
CREATE PROCEDURE [dbo].[sasp_PODetailDisplayLineNum] 
(
  @PONum int
  , @POLine int
)
AS

  SELECT ISNULL(pod.DisplayLineNum, 0) as LineNum
  FROM PODETAIL pod
  WHERE pod.PO_# = @PONum
  AND pod.LINE_# = @POLine