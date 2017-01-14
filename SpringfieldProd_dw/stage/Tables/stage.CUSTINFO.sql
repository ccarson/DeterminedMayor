CREATE TABLE stage.CUSTINFO(
    ID					BIGINT			NOT NULL 
		IDENTITY 
		CONSTRAINT pk_CUSTINFO PRIMARY KEY CLUSTERED
  , Recnum              BIGINT          
  , BCUSTID             VARCHAR (10)    
  , SCUSTID             VARCHAR (10)    
  , [DATE]              DATETIME        
  , SHIPDATE            DATETIME        
  , ORDNUM              DECIMAL (10, 2)	NOT NULL
  , COM                 VARCHAR (1)     
  , SNAME               VARCHAR (36)    
  , SUB                 DECIMAL (10, 2) 
  , DISC                DECIMAL (8, 2)  
  , POST                DECIMAL (8, 2)  
  , DEP                 DECIMAL (8, 2)  
  , COD                 DECIMAL (6, 2)  
  , TAX                 DECIMAL (8, 2)  
  , RECEIVED            DECIMAL (8, 2)  
  , CARDKIND            VARCHAR (1)     
  , CARDNUM             VARCHAR (19)    
  , N1                  VARCHAR (35)    
  , N2                  VARCHAR (35)    
  , N3                  VARCHAR (35)    
  , N4                  VARCHAR (35)    
  , N5                  VARCHAR (35)    
  , N6                  VARCHAR (35)    
  , N7                  VARCHAR (35)    
  , [STATUS]            VARCHAR (2)     
  , ACCTYPE             VARCHAR (1)     
  , EXPIRE              VARCHAR (4)     
  , EXCISE_FLAG         VARCHAR (1)     
  , CHECK_TYPE          VARCHAR (1)     
  , EXCISE_DATE         DATETIME        
  , PAID_DATE           DATETIME        
  , LAST_CHANGE         DECIMAL (4)     
  , ORIGINAL            DECIMAL (8)     
  , DATE_WANTED         DATETIME        
  , CANCEL_DATE         DATETIME        
  , OVER60_FLAG         VARCHAR (1)     
  , OTOTAL              DECIMAL (10, 2) 
  , BACKORDER           VARCHAR (1)     
  , CUST_PO#            VARCHAR (40)    
  , TAXRATE             DECIMAL (6, 4)  
  , TRADE_AMOUNT        DECIMAL (8, 2)  
  , TRADE_TAX_FLAG      VARCHAR (1)     
  , COMPANY_#           VARCHAR (4)     
  , ACCR_DISC           DECIMAL (6, 2)  
  , WHLE_DISC           DECIMAL (8, 2)  
  , STATEID             VARCHAR (4)     
  , TELEWHO             VARCHAR (4)     
  , FREIGHT_FLAG        VARCHAR (1)     
  , COD_FLAG            VARCHAR (1)     
  , CID                 VARCHAR (5)     
  , StoreSale_Flag      VARCHAR (1)     
  , YardCode            VARCHAR (4)     
  , Packing_Notes       VARCHAR (MAX)   
  , Balance             DECIMAL (10, 2) 
  , RefundTotal         DECIMAL (10, 2) 
  , Invoice_Notes       VARCHAR (MAX)   
  , Programming_Ver     DECIMAL (2)     
  , Sub_Taxable         DECIMAL (10, 2) 
  , OrderedBy           VARCHAR (30)    
  , Date_Due            DATETIME        
  , O_Sub               DECIMAL (10, 2) 
  , O_Disc              DECIMAL (10, 2) 
  , O_Post              DECIMAL (10, 2) 
  , O_Tax               DECIMAL (10, 2) 
  , O_SubTaxable        DECIMAL (10, 2) 
  , O_Total             DECIMAL (10, 2) 
  , SUBTOT              DECIMAL (10, 2) 
  , USERINITIALS        VARCHAR (4)     
  , ShippedBy           VARCHAR (4)     
  , TaxStateRate        DECIMAL (6, 4)  
  , TaxCountyRate       DECIMAL (6, 4)  
  , TaxCityRate         DECIMAL (6, 4)  
  , TaxSpecialRate      DECIMAL (6, 4)  
  , TaxByZipID          DECIMAL (10)    
  , InvoiceNum          DECIMAL (8)     
  , ShipToPO            VARCHAR (40)    
  , Form4473            DECIMAL (8)     
  , CalcTax             VARCHAR (1)     
  , CreatedBy           VARCHAR (4)     
  , CreatedDate         DATETIME        
  , ChangedBy           VARCHAR (4)     
  , ChangedDate         DATETIME        
  , [Version]           VARCHAR (15)    
  , ForceTax            VARCHAR (1)     
  , NoPLPrint           VARCHAR (1)     
  , ReleaseDate         DATETIME        
  , SAddress            VARCHAR (35)    
  , SAddress2           VARCHAR (35)    
  , SCity               VARCHAR (30)    
  , SState              VARCHAR (2)     
  , SZip                VARCHAR (10)    
  , SCountry            VARCHAR (2)     
  , ExternalOrderType   VARCHAR (1)     
  , ExternalOrdNum      BIGINT          
  , CCToken             VARCHAR (25)    
  , CCApprovalCode      VARCHAR (25)    
  , NoTaxChange         VARCHAR (1)     
  , CCRetRef            VARCHAR (25)    
  , Sub_Labor           NUMERIC (10, 2) 
  , Sub_LaborRepair     NUMERIC (10, 2) 
  , Sub_Apparel         NUMERIC (10, 2) 
  , CouponDiscount      NUMERIC (6, 2)  
  , ReadyToShip         VARCHAR (4)     
  , PostType            VARCHAR (2)     
  , ShipDestinationType	VARCHAR (1)     
  , ShipUPS             VARCHAR (1)     
  , IAS_Sub             NUMERIC (10, 2) 
  , IAS_Disc            NUMERIC (10, 2) 
  , IAS_Post            NUMERIC (10, 2) 
  , IAS_Tax             NUMERIC (10, 2) 
  , IAS_OTotal          NUMERIC (10, 2) 
  , IAS_Sub_Taxable     NUMERIC (10, 2) 
  , IAS_Sub_Labor       NUMERIC (10, 2) 
  , IAS_Sub_LaborRepair NUMERIC (10, 2) 
  , IAS_Sub_Apparel     NUMERIC (10, 2) 
  , NumberOfCartons     SMALLINT        
  , Packed              VARCHAR (4)     
  , ShipLocation        VARCHAR (1)     
  , CustApproval        VARCHAR (1)     
  , MgrApproval         VARCHAR (1)     
  , ReadyToShipDate     DATETIME        
  , CancelAfter         DATETIME        
  , AuthorizedAmount    NUMERIC (10, 2) 
  , AVSResult           VARCHAR (1)     
  , CCTranStatus        VARCHAR (1)     
  , CCLatestTransID     VARCHAR (25)    
  , AdultSig			VARCHAR(1)
  , SYS_CHANGE_VERSION	BIGINT
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CUSTINFO_INDEX00]
    ON [stage].[CUSTINFO]([ORDNUM] ASC, [ID] ASC);

