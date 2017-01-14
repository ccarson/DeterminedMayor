CREATE VIEW
    dbo.vwAllParts
AS

SELECT
    PartKey
  , SourceRecnum
  , SPRNUM
  , SPRDescription
  , LastSoldDate
  , ReorderPointQty
  , FullyStockedQty
  , SafetyStockQty
  , LeadTimeDays
  , UPC
  , GunType
  , GunStock
  , GroupCode
  , SPRCategory
  , SPRSubCategory
  , VendorIDCode
  , IsTaxable
  , ExciseTaxType
  , IsGunPart
  , BarrelLength
  , HasThreadedBarrel
  , FinishDescription
  , IsSellable
  , PartStatus
  , PartTypeCode
  , PartCategory
  , CapacityCode
  , LocationCode
  , IsReportable		
  , IsAssembly			
  , AssemblyPartKey		
  , IsBackorderPart
  , FormattedPartKey	
  , DWChecksum
  , DWVersion
  , DWTimestamp

FROM
    dimension.Part
UNION ALL
SELECT
    PartKey
  , SPRNUM
  , SPRDescription
  , SourceRecnum
  , LastSoldDate
  , ReorderPointQty
  , FullyStockedQty
  , SafetyStockQty
  , LeadTimeDays
  , UPC
  , GunType
  , GunStock
  , GroupCode
  , SPRCategory
  , SPRSubCategory
  , VendorIDCode
  , IsTaxable
  , ExciseTaxType
  , IsGunPart
  , BarrelLength
  , HasThreadedBarrel
  , FinishDescription
  , IsSellable
  , PartStatus
  , PartTypeCode
  , PartCategory
  , CapacityCode
  , LocationCode
  , IsReportable		
  , IsAssembly			
  , AssemblyPartKey		
  , IsBackorderPart
  , FormattedPartKey	
  , DWChecksum
  , DWVersion
  , DWTimestamp
FROM
    archive.Part
;