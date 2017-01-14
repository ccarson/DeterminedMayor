
CREATE PROCEDURE [dbo].[sasp_UpdateManifestsForSCustIDWithWaybill] @sWaybill varchar(50), @sCustID varchar(10), @iHeaderID bigint, @iPallet int
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
      AND HeaderID = @iHeaderID 
      AND SCustID = @sCustID
    );

--Now set the waybill into all the packages
UPDATE ManifestPackage 
SET TrackingID = @sWaybill
WHERE DetailID IN 
  (SELECT md.ID 
    FROM ManifestDetail md
    WHERE md.Status <> 'C' 
      AND md.HeaderID = @iHeaderID
      AND md.SCustID = @sCustID
  )
  AND ManifestPackage.ID IN
    (SELECT ch.ManifestPackageID
      FROM CartonHeader ch
        WHERE ManifestPackage.ID = ch.ManifestPackageID
          AND ch.Pallet = @iPallet
    )