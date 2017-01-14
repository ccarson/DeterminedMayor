
CREATE PROCEDURE [dbo].[sasp_ComparePartCountToFIFO] 
AS

DECLARE @FIFOCount table ( PartNum varchar(20), Quantity int);  

INSERT INTO @FIFOCount (PartNum, Quantity) 
SELECT PartNum, sum(pfr.QuantityIn - pfr.QuantityOut)
FROM PartFIFOReceived pfr
GROUP BY pfr.PartNum; 

INSERT INTO @FIFOCount (PartNum, Quantity) 
SELECT p.SPRNUM, 0
FROM parts p WHERE p.SPRNUM NOT IN 
(SELECT DISTINCT PartNum 
FROM @FIFOCount); 

select fc.PartNum, fc.Quantity AS FIFOCount, case when p.RECEIVE_TO = 'R' THEN p.[RAW] ELSE p.FIN END AS PartCount
from @FIFOCount fc
inner join parts p
on fc.PartNum = p.SPRNUM
order by fc.PartNum