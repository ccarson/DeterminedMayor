
CREATE PROCEDURE [dbo].[sasp_MinShippingMethodForAllOrdered] @numOrder NUMERIC(12,2)
AS
BEGIN
  SELECT MIN(
    CASE WHEN p.RPT_GROUP LIKE '%-%P' THEN '2'
      WHEN p.RPT_GROUP LIKE '%-%R' THEN 'G'
      WHEN p.RPT_GROUP = 'REPAIR' THEN 
            (CASE p.SPRNUM 
              WHEN 'RP900G' THEN '2' 
              WHEN 'RP900I' THEN '2' 
              WHEN 'RP900Y' THEN '2' 
              WHEN 'RC900G' THEN '2' 
              WHEN 'RC900Y' THEN '2' 
              WHEN 'RP900EP' THEN '2'
              ELSE 'G' END) 
      ELSE 'G'
    END) 
  FROM [MASTERLN] ml 
    INNER JOIN [parts] p 
      ON ml.SPRNUM = p.SPRNUM AND p.SERIAL_FLAG = 'Y' 
  AND ml.ORDNUM = @numOrder
  AND ml.Quan > 0
END
