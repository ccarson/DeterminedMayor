
CREATE PROCEDURE [dbo].[sasp_PODetailSwapWithNext] 
(
  @PONum int,
  @iCurrentLine int
)
AS

DECLARE @iNext int;
DECLARE @NextID bigint;
DECLARE @CurrentID bigint;

--Find the next line number
SET @iNext = (SELECT ISNULL(MIN(pod.DisplayLineNum), 0)
FROM PODETAIL pod
WHERE pod.DisplayLineNum > @iCurrentLine
AND pod.PO_# = @PONum);

--Find the ID of the current line
SET @CurrentID = (SELECT pod.Recnum FROM PODETAIL pod WHERE pod.PO_# = @PONum AND pod.DisplayLineNum = @iCurrentLine);

--If we have both a next line and a current ID, we can swap the values
IF ((@iNext > 0) AND (@CurrentID IS NOT NULL))
BEGIN
  SET @NextID = (SELECT pod.Recnum FROM PODETAIL pod WHERE pod.PO_# = @PONum AND pod.DisplayLineNum = @iNext);
  UPDATE PODETAIL SET DisplayLineNum = @iCurrentLine WHERE Recnum = @NextID;
  UPDATE PODETAIL SET DisplayLineNum = @iNext WHERE Recnum = @CurrentID;
  SELECT 2; --How many lines were updated
END
ELSE BEGIN
--  SELECT 'No next line found.'
  SELECT 0; --How many lines were updated
END