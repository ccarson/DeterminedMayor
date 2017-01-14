
CREATE PROCEDURE [dbo].[sasp_UpdateManifestHeaderPickupDate] @iHeaderID bigint, @dToday date
AS

DECLARE @iBatch int;

--Find the max batch number for the ship date
SET @iBatch = 
  (SELECT ISNULL(MAX(mh1.Batch), 0)
  FROM ManifestHeader mh1
    INNER JOIN ManifestHeader mh2
      ON mh1.PickupDate = @dToday
        AND mh2.ID = @iHeaderID
        AND mh1.Location = mh2.Location
        and mh1.CarrierID = mh2.CarrierID
  );

UPDATE ManifestHeader
SET PickupDate = @dToday
  , Batch = @iBatch + 1
WHERE ManifestHeader.ID = @iHeaderID