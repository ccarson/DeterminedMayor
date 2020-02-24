
CREATE PROCEDURE [dbo].[SummaraizePartsNeeded] 
	-- Add the parameters for the stored procedure here
	@ForecastID int
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @SubPart   varChar(20);
Declare @LeadTime  int;
Declare @PurchFlag char(1);

DECLARE @PartsNeededID int;
DECLARE @AvailCalc int = 0;
DECLARE @POCalc int = 0;
DECLARE @WOCalc int = 0;
DECLARE @QtyToOrder int = 0;
DECLARE @Balance int = 0;
DECLARE @POQty int = 0;
DECLARE @WOQty int = 0;
Declare @CurrentBalance int = 0;
DECLARE @CalcBalance int = 0;
Declare @dToday date;
Declare @OrderBy date;
Declare @Needed int = 0;
DECLARE @NeededBy date;

Set @dToday = DATEADD(month, DATEDIFF(month, 0, GetDate()), 0)

--Calculate all the quantites needed of all the parts needed.
DECLARE cPartsForecastDetail CURSOR LOCAL READ_ONLY
FOR
SELECT SprNum, NeededBy, SUM(Usage) AS Needed
FROM PartsForecastDetail
WHERE ForecastHeaderID = @ForecastID
GROUP BY SprNum, NeededBy
ORDER BY SprNum, NeededBy

OPEN cPartsForecastDetail

FETCH NEXT FROM cPartsForecastDetail
INTO @SubPart, @NeededBy, @Needed

WHILE @@FETCH_STATUS = 0
BEGIN
  SELECT @LeadTime = p.LEAD_TIME
  , @PurchFlag = p.PURCH_FLAG
  FROM parts p
  WHERE p.SPRNUM = @SubPart;

	Set @OrderBy = Dateadd(DAY, (@LeadTime * -1), @NeededBy);

	-- Convert all the date to the first of whatever month they are
	--	     e.g. @NeededBy = '2018-04-15' then DATEADD(month, DATEDIFF(month, 0, @NeededBy), 0) = '2018-04-01'
	Set @OrderBy  = DATEADD(month, DATEDIFF(month, 0, @OrderBy), 0);

	-- Reset all the variables
	SET @PartsNeededID = NULL;
	SET @AvailCalc = 0;
	SET @POCalc = 0;
	SET @WOCalc = 0;
	SET @QtyToOrder = 0;
	SET @Balance = 0;
	SET @POQty = 0;
	SET @WOQty = 0;
	SET @CurrentBalance = 0;
	SET @CalcBalance = 0;

	-- Look up this combination of SubPart, NeededBy, OrderBy, and ForecastHeaderID in PartsNeeded to see if we need to 
	-- create a new record or update an existing one
	SELECT @PartsNeededID = PartsNeeded.ID,
		@AvailCalc = AvailableCalc,
		@POCalc = POCalc,
		@WOCalc = WOcalc,
		@CurrentBalance = Balance
		FROM PartsNeeded 
		WHERE ForecastHeaderID = @ForecastID
		AND SprNum = @SubPart
		AND NeededBy = @NeededBy
		AND OrderBy = @OrderBy;

	-- If there isn't already a PartsNeeded record, create it here (may not be needed)
	IF @PartsNeededID is null 
	BEGIN
		INSERT INTO PartsNeeded (SprNum,  NeededBy, OrderBy, ForecastHeaderID) 
    VALUES(@SubPart, @NeededBy, @OrderBy, @ForecastID);

		SET @PartsNeededID = Scope_Identity();
		SET @AvailCalc = 0;
		SET @POCalc = 0;
		SET @WOCalc = 0;

		-- Calculate the starting balance...
		-- If this month is BEFORE the current month AND there are NO previous months, use 0 as the current balance
		-- If this month is BEFORE the current month AND there ARE previous months, use last month's balance as the current balance
		-- If this month is the current month, use AVAILABLE from parts + the previous month's balance (or 0 if none) as the current balance
		-- If this month is after the current month, use the previous month's balance as the current balance
		SET @CurrentBalance = dbo.GetPreviousMonthBalance(@ForecastID, @SubPart, @NeededBy);
		IF (@CurrentBalance IS NULL) BEGIN
			SET @CurrentBalance = 0;
		END
	END

	--IF (@NeededBy < @dToday) BEGIN
	--	Set @CurrentBalance = dbo.GetPreviousMonthBalance(@ForecastID, @SubPart, @NeededBy);
	--	if (@CurrentBalance is Null) SET @CurrentBalance = 0; -- This should only be NULL if a record for the previous month does not exist
	--END
	--ELSE 
	IF (@NeededBy = DATEADD(MONTH, 0, @dToday) and @AvailCalc = 0) BEGIN
		SET @CurrentBalance = @CurrentBalance + dbo.GetCurrentBalance(@SubPart);
		
	END

	IF (@NeededBy = @dToday) BEGIN
		-- Get OverDue POs and WOs IF they haven't already been accounted for
		IF (@PoCalc = 0) SET @POQty = dbo.GetOverduePOQty(@SubPart, @NeededBy);
		IF (@WOCalc = 0) SET @WOQty = dbo.GetOverdueWOQty(@SubPart, @NeededBy);
	END
	-- Calculate existing POs for this part/month
	IF (@PoCalc = 0) SET @POQty = @PoQty + dbo.GetPOByPartDate(@SubPart, @NeededBy);

	-- Get the WOs that should be finished this month
	IF (@WoCalc = 0) SET @WOQty = @WoQty + dbo.GetWOByPartDate(@SubPart, @NeededBy);

	SET @CalcBalance = @CurrentBalance;
	SET @CurrentBalance = dbo.MaxOf(@CurrentBalance, 0);

	-- Calculate the balance at the end of the month
	SET @Balance = @CalcBalance + @POQty + @WOQty - @Needed;

	
	IF (@AvailCalc = 1) 
	BEGIN
		SET @QtyToOrder = @Needed - (dbo.MaxOf(@CurrentBalance, 0) + @POQty + @WOQty )
	END
	ELSE
	BEGIN
		-- This is where we use the 2 different versions of the balance: @CalcBalance and @CurrentBalance
		IF (@PurchFlag = 'P') 
		BEGIN
			-- For Purchased items, we need to carry forward any negative balances
			SET @QtyToOrder = @Needed - ( @CalcBalance + @POQty + @WOQty )
		END
		ELSE 
		BEGIN
			-- For Manufactured items, DO NOT carry forward a negative balance (the negatve causes a compounding error)
			Set @QtyToOrder = @Needed - (@CurrentBalance + @POQty + @WOQty)
		END
	END

	-- Logically, you can't order negative 5 of something, so if @QtyToOrder is negative, set it to 0
	SET @QtyToOrder = dbo.MaxOf(@QtyToOrder, 0);

	-- UPTATE the PartsNeeded table
	UPDATE PartsNeeded SET
		POCalc = 1,
		WOCalc = 1,
		AvailableCalc = 1,
		WOQty = WOQty + @WOQty,
		POQty = POQty + @POQty,
		Balance = @Balance,
		Qty = Qty + @Needed,
		QtyToOrder = QtyToOrder + @QtyToOrder,
		IsAssembly = IIF((SELECT COUNT(*) FROM subref WHERE subref.MASTPART = @SubPart) > 0, 'Yes', '')
	WHERE ID = @PartsNeededID

  -- Find the next row and do it all again...
	FETCH NEXT FROM cPartsForecastDetail
  INTO @SubPart, @NeededBy, @Needed

END --cPartsForecastDetail loop

CLOSE cPartsForecastDetail
DEALLOCATE cPartsForecastDetail


END