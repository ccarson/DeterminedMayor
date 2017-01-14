CREATE TABLE stage.CMASTER(
    ID						BIGINT			NOT NULL
		IDENTITY
		CONSTRAINT pk_CMASTER PRIMARY KEY CLUSTERED
  , Recnum					BIGINT          
  , CUSTID					VARCHAR (10)    
  , BNAME					VARCHAR (36)    
  , BSTREET					VARCHAR (35)    
  , BSTREET2				VARCHAR (35)    
  , BCITY					VARCHAR (30)    
  , BSTATE					VARCHAR (2)     
  , BZIP					VARCHAR (10)    
  , COUNTRY					VARCHAR (15)    
  , FFLEXPR					DATETIME        
  , ACCTYPE					VARCHAR (1)     
  , CLASS					VARCHAR (1)     
  , CONTACT_NAME_1			VARCHAR (36)    
  , PHONE					VARCHAR (10)    
  , CONTACT_NAME_2			VARCHAR (36)    
  , PHONE_2					VARCHAR (10)    
  , FAX_NUMBER				VARCHAR (10)    
  , ILLTAX					VARCHAR (12)    
  , YTDSHIP					DECIMAL (12, 2) 
  , YTDPAY					DECIMAL (12, 2) 
  , TELESTAT				VARCHAR (2)     
  , TELEWHO					VARCHAR (4)     
  , FFLNUM					VARCHAR (10)    
  , LPAYOPEN				DATETIME        
  , LPAYCOD					DATETIME        
  , STOCKING				VARCHAR (1)     
  , EXCISE_FLAG				VARCHAR (1)     
  , DISCOUNT				DECIMAL (4, 2)  
  , TIME_ZONE				DECIMAL (2)     
  , TERMS					VARCHAR (15)    
  , GROUP_CODE				VARCHAR (10)    
  , PROF_GUNSMITH			DATETIME        
  , MATCH_FLAG				VARCHAR (1)     
  , DL_NUMBER				VARCHAR (25)    
  , DL_STATE				VARCHAR (2)     
  , CUSTYPE					VARCHAR (1)     
  , NOW						DECIMAL (10, 2) 
  , OTHIRTY					DECIMAL (10, 2) 
  , OSIXTY					DECIMAL (10, 2) 
  , ONINETY					DECIMAL (10, 2) 
  , O1TWENTY				DECIMAL (10, 2) 
  , FINANCE					DECIMAL (10, 2) 
  , LASTCALC				DATETIME        
  , FIRSTPUR				DATETIME        
  , HICREDIT				DECIMAL (10, 2) 
  , CRLIMIT					DECIMAL (10, 2) 
  , TOTPAID					DECIMAL (6)     
  , PAIDNOW					DECIMAL (6)     
  , PAID30					DECIMAL (6)     
  , PAID60					DECIMAL (6)     
  , PAID90					DECIMAL (6)     
  , PAID120					DECIMAL (6)     
  , INTRATE					DECIMAL (6, 4)  
  , WFINANCE				DECIMAL (10, 2) 
  , CURBAL					DECIMAL (10, 2) 
  , N1						VARCHAR (35)    
  , N2						VARCHAR (35)    
  , N3						VARCHAR (35)    
  , N4						VARCHAR (35)    
  , N5						VARCHAR (35)    
  , LABEL_FLAG				VARCHAR (1)     
  , YTDBILL					DECIMAL (12, 2) 
  , DELETE_FLAG				VARCHAR (1)     
  , MEDIA_CODE				VARCHAR (6)     
  , ACCRUAL_DISC			DECIMAL (6, 2)  
  , SALES_TAX_DATE			DATETIME        
  , EXCISE_#				VARCHAR (20)    
  , EXCISE_DATE				DATETIME        
  , CREDIT_DATE				DATETIME        
  , STATEID					VARCHAR (4)     
  , EMAIL					VARCHAR (35)    
  , REP_ID					VARCHAR (15)    
  , SA_REP					VARCHAR (15)    
  , ADDED_REP				VARCHAR (15)    
  , DATE_ADDED				DATETIME        
  , TOTALAMOUNTDUE			DECIMAL (10, 2) 
  , PAIDCURRENTPER			DECIMAL (6, 2)  
  , PAID30PER				DECIMAL (6, 2)  
  , PAID60PER				DECIMAL (6, 2)  
  , PAID90PER				DECIMAL (6, 2)  
  , PAID120PER				DECIMAL (6, 2)  
  , ONMAILING_FLAG			VARCHAR (1)     
  , APPLYSHIPPING			VARCHAR (1)     
  , WEBSITE					VARCHAR (80)    
  , LAST_NAME				VARCHAR (25)    
  , FIRST_NAME				VARCHAR (15)    
  , Customer_Type			VARCHAR (1)     
  , TAX_FORM_EXP			DATETIME        
  , USERINITIALS			VARCHAR (4)     
  , DUE_0_20				DECIMAL (12, 2) 
  , DUE_21_30				DECIMAL (12, 2) 
  , DUE_31_45				DECIMAL (12, 2) 
  , DUE_46_60				DECIMAL (12, 2) 
  , DUE_60PLUS				DECIMAL (12, 2) 
  , PriceType				VARCHAR (20)    
  , DefaultPrice			VARCHAR (1)     
  , EMailInvoice			VARCHAR (1)     
  , EMailMerge				VARCHAR (1)     
  , EMailSubject			VARCHAR (80)    
  , CreatedBy				VARCHAR (4)     
  , CreatedDate				DATE            
  , ChangedBy				VARCHAR (4)     
  , ChangedDate				DATE            
  , [Version]				VARCHAR (15)    
  , BuyGroup				VARCHAR (1)     
  , BuyGroupNum				BIGINT          
  , OptInRecallEmails		VARCHAR (1)     
  , OptInEmails				VARCHAR (1)     
  , OptInRecallEmailsDate	DATETIME        
  , OptInEmailsDate			DATETIME        
  , ExternalCustID			BIGINT          
  , ShipDestinationType		VARCHAR (1)     
  , Hold					VARCHAR (1)     
  , HoldDate				DATETIME        
  , HoldReason				VARCHAR (256)   
  , PostType				VARCHAR (2)     
  , ShipUPS					VARCHAR (1)     
  , HoldBy					VARCHAR (4)     
  , ShipApprovalRequired	VARCHAR (1)     
  , ExternalCustType		VARCHAR (1)     
  , AssuredDiscount			NUMERIC (6, 4)  
  , ADToDiscountedOnly		VARCHAR (1)     
  , SYS_CHANGE_VERSION		BIGINT
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CMASTER_INDEX00]
    ON [stage].[CMASTER]( CUSTID ASC )
	INCLUDE( BNAME, BCITY, BSTATE, COUNTRY ) ;

GO




