
CREATE PROCEDURE [dbo].[sasp_ShipDatesForHeader] @iHeaderID bigint, @dToday date
AS

UPDATE CUSTINFO
SET SHIPDATE = @dToday
WHERE ORDNUM IN 
  (SELECT md.OrdNum
  FROM ManifestHeader mh
    INNER JOIN ManifestDetail md
      ON mh.ID = md.HeaderID
        AND mh.ID = @iHeaderID
        AND md.Status <> 'C' 
        AND md.OrdNum > 0
  )