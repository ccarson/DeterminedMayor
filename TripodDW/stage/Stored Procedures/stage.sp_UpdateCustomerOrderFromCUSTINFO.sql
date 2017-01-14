CREATE PROCEDURE
    stage.sp_UpdateCustomerOrderFromCUSTINFO
/*
***********************************************************************************************************************************

    Procedure:      stage.sp_UpdateCustomerOrderFromCUSTINFO
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       UPDATE existing stage.CustomerOrder records from stage CUSTINFO  and Tripod Part

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

UPDATE
    customerOrder
SET
    OrderDateKey        =   CONVERT( bigint, CONVERT( VARCHAR(08), stage.[DATE], 112 ) )
  , ShipDateKey         =   ISNULL( NULLIF( CONVERT( bigint, CONVERT( varchar(08), stage.SHIPDATE, 112 ) ), 17530101 ), 0 )
  , SourceOrderRecnum   =   stage.Recnum
  , OrderStatus         =   stage.STATUS
  , ShipToName          =   stage.SNAME
  , CustomerPO          =   stage.CUST_PO#
  , ShipToPO            =   stage.ShipToPO
  , PaidDate            =   stage.PAID_DATE
  , WantedDateKey       =   ISNULL( NULLIF( CONVERT( bigint, CONVERT( varchar(08), stage.DATE_WANTED, 112 ) ), 17530101 ), 0 )
  , CancelDate          =   stage.CANCEL_DATE
  , SubtotalAmount      =   stage.SUB
  , DiscountAmount      =   stage.DISC
  , PostageAmount       =   stage.POST
  , DepositAmount       =   stage.DEP
  , CODAmount           =   stage.COD
  , TaxAmount           =   stage.TAX
  , ReceivedAmount      =   stage.RECEIVED
  , TotalAmount         =   stage.OTOTAL
  , BalanceAmount       =   stage.Balance
  , RefundAmount        =   stage.RefundTotal
  , BackorderQuantity   =   CASE
                                WHEN stage.STATUS IN( 'RD', 'RP' ) THEN customerOrder.QuanS
                                WHEN customerOrder.Quan_BO = 0 AND customerOrder.Programming_Ver > 0 THEN customerOrder.ItemQuantity - customerOrder.ShippedQuantity
                                ELSE customerOrder.Quan_BO
                            END
FROM
    stage.CustomerOrder AS customerOrder
INNER JOIN
    stage.CUSTINFO AS stage
        ON stage.ORDNUM = customerOrder.OrderNumber ;