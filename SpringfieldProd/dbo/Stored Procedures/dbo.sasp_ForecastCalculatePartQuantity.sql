
CREATE PROCEDURE [dbo].[sasp_ForecastCalculatePartQuantity] 
	-- Add the parameters for the stored procedure here
	@MasterPart varchar(20),
	@QtyToBuild int,
	@idPartsForecast bigint,
  @idForecast bigint

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


DECLARE @SubPart   varchar(20);
DECLARE @Usage  int;
DECLARE @IsAssembly  char(3);
DECLARE @Balance  int;
--DECLARE @idPartNeeded  bigint;
DECLARE @idPFD  bigint;
DECLARE @Multiplier int;
DECLARE @Quantity  int;
DECLARE @NeededBy date;
DECLARE @EarlierSubparts int;
DECLARE @PurchFlag char(1);

DECLARE cQuantityCalculation CURSOR LOCAL READ_ONLY
FOR
  SELECT pfd.ID, pfd.SprNum, pfd.NeededBy, s.AMOUNT, p.PURCH_FLAG
  FROM PartsForecastDetail pfd
  INNER JOIN subref s
  ON s.SUBPART = pfd.SprNum
  AND s.MASTPART = pfd.MasterPart
  AND pfd.PartsForecastID = @idPartsForecast
  AND pfd.MasterPart = @MasterPart
  AND pfd.BalanceApplied = 0
  INNER JOIN parts p
  ON p.SPRNUM = pfd.SprNum;

OPEN cQuantityCalculation

FETCH NEXT FROM cQuantityCalculation
INTO @idPFD, @SubPart, @NeededBy, @Multiplier, @PurchFlag

WHILE @@FETCH_STATUS = 0
BEGIN
  SELECT 
  @Balance = pn.Balance
  , @IsAssembly = pn.IsAssembly
  FROM PartsNeeded pn
  WHERE pn.SprNum = @SubPart
  AND pn.NeededBy = @NeededBy
  AND pn.ForecastHeaderID = @idForecast;

  SET @Usage = @Multiplier * @QtyToBuild; --Reset this to the quantity needed to build the Master part

  IF (@Usage = 0)
  BEGIN --Nothing to use, so set the row as done and tell all children the same.
    UPDATE PartsForecastDetail SET
      Usage = 0
      , Quantity = 0
      , ParentUsageApplied = 1
      , BalanceApplied = 1
    WHERE ID = @idPFD

    -------------
    --Now recursively process any subassemblies for this subpart
    -------------
    IF (@IsAssembly = 'Yes') EXEC dbo.sasp_ForecastCalculatePartQuantity @SubPart, 0, @idPartsForecast, @idForecast;
  END
  ELSE BEGIN
    IF EXISTS (SELECT ID
      FROM PartsForecastDetail pfd
      WHERE BalanceApplied = 0
      AND SprNum = @SubPart
      AND NeededBy < @NeededBy)
    BEGIN
      SET @EarlierSubparts = 1;
    END
    ELSE BEGIN
      SET @EarlierSubparts = 0;
    END

    IF (@EarlierSubparts > 0) 
    BEGIN
      ------------------
      --Save the updated usage to PartsForecastDetail and say that Parent Usage is applied.  
      --  We can't update from Balance yet, so there's no use going further down the rabbit hole...
      ------------------
      UPDATE PartsForecastDetail SET
        Usage = @Usage
        , ParentUsageApplied = 1
      WHERE ID = @idPFD
    END
    ELSE BEGIN
  IF (@Balance > @Usage)
  BEGIN
    SET @Quantity = 0;
  END
  ELSE IF (@Balance > 0)
  BEGIN
    SET @Quantity = @Usage - @Balance;
  END
  ELSE BEGIN
    SET @Quantity = @Usage;
  END

    --We don't need to set this, as we're not using it for the Update...
  --SET @Balance = @Balance - @Usage;

      ------------------
  --Save the updated values to PartsForecastDetail
      ------------------
  UPDATE PartsForecastDetail SET
    Usage = @Usage
    , Quantity = @Quantity
        , ParentUsageApplied = 1
        , BalanceApplied = 1
  WHERE ID = @idPFD

      -------------
      --Set the new Balance in PartsNeeded
      -------------
      UPDATE PartsNeeded SET
	    Balance = Balance - @Usage
      , Qty = IIF(NeededBy = @NeededBy, Qty + @Usage, Qty)
      --QtyToOrder is calculated differently based on where a part comes from.  It's cumulative for Purchased parts, but just per month for Manufactured parts.
      , QtyToOrder = IIF(@PurchFlag = 'P', IIF(@Quantity > 0, QtyToOrder + @Quantity, QtyToOrder), IIF(NeededBy = @NeededBy, QtyToOrder + @Quantity, QtyToOrder))
      WHERE ForecastHeaderID = @idForecast
      AND SprNum = @SubPart
      AND NeededBy >= @NeededBy;

  -------------
  --Now recursively process any subassemblies for this subpart
  -------------
      IF (@IsAssembly = 'Yes') EXEC dbo.sasp_ForecastCalculatePartQuantity @SubPart, @Quantity, @idPartsForecast, @idForecast;
    END
  END

    -- Find the next row and do it all again...
  FETCH NEXT FROM cQuantityCalculation
  INTO @idPFD, @SubPart, @NeededBy, @Multiplier, @PurchFlag

END --cQuantityCalculation loop

CLOSE cQuantityCalculation
DEALLOCATE cQuantityCalculation

END