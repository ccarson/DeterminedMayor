
CREATE FUNCTION
    fact.tvf_GetInventoryData( @pSPRNUM varchar(20) )

RETURNS TABLE AS
/*
************************************************************************************************************************************

   Function:    fact.tvf_GetInventoryData
     Author:    Chris Carson
    Purpose:    Gets data for fact.Inventory record from Springfield data.

    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         2016-10-01          created


    Notes

************************************************************************************************************************************
*/
RETURN

SELECT
    PartKey             =   tripod.PartKey
  , InventoryDateKey    =   CONVERT( bigint, CONVERT( varchar(08), GETDATE(), 112 ) )
  , FinishedGoodsQty    =   parts.FIN
  , RawGoodsQty         =   parts.[RAW]
  , WIPQty              =   parts.WIP
  , AssignedQty         =   parts.ASSIGNED
  , RawAssignedQty      =   parts.RAW_ASSIGNED
  , PackedQty           =   CONVERT( decimal(10), parts.Packed )
  , ReservedQty         =   parts.RESERVED
  , OnOrderQty          =   parts.ONORD
  , PulledToWOQty       =   CONVERT( decimal(10), ISNULL( parts.PulledToWO, 0 ) )
  , YTDShippedQty       =   parts.YSHIP
  , YTDAssignedQty      =   parts.YA
FROM
    [$(SpringfieldProd)].dbo.parts AS parts
INNER JOIN
    dimension.Part AS tripod
        ON tripod.SPRNUM = parts.SPRNUM
WHERE
    parts.SPRNUM = @pSPRNUM ;
