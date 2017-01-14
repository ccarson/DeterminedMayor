
CREATE PROCEDURE [dbo].[sasp_SalesMarginAndCostOfGoodsSold] 
(
  @StartShipDate date
  , @EndShipDate date
  , @ExcludeAccountType5 int
)
AS
/* Create Inventory Aging file */

DECLARE @WOPO table
(
  SPRNum varchar(20),
  WP char(1),
  WOPONumber bigint, --WO or PO Number
  Quan bigint,
  UnitCost decimal(12,4),
  ItemDate datetime,
  StandardCost decimal(12,4)
  , WOPOStatus char(1)
);

DECLARE @InvenAging table
(
  ID bigint identity,
  SPRNum varchar(20),
  WP char(1),
  WOPONumber bigint, --WO or PO Number
  Quan bigint,
  UnitCost decimal(12,4),
  ItemDate datetime,
  TotalCost decimal(18,4),
  StandardCost decimal(12,4)
  , WOPOStatus char(1)
);

DECLARE @PartsShipped table
(
  OrderNum NUMERIC(12,2),
  PartNum varchar(20),
  QuantityShipped int,
  SalesPrice decimal(12,4)
);

DECLARE @ShippedWithAging table
(
  ID bigint identity,
  OrderNum NUMERIC(12,2),
  PartNum varchar(20),
  QuantityShipped int,
  SalesPrice decimal(12,4),
  WP char(1),
  WOPONumber bigint, --WO or PO Number
  UnitCost decimal(12,4),
  ItemDate datetime,
  StandardCost decimal(12,4),
  InventoryRowForOrder int
  , WOPOStatus char(1)
);

DECLARE
  @PartNum varchar(20),
  @PartCount INT, 
  @ShipCount INT, 
  @ItemCount INT, 
  @RunningTotal INT = 0,  
  @UnitCost decimal(12,4),
  @StandardCost decimal(12,4),
  @ItemDate datetime,
  @WP char(1),
  @WOPONumber bigint,
  @OrderNum NUMERIC(12,2),
  @QuantityShipped int,
  @SalesPrice decimal(12,4),
  @ID bigint
  , @InventoryRow int
  , @WOPOStatus char(1);

DECLARE cParts CURSOR LOCAL FAST_FORWARD
  FOR SELECT ps.SPRNum, p.FIN + p.RESERVED + p.Packed, ps.SumShipped
    FROM parts p
      INNER JOIN 
        (SELECT ml.SPRNUM, SUM(ml.QUANSHIP) as SumShipped
          FROM MASTERLN ml
            INNER JOIN CUSTINFO ci
              ON ml.ORDNUM = ci.ORDNUM
                  AND ci.SHIPDATE >= @StartShipDate
                  AND ci.SHIPDATE <= @EndShipDate
                  AND ml.QUANSHIP > 0
                  AND ((@ExcludeAccountType5 = 0)
                      OR (ci.ACCTYPE <> '5')) --2017-01-04 MRM Account Type is no longer Numeric...
            GROUP BY ml.SPRNUM) ps
        ON p.SPRNUM = ps.SPRNUM
    WHERE ps.SumShipped <> 0 
    ORDER BY p.SPRNUM;

OPEN cParts;

FETCH NEXT FROM cParts 
INTO @PartNum, @PartCount, @ShipCount;

WHILE @@FETCH_STATUS = 0
BEGIN
  SET @RunningTotal = @PartCount + @ShipCount;

  -- Get counts of items from their related Work Orders
  DECLARE cWO CURSOR LOCAL FAST_FORWARD
    FOR SELECT AVAIL, 
        CASE 
          --WHEN [STATUS] = '8' THEN (STD_LABOR + STD_OVERHEAD + STD_INDIRECT + STD_SUBCONTR + STD_MATERIALS) / QTY_PROJ -- Inventory Closed
          WHEN [STATUS] = '9' THEN UNIT_COST -- Cost Closed
          ELSE (STD_LABOR + STD_OVERHEAD + STD_INDIRECT + STD_SUBCONTR + STD_MATERIALS) / CASE WHEN ISNULL(QTY_PROJ, 0) < 1 THEN 1 ELSE QTY_PROJ END
        END
        , CLOSE_DATE
        , (STD_LABOR + STD_OVERHEAD + STD_INDIRECT + STD_SUBCONTR + STD_MATERIALS) / CASE WHEN ISNULL(QTY_PROJ, 0) < 1 THEN 1 ELSE QTY_PROJ END  --Std Cost
        , WO_#
        , [STATUS]
      FROM WOHeader 
      WHERE SPRNUM = @PartNum
          --AND [STATUS] IN ('8', '9')
      ORDER BY CLOSE_DATE DESC;
  
  OPEN cWO;

  FETCH NEXT FROM cWO 
  INTO @ItemCount, @UnitCost, @ItemDate, @StandardCost, @WOPONumber, @WOPOStatus;
  
  WHILE @@FETCH_STATUS = 0
  BEGIN
    INSERT @WOPO(SPRNum, WP, Quan, UnitCost, ItemDate, StandardCost, WOPONumber, WOPOStatus)
      SELECT @PartNum, 'W', @ItemCount, @UnitCost, @ItemDate, @StandardCost, @WOPONumber, @WOPOStatus;

    SET @RunningTotal = @RunningTotal - @ItemCount;
    
    IF @RunningTotal <= 0
      BREAK;

    FETCH NEXT FROM cWO 
    INTO @ItemCount, @UnitCost, @ItemDate, @StandardCost, @WOPONumber, @WOPOStatus;
  END

  CLOSE cWO;
  DEALLOCATE cWO;

  -- Reset
  SET @RunningTotal = @PartCount + @ShipCount;

  -- Get counts of items from their related Purchase Orders
  DECLARE cPO CURSOR LOCAL FAST_FORWARD
    FOR SELECT pod.QTY_RECD_TD, pod.PRICE_EA + ISNULL(p.FREIGHT, 0), pod.DATE_RECD
        , (pod.PRICE_EA + ISNULL(p.FREIGHT, 0)) / (ISNULL(u.QTY, 1)) --Std Cost
        , PO_#
        , 0
      FROM PODETAIL pod
        INNER JOIN parts p ON pod.SPRNUM = p.SPRNUM
          AND pod.SPRNUM = @PartNum
        LEFT JOIN INUOM u ON pod.UOM_CODE = u.CODE
      ORDER BY DATE_RECD DESC;
  
  OPEN cPO;

  FETCH NEXT FROM cPO 
  INTO @ItemCount, @UnitCost, @ItemDate, @StandardCost, @WOPONumber, @WOPOStatus;
      
  WHILE @@FETCH_STATUS = 0
  BEGIN
    INSERT @WOPO(SPRNum, WP, Quan, UnitCost, ItemDate, StandardCost, WOPONumber, WOPOStatus)
      SELECT @PartNum, 'P', @ItemCount, @UnitCost, @ItemDate, @StandardCost, @WOPONumber, @WOPOStatus;

    SET @RunningTotal = @RunningTotal - @ItemCount;
    
    IF @RunningTotal <= 0
      BREAK;

    FETCH NEXT FROM cPO 
    INTO @ItemCount, @UnitCost, @ItemDate, @StandardCost, @WOPONumber, @WOPOStatus;
  END
      
  CLOSE cPO;
  DEALLOCATE cPO;
  
  -- Now move the data to the Inventory Aging table.
  SET @RunningTotal = @PartCount + @ShipCount;
  
  DECLARE cWOPO CURSOR LOCAL FAST_FORWARD
    FOR SELECT WP, Quan, UnitCost, ItemDate, StandardCost, WOPONumber, WOPOStatus
      FROM @WOPO 
      WHERE SPRNum = @PartNum
      ORDER BY ItemDate DESC;
  
  OPEN cWOPO;

  FETCH NEXT FROM cWOPO 
  INTO @WP, @ItemCount, @UnitCost, @ItemDate, @StandardCost, @WOPONumber, @WOPOStatus;
  
  WHILE @@FETCH_STATUS = 0
  BEGIN
    IF ((@RunningTotal - @ItemCount) < @ShipCount) --Only include aging rows for the shipped part
    BEGIN
      INSERT @InvenAging(SPRNum, WP, Quan, UnitCost, ItemDate, StandardCost, WOPONumber, WOPOStatus)
        SELECT @PartNum, @WP, 
            CASE 
              WHEN ((@RunningTotal > @ShipCount) AND (@RunningTotal > @ItemCount)) THEN @ItemCount - (@RunningTotal - @ShipCount) --This WO/PO includes part of what's still in stock and part of what was shipped.  Remove the amount that's still in stock and just include the shipped part.
              WHEN ((@RunningTotal > @ShipCount) AND (@RunningTotal <= @ItemCount)) THEN @ShipCount --This WO/PO includes more than the amount reamining in stock plus what was shipped, so just use what was shipped.
              WHEN @RunningTotal > @ItemCount THEN @ItemCount --More remaining than what was on this WO/PO
              ELSE @RunningTotal --Less remaining than what's on the WO/PO
            END,
            @UnitCost, @ItemDate
            , @StandardCost
            , @WOPONumber
            , @WOPOStatus;
    END

    SET @RunningTotal = @RunningTotal - @ItemCount;
    
    IF @RunningTotal <= 0
      BREAK;

    FETCH NEXT FROM cWOPO 
    INTO @WP, @ItemCount, @UnitCost, @ItemDate, @StandardCost, @WOPONumber, @WOPOStatus;
  END

  CLOSE cWOPO;
  DEALLOCATE cWOPO;

  -- Move to the next Part
  FETCH cParts INTO @PartNum, @PartCount, @ShipCount;
END

CLOSE cParts;
DEALLOCATE cParts;

--Get the list of items shipped into a temp table so we can run our nested cursors
INSERT INTO @PartsShipped (OrderNum, PartNum, QuantityShipped, SalesPrice)
SELECT ci.ORDNUM, ml.SPRNUM, ml.QUANSHIP, ml.UPRICE
FROM CUSTINFO ci
  INNER JOIN MASTERLN ml
    ON ml.ORDNUM = ci.ORDNUM
        AND ci.SHIPDATE >= @StartShipDate
        AND ml.QUANSHIP > 0
        AND ((@ExcludeAccountType5 = 0) --2016-09-07 MRM Added excluding of account type 5 (on loan) at Laura's request.
            OR (ci.ACCTYPE <> '5')); --2017-01-04 MRM Account Type is no longer Numeric...

--Loop through the orders and find the associated WO/PO info
DECLARE cOrders CURSOR LOCAL FAST_FORWARD
  FOR SELECT ps.OrderNum, ps.PartNum, ps.QuantityShipped, ps.SalesPrice
    FROM @PartsShipped ps
    ORDER BY ps.PartNum;

OPEN cOrders;

FETCH NEXT FROM cOrders 
INTO @OrderNum, @PartNum, @QuantityShipped, @SalesPrice;

WHILE @@FETCH_STATUS = 0
BEGIN
  SET @RunningTotal = @QuantityShipped;
  set @InventoryRow = 1;

  --Find the appropriate inventory aging data
  DECLARE cInvenAging CURSOR LOCAL FAST_FORWARD
    FOR SELECT ID, SPRNum, WP, WOPONumber, Quan, UnitCost, ItemDate, StandardCost, WOPOStatus
      FROM @InvenAging
      WHERE SPRNum = @PartNum
      ORDER BY ItemDate DESC;
  
  OPEN cInvenAging;

  FETCH NEXT FROM cInvenAging 
  INTO @ID, @PartNum, @WP, @WOPONumber, @ItemCount, @UnitCost, @ItemDate, @StandardCost, @WOPOStatus;
  
  WHILE @@FETCH_STATUS = 0
  BEGIN
    INSERT @ShippedWithAging (OrderNum, PartNum, QuantityShipped, SalesPrice, WP, WOPONumber, UnitCost, ItemDate, StandardCost, InventoryRowForOrder, WOPOStatus)
      SELECT @OrderNum 
          , @PartNum,
          CASE 
            WHEN @RunningTotal > @ItemCount THEN @ItemCount --More remaining than what was on this WO/PO
            ELSE @RunningTotal --Less remaining than what's on the WO/PO
          END
          , @SalesPrice
          , @WP
          , @WOPONumber
          , @UnitCost
          , @ItemDate
          , @StandardCost
          , @InventoryRow
          , @WOPOStatus
          ;

    IF (@RunningTotal >= @ItemCount)
    BEGIN
      DELETE FROM @InvenAging WHERE ID = @ID
    END
    ELSE BEGIN --@RunningTotal < @ItemCount, so remove @RunningTotal from the row so we're doing the next shipment of this part (if any) right
      UPDATE @InvenAging SET Quan = (@ItemCount - @RunningTotal) WHERE ID = @ID
    END

    SET @RunningTotal = @RunningTotal - @ItemCount;
    set @InventoryRow = @InventoryRow + 1;
    
    IF @RunningTotal <= 0
      BREAK;

    FETCH NEXT FROM cInvenAging 
    INTO @ID, @PartNum, @WP, @WOPONumber, @ItemCount, @UnitCost, @ItemDate, @StandardCost, @WOPOStatus;
  END

  --2016-08-24 MRM If there's still a balance with no WO/PO, create a dummy row.
  IF @RunningTotal > 0
  BEGIN
    INSERT @ShippedWithAging (OrderNum, PartNum, QuantityShipped, SalesPrice, WP, WOPONumber, UnitCost, ItemDate, StandardCost, InventoryRowForOrder, WOPOStatus)
    SELECT @OrderNum 
        , @PartNum
        , @RunningTotal
        , @SalesPrice
        , 'N'
        , 0
        , 0
        , '1753-01-01'
        , 0
        , 0
        , 0
        ;
  END

  CLOSE cInvenAging;
  DEALLOCATE cInvenAging;

  -- Move to the next Order
  FETCH cOrders INTO @OrderNum, @PartNum, @QuantityShipped, @SalesPrice;
END

CLOSE cOrders;
DEALLOCATE cOrders;

--Now show the resulting combined Sales info
SELECT swa.PartNum
  , p.[DESC] AS PartDescription
  , p.RPT_GROUP AS PartCategory
  , p.SubCategory
  , swa.QuantityShipped
  , swa.SalesPrice
  , swa.QuantityShipped * swa.SalesPrice AS SalesTotal
  , swa.OrderNum
  , ci.SHIPDATE AS ShipDate
  , swa.WP
  , swa.WOPONumber
  , swa.ItemDate
  , swa.UnitCost
  , swa.QuantityShipped * swa.UnitCost AS UnitTotal
  --2017-01-18 MRM Laura wants these to be Parts.CostFin now...
  --, swa.StandardCost
  --, swa.QuantityShipped * swa.StandardCost AS StandardTotal
  , p.COSTFIN AS StandardCost
  , swa.QuantityShipped * p.COSTFIN AS StandardTotal
  , swa.SalesPrice - swa.UnitCost AS GrossMargin
  , (swa.SalesPrice - swa.UnitCost) * swa.QuantityShipped AS GrossMarginTotal
  , CASE WHEN swa.SalesPrice = 0 THEN 0 ELSE (swa.SalesPrice - swa.UnitCost) / swa.SalesPrice END AS GrossMarginPercent
  , swa.InventoryRowForOrder
  , p.SACCOUNT_ID as SAccountID
  , swa.WOPOStatus
FROM @ShippedWithAging swa
  INNER JOIN parts p
    ON swa.PartNum = p.SPRNUM
  INNER JOIN CUSTINFO ci
    ON swa.OrderNum = ci.ORDNUM
ORDER BY swa.ID;