
-- =============================================
-- Author:		Harper Carr
-- Create date: 2018-04-25
-- Description:	Get the quantity of WOs that should have been completed before @LastDate
-- =============================================
CREATE FUNCTION [dbo].[GetOverdueWOQty]
(
	-- Add the parameters for the function here
	@SprNum varchar(20),
	@LastDate date
)
RETURNS int
AS
BEGIN
	-- Declare the return variable here
	DECLARE @OverdueQty int

	-- Add the T-SQL statements to compute the return value here
	Select @OverdueQty = SUM(QTY_PROJ - AVAIL) --WO_#, SprNum, Status, Target, Open_Date, Close_Date, Qty_Proj, Avail
    from WOHeader
    where SPRNUM = @SprNum
    and TARGET < @LastDate
    and STATUS < 8
    
	if (@OverdueQty is null) SET @OverdueQty = 0;

	-- Return the result of the function
	RETURN @OverdueQty

END