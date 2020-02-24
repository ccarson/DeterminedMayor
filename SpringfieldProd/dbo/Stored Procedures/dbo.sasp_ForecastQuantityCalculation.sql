
CREATE PROCEDURE [dbo].[sasp_ForecastQuantityCalculation] 
	-- Add the parameters for the stored procedure here
  @idForecast bigint

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

  DECLARE @idPartsForecast bigint;
  DECLARE	@MasterPart varchar(20);
  DECLARE @Quantity  int;

  -------------
  --Process all of the top-level records
  -------------
  DECLARE cPF CURSOR LOCAL READ_ONLY
  FOR
    SELECT pf.ID, pf.SprNum, pf.Quan
    FROM PartsForecast pf
    WHERE pf.ForecastHeaderID = @idForecast
    ORDER BY pf.YearMonth, pf.SprNum;

  OPEN cPF

  FETCH NEXT FROM cPF
  INTO @idPartsForecast, @MasterPart, @Quantity

  WHILE @@FETCH_STATUS = 0
  BEGIN
    EXEC sasp_ForecastCalculatePartQuantity @MasterPart, @Quantity, @idPartsForecast, @idForecast
      
    -- Find the next row and do it all again...
    FETCH NEXT FROM cPF
    INTO @idPartsForecast, @MasterPart, @Quantity
  END --cQuantityCalculation loop

  CLOSE cPF
  DEALLOCATE cPF

  --------------
  --Now check if there are any parts left to process.  Repeat as many times as needed.
  --------------
  WHILE EXISTS (SELECT ID FROM PartsForecastDetail pfd WHERE ParentUsageApplied = 1 AND BalanceApplied = 0)
  BEGIN

    DECLARE cPFD CURSOR LOCAL READ_ONLY
    FOR
      SELECT idPF, PartNum, Qty
      FROM
      (
      -------------
      --Parts where it's a subpart of a subpart
      -------------
      SELECT mast.PartsForecastID AS idPF, mast.SprNum AS PartNum, mast.Usage AS Qty, mast.NeededBy
      FROM PartsForecastDetail mast
      INNER JOIN 
      (SELECT DISTINCT pfd.MasterPart, pfd.PartsForecastID
      FROM PartsForecastDetail pfd
      WHERE pfd.ForecastHeaderID = @idForecast
      AND pfd.ParentUsageApplied = 1
      AND pfd.BalanceApplied = 0) pfd
      ON mast.PartsForecastID = pfd.PartsForecastID
      AND mast.SprNum = pfd.MasterPart
      UNION ALL
      -------------
      --Parts where it's a subpart of the top level master part
      -------------
      SELECT pf.ID, pf.SprNum, pf.Quan, CAST(RIGHT(pf.YearMonth, 2) + '/01/' + LEFT(pf.YearMonth, 4) AS date)
      FROM PartsForecast pf
      INNER JOIN
      (SELECT DISTINCT pfd.MasterPart, pfd.PartsForecastID
      FROM PartsForecastDetail pfd
      WHERE pfd.ForecastHeaderID = @idForecast
      AND pfd.ParentUsageApplied = 1
      AND pfd.BalanceApplied = 0) pfd
      ON pf.SprNum = pfd.MasterPart
      AND pf.ID = pfd.PartsForecastID
      ) retry
      ORDER BY NeededBy, PartNum


    OPEN cPFD

    FETCH NEXT FROM cPFD
    INTO @idPartsForecast, @MasterPart, @Quantity

    WHILE @@FETCH_STATUS = 0
    BEGIN
      EXEC sasp_ForecastCalculatePartQuantity @MasterPart, @Quantity, @idPartsForecast, @idForecast
      
      -- Find the next row and do it all again...
      FETCH NEXT FROM cPFD
      INTO @idPartsForecast, @MasterPart, @Quantity
    END --cQuantityCalculation loop

    CLOSE cPFD
    DEALLOCATE cPFD
  END
END