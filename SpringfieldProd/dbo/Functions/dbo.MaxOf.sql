
-- =============================================
-- Author:		Harper Carr
-- Create date: 2018-04-25
-- Description:	Return the higher of 2 passed numeric values.
--              Initially used by dbo.CalculatePartsNeeded to set a negative number to 0
--				e.g. dbo.MaxOf(-1234, 4) = 0
-- =============================================
CREATE FUNCTION [dbo].[MaxOf]
(
	-- Add the parameters for the function here
	@Value1 numeric,
	@Value2 numeric
)
RETURNS numeric
AS
BEGIN
	DECLARE @Result numeric;

	if (@Value1 > @Value2) SET @Result = @Value1
	else SET @Result = @Value2

	RETURN @Result
END