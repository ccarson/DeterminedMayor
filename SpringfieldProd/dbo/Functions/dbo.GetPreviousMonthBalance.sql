
-- =============================================
-- Author:		Harper Carr
-- Create date: 2018-04-13
-- Description:	Analog of GetPreviousMonthBalance in Forecast.vw 
--              Return the balance column from the month before @ThisDate in PartsNeeded
-- =============================================
CREATE FUNCTION [dbo].[GetPreviousMonthBalance] 
(
	-- Add the parameters for the function here
	@ForecastID int,
	@SprNum varchar(20),
	@ThisDate date

)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Balance int

	-- Add the T-SQL statements to compute the return value here
	SELECT @Balance = Balance FROM PartsNeeded
	WHERE ForecastHeaderID = @ForecastID
	AND SprNum = @SprNum
	AND NeededBy = DATEADD(MONTH,-1,@ThisDate)

	if (@Balance is null) SET @Balance = 0;

	-- Return the result of the function
	RETURN @Balance

END