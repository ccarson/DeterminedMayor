CREATE TABLE 
	stage.Part(
		ID                BIGINT         NOT NULL	IDENTITY 
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
	  , DWChecksum			BINARY (32)		NOT NULL
	  , DWTimestamp       	DATETIME       	NOT NULL 	DEFAULT GETDATE()
);


GO
CREATE UNIQUE NONCLUSTERED INDEX UX_Part_00
    ON stage.Part(SPRNUM ASC);

