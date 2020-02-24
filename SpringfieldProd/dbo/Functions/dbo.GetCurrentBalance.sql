
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[GetCurrentBalance]
(
	-- Add the parameters for the function here
	@SprNum varchar(20)
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @CurrBalance int

	-- Add the T-SQL statements to compute the return value here
	SELECT @CurrBalance = (Parts.FIN - Parts.ASSIGNED + Parts.RAW - Parts.RAW_ASSIGNED ) FROM parts WHERE SPRNUM = @SprNum

	if (@CurrBalance is null) SET @CurrBalance = 0; -- probably shouldn't be necessary... if it isn't in PARTS how are we doing ANYTHING with it?

	-- Return the result of the function
	RETURN @CurrBalance

END