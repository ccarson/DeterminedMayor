CREATE VIEW
    dbo.vwAllCustomers
AS

SELECT
    CustomerKey
  , SourceRecnum
  , CustomerID
  , CustomerName
  , PriceType
  , DWChecksum
  , DWVersion
  , DWTimestamp
FROM
    dimension.Customer
UNION ALL
SELECT
    CustomerKey
  , SourceRecnum
  , CustomerID
  , CustomerName
  , PriceType
  , DWChecksum
  , DWVersion
  , DWTimestamp
FROM
    archive.Customer
;