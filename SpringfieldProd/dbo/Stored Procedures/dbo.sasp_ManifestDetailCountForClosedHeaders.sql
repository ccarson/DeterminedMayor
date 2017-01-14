CREATE PROCEDURE [dbo].[sasp_ManifestDetailCountForClosedHeaders] @numOrder NUMERIC(12,2)
AS
  SELECT COUNT(*) 
  FROM ManifestDetail
  WHERE OrdNum = @numOrder 
      AND Status NOT IN ('O', 'C')
