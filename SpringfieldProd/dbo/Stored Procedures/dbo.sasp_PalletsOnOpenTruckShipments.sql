CREATE PROCEDURE [dbo].[sasp_PalletsOnOpenTruckShipments] @sLocation char(1)
AS
  WITH GroupedCust AS 
  (SELECT mh.ID, ch.Pallet, SUM(md.PackageCount) as TotalPackages
    FROM ManifestHeader mh
      INNER JOIN Carrier c
        ON mh.CarrierID = c.ID
            AND c.CreateDailyManifest = 'N'
            AND mh.[Status] = 'O'
            AND mh.Location = @sLocation
      INNER JOIN ManifestDetail md
        ON mh.ID = md.HeaderID
      INNER JOIN ManifestPackage mp
        ON md.ID = mp.DetailID
      INNER JOIN CartonHeader ch
        ON mp.ID = ch.ManifestPackageID
    WHERE md.[Status] <> 'C'
    GROUP BY mh.ID, ch.Pallet) 
  --The AIM orders, by Ship To ID
  SELECT gc.ID, c.Name, mh.SCustID, gc.Pallet, gc.TotalPackages
  FROM GroupedCust gc 
    INNER JOIN ManifestHeader mh
      ON gc.ID = mh.ID
    INNER JOIN Carrier c
        ON mh.CarrierID = c.ID