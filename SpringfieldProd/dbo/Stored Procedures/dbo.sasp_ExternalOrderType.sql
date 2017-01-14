CREATE PROCEDURE [dbo].[sasp_ExternalOrderType] @numOrder NUMERIC(12,2)
AS
  SELECT ISNULL(ExternalOrderType, '')
  FROM CUSTINFO
  WHERE ORDNUM = @numOrder 
