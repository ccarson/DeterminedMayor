CREATE PROCEDURE [dbo].[sasp_PackedQtyForOrder] @numOrder NUMERIC(12,2)
AS
  SELECT ISNULL(SUM(CartonDetail.Qty), 0)
  FROM CartonDetail 
    INNER JOIN CartonHeader 
      ON CartonHeader.ID = CartonDetail.CartonHeaderID 
    WHERE CartonHeader.OrdNum = @numOrder
