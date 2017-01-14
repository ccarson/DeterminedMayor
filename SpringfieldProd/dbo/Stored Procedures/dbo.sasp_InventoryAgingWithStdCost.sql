
CREATE PROCEDURE [dbo].[sasp_InventoryAgingWithStdCost] @InventoryType char(3)
AS
  IF @InventoryType = 'FIN' 
  begin
    EXEC sp_executesql N'sasp_InventoryAgingFinWithStdCost'
  end
  ELSE IF @InventoryType = 'RES' 
  begin
    EXEC sp_executesql N'sasp_InventoryAgingReservedWithStdCost'
  end
  ELSE IF @InventoryType = 'RAW' 
  begin
    EXEC sp_executesql N'sasp_InventoryAgingRawWithStdCost'
  end
  ELSE IF @InventoryType = 'WIP' 
  begin
    EXEC sp_executesql N'sasp_InventoryAgingWIPWithStdCost'
  end
  ELSE
    SELECT 'Invalid Inventory Type'