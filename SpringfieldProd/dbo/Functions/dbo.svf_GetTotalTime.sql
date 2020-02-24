

-- =============================================
-- Author:		Harper Carr
-- Create date: 20108-04-25
-- Description: Given a specific @SprNum and @Quantity to make,
--				return the total number of minutes needed to make that part
-- =============================================
CREATE FUNCTION [dbo].[svf_GetTotalTime]
(
	-- Add the parameters for the function here
	@SprNum varchar(20),
	@Quantity int
)
RETURNS numeric
WITH SCHEMABINDING
AS
BEGIN
	-- Declare the return variable here
	DECLARE @TotalTime numeric

	-- Add the T-SQL statements to compute the return value here
	SELECT @TotalTime = SUM(STD_TIME) FROM dbo.WOTEMPLT WHERE SPRNUM = @SprNum

	if (@TotalTime is null) SET @TotalTime = 0;

	-- Return the result of the function
	RETURN (@TotalTime * @Quantity)

END