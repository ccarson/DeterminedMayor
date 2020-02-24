

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReNumber_ForecastPOD]
	-- Add the parameters for the stored procedure here
	@ForecastPOH_ID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    Declare @POD_ID int;
	Declare @Line int;
	Set @Line = 10;

	Update ForecastPOD SET Line_# = Line_# + 100;

	DECLARE cCursor CURSOR LOCAL READ_ONLY
	FOR
	  SELECT ForecastPOD_ID
	  FROM ForecastPOD
	  Where ForecastPOH_ID = @ForecastPOH_ID
	  Order By Delivery_Date, SprNum

	OPEN cCursor

	FETCH NEXT FROM cCursor
	INTO @POD_ID

	WHILE @@FETCH_STATUS = 0
	BEGIN

		UPDATE ForecastPOD SET Line_# = @Line
		WHERE ForecastPOD_ID = @POD_ID;

		Set @Line = @Line + 10;

	-- Find the next row and do it all again...
	  FETCH NEXT FROM cCursor
	  INTO @POD_ID

	END --cCursor loop

	CLOSE cCursor
	DEALLOCATE cCursor
END