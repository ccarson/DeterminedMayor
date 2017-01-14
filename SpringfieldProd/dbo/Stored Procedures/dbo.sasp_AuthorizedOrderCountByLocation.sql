
CREATE PROCEDURE [dbo].[sasp_AuthorizedOrderCountByLocation] 
AS
  SELECT MAX(cm.DESCRIPTION) as Location, COUNT(ci.ORDNUM)
  FROM CUSTINFO ci
    LEFT JOIN CodeMast cm
      ON ci.ShipLocation = cm.CODE
          AND cm.TYPE = 'LOCATION'
  WHERE ci.CCTranStatus = 'A'
          AND ci.SHIPDATE < '1900-01-01'
  GROUP BY ci.ShipLocation