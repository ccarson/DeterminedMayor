CREATE TABLE stage.MASTERLN(
    ID                  BIGINT			NOT NULL
		IDENTITY
		CONSTRAINT pk_MASTERLN PRIMARY KEY CLUSTERED
  , Recnum              BIGINT          
  , ORDNUM              DECIMAL (10, 2) 
  , QUAN                DECIMAL (8)     
  , QUANS               DECIMAL (8)     
  , SPRNUM              VARCHAR (20)    
  , [DESC]              VARCHAR (38)    
  , UPRICE			    DECIMAL (8, 2)  
  , TPRICE			    DECIMAL (8, 2)  
  , BACKORDER		    VARCHAR (1)     
  , QUANSHIP		    DECIMAL (8)     
  , [DATE]			    DATETIME        
  , SHIPDATE		    DATETIME        
  , [IN]			    DECIMAL (4)     
  , YARD			    VARCHAR (4)     
  , COM				    VARCHAR (1)     
  , TELEYARD 		    VARCHAR (4)     
  , EXCISE_DATE		    DATETIME        
  , IN2				    DECIMAL (2)     
  , TCOST			    DECIMAL (10, 4) 
  , REGPRICE		    DECIMAL (8, 2)  
  , BACKREL			    DECIMAL (8)     
  , LIST_PRICE		    DECIMAL (8, 2)  
  , CUSTOM_FLAG		    VARCHAR (1)     
  , Quan_BO			    DECIMAL (8)     
  , [Status]            VARCHAR (1)     
  , Programming_Ver		DECIMAL (2)     
  , Purchase_Time	    VARCHAR (5)     
  , RawCostEach		    DECIMAL (12, 6) 
  , FinCostEach		    DECIMAL (12, 6) 
  , USERINITIALS	    VARCHAR (4)     
  , MovedToBO		    VARCHAR (1)     
  , QuanA			    INT             
  , QuanPacked		    DECIMAL (8)     
  , QuanSOriginal	    INT             
  , SYS_CHANGE_VERSION	BIGINT
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [MASTERLN_INDEX00]
    ON [stage].[MASTERLN]([ORDNUM] ASC, [IN] ASC, [ID] ASC);

