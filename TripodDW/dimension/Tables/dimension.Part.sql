CREATE TABLE 
	dimension.Part (
		PartKey           	BIGINT         	NOT NULL	IDENTITY
			CONSTRAINT pk_Part PRIMARY KEY CLUSTERED
	  , SourceRecnum      	BIGINT         	NOT NULL
	  , SPRNUM            	VARCHAR(20)   	NOT NULL
	  , SPRDescription    	VARCHAR(35)   	NOT NULL
	  , LastSoldDate      	DATETIME       	NOT NULL
	  , ReorderPointQty   	DECIMAL(10)   	NOT NULL
	  , FullyStockedQty   	DECIMAL(10)   	NOT NULL
	  , SafetyStockQty    	DECIMAL(10)   	NOT NULL
	  , LeadTimeDays      	DECIMAL(06)    	NOT NULL
	  , UPC               	VARCHAR(15)   	NOT NULL
	  , GunType           	VARCHAR(20)   	NOT NULL
	  , GunStock          	VARCHAR(06)    	NOT NULL
	  , GroupCode         	VARCHAR(01)    	NOT NULL
	  , ReportingGroup    	VARCHAR(06)    	NOT NULL
	  , SPRCategory       	VARCHAR(30)   	NOT NULL
	  , SPRSubCategory    	VARCHAR(30)   	NOT NULL
	  , VendorIDCode      	VARCHAR(08)    	NOT NULL
	  , IsTaxable         	VARCHAR(01)    	NOT NULL
	  , ExciseTaxType     	VARCHAR(01)    	NOT NULL
	  , IsGunPart         	VARCHAR(01)    	NOT NULL
	  , BarrelLength      	DECIMAL(4, 2) 	NOT NULL
	  , HasThreadedBarrel 	VARCHAR(01)    	NOT NULL
	  , FinishDescription 	VARCHAR(20)   	NOT NULL
	  , IsSellable        	VARCHAR(01)    	NOT NULL
	  , PartStatus        	VARCHAR(01)    	NOT NULL
	  , PartTypeCode      	VARCHAR(01)    	NOT NULL
	  , PartCategory      	VARCHAR(10)   	NOT NULL
	  , CapacityCode      	VARCHAR(04)    	NOT NULL
	  , LocationCode      	VARCHAR(01)    	NOT NULL
	  , IsReportable		VARCHAR(01)		NOT NULL
	  , IsAssembly			VARCHAR(01)		NOT NULL
	  , AssemblyPartKey		VARCHAR(20)		NOT NULL
	  , IsBackorderPart   	AS	CASE 
									WHEN SPRNUM LIKE 'RC%' 	THEN 0 
									WHEN SPRNUM = 'ROUNDUP' THEN 0
									WHEN SPRNUM LIKE 'RP%' 	THEN 0 
									WHEN SPRNUM LIKE 'SC%' 	THEN 0 
									ELSE 1 
								END	PERSISTED
	  , FormattedPartKey	AS 	SPRNUM + ' - ' + SPRDescription PERSISTED
	  , DWChecksum        	BINARY (32)    	NOT NULL
	  , DWVersion         	INT            	NOT NULL 	DEFAULT 1
	  , DWTimestamp       	DATETIME       	NOT NULL 	DEFAULT GETDATE()
)
;


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Part_00]
    ON [dimension].[Part]([SPRNUM] ASC) WITH (FILLFACTOR = 90)
;


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Part_01]
    ON [dimension].[Part]([SourceRecnum] ASC) WITH (FILLFACTOR = 90)
;


GO

CREATE TRIGGER dimension.trg_Part_archive
    ON dimension.Part AFTER UPDATE
AS
/*
************************************************************************************************************************************

    Trigger:    dimension.trg_Part_archive
     Author:    ccarson
    Purpose:    archives existing dimension.Part records

    revisor         date            description
    ---------       ----------      ----------------------------
    ccarson         2016-10-01      created

    Notes:

************************************************************************************************************************************
*/
BEGIN

IF  @@ROWCOUNT = 0 RETURN ;

SET NOCOUNT, XACT_ABORT ON ;

INSERT INTO
    archive.Part(
        PartKey
      , SourceRecnum
      , SPRNUM
      , SPRDescription
      , LastSoldDate
      , ReorderPointQty
      , FullyStockedQty
      , SafetyStockQty
      , LeadTimeDays
      , UPC
      , GunType
      , GunStock
      , GroupCode
      , ReportingGroup
      , SPRCategory
      , SPRSubCategory
      , VendorIDCode
      , IsTaxable
      , ExciseTaxType
      , IsGunPart
      , BarrelLength
      , HasThreadedBarrel
      , FinishDescription
      , IsSellable
      , PartStatus
      , PartTypeCode
      , PartCategory
      , CapacityCode
      , LocationCode
	  , IsReportable		
	  , IsAssembly			
	  , AssemblyPartKey		
      , DWChecksum
      , DWVersion
      , DWTimestamp )
SELECT
    PartKey             =   tripod.PartKey
  , SourceRecnum        =   tripod.SourceRecnum
  , SPRNUM              =   tripod.SPRNUM
  , SPRDescription      =   tripod.SPRDescription
  , LastSoldDate        =   tripod.LastSoldDate
  , ReorderPointQty     =   tripod.ReorderPointQty
  , FullyStockedQty     =   tripod.FullyStockedQty
  , SafetyStockQty      =   tripod.SafetyStockQty
  , LeadTimeDays        =   tripod.LeadTimeDays
  , UPC                 =   tripod.UPC
  , GunType             =   tripod.GunType
  , GunStock            =   tripod.GunStock
  , GroupCode           =   tripod.GroupCode
  , ReportingGroup      =   tripod.ReportingGroup
  , SPRCategory         =   tripod.SPRCategory
  , SPRSubCategory      =   tripod.SPRSubCategory
  , VendorIDCode        =   tripod.VendorIDCode
  , IsTaxable           =   tripod.IsTaxable
  , ExciseTaxType       =   tripod.ExciseTaxType
  , IsGunPart           =   tripod.IsGunPart
  , BarrelLength        =   tripod.BarrelLength
  , HasThreadedBarrel   =   tripod.HasThreadedBarrel
  , FinishDescription   =   tripod.FinishDescription
  , IsSellable          =   tripod.IsSellable
  , PartStatus          =   tripod.PartStatus
  , PartTypeCode        =   tripod.PartTypeCode
  , PartCategory        =   tripod.PartCategory
  , CapacityCode        =   tripod.CapacityCode
  , LocationCode        =   tripod.LocationCode
  , IsReportable		=	tripod.IsReportable		
  , IsAssembly			=	tripod.IsAssembly			
  , AssemblyPartKey		=	tripod.AssemblyPartKey		
  , DWChecksum          =   tripod.DWChecksum
  , DWVersion           =   tripod.DWVersion
  , DWTimestamp         =   tripod.DWTimestamp
FROM
    deleted AS tripod ;

END
