CREATE PROCEDURE [dbo].[sasp_PackedQtyForPartNum] @numOrder NUMERIC(12,2), @sPartNum VARCHAR(20)
AS
  SELECT SUM(CartonDetail.Qty) 
  FROM CartonDetail 
    INNER JOIN CartonHeader 
      ON CartonHeader.ID = CartonDetail.CartonHeaderID 
    WHERE CartonHeader.OrdNum = @numOrder
        AND CartonDetail.SprNum = @sPartNum
