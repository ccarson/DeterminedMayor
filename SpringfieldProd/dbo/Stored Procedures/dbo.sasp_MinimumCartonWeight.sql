CREATE PROCEDURE [dbo].[sasp_MinimumCartonWeight] @numOrder NUMERIC(12,2)
AS
  SELECT MIN([Weight])
  FROM CartonHeader
  WHERE OrdNum = @numOrder 
