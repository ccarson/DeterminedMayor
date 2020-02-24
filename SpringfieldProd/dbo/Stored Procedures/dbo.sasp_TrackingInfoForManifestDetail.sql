
CREATE PROCEDURE [dbo].[sasp_TrackingInfoForManifestDetail] @idManifestDetail bigint
AS
  SELECT mp.TrackingID, 
	c.Name, cs.DisplayName, 
	mp.[Weight], 
	ISNULL(ch.CreatedBy, 'N/A') as Packer, 
	ISNULL(ch.Pallet, 0) as Pallet, 
	Convert(nvarchar(6), ch.Carton_Length)+'x'+Convert(nvarchar(6), ch.Carton_width)+'x'+Convert(nvarchar(6), ch.Carton_Height) as Dim
    FROM ManifestDetail md
      INNER JOIN ManifestPackage mp
        ON md.ID = mp.DetailID
            AND md.ID = @idManifestDetail 
      INNER JOIN ManifestHeader mh
        ON md.HeaderID = mh.ID
      INNER JOIN Carrier c
        ON c.ID = mh.CarrierID
      INNER JOIN CarrierService cs
        ON cs.ID = md.CarrierServiceID
      LEFT JOIN CartonHeader ch
        ON mp.ID = ch.ManifestPackageID