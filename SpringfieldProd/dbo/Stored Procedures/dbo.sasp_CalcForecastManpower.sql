
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sasp_CalcForecastManpower]
	-- Add the parameters for the stored procedure here
	@ForecastID int
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Update PartsForecast
	Set TotalMinutesNeeded = dbo.svf_GetTotalTime(Sprnum, Quan)
	WHERE ForecastHeaderID = @ForecastID

	Update PartsNeeded
	Set TotalMinutesNeeded = dbo.svf_GetTotalTime(Sprnum, QtyToOrder)
	WHERE ForecastHeaderID = @ForecastID

	DECLARE @YearMonth as varchar(10);
	DECLARE @Dept as int;
	DECLARE @ForecastLaborID as int;

	-- This will loop through the vwLaborSummary records and create ForecastLabor records for
	-- any department that has labor records for that year/month combination.  This should fix
	-- the NULL record problem causing weird blank lines in the Forecast view's Staff Time page
	Declare cLaborCursor  CURSOR FOR 
	select vwLaborSummary.YearMonth, vwLaborSummary.Dept, ForecastLabor.ID from vwLaborSummary
	left outer join ForecastLabor ON ForecastLabor.ForecastID = vwLaborSummary.ForecastHeaderID
	AND ForecastLabor.Department = vwLaborSummary.Dept
	AND ForecastLabor.Month = vwLaborSummary.YearMonth
	WHERE vwLaborSummary.ForecastHeaderID = @ForecastID
	AND ForecastLabor.ID Is Null;

	OPEN cLaborCursor
	FETCH NEXT FROM cLaborCursor INTO
	@YearMonth, @Dept, @ForecastLaborID

	WHILE @@FETCH_STATUS = 0
	BEGIN

		INSERT INTO ForecastLabor(ForecastID, Month, Department, MinutesAvailable, EffectiveRate, EffectiveAvailable, ExtraTime)
		SELECT @ForecastID, @YearMonth, @Dept, ForecastLaborBase.MonthlyBase, ForecastLaborBase.EffectiveRate, ForecastLaborBase.MonthlyEffective, 0 
		FROM ForecastLaborBase
		WHERE ForecastLaborBase.Num = @Dept

		FETCH NEXT FROM cLaborCursor INTO
		@YearMonth, @Dept, @ForecastLaborID
	END

	CLOSE cLaborCursor
	DEALLOCATE cLaborCursor
END