CREATE TABLE 
	archive.CustomerOrder(
		CustomerOrderFactKey	BIGINT			NOT NULL
      , BillToCustomerKey    	BIGINT          NOT NULL
      , BillToLocationKey    	BIGINT          NOT NULL
      , ShipToCustomerKey    	BIGINT          NOT NULL
      , ShipToLocationKey    	BIGINT          NOT NULL
      , OrderDateKey         	BIGINT          NOT NULL
      , ShipDateKey          	BIGINT          NOT NULL
      , WantedDateKey        	BIGINT          NOT NULL
      , PartKey              	BIGINT          NOT NULL
      , SourceOrderRecnum    	BIGINT          NOT NULL
      , SourceLineRecnum     	BIGINT          NOT NULL
      , ShipToName           	VARCHAR(36)    	NOT NULL
      , OrderNumber          	DECIMAL(10, 2) 	NOT NULL
      , OrderStatus          	CHAR(2)        	NOT NULL
      , LineItemNumber       	DECIMAL(4)     	NOT NULL
      , LineItemStatus       	CHAR(1)        	NOT NULL
      , CustomerPO           	VARCHAR(40)    	NOT NULL
      , ShipToPO             	VARCHAR(40)    	NOT NULL
      , PaidDate             	DATETIME        NOT NULL
      , CancelDate           	DATETIME        NOT NULL
      , SubtotalAmount       	DECIMAL(10, 2) 	NOT NULL
      , DiscountAmount       	DECIMAL(10, 2) 	NOT NULL
      , PostageAmount        	DECIMAL(10, 2) 	NOT NULL
      , DepositAmount        	DECIMAL(10, 2) 	NOT NULL
      , CODAmount            	DECIMAL(10, 2) 	NOT NULL
      , TaxAmount            	DECIMAL(10, 2) 	NOT NULL
      , ReceivedAmount       	DECIMAL(10, 2) 	NOT NULL
      , TotalAmount          	DECIMAL(10, 2) 	NOT NULL
      , BalanceAmount        	DECIMAL(10, 2) 	NOT NULL
      , RefundAmount         	DECIMAL(10, 2) 	NOT NULL
      , UnitPrice            	DECIMAL(8, 2)  	NOT NULL
      , TotalPrice           	DECIMAL(8, 2)  	NOT NULL
      , RegularPrice         	DECIMAL(8, 2)  	NOT NULL
      , ListPrice            	DECIMAL(8, 2)  	NOT NULL
      , TotalCost            	DECIMAL(10, 4) 	NOT NULL
      , UnitRawCost          	DECIMAL(12, 6) 	NOT NULL
      , UnitFinalCost        	DECIMAL(12, 6) 	NOT NULL
      , ItemQuantity         	DECIMAL(8)     	NOT NULL
      , ShippedQuantity      	DECIMAL(8)     	NOT NULL
      , BackorderQuantity    	DECIMAL(8)     	NOT NULL
      , QuanS                	DECIMAL(8)     	NOT NULL
      , Quan_BO              	DECIMAL(8)     	NOT NULL
      , YardCode             	VARCHAR(04)     NOT NULL
      , Programming_Ver      	DECIMAL(2)     	NOT NULL
      , OriginalOrderNumber  	AS	CONVERT( BIGINT, FLOOR( OrderNumber ) ) PERSISTED
      , IsOriginalOrder      	AS	CASE 
										WHEN OrderNumber = FLOOR( OrderNumber ) THEN 1
										ELSE 0 
									END PERSISTED 
	  , IsBackorder          	AS	CASE OrderStatus 
										WHEN 'BD' THEN 1 
										WHEN 'BP' THEN 1 
										WHEN 'OD' THEN 1 
										WHEN 'OP' THEN 1 
										WHEN 'RD' THEN 1 
										WHEN 'RP' THEN 1 
										ELSE 0 
									END PERSISTED NOT NULL
      , ItemBackorderPrice   	AS  BackorderQuantity * UnitPrice PERSISTED
      , DWChecksum           	BINARY(32)		NOT NULL
      , DWVersion            	INT             NOT NULL	DEFAULT 1 
      , DWTimestamp          	DATETIME        NOT NULL	DEFAULT GETDATE()
      , CONSTRAINT pk_CustomerOrder_archive
			PRIMARY KEY CLUSTERED ( CustomerOrderFactKey ASC, DWVersion ASC) WITH ( FILLFACTOR = 90 )
);

