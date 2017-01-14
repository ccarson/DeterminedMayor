CREATE TABLE [dbo].[PartsNeeded] (
    [ID]               BIGINT       IDENTITY (1, 1) NOT NULL,
    [SprNum]           VARCHAR (20) DEFAULT (' ') NOT NULL,
    [NeededBy]         DATE         DEFAULT ('0001-01-01') NOT NULL,
    [OrderBy]          DATE         NULL,
    [Qty]              BIGINT       NULL,
    [ForecastHeaderID] BIGINT       DEFAULT ((0)) NOT NULL,
    [IsAssembly]       VARCHAR (3)  NULL,
    [QtyToOrder]       BIGINT       NULL,
    [WOQty]            BIGINT       NULL,
    [POQty]            BIGINT       NULL,
    [Balance]          BIGINT       NULL,
    [WOCalc]           TINYINT      NULL,
    [POCalc]           TINYINT      NULL,
    [AvailableCalc]    TINYINT      NULL,
    CONSTRAINT [PartsNeeded_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);






GO




GO
CREATE UNIQUE NONCLUSTERED INDEX [PartsNeeded_INDEX03]
    ON [dbo].[PartsNeeded]([ForecastHeaderID] ASC, [SprNum] ASC, [NeededBy] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PartsNeeded_INDEX02]
    ON [dbo].[PartsNeeded]([SprNum] ASC, [NeededBy] ASC, [ID] ASC) WITH (FILLFACTOR = 100);

