CREATE PROCEDURE
    dimension.sp_InsertPart
/*
***********************************************************************************************************************************

    Procedure:      dimension.sp_InsertPart
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       INSERT dimension.Part records from stage.Part where SPRNUM is not already present in dimension.Part
                        This loads new Part records into dimension.Part

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

INSERT INTO
    dimension.Part(
        SourceRecnum
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
      , ReportingGroup
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
      , DWChecksum )
SELECT
    stage.SourceRecnum
  , stage.SPRNUM
  , stage.SPRDescription
  , stage.LastSoldDate
  , stage.ReorderPointQty
  , stage.FullyStockedQty
  , stage.SafetyStockQty
  , stage.LeadTimeDays
  , stage.UPC
  , stage.GunType
  , stage.GunStock
  , stage.GroupCode
  , stage.ReportingGroup
  , stage.SPRCategory
  , stage.SPRSubCategory
  , stage.VendorIDCode
  , stage.IsTaxable
  , stage.ExciseTaxType
  , stage.IsGunPart
  , stage.BarrelLength
  , stage.HasThreadedBarrel
  , stage.FinishDescription
  , stage.IsSellable
  , stage.PartStatus
  , stage.PartTypeCode
  , stage.PartCategory
  , stage.CapacityCode
  , stage.LocationCode
  , stage.IsReportable		
  , stage.IsAssembly			
  , stage.AssemblyPartKey		
  , stage.DWChecksum
FROM
    stage.Part AS stage
WHERE NOT EXISTS(
    SELECT 1 FROM dimension.Part AS tripod
        WHERE tripod.SPRNUM = stage.SPRNUM )
;