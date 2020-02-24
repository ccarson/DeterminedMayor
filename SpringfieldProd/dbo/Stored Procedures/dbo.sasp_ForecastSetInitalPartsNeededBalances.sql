
CREATE PROCEDURE [dbo].[sasp_ForecastSetInitalPartsNeededBalances] 
	-- Add the parameters for the stored procedure here
	@ForecastID int
		
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


DECLARE @MinDate date;
DECLARE @MaxDate date;

SET @MinDate = (SELECT MIN(pfd.NeededBy)
FROM PartsForecastDetail pfd
WHERE ForecastHeaderID = @ForecastID);

SET @MaxDate = (SELECT MAX(pfd.NeededBy)
FROM PartsForecastDetail pfd
WHERE ForecastHeaderID = @ForecastID);

--SELECT @MinDate, @MaxDate

---------------
--Create all the rows in PartsNeeded
---------------
INSERT INTO PartsNeeded (SprNum, NeededBy, OrderBy, Qty, ForecastHeaderID, IsAssembly, QtyToOrder, WOQty, POQty, Balance)
SELECT p.SPRNUM
, YearMonthTbl.YearMonth
, DATEADD(month, DATEDIFF(month, 0, DATEADD(DAY, (p.LEAD_TIME * -1), YearMonthTbl.YearMonth)), 0)
, 0
, @ForecastID
, ''
, 0
, 0
, 0
, 0
FROM 
parts p
CROSS JOIN
(SELECT  DATEADD(MONTH, x.number, @MinDate) As YearMonth
FROM    master.dbo.spt_values x
WHERE   x.type = 'P'        
AND     x.number <= DATEDIFF(MONTH, @MinDate, @MaxDate)) YearMonthTbl
WHERE p.SPRNUM IN
(SELECT DISTINCT pfd.SprNum
FROM PartsForecastDetail pfd
WHERE ForecastHeaderID = @ForecastID
)

DECLARE @SubPart   varchar(20);
DECLARE @NeededBy date;
DECLARE @PartsNeededID bigint;
DECLARE @Balance int = 0;
DECLARE @POQty int = 0;
DECLARE @WOQty int = 0;


DECLARE cPartsNeeded CURSOR LOCAL READ_ONLY
FOR
SELECT pn.ID
, pn.SprNum
, pn.NeededBy
--YearMonthTbl.YearMonth 
--, orders.vad_variant_code
--, orders.qty

FROM PartsNeeded pn
WHERE pn.ForecastHeaderID = @ForecastID
ORDER BY pn.SprNum, pn.NeededBy


OPEN cPartsNeeded

FETCH NEXT FROM cPartsNeeded
INTO @PartsNeededID, @SubPart, @NeededBy

WHILE @@FETCH_STATUS = 0
BEGIN
	SET @Balance = 0;
	SET @POQty = 0;
	SET @WOQty = 0;

  IF (@NeededBy = @MinDate) --First month
  BEGIN
    SET @POQty = dbo.GetOverduePOQty(@SubPart, @NeededBy) + dbo.GetPOByPartDate(@SubPart, @NeededBy);
    SET @WOQty = dbo.GetOverdueWOQty(@SubPart, @NeededBy) + dbo.GetWOByPartDate(@SubPart, @NeededBy);
    SET @Balance = dbo.GetCurrentBalance(@SubPart) + @POQty + @WOQty;
  END
  ELSE BEGIN --Not the first month
    SET @POQty = dbo.GetPOByPartDate(@SubPart, @NeededBy);
    SET @WOQty = dbo.GetWOByPartDate(@SubPart, @NeededBy);
    SET @Balance = dbo.GetPreviousMonthBalance(@ForecastID, @SubPart, @NeededBy) + @POQty + @WOQty;
  END

  UPDATE PartsNeeded SET
	WOQty = @WOQty,
	POQty = @POQty,
	Balance = @Balance,
	IsAssembly = IIF((SELECT COUNT(*) FROM subref WHERE subref.MASTPART = @SubPart) > 0, 'Yes', '')
  WHERE ID = @PartsNeededID;

    -- Find the next row and do it all again...
	FETCH NEXT FROM cPartsNeeded
  INTO @PartsNeededID, @SubPart, @NeededBy

END --cPartsNeeded loop

CLOSE cPartsNeeded
DEALLOCATE cPartsNeeded

END