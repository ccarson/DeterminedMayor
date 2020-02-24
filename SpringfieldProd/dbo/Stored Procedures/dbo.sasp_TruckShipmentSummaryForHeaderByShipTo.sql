
CREATE PROCEDURE [dbo].[sasp_TruckShipmentSummaryForHeaderByShipTo] @iHeaderID bigint
AS
  WITH GroupedCust AS 
  (SELECT md.SCustID, SUM(md.TotalWeight) AS TotWeight, ISNULL(ch.Pallet, 0) AS Pallet, SUM(md.PackageCount) as TotalPackages
    FROM ManifestDetail md
      INNER JOIN ManifestPackage mp
        ON md.ID = mp.DetailID
      LEFT JOIN CartonHeader ch
        ON mp.ID = ch.ManifestPackageID
    WHERE md.[Status] <> 'C'
        AND md.SCustID IS NOT NULL AND md.SCustID <> '' AND md.HeaderID = @iHeaderID 
    GROUP BY md.SCustID, ISNULL(ch.Pallet, 0)) 
  --The AIM orders, by Ship To ID
  SELECT gc.SCustID, '' AS VendorID, cm.BNAME, gc.TotWeight, gc.Pallet, gc.TotalPackages
  FROM GroupedCust gc 
    INNER JOIN CMASTER cm ON gc.SCustID = cm.CustID 
  --Now the non-AIM orders, by Name/City/State.
  UNION SELECT '', md.VendorID, md.Name, SUM(md.TotalWeight), ISNULL(ch.Pallet, 0) AS Pallet, SUM(md.PackageCount)
  FROM ManifestDetail md
    INNER JOIN ManifestPackage mp
      ON md.ID = mp.DetailID
    LEFT JOIN CartonHeader ch
      ON mp.ID = ch.ManifestPackageID
  WHERE md.[Status] <> 'C' 
    AND (md.SCustID IS NULL OR md.SCustID = '') 
    AND md.HeaderID = @iHeaderID 
  GROUP BY md.VendorID, md.Name, ISNULL(ch.Pallet, 0)