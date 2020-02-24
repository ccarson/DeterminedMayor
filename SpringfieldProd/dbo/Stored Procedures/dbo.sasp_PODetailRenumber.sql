
CREATE PROCEDURE [dbo].[sasp_PODetailRenumber] 
(
  @PONum int
)
AS


DECLARE @DetailLines table
(
ID bigint
, PrevLine int
, NewLine int
)

--Create the relationships of the old and new line numbers.
INSERT INTO @DetailLines (ID, PrevLine, NewLine)
SELECT pod.Recnum, pod.DisplayLineNum, ROW_NUMBER() OVER(ORDER BY pod.DisplayLineNum ASC)
FROM PODETAIL pod
WHERE pod.PO_# = @PONum

/*
SELECT *
FROM @DetailLines dl
INNER JOIN PODETAIL pod
ON dl.ID = pod.Recnum
*/

UPDATE PODETAIL SET DisplayLineNum = dl.NewLine
FROM @DetailLines dl
WHERE dl.ID = PODETAIL.Recnum

/*
SELECT *
FROM @DetailLines dl
INNER JOIN PODETAIL pod
ON dl.ID = pod.Recnum
*/