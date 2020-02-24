

CREATE PROCEDURE [dbo].[sasp_UpdateManifestsForNonAIMOrdersWithWaybill] 
(
  @sWaybill varchar(50)
, @sVendorID varchar(8)
, @iHeaderID bigint
, @iPallet int
)
AS

--We don't actually have CartonHeader records for Non-AIM orders, so the Pallet number is useless right now...

UPDATE ManifestDetail 
SET MasterTrackingID = @sWaybill
  , MasterTrackingIDType = 'TRUCK' 
/*
WHERE ManifestDetail.ID IN
  (SELECT md.ID
    FROM ManifestDetail md
      INNER JOIN ManifestPackage mp
        ON md.ID = mp.DetailID
      LEFT JOIN CartonHeader ch
        ON mp.ID = ch.ManifestPackageID
          AND ch.Pallet = @iPallet
    WHERE md.Status <> 'C' 
      AND md.HeaderID = @iHeaderID 
      AND md.VendorID = @sVendorID 
  );
*/
--Remove this if we put the Pallet code (above) back in.
    WHERE [Status] <> 'C' 
      AND HeaderID = @iHeaderID 
      AND VendorID = @sVendorID;

--Now set the waybill into all the packages
UPDATE ManifestPackage 
SET TrackingID = @sWaybill
WHERE DetailID IN 
  (SELECT md.ID 
    FROM ManifestDetail md
    WHERE md.Status <> 'C' 
      AND md.HeaderID = @iHeaderID
      AND md.VendorID = @sVendorID 
  )
/*
  AND ManifestPackage.ID IN
    (SELECT ch.ManifestPackageID
      FROM CartonHeader ch
        WHERE ManifestPackage.ID = ch.ManifestPackageID
          AND ch.Pallet = @iPallet
    )
*/