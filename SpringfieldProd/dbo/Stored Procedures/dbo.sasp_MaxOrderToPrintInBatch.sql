
CREATE PROCEDURE [dbo].[sasp_MaxOrderToPrintInBatch] 
(
  @iMaxRows int,
  @iCustomerCopy tinyint
)
AS

DECLARE @UnprintedOrders TABLE
(
  OrderNum decimal(10, 2) 
); 

IF @iCustomerCopy <> 0 BEGIN
  INSERT INTO @UnprintedOrders (OrderNum)
  SELECT TOP (@iMaxRows) md.OrdNum
  FROM ManifestDetail md 
  WHERE md.Status = 'P' 
      AND md.InvoiceOutputType = 'P' 
  ORDER BY OrdNum;
END
ELSE BEGIN
  INSERT INTO @UnprintedOrders (OrderNum)
  SELECT TOP (@iMaxRows) md.OrdNum
  FROM ManifestDetail md 
  WHERE md.Status IN ('R', 'I', 'P', 'E') 
      AND md.SACopyPrinted = 'N' 
  ORDER BY OrdNum;
END

SELECT ISNULL(MAX(OrderNum), 0) 
FROM @UnprintedOrders;