
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION [dbo].[YearMonthToDate] 
(
	-- Add the parameters for the function here
	@YearMonth char(6)
)
RETURNS Date
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ReturnDate date;

	SET @ReturnDate = Left(@YearMonth, 4) + '-' + right(@YearMonth, 2) + '-01'

	RETURN @ReturnDate;

END