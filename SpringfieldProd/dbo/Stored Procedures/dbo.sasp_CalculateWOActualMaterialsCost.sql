
CREATE PROCEDURE [dbo].[sasp_CalculateWOActualMaterialsCost] 
(
  @WONum numeric(12,2)
)
AS

DECLARE @FIFOCost numeric(16,6);
DECLARE @PartsCost numeric(16,6);

SET @FIFOCost = 
(SELECT ISNULL(SUM(pfr.ActualCost * pfu.Quantity), 0) FROM PartFIFOUsage pfu INNER JOIN PartFIFOReceived pfr ON pfu.PartFIFOReceivedID = pfr.ID
  AND ((pfu.UsageType = 'W') OR (pfu.UsageType = 'V')) AND pfu.UsageNumber = @WONum);

SET @PartsCost =
(SELECT SUM((wb.PULLED - ISNULL(pfu.FIFOQty, 0)) * (CASE WHEN p.RECEIVE_TO = 'R' THEN p.COSTRAW ELSE p.COSTFIN END))
--top 100 *
-- SUM
FROM WOBOM wb
INNER JOIN parts p
ON wb.SUBPART = p.SPRNUM
LEFT JOIN 
(
SELECT pfu.PartNum, SUM (pfu.Quantity) AS FIFOQty
FROM PartFIFOUsage pfu
WHERE ((pfu.UsageType = 'W') OR (pfu.UsageType = 'V')) AND pfu.UsageNumber = @WONum
GROUP BY pfu.PartNum
) pfu
ON wb.SUBPART = pfu.PartNum
WHERE wb.WO_# = @WONum
AND wb.REPLACE_FLAG <> 'Y')

SELECT ISNULL(@FIFOCost + @PartsCost, 0) AS ActualCost