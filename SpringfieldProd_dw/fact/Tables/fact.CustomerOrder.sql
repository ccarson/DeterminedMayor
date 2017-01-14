CREATE TABLE fact.CustomerOrder(
    CustomerOrderFactKey    BIGINT              NOT NULL
        IDENTITY
        CONSTRAINT pk_CustomerOrder 
            PRIMARY KEY CLUSTERED
  , BillToCustomerKey		BIGINT              NOT NULL
        CONSTRAINT fk_CustomerOrder_Customer1
            FOREIGN KEY REFERENCES dimension.Customer( CustomerKey )
  , BillToLocationKey       BIGINT              NOT NULL
        CONSTRAINT fk_CustomerOrder_Location1
            FOREIGN KEY REFERENCES dimension.Location( LocationKey )  
  , ShipToCustomerKey		BIGINT              NOT NULL
        CONSTRAINT fk_CustomerOrder_Customer2
            FOREIGN KEY REFERENCES dimension.Customer( CustomerKey )
  , ShipToLocationKey       BIGINT              NOT NULL
        CONSTRAINT fk_CustomerOrder_Location2
            FOREIGN KEY REFERENCES dimension.Location( LocationKey )  
  , OrderDateKey            BIGINT              NOT NULL
        CONSTRAINT fk_CustomerOrder_Date1 
            FOREIGN KEY REFERENCES dimension.Date( DateKey )  
  , ShipDateKey             BIGINT              NOT NULL
        CONSTRAINT fk_CustomerOrder_Date2
            FOREIGN KEY REFERENCES dimension.Date( DateKey )  
  , WantedDateKey           BIGINT              NOT NULL
        CONSTRAINT fk_CustomerOrder_Date3
            FOREIGN KEY REFERENCES dimension.Date( DateKey )  
  , ShipToName              VARCHAR (36)		NOT NULL
  , SourceOrderRecnum       BIGINT              NOT NULL
  , SourceLineRecnum        BIGINT              NOT NULL
  , OrderNumber             DECIMAL (10, 2)     NOT NULL
  , OrderStatus             VARCHAR (02)        NOT NULL
  , LineItemNumber          DECIMAL (4)         NOT NULL
  , LineItemStatus          VARCHAR (01)        NOT NULL
  , CustomerPO              VARCHAR (40)        NOT NULL
  , ShipToPO                VARCHAR (40)        NOT NULL
  , PaidDate                DATETIME            NOT NULL
  , CancelDate              DATETIME            NOT NULL
  , SubtotalAmount          DECIMAL (10, 2)     NOT NULL
  , DiscountAmount          DECIMAL (10, 2)     NOT NULL
  , PostageAmount           DECIMAL (10, 2)     NOT NULL
  , DepositAmount           DECIMAL (10, 2)     NOT NULL
  , CODAmount               DECIMAL (10, 2)     NOT NULL
  , TaxAmount               DECIMAL (10, 2)     NOT NULL
  , ReceivedAmount          DECIMAL (10, 2)     NOT NULL
  , TotalAmount             DECIMAL (10, 2)     NOT NULL
  , BalanceAmount           DECIMAL (10, 2)     NOT NULL
  , RefundAmount            DECIMAL (10, 2)     NOT NULL
  , PartNumber              VARCHAR (20)        NOT NULL
  , UnitPrice               DECIMAL (8, 2)      NOT NULL
  , TotalPrice              DECIMAL (8, 2)      NOT NULL
  , RegularPrice            DECIMAL (8, 2)      NOT NULL
  , ListPrice               DECIMAL (8, 2)      NOT NULL
  , TotalCost               DECIMAL (10, 4)     NOT NULL
  , UnitRawCost             DECIMAL (12, 6)     NOT NULL
  , UnitFinalCost           DECIMAL (12, 6)     NOT NULL
  , ItemQuantity            DECIMAL (8)         NOT NULL
  , ShippedQuantity         DECIMAL (8)         NOT NULL
  , BackorderQuantity		DECIMAL (8)         NOT NULL
  , QuanS                   DECIMAL (8)         NOT NULL
  , Quan_BO                 DECIMAL (8)         NOT NULL
  , Programming_Ver         DECIMAL (2, 0)      NOT NULL
  , DWTimestamp             DATETIME            NOT NULL
        CONSTRAINT df_CustomerOrder_DWTimestamp 
            DEFAULT GETDATE() 
);

GO



