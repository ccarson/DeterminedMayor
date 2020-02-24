CREATE PROCEDURE [dbo].[sasp_PackedQtyForLine] @numOrder NUMERIC(12,2), @iLine INT
AS
DECLARE @OrderNumber Numeric(12,2)
DECLARE @LineNum INT
SET @OrderNumber = @numOrder;
SET @LineNum = @iLine;
  SELECT SUM(CartonDetail.qty) 
  FROM CartonDetail 
    INNER JOIN CartonHeader 
      ON CartonHeader.ID = CartonDetail.CartonHeaderID 
    WHERE CartonHeader.ORDNUM = @OrderNumber
        AND CartonDetail.LineNumber = @LineNum
