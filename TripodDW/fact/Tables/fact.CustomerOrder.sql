CREATE TABLE 
	fact.CustomerOrder(
		CustomerOrderFactKey	BIGINT			NOT NULL 	IDENTITY 
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
      , CONSTRAINT pk_CustomerOrder PRIMARY KEY CLUSTERED (CustomerOrderFactKey ASC) WITH (FILLFACTOR = 90)
      , CONSTRAINT fk_CustomerOrder_Customer1 FOREIGN KEY (BillToCustomerKey) REFERENCES dimension.Customer (CustomerKey)
      , CONSTRAINT fk_CustomerOrder_Customer2 FOREIGN KEY (ShipToCustomerKey) REFERENCES dimension.Customer (CustomerKey)
      , CONSTRAINT fk_CustomerOrder_Date1 FOREIGN KEY (OrderDateKey) REFERENCES dimension.Date (DateKey)
      , CONSTRAINT fk_CustomerOrder_Date2 FOREIGN KEY (ShipDateKey) REFERENCES dimension.Date (DateKey)
      , CONSTRAINT fk_CustomerOrder_Date3 FOREIGN KEY (WantedDateKey) REFERENCES dimension.Date (DateKey)
      , CONSTRAINT fk_CustomerOrder_Location1 FOREIGN KEY (BillToLocationKey) REFERENCES dimension.Location (LocationKey)
      , CONSTRAINT fk_CustomerOrder_Location2 FOREIGN KEY (ShipToLocationKey) REFERENCES dimension.Location (LocationKey)
      , CONSTRAINT fk_CustomerOrder_part FOREIGN KEY (PartKey) REFERENCES dimension.Part (PartKey)
);


GO
CREATE NONCLUSTERED INDEX IX_CustomerOrder_01
    ON fact.CustomerOrder(OrderDateKey ASC)
    INCLUDE(CustomerOrderFactKey, BillToCustomerKey, BillToLocationKey, ShipToCustomerKey, ShipToLocationKey, ShipDateKey, WantedDateKey, PartKey, OrderNumber, UnitPrice, ItemQuantity, ShippedQuantity, BackorderQuantity) WITH (FILLFACTOR = 100);
GO

CREATE NONCLUSTERED INDEX IX_CustomerOrder_02
    ON fact.CustomerOrder(PartKey ASC, OrderDateKey ASC)
    INCLUDE(CustomerOrderFactKey, BillToCustomerKey, BillToLocationKey, ShipToCustomerKey, ShipToLocationKey, ShipDateKey, WantedDateKey, OrderNumber, UnitPrice, ItemQuantity, ShippedQuantity, BackorderQuantity) WITH (FILLFACTOR = 100);
GO
CREATE NONCLUSTERED INDEX [IX_CustomerOrder_03]
    ON [fact].[CustomerOrder]([OrderNumber] ASC, [LineItemNumber] ASC)
    INCLUDE([CustomerOrderFactKey])  WITH (FILLFACTOR = 100);
GO

CREATE UNIQUE NONCLUSTERED INDEX UX_CustomerOrder_00
    ON fact.CustomerOrder(SourceOrderRecnum ASC, SourceLineRecnum ASC) WITH (FILLFACTOR = 90);


GO
CREATE UNIQUE NONCLUSTERED INDEX UX_CustomerOrder_01
    ON fact.CustomerOrder(DWChecksum ASC) WITH (FILLFACTOR = 80);


GO
CREATE UNIQUE NONCLUSTERED INDEX UX_CustomerOrder_02
    ON fact.CustomerOrder(PartKey ASC, CustomerOrderFactKey ASC)
    INCLUDE(SourceOrderRecnum, SourceLineRecnum, ShipToName, OrderNumber, OrderStatus, CustomerPO, ShipToPO, OriginalOrderNumber, LineItemNumber, UnitPrice, BillToCustomerKey, ShipToCustomerKey) WITH (FILLFACTOR = 90);


GO

CREATE TRIGGER fact.trg_CustomerOrder_archive
	ON fact.CustomerOrder AFTER UPDATE, DELETE 
AS
/*
************************************************************************************************************************************

    Trigger:    fact.trg_CustomerOrder_archive 
     Author:    ccarson
    Purpose:    archives existing fact.CustomerOrder records

    revisor         date            description
    ---------       ----------      ----------------------------
    ccarson         2016-10-01      created

    Notes:

************************************************************************************************************************************
*/
BEGIN
    IF  @@ROWCOUNT = 0 RETURN ;

    SET NOCOUNT, XACT_ABORT ON ;
    
--  1)  INSERT deleted data into archive.CustomerOrder
INSERT INTO
    archive.CustomerOrder(
        CustomerOrderFactKey
      , BillToCustomerKey
      , BillToLocationKey
      , ShipToCustomerKey
      , ShipToLocationKey
      , OrderDateKey
      , ShipDateKey
      , WantedDateKey
      , PartKey
      , SourceOrderRecnum
      , SourceLineRecnum
      , ShipToName
      , OrderNumber
      , OrderStatus
      , LineItemNumber
      , LineItemStatus
      , CustomerPO
      , ShipToPO
      , PaidDate
      , CancelDate
      , SubtotalAmount
      , DiscountAmount
      , PostageAmount
      , DepositAmount
      , CODAmount
      , TaxAmount
      , ReceivedAmount
      , TotalAmount
      , BalanceAmount
      , RefundAmount
      , UnitPrice
      , TotalPrice
      , RegularPrice
      , ListPrice
      , TotalCost
      , UnitRawCost
      , UnitFinalCost
      , ItemQuantity
      , ShippedQuantity
      , BackorderQuantity
      , QuanS
      , Quan_BO
      , YardCode
      , Programming_Ver
      , DWChecksum
      , DWVersion
      , DWTimestamp )

SELECT
        CustomerOrderFactKey    =   tripod.CustomerOrderFactKey
      , BillToCustomerKey       =   tripod.BillToCustomerKey
      , BillToLocationKey       =   tripod.BillToLocationKey
      , ShipToCustomerKey       =   tripod.ShipToCustomerKey
      , ShipToLocationKey       =   tripod.ShipToLocationKey
      , OrderDateKey            =   tripod.OrderDateKey
      , ShipDateKey             =   tripod.ShipDateKey
      , WantedDateKey           =   tripod.WantedDateKey
      , PartKey                 =   tripod.PartKey
      , SourceOrderRecnum       =   tripod.SourceOrderRecnum
      , SourceLineRecnum        =   tripod.SourceLineRecnum
      , ShipToName              =   tripod.ShipToName
      , OrderNumber             =   tripod.OrderNumber
      , OrderStatus             =   tripod.OrderStatus
      , LineItemNumber          =   tripod.LineItemNumber
      , LineItemStatus          =   tripod.LineItemStatus
      , CustomerPO              =   tripod.CustomerPO
      , ShipToPO                =   tripod.ShipToPO
      , PaidDate                =   tripod.PaidDate
      , CancelDate              =   tripod.CancelDate
      , SubtotalAmount          =   tripod.SubtotalAmount
      , DiscountAmount          =   tripod.DiscountAmount
      , PostageAmount           =   tripod.PostageAmount
      , DepositAmount           =   tripod.DepositAmount
      , CODAmount               =   tripod.CODAmount
      , TaxAmount               =   tripod.TaxAmount
      , ReceivedAmount          =   tripod.ReceivedAmount
      , TotalAmount             =   tripod.TotalAmount
      , BalanceAmount           =   tripod.BalanceAmount
      , RefundAmount            =   tripod.RefundAmount
      , UnitPrice               =   tripod.UnitPrice
      , TotalPrice              =   tripod.TotalPrice
      , RegularPrice            =   tripod.RegularPrice
      , ListPrice               =   tripod.ListPrice
      , TotalCost               =   tripod.TotalCost
      , UnitRawCost             =   tripod.UnitRawCost
      , UnitFinalCost           =   tripod.UnitFinalCost
      , ItemQuantity            =   tripod.ItemQuantity
      , ShippedQuantity         =   tripod.ShippedQuantity
      , BackorderQuantity       =   tripod.BackorderQuantity
      , QuanS                   =   tripod.QuanS
      , Quan_BO                 =   tripod.Quan_BO
      , YardCode                =   tripod.YardCode
      , Programming_Ver         =   tripod.Programming_Ver
      , DWChecksum              =   tripod.DWChecksum
      , DWVersion               =   tripod.DWVersion
      , DWTimestamp             =   tripod.DWTimestamp
FROM
    deleted AS tripod ;

END

