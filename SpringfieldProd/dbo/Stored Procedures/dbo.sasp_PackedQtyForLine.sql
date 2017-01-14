CREATE PROCEDURE [dbo].[sasp_PackedQtyForLine] @numOrder NUMERIC(12,2), @iLine INT
AS
  SELECT SUM(CartonDetail.Qty) 
  FROM CartonDetail 
    INNER JOIN CartonHeader 
      ON CartonHeader.ID = CartonDetail.CartonHeaderID 
    WHERE CartonHeader.OrdNum = @numOrder
        AND CartonDetail.LineNumber = @iLine
