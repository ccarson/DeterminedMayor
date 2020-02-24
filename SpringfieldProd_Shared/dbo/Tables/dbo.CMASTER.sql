CREATE TABLE dbo.CMASTER
(
	Recnum                	bigint          NOT NULL 	IDENTITY 
  , CUSTID                	varchar(10)    	NOT NULL	DEFAULT		' '             
  , BNAME                 	varchar(36)    	NOT NULL 	DEFAULT 	' '             
  , BSTREET               	varchar(35)    	NOT NULL 	DEFAULT 	' '             
  , BSTREET2              	varchar(35)    	NOT NULL 	DEFAULT 	' '             
  , BCITY                 	varchar(30)    	NOT NULL	                            
  , BSTATE                	varchar(2)     	NOT NULL 	DEFAULT 	' '             
  , BZIP                  	varchar(10)    	NOT NULL 	DEFAULT 	' '             
  , COUNTRY               	varchar(15)    	NOT NULL 	DEFAULT 	' '             
  , FFLEXPR               	datetime        NOT NULL 	DEFAULT 	'01/01/1753'    
  , ACCTYPE               	varchar(1)     	NOT NULL 	DEFAULT 	' '             
  , CLASS                 	varchar(1)     	NOT NULL 	DEFAULT 	' '             
  , CONTACT_NAME_1        	varchar(36)    	NOT NULL 	DEFAULT 	' '             
  , PHONE                 	varchar(10)    	NOT NULL 	DEFAULT 	' '             
  , CONTACT_NAME_2        	varchar(36)    	NOT NULL 	DEFAULT 	' '             
  , PHONE_2               	varchar(10)    	NOT NULL 	DEFAULT 	' '             
  , FAX_NUMBER            	varchar(10)    	NOT NULL 	DEFAULT 	' '             
  , ILLTAX                	varchar(12)    	NOT NULL 	DEFAULT 	' '             
  , YTDSHIP               	decimal(12, 2) 	NOT NULL 	DEFAULT 	0               
  , YTDPAY                	decimal(12, 2) 	NOT NULL 	DEFAULT 	0               
  , TELESTAT              	varchar(2)     	NOT NULL 	DEFAULT 	' '             
  , TELEWHO               	varchar(4)     	NOT NULL 	DEFAULT 	' '             
  , FFLNUM                	varchar(10)    	NOT NULL 	DEFAULT 	' '             
  , LPAYOPEN              	datetime        NOT NULL 	DEFAULT 	'01/01/1753'    
  , LPAYCOD               	datetime        NOT NULL 	DEFAULT 	'01/01/1753'    
  , STOCKING              	varchar(1)     	NOT NULL 	DEFAULT 	' '             
  , EXCISE_FLAG           	varchar(1)     	NOT NULL 	DEFAULT 	' '             
  , DISCOUNT              	decimal(4, 2)  	NOT NULL 	DEFAULT 	0 				
  , TIME_ZONE             	decimal(2)     	NOT NULL 	DEFAULT 	0 				
  , TERMS                 	varchar(15)    	NOT NULL 	DEFAULT 	' '				
  , GROUP_CODE            	varchar(10)    	NOT NULL 	DEFAULT 	' '				
  , PROF_GUNSMITH         	datetime        NOT NULL 	DEFAULT 	'01/01/1753'	
  , MATCH_FLAG            	varchar(1)     	NOT NULL 	DEFAULT 	' '				
  , DL_NUMBER             	varchar(25)    	NOT NULL 	DEFAULT 	' '				
  , DL_STATE              	varchar(2)     	NOT NULL 	DEFAULT 	' '				
  , CUSTYPE               	varchar(1)     	NOT NULL 	DEFAULT 	' '				
  , NOW                   	decimal(10, 2) 	NOT NULL 	DEFAULT 	0				
  , OTHIRTY               	decimal(10, 2) 	NOT NULL 	DEFAULT 	0				
  , OSIXTY                	decimal(10, 2) 	NOT NULL 	DEFAULT 	0				
  , ONINETY               	decimal(10, 2) 	NOT NULL 	DEFAULT 	0				
  , O1TWENTY              	decimal(10, 2) 	NOT NULL 	DEFAULT 	0				
  , FINANCE               	decimal(10, 2) 	NOT NULL 	DEFAULT 	0				
  , LASTCALC              	datetime        NOT NULL 	DEFAULT 	'01/01/1753'	
  , FIRSTPUR              	datetime        NOT NULL 	DEFAULT 	'01/01/1753'	
  , HICREDIT              	decimal(10, 2) 	NOT NULL 	DEFAULT 	0				
  , CRLIMIT               	decimal(10, 2) 	NOT NULL 	DEFAULT 	0				
  , TOTPAID               	decimal(6)     	NOT NULL 	DEFAULT 	0				
  , PAIDNOW               	decimal(6)     	NOT NULL 	DEFAULT 	0				
  , PAID30                	decimal(6)     	NOT NULL 	DEFAULT 	0				
  , PAID60                	decimal(6)     	NOT NULL 	DEFAULT 	0				
  , PAID90                	decimal(6)     	NOT NULL 	DEFAULT 	0				
  , PAID120               	decimal(6)     	NOT NULL 	DEFAULT 	0				
  , INTRATE               	decimal(6, 4)  	NOT NULL 	DEFAULT 	0				
  , WFINANCE              	decimal(10, 2) 	NOT NULL 	DEFAULT 	0				
  , CURBAL                	decimal(10, 2) 	NOT NULL 	DEFAULT 	0				
  , N1                    	varchar(35)    	NOT NULL 	DEFAULT 	' '				
  , N2                    	varchar(35)    	NOT NULL 	DEFAULT 	' '				
  , N3                    	varchar(35)    	NOT NULL 	DEFAULT 	' '				
  , N4                    	varchar(35)    	NOT NULL 	DEFAULT 	' '				
  , N5                    	varchar(35)    	NOT NULL 	DEFAULT 	' '				
  , LABEL_FLAG            	varchar(1)     	NOT NULL 	DEFAULT 	' '				
  , YTDBILL               	decimal(12, 2) 	NOT NULL 	DEFAULT 	0				
  , DELETE_FLAG           	varchar(1)     	NOT NULL 	DEFAULT 	' '				
  , MEDIA_CODE            	varchar(6)     	NOT NULL 	DEFAULT 	' '				
  , ACCRUAL_DISC          	decimal(6, 2)  	NOT NULL 	DEFAULT 	0				
  , SALES_TAX_DATE        	datetime        NOT NULL 	DEFAULT 	'01/01/1753'	
  , EXCISE_#              	varchar(20)    	NOT NULL 	DEFAULT 	' '				
  , EXCISE_DATE           	datetime        NOT NULL 	DEFAULT 	'01/01/1753'	
  , CREDIT_DATE           	datetime        NOT NULL 	DEFAULT 	'01/01/1753'	
  , STATEID               	varchar(4)     	NOT NULL 	DEFAULT 	' '				
  , EMAIL                 	varchar(35)    	NOT NULL 	DEFAULT 	' '				
  , REP_ID                	varchar(15)    	NOT NULL 	DEFAULT 	' '				
  , SA_REP                	varchar(15)    	NOT NULL 	DEFAULT 	' '				
  , ADDED_REP             	varchar(15)    	NOT NULL 	DEFAULT 	' '				
  , DATE_ADDED            	datetime        NOT NULL 	DEFAULT 	'01/01/1753'	
  , TOTALAMOUNTDUE        	decimal(10, 2) 	NOT NULL 	DEFAULT 	0				
  , PAIDCURRENTPER        	decimal(6, 2)  	NOT NULL 	DEFAULT 	0				
  , PAID30PER             	decimal(6, 2)  	NOT NULL 	DEFAULT 	0				
  , PAID60PER             	decimal(6, 2)  	NOT NULL 	DEFAULT 	0				
  , PAID90PER             	decimal(6, 2)  	NOT NULL 	DEFAULT 	0				
  , PAID120PER            	decimal(6, 2)  	NOT NULL 	DEFAULT 	0				
  , ONMAILING_FLAG        	varchar(1)     	NOT NULL 	DEFAULT 	' '				
  , APPLYSHIPPING         	varchar(1)     	NOT NULL 	DEFAULT 	' '				
  , WEBSITE               	varchar(80)    	NOT NULL 	DEFAULT 	' '				
  , LAST_NAME             	varchar(25)    	NOT NULL 	DEFAULT 	' '				
  , FIRST_NAME            	varchar(15)    	NOT NULL 	DEFAULT 	' '				
  , Customer_Type         	varchar(1)     	NOT NULL 	DEFAULT 	' '				
  , TAX_FORM_EXP          	datetime        NOT NULL 	DEFAULT 	'01/01/1753'	
  , USERINITIALS          	varchar(4)     	NOT NULL 	DEFAULT 	' '             
  , DUE_0_20              	decimal(12, 2)	NOT NULL 	DEFAULT 	0				
  , DUE_21_30             	decimal(12, 2) 	NOT NULL 	DEFAULT 	0				
  , DUE_31_45             	decimal(12, 2) 	NOT NULL 	DEFAULT 	0				
  , DUE_46_60             	decimal(12, 2) 	NOT NULL 	DEFAULT 	0				
  , DUE_60PLUS            	decimal(12, 2) 	NOT NULL 	DEFAULT 	0				
  , PriceType             	varchar(20)    	NOT NULL 	DEFAULT 	' '             
  , DefaultPrice          	varchar(1)     	NOT NULL 	DEFAULT 	' '             
  , EMailInvoice          	varchar(1)     	NOT NULL 	DEFAULT 	' '             
  , EMailMerge            	varchar(1)     	NOT NULL 	DEFAULT 	' '             
  , EMailSubject          	varchar(80)    	NOT NULL 	DEFAULT 	' '             
  , CreatedBy             	varchar(4)                                              
  , CreatedDate           	date                                                    
  , ChangedBy             	varchar(4)                                              
  , ChangedDate           	date                                                    
  , Version               	varchar(15)                                             
  , BuyGroup              	varchar(1)     	NOT NULL 	DEFAULT 	' '				
  , BuyGroupNum           	bigint         	NOT NULL 	DEFAULT 	0				
  , OptInRecallEmails     	varchar(1)                                              
  , OptInEmails           	varchar(1)                                              
  , OptInRecallEmailsDate	datetime        NULL		DEFAULT 	'1753-01-01'	
  , OptInEmailsDate       	datetime        NOT NULL 	DEFAULT 	'1753-01-01'	
  , ExternalCustID        	bigint          NOT NULL 	DEFAULT 	0				
  , ShipDestinationType   	varchar(1)                                              
  , Hold                  	varchar(1)                                              
  , HoldDate              	datetime                                                
  , HoldReason            	varchar(256)                                            
  , PostType              	varchar(2)                                              
  , ShipUPS               	varchar(1)                                              
  , HoldBy                	varchar(4)                                              
  , ShipApprovalRequired  	varchar(1)                                              
  , ExternalCustType      	varchar(1)     	NOT NULL 	DEFAULT 	' '				
  , AssuredDiscount       	numeric(6, 4)  		                                    
  , ADToDiscountedOnly    	varchar(1)     		                                    
  , DealerAgentID         	bigint          NOT NULL 	DEFAULT 	0 				
  , DealerRegionID        	bigint          NOT NULL 	DEFAULT 	0 				
  , SpecialTaxStamp        	varchar(20)    	NOT NULL 	DEFAULT 	''				
  , SpecialTaxStampExpDate 	datetime        NOT NULL 	DEFAULT 	'1753/01/01'	
  , EmployerIDNum          	varchar(10)    	NOT NULL 	DEFAULT 	''				
  , FFLNotRequiredReason   	varchar(10)    	NOT NULL 	DEFAULT 	''				
	
  , CONSTRAINT	CMASTER_INDEX01 
		PRIMARY KEY CLUSTERED( CUSTID ASC )
  
  , CONSTRAINT 	FK_CMASTER_PriceType 
		FOREIGN KEY( PriceType ) 
		REFERENCES dbo.PLTypes( PriceType )
)
;
GO

ALTER TABLE dbo.CMASTER ENABLE CHANGE_TRACKING WITH ( TRACK_COLUMNS_UPDATED = OFF ) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX00
    ON dbo.CMASTER(Recnum ASC) 
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX02
    ON dbo.CMASTER(BNAME ASC, Recnum ASC) 
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX03
    ON dbo.CMASTER(BSTATE ASC, YTDSHIP ASC, Recnum ASC) 
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX04
    ON dbo.CMASTER(GROUP_CODE ASC, CUSTID ASC, Recnum ASC) 
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX05
    ON dbo.CMASTER(BZIP ASC, Recnum ASC) 
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX06
    ON dbo.CMASTER(YTDSHIP ASC, Recnum ASC) 
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX07
    ON dbo.CMASTER(BSTATE ASC, BNAME ASC, Recnum ASC) 
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX08
    ON dbo.CMASTER(TELEWHO ASC, BNAME ASC, CUSTID ASC)
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX09
    ON dbo.CMASTER(TELEWHO ASC, YTDSHIP ASC, Recnum ASC) 
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX10
    ON dbo.CMASTER(BSTATE ASC, BZIP ASC, Recnum ASC) 
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX11
    ON dbo.CMASTER(REP_ID ASC, BSTATE ASC, CUSTID ASC)
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX12
    ON dbo.CMASTER(Customer_Type ASC, CUSTID ASC, Recnum ASC) 
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX13
    ON dbo.CMASTER(CUSTYPE ASC, BNAME ASC, CUSTID ASC) 
;
GO

CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX15
    ON dbo.CMASTER(ExternalCustType ASC, ExternalCustID ASC, CUSTID ASC)
;
GO


CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX14
    ON dbo.CMASTER(PriceType ASC, CUSTID ASC) 
;
GO


CREATE UNIQUE NONCLUSTERED INDEX CMASTER_INDEX16
    ON dbo.CMASTER(BuyGroup ASC, BuyGroupNum ASC, CUSTID ASC) 
;
