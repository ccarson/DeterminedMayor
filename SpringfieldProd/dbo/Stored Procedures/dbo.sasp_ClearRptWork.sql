
CREATE PROCEDURE [dbo].[sasp_ClearRptWork] @sUser VARCHAR(10), @sReport VARCHAR(50)
AS
  DELETE FROM RptWork
  WHERE [User] = @sUser
    AND Report = @sReport;
