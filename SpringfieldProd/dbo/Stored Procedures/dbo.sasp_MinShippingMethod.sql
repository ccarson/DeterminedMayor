CREATE PROCEDURE [dbo].[sasp_MinShippingMethod] @numOrder NUMERIC(12,2)
AS
  SELECT MIN(
    CASE LEFT(p.RPT_GROUP, 2) 
      WHEN 'XD' THEN '2' 
      WHEN '19' THEN '2' 
      ELSE 
        (CASE p.RPT_GROUP 
          WHEN 'CUST-P' THEN '2' 
          WHEN 'REPAIR' THEN 
            (CASE p.SPRNUM 
              WHEN 'RP900G' THEN '2' 
              WHEN 'RP900I' THEN '2' 
              WHEN 'RP900Y' THEN '2' 
              WHEN 'RC900G' THEN '2' 
              WHEN 'RC900Y' THEN '2' 
              ELSE 'G' END) 
          ELSE 'G' END) 
      END) 
    FROM [MASTERLN] ml 
      INNER JOIN [parts] p 
        ON ml.SPRNUM = p.SPRNUM AND p.SERIAL_FLAG = 'Y' 
    AND ml.ORDNUM = @numOrder
    AND (ml.QUANS > 0 OR ml.QuanPacked > 0)
