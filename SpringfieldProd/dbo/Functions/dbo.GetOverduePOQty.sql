
-- =============================================
-- Author:		Harper Carr
-- Create date: 2018-04-13
-- Description:	Analog of GetOverduePOQty in Forecast.vw
-- =============================================
CREATE FUNCTION [dbo].[GetOverduePOQty]
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

	select @OverdueQty = sum(PODETAIL.QTY_ORD - PODETAIL.QTY_RECD_TD) from PODETAIL
	where PODETAIL.SPRNUM = @SprNum
	and (PODETAIL.QTY_ORD > PODETAIL.QTY_RECD_TD)
	and CLOSED_FLAG <> 'Y'
	and PODETAIL.DELIV_DATE < @LastDate

	if (@OverdueQty is null) Set @OverdueQty = 0

	-- Return the result of the function
	RETURN @OverdueQty

END