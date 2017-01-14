CREATE PROCEDURE [dbo].[sasp_QuantityAllocatedForWorkOrders] 
(
@sPartNum VARCHAR(20)
, @sInventoryState CHAR(1)
)
AS
  DECLARE @PartNum VARCHAR(20);
  DECLARE @InventoryState CHAR(1);
  SET @PartNum = @sPartNum;
  SET @InventoryState = @sInventoryState;

  SELECT SUM(WOBOM.NEEDED-WOBOM.PULLED)
  FROM WOBOM
    INNER JOIN WOHeader 
      ON WOBOM.WO_# = WOHeader.WO_# 
  WHERE WOHeader.STATUS > 1
    AND WOHeader.STATUS < 8 
    AND WOBOM.REPLACE_FLAG <> 'Y' 
    AND wobom.INV_STATE = @InventoryState
    AND wobom.SUBPART = @PartNum
