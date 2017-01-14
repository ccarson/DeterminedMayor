
CREATE PROCEDURE [dbo].[sasp_CurrentManifestHeaderIDForCustomer] 
(
@sLocation CHAR(1)
, @idCarrier INT
, @sStatus CHAR(1)
, @sSCustID CHAR(10)
)
AS
  SELECT ISNULL(MAX(ID), 0) AS CurrentID
  FROM ManifestHeader
  WHERE Location = @sLocation
      AND CarrierID = @idCarrier
      AND [Status] = @sStatus
      AND SCustID = @sSCustID