CREATE PROCEDURE [dbo].[sasp_ManifestDetailCountForStatus] @numOrder NUMERIC(12,2), @sStatus CHAR(1)
AS
  SELECT COUNT(*) 
  FROM ManifestDetail
  WHERE OrdNum = @numOrder 
      AND Status = @sStatus
