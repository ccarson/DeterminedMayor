CREATE VIEW
    dbo.vwAllCustomerOrders
AS

SELECT
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
  , OriginalOrderNumber  	
  , IsOriginalOrder  		
  , IsBackorder				
  , ItemBackorderPrice		
  , DWChecksum
  , DWVersion
  , DWTimestamp

FROM
    fact.CustomerOrder
UNION ALL

SELECT
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
  , OriginalOrderNumber  	
  , IsOriginalOrder  		
  , IsBackorder				
  , ItemBackorderPrice	
  , DWChecksum
  , DWVersion
  , DWTimestamp

FROM
    archive.CustomerOrder
;