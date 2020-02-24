
-- =============================================
-- Author:		Harper Carr
-- Create date: 2018-05-02
-- Description:	Convert a real date to a YearMonth string for PartsForecast
-- =============================================
CREATE FUNCTION [dbo].[DateToYearMonth] 
(
	-- Add the parameters for the function here
	@Date date
)
RETURNS char(6)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @YearMonth char(6)
	DECLARE @Year int;
	DECLARE @Month int;

	-- Add the T-SQL statements to compute the return value here
	SET @Year = DATEPART(year, @Date);
	SET @Month = Datepart(month, @Date);

	if (@Month < 10) SET @YearMonth = concat(@Year, '0', @Month);
	else Set @YearMonth = concat(@Year, @Month);

	-- Return the result of the function
	RETURN @YearMonth

END