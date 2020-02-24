
CREATE PROCEDURE [dbo].[sasp_RMA_Conversion] 
(
  @pRMANumber    decimal(8,0) = NULL
)
AS

SET NOCOUNT, XACT_ABORT ON ; 

BEGIN TRY


DECLARE @ErrorMsg    VARCHAR(1000) = '' ; 

IF EXISTS( SELECT 1 FROM dbo.RMAHeader WHERE RMANumber = ISNULL( @pRMANumber, -1 ) ) 
BEGIN
    SELECT
        @ErrorMsg = 'Error:  RMA# ' + CONVERT( varchar(20), @pRMANumber ) + ' has already been converted.' ;
    RAISERROR( @ErrorMsg, 16, 1 ) ; 
END

IF EXISTS( SELECT 1 FROM dbo.rahdr WHERE RMA# = ISNULL( @pRMANumber, RMA# ) ) 
BEGIN
    
--    RAHDR Conversion
INSERT INTO 
    dbo.RMAHeader(
        RMANumber
      , CurrentState
      , CustID
      , CustomerName
      , CustomerNote
      , Reason
      , ReturnSameAddress
      , ReturnCustID
      , LabelItemType
      , LabelShipMethod
      , LabelEmail
      , LabelResidential
      , LabelTrackingNumber
      , LabelURL
      , CreatedBy
      , CreatedDate
      , ChangedBy
      , ChangedDate
      , CompletedBy
      , CompletedDate
      , BillableHours
      , WarrantyHours 
      , HubspotID)
SELECT 
    RMANumber               =    hdr.RMA#
  , CurrentState            =    CASE
                                    WHEN hdr.DONE_FLAG = 'Y'             THEN 'S'
                                    WHEN hdr.ORDNUM > 0                 THEN 'C'
                                    WHEN hdr.REC_DATE > '1900-01-01'     THEN 'R'
                                    ELSE 'N'
                                END
  , CustID                  =    hdr.CUSTID
  , CustomerName            =    hdr.CUST_NAME
  , CustomerNote            =    ISNULL( hdr.CustNotes, '' )
  , Reason                  =    hdr.REASON
  , ReturnSameAddress       =    'Y'
  , ReturnCustID            =    hdr.CUSTID
  , LabelItemType           =    hdr.ProdType
  , LabelShipMethod         =    CASE hdr.ShipMethod            
                                    WHEN 'PRIORITY_OVERNIGHT'     THEN '1'
                                    WHEN 'Overnight'             THEN '1'
                                    WHEN 'FEDEX_2_DAY'             THEN '2'
                                    WHEN '2 Day'                 THEN '2'
                                    WHEN 'FEDEX_GROUND'         THEN 'G'
                                    WHEN 'Ground'                 THEN 'G'
                                    ELSE ''
                                END
  , LabelEmail              =    hdr.ShipEmail
  , LabelResidential        =    'Y'
  , LabelTrackingNumber     =    hdr.FEDEXTRACKING
  , LabelURL                =    ISNULL( hdr.LabelURL, '' )
  , CreatedBy               =    ISNULL( hdr.CreatedBy, ISNULL( hdr.ENT_INIT, '' ) )
  , CreatedDate             =    ISNULL( hdr.CreatedDate, ISNULL( hdr.ENTER_DATE, '1753-01-01' ) )
  , ChangedBy               =    ISNULL( hdr.ChangedBy, '' )
  , ChangedDate             =    ISNULL( hdr.ChangedDate, '1753-01-01' )
  , CompletedBy             =    ''
  , CompletedDate           =    hdr.COMPLETE_DATE
  , BillableHours           =    hdr.TotBillHours
  , WarrantyHours           =    hdr.TotWarrHours
  , HubspotID               =    0
FROM 
    dbo.RAHDR AS hdr
WHERE 
    hdr.RMA# = ISNULL( @pRMANumber, hdr.RMA# ) ;

--    RMAItem Conversion
INSERT INTO 
    dbo.RMAItem( 
        HeaderID
      , PartNum
      , ItemDescription
      , Quantity
      , Serial
      , ReceivedBy
      , ReceivedDate
      , ReceivingTicket
      , ReturnedDate
      , OrdNum
      , Action
      , BillableHours
      , WarrantyHours
      , ItemNumber
      , Product )
SELECT 
    HeaderID        =    rh.ID
  , PartNum         =    hdr.SPRNUM
  , ItemDescription =    ISNULL( parts.[DESC], 'No Description' )
  , Quantity        =    1
  , Serial          =    hdr.SERIAL#
  , ReceivedBy      =    hdr.REC_INIT
  , ReceivedDate    =    hdr.REC_DATE
  , ReceivingTicket =    hdr.ReceiveTicket
  , ReturnedDate    =    ISNULL( custinfo.SHIPDATE, '1753-01-01' )
  , OrdNum          =    hdr.ORDNUM
  , Action          =    'I'
  , BillableHours   =    0
  , WarrantyHours   =    0
  , ItemNumber      =    ROW_NUMBER() OVER(     PARTITION BY rh.ID  
                                            ORDER BY hdr.SPRNUM )
  , Product         =    ISNULL( NULLIF( hdr.Product, '' ), 'ACCY ' )
FROM
    dbo.RAHDR AS hdr
INNER JOIN 
    dbo.RMAHeader AS rh
        ON rh.RMANumber = hdr.RMA#
LEFT JOIN
    dbo.CUSTINFO AS custinfo
        ON custinfo.ORDNUM = hdr.ORDNUM
LEFT JOIN
    dbo.parts AS parts ON parts.SPRNUM = hdr.SPRNUM 
WHERE 
    hdr.RMA# = ISNULL( @pRMANumber, hdr.RMA# ) ;
    
--    RMAItemWork Conversion
INSERT INTO 
    dbo.RMAItemWork(
        ItemID
      , Code
      , StartDate
      , FinishDate
      , Initials
      , WorkType
      , BillableHours
      , WarrantyHours
      , CreatedBy
      , CreatedDate )
SELECT
    ItemID          =    ri.ID
  , Code            =    dtl.CODE
  , StartDate       =    dtl.START_DATE
  , FinishDate      =    dtl.FINISH_DATE
  , Initials        =    dtl.DONE_BY
  , WorkType        =    CASE dtl.WARRANTY
                            WHEN 'Y' THEN 'W'
                            ELSE 'R'
                        END
  , BillableHours   =    0
  , WarrantyHours   =    0
  , CreatedBy       =    'CONV'
  , CreatedDate     =    ISNULL( dtl.FINISH_DATE, '1753-01-01' )
FROM 
    dbo.RAHDR AS hdr
INNER JOIN 
    dbo.RADETAIL AS dtl
        ON dtl.RMA# = hdr.RMA#
INNER JOIN 
    dbo.RMAHeader AS rh
        ON rh.RMANumber = hdr.RMA#
INNER JOIN 
    dbo.RMAItem AS ri
        ON ri.HeaderID = rh.ID
WHERE 
    hdr.RMA# = ISNULL( @pRMANumber, hdr.RMA# ) ;

  
-- Delete duplicate items.
DELETE FROM RMAItemWork
WHERE ID IN
(
SELECT riw2.ID
FROM RMAItemWork riw1
INNER JOIN RMAItemWork riw2
  ON riw1.ItemID = riw2.ItemID
      AND riw1.ID < riw2.ID
      AND riw1.Code = riw2.Code
INNER JOIN 
    dbo.RMAItem AS ri
  ON riw1.ItemID = ri.ID
INNER JOIN 
    dbo.RMAHeader AS rh
        ON ri.HeaderID = rh.ID
        and rh.RMANumber = ISNULL( @pRMANumber, rh.RMANumber ) 

)


--    RMAItemWorkPartUsage Conversion
INSERT INTO 
    dbo.RMAItemWorkPartUsage(
        ItemWorkID
      , PartNum
      , PartDescription
      , Quantity )
SELECT
    ItemWorkID      =    iw.ID
  , PartNum         =    dtl.SPRNUM
  , PartDescription =    ISNULL( parts.[DESC], 'No Description' )
  , Quantity        =    dtl.Qty

FROM 
    dbo.RAHDR AS hdr
INNER JOIN 
    dbo.RADETAIL AS dtl
        ON dtl.RMA# = hdr.RMA#
INNER JOIN 
    dbo.RMAHeader AS rh
        ON rh.RMANumber = hdr.RMA#
INNER JOIN 
    dbo.RMAItem AS ri
        ON ri.HeaderID = rh.ID
INNER JOIN 
    dbo.RMAItemWork AS iw 
        ON iw.ItemID = ri.ID 
            AND iw.Code = dtl.CODE
LEFT JOIN 
    dbo.parts AS parts
        ON parts.SPRNUM = dtl.SPRNUM
WHERE 
    hdr.RMA# = ISNULL( @pRMANumber, hdr.RMA# ) 
        AND dtl.SPRNUM != '';

--    RMANote
INSERT INTO 
    dbo.RMANote(
        HeaderID
      , Initials
      , FollowUpDate
      , FollowedUpDate
      , Note
      , CreatedBy
      , CreatedDate
      , NoteType )
SELECT 
    HeaderID        =    rh.ID
  , Initials        =    'CONV'
  , FollowUpDate    =    '1753-01-01'
  , FollowedUpDate  =    '1753-01-01'
  , Note            =    x.NoteText
  , CreatedBy       =    'CONV'
  , CreatedDate     =    rh.CreatedDate
  , NoteType        =    x.NoteType
FROM 
    dbo.RAHDR AS hdr
INNER JOIN
    dbo.RMAHeader AS rh 
        ON rh.RMANumber = hdr.RMA# 
CROSS APPLY( 
    VALUES 
        ( 'NOTE', 'COMMENT1: '      + NULLIF( hdr.COMMENT1, '' ) )
      , ( 'NOTE', 'COMMENT2: '      + NULLIF( hdr.COMMENT2, '' ) )
      , ( 'NOTE', 'OTHER_PARTS: '   + NULLIF( hdr.OTHER_PARTS, '' ) )
      , ( 'NOTE', 'Description: '   + NULLIF( LEFT( hdr.Description, 1010 ), '' ) )
      , ( 'NOTE', 'InternalNotes: ' + NULLIF( LEFT( hdr.InternalNotes, 1008 ), '' ) )  
      ) AS x( NoteType, NoteText )
WHERE
    hdr.RMA# = ISNULL( @pRMANumber, hdr.RMA# ) 
        AND x.NoteText IS NOT NULL ; 
END


--    RAHDRH Conversion
IF EXISTS( SELECT 1 FROM dbo.rahdrh WHERE RMA# = ISNULL( @pRMANumber, RMA# ) ) 
BEGIN


INSERT INTO 
    dbo.RMAHeader(
        RMANumber
      , CurrentState
      , CustID
      , CustomerName
      , CustomerNote
      , Reason
      , ReturnSameAddress
      , ReturnCustID
      , LabelItemType
      , LabelShipMethod
      , LabelEmail
      , LabelResidential
      , LabelTrackingNumber
      , LabelURL
      , CreatedBy
      , CreatedDate
      , ChangedBy
      , ChangedDate
      , CompletedBy
      , CompletedDate
      , BillableHours
      , WarrantyHours
      , HubspotID
    )
SELECT 
    RMANumber               =    hdr.RMA#
  , CurrentState            =    'S'
  , CustID                  =    hdr.CUSTID
  , CustomerName            =    hdr.CUST_NAME
  , CustomerNote            =    ISNULL( hdr.CustNotes, '' )
  , Reason                  =    hdr.REASON
  , ReturnSameAddress       =    'Y'
  , ReturnCustID            =    hdr.CUSTID
  , LabelItemType           =    ''
  , LabelShipMethod         =    CASE hdr.ShipMethod            
                                    WHEN 'PRIORITY_OVERNIGHT'     THEN '1'
                                    WHEN 'Overnight'             THEN '1'
                                    WHEN 'FEDEX_2_DAY'             THEN '2'
                                    WHEN '2 Day'                 THEN '2'
                                    WHEN 'FEDEX_GROUND'         THEN 'G'
                                    WHEN 'Ground'                 THEN 'G'
                                    ELSE ''
                                END
  , LabelEmail              =    hdr.ShipEmail
  , LabelResidential        =    'Y'
  , LabelTrackingNumber     =    hdr.FEDEXTRACKING
  , LabelURL                =    ISNULL( hdr.LabelURL, '' )
  , CreatedBy               =    ISNULL( hdr.ENT_INIT, '' ) 
  , CreatedDate             =    ISNULL( hdr.ENTER_DATE, '1753-01-01' ) 
  , ChangedBy               =    'CONV'
  , ChangedDate             =    GETDATE()
  , CompletedBy             =    ''
  , CompletedDate           =    hdr.COMPLETE_DATE
  , BillableHours           =    hdr.TotBillHours
  , WarrantyHours           =    hdr.TotWarrHours
  , HubspotID               =    hdr.Hubspot_ID
FROM 
    dbo.RAHDRH AS hdr
WHERE 
    hdr.RMA# = ISNULL( @pRMANumber, hdr.RMA# ) ;

--    RMAItem Conversion
INSERT INTO 
    dbo.RMAItem( 
        HeaderID
      , PartNum
      , ItemDescription
      , Quantity
      , Serial
      , ReceivedBy
      , ReceivedDate
      , ReceivingTicket
      , ReturnedDate
      , OrdNum
      , Action
      , BillableHours
      , WarrantyHours
      , ItemNumber
      , Product )
SELECT 
    HeaderID        =    rh.ID
  , PartNum         =    hdr.SPRNUM
  , ItemDescription =    ISNULL( parts.[DESC], 'No Description' )
  , Quantity        =    1
  , Serial          =    hdr.SERIAL#
  , ReceivedBy      =    hdr.REC_INIT
  , ReceivedDate    =    hdr.REC_DATE
  , ReceivingTicket =    hdr.ReceiveTicket
  , ReturnedDate    =    ISNULL( custinfo.SHIPDATE, '1753-01-01' )
  , OrdNum          =    hdr.ORDNUM
  , Action          =    'I'
  , BillableHours   =    hdr.TotBillHours
  , WarrantyHours   =    hdr.TotWarrHours
  , ItemNumber      =    ROW_NUMBER() OVER(     PARTITION BY rh.ID  
                                            ORDER BY hdr.SPRNUM )
  , Product         =    ISNULL( NULLIF( hdr.Product, '' ), 'ACCY ' )
FROM
    dbo.RAHDRH AS hdr
INNER JOIN 
    dbo.RMAHeader AS rh
        ON rh.RMANumber = hdr.RMA#
LEFT JOIN
    dbo.CUSTINFO AS custinfo
        ON custinfo.ORDNUM = hdr.ORDNUM
LEFT JOIN
    dbo.parts AS parts 
        ON parts.SPRNUM = hdr.SPRNUM 
WHERE 
    hdr.RMA# = ISNULL( @pRMANumber, hdr.RMA# ) ;
    
--    RMAItemWork Conversion
INSERT INTO 
    dbo.RMAItemWork(
        ItemID
      , Code
      , StartDate
      , FinishDate
      , Initials
      , WorkType 
      , BillableHours
      , WarrantyHours
      , CreatedBy
      , CreatedDate )
SELECT
    ItemID          =    ri.ID
  , Code            =    dtl.CODE
  , StartDate       =    dtl.START_DATE
  , FinishDate      =    dtl.FINISH_DATE
  , Initials        =    dtl.DONE_BY
  , WorkType        =    CASE dtl.WARRANTY
                            WHEN 'Y' THEN 'W'
                            ELSE 'R'
                        END
  , BillableHours   =    0
  , WarrantyHours   =    0
  , CreatedBy       =    'CONV'
  , CreatedDate     =    ISNULL( dtl.FINISH_DATE, '1753-01-01' )
FROM 
    dbo.RAHDRH AS hdr
INNER JOIN 
    dbo.RADETLH AS dtl
        ON dtl.RMA# = hdr.RMA#
INNER JOIN 
    dbo.RMAHeader AS rh
        ON rh.RMANumber = hdr.RMA#
INNER JOIN 
    dbo.RMAItem AS ri
        ON ri.HeaderID = rh.ID
WHERE 
    hdr.RMA# = ISNULL( @pRMANumber, hdr.RMA# ) ;

-- Delete duplicate items.
DELETE FROM RMAItemWork
WHERE ID IN
(
SELECT riw2.ID
FROM RMAItemWork riw1
INNER JOIN RMAItemWork riw2
  ON riw1.ItemID = riw2.ItemID
      AND riw1.ID < riw2.ID
      AND riw1.Code = riw2.Code
INNER JOIN 
    dbo.RMAItem AS ri
  ON riw1.ItemID = ri.ID
INNER JOIN 
    dbo.RMAHeader AS rh
        ON ri.HeaderID = rh.ID
        and rh.RMANumber = ISNULL( @pRMANumber, rh.RMANumber ) 

)
    
    
--    RMAItemWorkPartUsage Conversion
INSERT INTO 
    dbo.RMAItemWorkPartUsage(
        ItemWorkID
      , PartNum
      , PartDescription
      , Quantity )
SELECT
    ItemWorkID      =    iw.ID
  , PartNum         =    dtl.SPRNUM
  , PartDescription =    ISNULL( parts.[DESC], 'No Description' )
  , Quantity        =    dtl.Qty

FROM 
    dbo.RAHDRH AS hdr
INNER JOIN 
    dbo.RADETLH AS dtl
        ON dtl.RMA# = hdr.RMA#
INNER JOIN 
    dbo.RMAHeader AS rh
        ON rh.RMANumber = hdr.RMA#
INNER JOIN 
    dbo.RMAItem AS ri
        ON ri.HeaderID = rh.ID
INNER JOIN 
    dbo.RMAItemWork AS iw 
        ON iw.ItemID = ri.ID 
            AND iw.Code = dtl.CODE
LEFT JOIN 
    dbo.parts AS parts
        ON parts.SPRNUM = dtl.SPRNUM
WHERE 
    hdr.RMA# = ISNULL( @pRMANumber, hdr.RMA# ) 
        AND dtl.SPRNUM != ''

--    RMANote
INSERT INTO 
    dbo.RMANote(
        HeaderID
      , Initials
      , FollowUpDate
      , FollowedUpDate
      , Note
      , CreatedBy
      , CreatedDate
      , NoteType )
SELECT 
    HeaderID        =    rh.ID
  , Initials        =    'CONV'
  , FollowUpDate    =    '1753-01-01'
  , FollowedUpDate  =    '1753-01-01'
  , Note            =    x.NoteText
  , CreatedBy       =    'CONV'
  , CreatedDate     =    rh.CreatedDate
  , NoteType        =    x.NoteType
FROM 
    dbo.RAHDRH AS hdr
INNER JOIN
    dbo.RMAHeader AS rh 
        ON rh.RMANumber = hdr.RMA# 
CROSS APPLY( 
    VALUES 
        ( 'NOTE', 'COMMENT1: '      + NULLIF( hdr.COMMENT1, '' ) )
      , ( 'NOTE', 'COMMENT2: '      + NULLIF( hdr.COMMENT2, '' ) )
      , ( 'NOTE', 'OTHER_PARTS: '   + NULLIF( hdr.OTHER_PARTS, '' ) )
      , ( 'NOTE', 'Description: '   + NULLIF( LEFT( hdr.Description, 1010 ), '' ) )
      , ( 'NOTE', 'InternalNotes: ' + NULLIF( LEFT( hdr.InternalNotes, 1008 ), '' ) )      
      ) AS x( NoteType, NoteText )
WHERE 
    hdr.RMA# = ISNULL( @pRMANumber, hdr.RMA# )
        AND x.NoteText IS NOT NULL ; 
END

RETURN ;
 
END TRY 
BEGIN CATCH 
    ROLLBACK TRANSACTION ;     
    THROW ; 
END CATCH