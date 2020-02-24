

-- =============================================
-- Author:		Harper Carr
-- Create date: 2018-04-25
-- Description:	Get the number of parts that should be manufactured during the month of @Date
-- =============================================
CREATE FUNCTION [dbo].[GetWOByPartDate]
(
	-- Add the parameters for the function here
	@SprNum varchar(20),
	@Date date
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @WOQty int

	-- Add the T-SQL statements to compute the return value here
	Select @WOQty = SUM(QTY_PROJ - AVAIL) --WO_#, SprNum, Status, Target, Open_Date, Close_Date, Qty_Proj, Avail
    from WOHeader
    where SPRNUM = @SprNum
    and TARGET >= @Date
	and TARGET < DATEADD(month, 1, @Date)
    and STATUS < 8
    
	if (@WOQty is null) SET @WOQty = 0;

	-- Return the result of the function
	RETURN @WOQty

END