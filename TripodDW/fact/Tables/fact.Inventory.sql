CREATE TABLE [fact].[Inventory] (
    [InventoryFactKey] BIGINT       IDENTITY (1, 1) NOT NULL,
    [PartKey]          BIGINT       NOT NULL,
    [InventoryDateKey] BIGINT       NOT NULL,
    [FinishedGoodsQty] DECIMAL (10) NOT NULL,
    [RawGoodsQty]      DECIMAL (10) NOT NULL,
    [WIPQty]           DECIMAL (10) NOT NULL,
    [AssignedQty]      DECIMAL (10) NOT NULL,
    [RawAssignedQty]   DECIMAL (10) NOT NULL,
    [PackedQty]        DECIMAL (10) NOT NULL,
    [ReservedQty]      DECIMAL (10) NOT NULL,
    [OnOrderQty]       DECIMAL (10) NOT NULL,
    [PulledToWOQty]    DECIMAL (10) NOT NULL,
    [YTDShippedQty]    DECIMAL (10) NOT NULL,
    [YTDAssignedQty]   DECIMAL (10) NOT NULL,
    [AvailableQty]     AS           ((([FinishedGoodsQty]+[RawGoodsQty])-[AssignedQty])-[RawAssignedQty]) PERSISTED,
    [DWTimestamp]      DATETIME     DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_Inventory] PRIMARY KEY CLUSTERED ([InventoryFactKey] ASC),
    CONSTRAINT [fk_Inventory_Date] FOREIGN KEY ([InventoryDateKey]) REFERENCES [dimension].[Date] ([DateKey]),
    CONSTRAINT [fk_Inventory_Part] FOREIGN KEY ([PartKey]) REFERENCES [dimension].[Part] ([PartKey])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Inventory_00]
    ON [fact].[Inventory]([PartKey] ASC, [InventoryDateKey] ASC);

