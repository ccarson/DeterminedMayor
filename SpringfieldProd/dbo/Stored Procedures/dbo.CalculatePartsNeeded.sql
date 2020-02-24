

-- =============================================
-- Author:		Harper Carr
-- Create date: 2018-04-25
-- Note:		Analog of CalcAllPartsTopDown in Forecast.vw
-- Arguments:   @SprNum		   - The part for which we are calculating sub-assembly quantites
--              @NeededBy      - The Year and Month for which we are calculating concatinated together as an integer 
--                               ex. 201704 = April, 2017
--              @TotalToBuild  - Total quantity of sMasterPart we need to product
--              @ForecastID    - the ID of this forecast so we can store the data in PartsNeeded correctly
--              @MasterOrderBy - the date sMasterPart needs to be ordered
--              @PFID          - the PartsForecast.ID of the firearm this part is being used in
-- Description:
-- This method will take the passed sMasterPart and find all the sub-parts that make up that sMasterPart.
-- Then, it will use iTotalToBuild and the number of sub-parts along with the number of outstanding POs and/or WOs
-- to calculate how many of each sub-part to produce.
-- If any of those sub-parts are themselves assemblies, it will recurse back into this method to calculate the quantities
-- for those sub-parts
-- =============================================
CREATE PROCEDURE [dbo].[CalculatePartsNeeded] 
	-- Add the parameters for the stored procedure here
	@SprNum varchar(20),
	@NeededBy date,
	@TotalToBuild int,
	@ForecastID int,
	@MasterOrderBy date,
	@PFID int
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DECLARE @SubPart   varChar(20);
DECLARE @Quantity  int;
DECLARE @Assembly  char(3);
Declare @LeadTime  int;
Declare @PurchFlag char(1);

Declare @dToday date;
Declare @OrderBy date;
Declare @Needed int = 0;

SET @Quantity = 0;
SET @LeadTime = 0;

--Set @dToday = GetDate();
Set @dToday = DATEADD(month, DATEDIFF(month, 0, GetDate()), 0)

Set @NeededBy = DATEADD(month, DATEDIFF(month, 0, @NeededBy), 0);

-- This should treat every month before the current month as the current month.
-- Since the forecast starts NEXT month, this will "summarize" everything in the past into a single record
IF (@NeededBy < @dToday) SET @NeededBy = @dToday;

--Create a list of all the parts needed.
DECLARE c1 CURSOR LOCAL READ_ONLY
FOR
SELECT SUBPART
,AMOUNT
,(Case WHEN SUBPART IN
(SELECT subref.MASTPART FROM subref INNER JOIN parts p ON p.SPRNUM = subref.MASTPART and p.PURCH_FLAG <> 'P') THEN 'Yes' Else '' End) as IsAssembly
,LEAD_TIME
,PURCH_FLAG
FROM subref
INNER JOIN parts ON subref.SUBPART = parts.SPRNUM
WHERE MASTPART = @SprNum

OPEN c1

FETCH NEXT FROM c1
INTO @SubPart, @Quantity, @Assembly, @LeadTime, @PurchFlag

WHILE @@FETCH_STATUS = 0
BEGIN
	--Set @OrderBy = Dateadd(DAY, (@LeadTime * -1), @MasterOrderBy);
	Set @OrderBy = Dateadd(DAY, (@LeadTime * -1), @NeededBy);

	-- Convert all the date to the first of whatever month they are
	--	     e.g. @NeededBy = '2018-04-15' then DATEADD(month, DATEDIFF(month, 0, @NeededBy), 0) = '2018-04-01'
	Set @OrderBy  = DATEADD(month, DATEDIFF(month, 0, @OrderBy), 0);

	-- Calculate the actual number we still need to produce
	Set @Needed = @TotalToBuild * @Quantity;

	-- Create the PartsForecastDetail record
	-- Since this gets created and not updated, we go ahead and calculate the TotalMinutesNeeded column using the svf_GetTotalTime() function
	INSERT INTO [dbo].[PartsForecastDetail]
		([PartsForecastID]
		,[ForecastHeaderID]
		,[SprNum]
		,[FinishDate]
		,[NeededBy]
		,[OrderBy]
		,[Quantity]
		,[MasterPart]
		,[Usage]
		,[TotalMinutesNeeded])
     VALUES (
        @PFID,
		@ForecastID,
		@SubPart,
		@MasterOrderBy,
		@NeededBy,
		@OrderBy,
		0, --This will be used to say how many of this part need to be built/ordered.  We calculate it later, so initialize it to 0 now.
		@SprNum,
		@Needed,
--		dbo.svf_GetTotalTime(@SubPart, dbo.MaxOf(@Needed, 0))
    0 --This can be calculated later.  Again, it's more of a PartsNeeded value.  Put in here to be able to calculate time needed by gun type, but that calculation may not be accurate anyway if the part can be used on different gun types.  You don't know which one the labor's actually going to be "assigned" to...
	)

	-- If the current part is an assembly, recurse into this SP again and calculate the quantities for all its subparts
	if (@Assembly = 'Yes') exec dbo.CalculatePartsNeeded @SubPart, @OrderBy, @Needed , @ForecastID, @MasterOrderBy, @PFID;

	-- Find the next part and do it all again...
	FETCH NEXT FROM c1
	INTO @SubPart, @Quantity, @Assembly, @LeadTime, @PurchFlag;

END --c1

CLOSE c1
DEALLOCATE c1

END --CalculatePartsNeeded