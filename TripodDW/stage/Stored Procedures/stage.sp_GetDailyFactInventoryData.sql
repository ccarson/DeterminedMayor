CREATE PROCEDURE
    stage.sp_GetDailyFactInventoryData
/*
***********************************************************************************************************************************

    Procedure:      stage.sp_GetDailyFactInventoryData
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       Build fact.Inventory records at beginning of new day.


***********************************************************************************************************************************
*/
AS

SET TRANSACTION ISOLATION LEVEL SNAPSHOT ;

SET NOCOUNT, XACT_ABORT ON ;

SELECT
    PartKey             =   partData.PartKey
  , InventoryDateKey    =   partData.InventoryDateKey
  , FinishedGoodsQty    =   partData.FinishedGoodsQty
  , RawGoodsQty         =   partData.RawGoodsQty
  , WIPQty              =   partData.WIPQty
  , AssignedQty         =   partData.AssignedQty
  , RawAssignedQty      =   partData.RawAssignedQty
  , PackedQty           =   partData.PackedQty
  , ReservedQty         =   partData.ReservedQty
  , OnOrderQty          =   partData.OnOrderQty
  , PulledToWOQty       =   partData.PulledToWOQty
  , YTDShippedQty       =   partData.YTDShippedQty
  , YTDAssignedQty      =   partData.YTDAssignedQty
FROM
    [$(SpringfieldProd)].dbo.parts AS parts
CROSS APPLY
    fact.tvf_GetInventoryData( parts.SPRNUM ) AS partData ;