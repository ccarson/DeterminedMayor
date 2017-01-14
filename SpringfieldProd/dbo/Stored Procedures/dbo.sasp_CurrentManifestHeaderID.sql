CREATE PROCEDURE [dbo].[sasp_CurrentManifestHeaderID] 
(
@sLocation CHAR(1)
, @idCarrier INT
, @sStatus CHAR(1)
)
AS
  SELECT ISNULL(MAX(ID), 0) AS CurrentID
  FROM ManifestHeader
  WHERE Location = @sLocation
      AND CarrierID = @idCarrier
      AND [Status] = @sStatus
