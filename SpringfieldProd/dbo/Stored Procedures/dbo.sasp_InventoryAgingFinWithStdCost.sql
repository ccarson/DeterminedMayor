
CREATE PROCEDURE [dbo].[sasp_InventoryAgingFinWithStdCost] 
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

DECLARE
  @PartNum varchar(20),
  @PartCount INT, 
  @ItemCount INT, 
  @RunningTotal INT = 0,  
  @UnitCost decimal(12,4),
  @StandardCost decimal(12,4),
  @ItemDate datetime,
  @WP char(1),
  @WOPONumber bigint
  , @WOPOStatus char(1);

DECLARE cParts CURSOR LOCAL FAST_FORWARD
  FOR SELECT SPRNUM, FIN + RESERVED + Packed
    FROM parts 
    WHERE FIN <> 0 
      OR RESERVED <> 0
      OR Packed > 0
    ORDER BY SPRNUM;

OPEN cParts;

FETCH NEXT FROM cParts 
INTO @PartNum, @PartCount;

WHILE @@FETCH_STATUS = 0
BEGIN
  SET @RunningTotal = @PartCount;

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
          AND [STATUS] IN ('8', '9')
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
  SET @RunningTotal = @PartCount;

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
  SET @RunningTotal = @PartCount;
  
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
    INSERT @InvenAging(SPRNum, WP, Quan, UnitCost, ItemDate, TotalCost, StandardCost, WOPONumber, WOPOStatus)
      SELECT @PartNum, @WP, 
          CASE 
            WHEN @RunningTotal > @ItemCount THEN @ItemCount
            ELSE @RunningTotal
          END,
          @UnitCost, @ItemDate, 
          CASE 
            WHEN @RunningTotal > @ItemCount THEN @ItemCount
            ELSE @RunningTotal
          END * @UnitCost
          , @StandardCost
          , @WOPONumber
          , @WOPOStatus;

    SET @RunningTotal = @RunningTotal - @ItemCount;
    
    IF @RunningTotal <= 0
      BREAK;

    FETCH NEXT FROM cWOPO 
    INTO @WP, @ItemCount, @UnitCost, @ItemDate, @StandardCost, @WOPONumber, @WOPOStatus;
  END

  --2016-08-24 MRM Add dummy rows for anything left over.
  IF @RunningTotal > 0
  BEGIN
    INSERT INTO @InvenAging(SPRNum, WP, Quan, UnitCost, ItemDate, TotalCost, StandardCost, WOPONumber, WOPOStatus)
    SELECT @PartNum, 'N', @RunningTotal, 0, '1753-01-01', 0, 0, 0, 0
  END

  CLOSE cWOPO;
  DEALLOCATE cWOPO;

  -- Move to the next Part
  FETCH cParts INTO @PartNum, @PartCount;
END

CLOSE cParts;
DEALLOCATE cParts;

--2016-08-02 MRM Added
--Now add any parts that didn't have a WO or PO into the list.  We'll have to put in "null" data for them.
INSERT INTO @InvenAging(SPRNum, WP, Quan, UnitCost, ItemDate, TotalCost, StandardCost, WOPONumber, WOPOStatus)
SELECT p.SPRNUM, 'N', p.FIN + p.RESERVED + p.Packed, 0, '1753-01-01', 0, 0, 0, 0
FROM parts p
WHERE p.SPRNUM NOT IN 
  (SELECT DISTINCT SPRNum
    FROM @WOPO)
  AND (FIN <> 0 
      OR RESERVED <> 0
      OR Packed <> 0)

-- Display the inventory aging file.
SELECT ia.SPRNum
  , p.[DESC]
  , p.RPT_GROUP
  , p.FIN + p.RESERVED + p.Packed as TotalQuan
  , ia.WP
  , ia.WOPONumber
  , ia.Quan
  --2017-01-18 MRM Laura wants this to be Parts.CostFin now...
  --, ia.StandardCost
  , p.COSTFIN AS StandardCost
  , ia.UnitCost
  , ia.ItemDate
  , ia.TotalCost
  , ia.WOPOStatus
FROM @InvenAging ia
  INNER JOIN parts p on ia.SPRNum = p.SPRNUM
ORDER BY ia.SPRNum;