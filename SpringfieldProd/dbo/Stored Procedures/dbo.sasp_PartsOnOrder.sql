
CREATE PROCEDURE [dbo].[sasp_PartsOnOrder] 
(
  @PartNum varchar(20)
)
AS
BEGIN

  DECLARE @WOPO table
  (
    OrderType char(1)
    , OrderNum int
    , OnOrder int
    , Received int
    , ProjectedDate datetime
    , OrderStatus char(1)
  )

  INSERT INTO @WOPO (OrderType, OrderNum, OnOrder, Received, ProjectedDate, OrderStatus)
  SELECT 'W', WO_#, QTY_PROJ, AVAIL, [TARGET], [STATUS]
  FROM WOHeader
  WHERE SPRNUM = @PartNum
      AND [STATUS] < 8;

  INSERT INTO @WOPO (OrderType, OrderNum, OnOrder, Received, ProjectedDate, OrderStatus)
  SELECT 'P', PO_#, QTY_ORD, QTY_RECD_TD, DELIV_DATE, ''
  FROM PODETAIL
  WHERE SPRNUM = @PartNum
      AND CLOSED_FLAG <> 'Y';

  SELECT OrderType, OrderNum, OnOrder, Received, ProjectedDate, OrderStatus
  FROM @WOPO
  ORDER BY ProjectedDate DESC

END