CREATE PROCEDURE
    dimension.sp_UpdatePart
/*
***********************************************************************************************************************************

    Procedure:      dimension.sp_UpdatePart
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       UPDATEs existing dimension.Part records with new data

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

UPDATE
    tripod
SET
    SourceRecnum        =   stage.SourceRecnum
  , SPRNUM              =   stage.SPRNUM
  , SPRDescription      =   stage.SPRDescription
  , LastSoldDate        =   stage.LastSoldDate
  , ReorderPointQty     =   stage.ReorderPointQty
  , FullyStockedQty     =   stage.FullyStockedQty
  , SafetyStockQty      =   stage.SafetyStockQty
  , LeadTimeDays        =   stage.LeadTimeDays
  , UPC                 =   stage.UPC
  , GunType             =   stage.GunType
  , GunStock            =   stage.GunStock
  , GroupCode           =   stage.GroupCode
  , ReportingGroup      =   stage.ReportingGroup
  , SPRCategory         =   stage.SPRCategory
  , SPRSubCategory      =   stage.SPRSubCategory
  , VendorIDCode        =   stage.VendorIDCode
  , IsTaxable           =   stage.IsTaxable
  , ExciseTaxType       =   stage.ExciseTaxType
  , IsGunPart           =   stage.IsGunPart
  , BarrelLength        =   stage.BarrelLength
  , HasThreadedBarrel   =   stage.HasThreadedBarrel
  , FinishDescription   =   stage.FinishDescription
  , IsSellable          =   stage.IsSellable
  , PartStatus          =   stage.PartStatus
  , PartTypeCode        =   stage.PartTypeCode
  , PartCategory        =   stage.PartCategory
  , CapacityCode        =   stage.CapacityCode
  , LocationCode        =   stage.LocationCode
  , IsReportable		=   stage.IsReportable
  , IsAssembly			=	stage.IsAssembly
  , AssemblyPartKey		=	stage.AssemblyPartKey
  , DWChecksum          =   stage.DWChecksum
  , DWVersion           =   tripod.DWVersion + 1
  , DWTimestamp         =   GETDATE()
FROM
    dimension.Part AS tripod
INNER JOIN
    stage.Part AS stage
        ON stage.SPRNUM = tripod.SPRNUM
WHERE
    stage.DWChecksum != tripod.DWChecksum ;