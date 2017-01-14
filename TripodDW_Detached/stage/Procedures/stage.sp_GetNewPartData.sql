CREATE PROCEDURE
    stage.sp_GetNewPartData
/*
***********************************************************************************************************************************

    Procedure:      stage.sp_GetNewPartData
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       Build dimension.Part records for customers that do not exist in Tripod


***********************************************************************************************************************************
*/
AS

SET TRANSACTION ISOLATION LEVEL SNAPSHOT ;

SET NOCOUNT, XACT_ABORT ON ;

SELECT
    partData.SPRNUM
  , partData.SPRDescription
  , partData.SourceRecnum
  , partData.LastSoldDate
  , partData.ReorderPointQty
  , partData.FullyStockedQty
  , partData.SafetyStockQty
  , partData.LeadTimeDays
  , partData.UPC
  , partData.GunType
  , partData.GunStock
  , partData.GroupCode
  , partData.ReportingGroup
  , partData.SPRCategory
  , partData.SPRSubCategory
  , partData.VendorIDCode
  , partData.IsTaxable
  , partData.ExciseTaxType
  , partData.IsGunPart
  , partData.BarrelLength
  , partData.HasThreadedBarrel
  , partData.FinishDescription
  , partData.IsSellable
  , partData.PartStatus
  , partData.PartTypeCode
  , partData.PartCategory
  , partData.CapacityCode
  , partData.LocationCode
  , partData.DWChecksum
FROM
    stage.parts AS stage
CROSS APPLY
    stage.tvf_GetPartData( stage.SPRNUM ) AS partData
WHERE
    stage.SPRNUM NOT IN( SELECT tripod.SPRNUM FROM dimension.Part AS tripod ) ;
