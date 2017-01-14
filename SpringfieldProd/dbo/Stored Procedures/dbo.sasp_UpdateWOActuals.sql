
CREATE PROCEDURE [dbo].[sasp_UpdateWOActuals] 
(
  @WONum numeric(12,2)
)
AS

DECLARE @spResults TABLE
(
  ActMaterial numeric(16,6)
);

INSERT INTO @spResults
EXEC sasp_CalculateWOActualMaterialsCost @WONum;

UPDATE WOHeader
SET ACT_SUBCONTR = SubTot.ActSub
, ACT_LABOR = SubTot.ActLabor
, ACT_OVERHEAD = SubTot.ActOverhead
, ACT_INDIRECT = SubTot.ActIndirect
FROM 
(SELECT
 SUM(wod.ACT_SUBCONTRACT) AS ActSub
, SUM((wod.ACT_TIME/60.0) * wol.DIR_RATE) AS ActLabor
, SUM((wod.ACT_TIME/60.0) * wol.OVERHEAD_RATE) AS ActOverhead
, SUM(wod.ACT_INDIRECT) AS ActIndirect
FROM WODetail wod
INNER JOIN WOLOCATN wol
  ON wod.LOCATION = wol.NUM
WHERE wod.WO_# = @WONum
) SubTot
WHERE WOHeader.WO_# = @WONum;

UPDATE WOHeader
SET ACT_MATERIALS = SubTot.ActMaterial
FROM 
(
SELECT TOP 1 ActMaterial
FROM @spResults
) SubTot
WHERE WOHeader.WO_# = @WONum;