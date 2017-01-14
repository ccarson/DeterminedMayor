
CREATE PROCEDURE [dbo].[sasp_UpdateManifestsForNonAIMOrdersWithWaybill] @sWaybill varchar(50), @sName varchar(36), @sCity varchar(20), @sState varchar(2), @iHeaderID bigint, @iPallet int
AS

UPDATE ManifestDetail 
SET MasterTrackingID = @sWaybill
  , MasterTrackingIDType = 'TRUCK' 
WHERE ManifestDetail.ID IN
  (SELECT md.ID
    FROM ManifestDetail md
      INNER JOIN ManifestPackage mp
        ON md.ID = mp.DetailID
      INNER JOIN CartonHeader ch
        ON mp.ID = ch.ManifestPackageID
          AND ch.Pallet = @iPallet
    WHERE md.Status <> 'C' 
      AND md.HeaderID = @iHeaderID 
      AND md.Name = @sName 
      AND md.City = @sCity 
      AND md.[State] = @sState
  );

--Now set the waybill into all the packages
UPDATE ManifestPackage 
SET TrackingID = @sWaybill
WHERE DetailID IN 
  (SELECT md.ID 
    FROM ManifestDetail md
    WHERE md.Status <> 'C' 
      AND md.HeaderID = @iHeaderID
      AND md.Name = @sName 
      AND md.City = @sCity 
      AND md.[State] = @sState
  )
  AND ManifestPackage.ID IN
    (SELECT ch.ManifestPackageID
      FROM CartonHeader ch
        WHERE ManifestPackage.ID = ch.ManifestPackageID
          AND ch.Pallet = @iPallet
    )