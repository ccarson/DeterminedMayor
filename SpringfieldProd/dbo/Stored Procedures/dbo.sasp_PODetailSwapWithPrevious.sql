
CREATE PROCEDURE [dbo].[sasp_PODetailSwapWithPrevious] 
(
  @PONum int,
  @iCurrentLine int
)
AS

DECLARE @iPrev int;
DECLARE @PrevID bigint;
DECLARE @CurrentID bigint;

--Find the previous line number
SET @iPrev = (SELECT ISNULL(MAX(pod.DisplayLineNum), 0)
FROM PODETAIL pod
WHERE pod.DisplayLineNum < @iCurrentLine
AND pod.PO_# = @PONum);

--Find the ID of the current line
SET @CurrentID = (SELECT pod.Recnum FROM PODETAIL pod WHERE pod.PO_# = @PONum AND pod.DisplayLineNum = @iCurrentLine);

--If we have both a previous line and a current ID, we can swap the values
IF ((@iPrev > 0) AND (@CurrentID IS NOT NULL))
BEGIN
  SET @PrevID = (SELECT pod.Recnum FROM PODETAIL pod WHERE pod.PO_# = @PONum AND pod.DisplayLineNum = @iPrev);
  UPDATE PODETAIL SET DisplayLineNum = @iCurrentLine WHERE Recnum = @PrevID;
  UPDATE PODETAIL SET DisplayLineNum = @iPrev WHERE Recnum = @CurrentID;
  SELECT 2; --How many lines were updated
END
ELSE BEGIN
--  SELECT 'No previous line found.'
  SELECT 0; --How many lines were updated
END