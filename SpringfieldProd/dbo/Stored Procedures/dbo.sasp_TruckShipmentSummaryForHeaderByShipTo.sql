
CREATE PROCEDURE [dbo].[sasp_TruckShipmentSummaryForHeaderByShipTo] @iHeaderID bigint
AS
  WITH GroupedCust AS 
  (SELECT md.SCustID, SUM(md.TotalWeight) AS TotWeight, ch.Pallet, SUM(md.PackageCount) as TotalPackages
    FROM ManifestDetail md
      INNER JOIN ManifestPackage mp
        ON md.ID = mp.DetailID
      INNER JOIN CartonHeader ch
        ON mp.ID = ch.ManifestPackageID
    WHERE md.[Status] <> 'C'
        AND md.SCustID IS NOT NULL AND md.SCustID <> '' AND md.HeaderID = @iHeaderID 
    GROUP BY md.SCustID, ch.Pallet) 
  --The AIM orders, by Ship To ID
  SELECT gc.SCustID, cm.BNAME, cm.BCITY, cm.BSTATE, gc.TotWeight, gc.Pallet, gc.TotalPackages
  FROM GroupedCust gc 
    INNER JOIN CMASTER cm ON gc.SCustID = cm.CUSTID 
  --Now the non-AIM orders, by Name/City/State.
  UNION SELECT '', md.Name, md.City, md.[State], SUM(md.TotalWeight), ch.Pallet, SUM(md.PackageCount)
  FROM ManifestDetail md
    INNER JOIN ManifestPackage mp
      ON md.ID = mp.DetailID
    INNER JOIN CartonHeader ch
      ON mp.ID = ch.ManifestPackageID
  WHERE md.[Status] <> 'C' 
    AND (md.SCustID IS NULL OR md.SCustID = '') 
    AND md.HeaderID = @iHeaderID 
  GROUP BY md.Name, md.City, md.[State], ch.Pallet