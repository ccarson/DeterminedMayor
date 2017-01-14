CREATE PROCEDURE
    stage.sp_GetUpdatedFactInventoryData
/*
***********************************************************************************************************************************

    Procedure:      stage.sp_GetUpdatedFactInventoryData
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       Build fact.Inventory records from parts being updated during the day


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
    stage.parts AS stage
CROSS APPLY
    fact.tvf_GetInventoryData( stage.SPRNUM ) AS partData ;
