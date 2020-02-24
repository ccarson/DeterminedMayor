
-- =============================================
-- Author:		Harper Carr
-- Create date: 2018-04-25
-- Description:	Return the number of items that should be delivered during the month of @Date
-- =============================================
CREATE FUNCTION [dbo].[GetPOByPartDate]
(
	-- Add the parameters for the function here
	@SprNum varchar(20),
	@Date date
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @POQty int

	-- Add the T-SQL statements to compute the return value here
	SELECT @POQty = Sum(PODETAIL.QTY_ORD - PODETAIL.QTY_RECD_TD) FROM PODETAIL
	WHERE PODETAIL.SPRNUM = @SprNum AND
	(PODETAIL.QTY_ORD > PODETAIL.QTY_RECD_TD) AND
	PODETAIL.CLOSED_FLAG <> 'Y' AND
	PODETAIL.DELIV_DATE >= @Date AND
	PODETAIL.DELIV_DATE < DATEADD(MONTH,1,@Date)
	
	if (@POQty is null) SET @POQty = 0;

	-- Return the result of the function
	RETURN @POQty

END