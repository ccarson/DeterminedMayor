CREATE TABLE 
	archive.Part(
		PartKey				BIGINT         	NOT NULL
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
	  , DWVersion         	INT            	NOT NULL
	  , DWTimestamp       	DATETIME       	NOT NULL 	DEFAULT GETDATE()
      , CONSTRAINT pk_Part_Archive 
			PRIMARY KEY CLUSTERED(
				PartKey ASC, DWVersion ASC) 
			WITH (FILLFACTOR = 90)
);

