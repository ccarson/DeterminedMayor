
CREATE PROCEDURE [dbo].[sasp_PartQuantityToPick] 
(
  @OrderNumber numeric(12,2)
  , @UseReleasedQuantity tinyint
)
AS
BEGIN

SET @UseReleasedQuantity = 
(SELECT CASE WHEN ci.[STATUS] in ('RD', 'RP') THEN @UseReleasedQuantity ELSE 0 END
FROM CUSTINFO ci
WHERE ci.ORDNUM = @OrderNumber
)

SELECT ml.SPRNUM, CASE WHEN @UseReleasedQuantity = 1 THEN SUM(ml.QUANS) ELSE SUM(ml.QUAN) END AS Quantity, p.[DESC]
FROM MASTERLN ml
  INNER JOIN parts p
    ON ml.SPRNUM = p.SPRNUM
WHERE ml.ORDNUM = @OrderNumber
GROUP BY ml.SPRNUM, p.[DESC]

END