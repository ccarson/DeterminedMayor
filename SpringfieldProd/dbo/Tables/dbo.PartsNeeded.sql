CREATE TABLE [dbo].[PartsNeeded] (
    [ID]                 BIGINT          IDENTITY (1, 1) NOT NULL,
    [SprNum]             VARCHAR (20)    CONSTRAINT [DF__PartsNeed__SprNu__5A9381AB] DEFAULT (' ') NOT NULL,
    [NeededBy]           DATE            CONSTRAINT [DF__PartsNeed__Neede__5B87A5E4] DEFAULT ('0001-01-01') NOT NULL,
    [OrderBy]            DATE            NULL,
    [Qty]                BIGINT          CONSTRAINT [DF_PartsNeeded_Qty] DEFAULT ((0)) NOT NULL,
    [ForecastHeaderID]   BIGINT          CONSTRAINT [DF__PartsNeed__Forec__63C7E62A] DEFAULT ((0)) NOT NULL,
    [IsAssembly]         VARCHAR (3)     NULL,
    [QtyToOrder]         BIGINT          CONSTRAINT [DF_PartsNeeded_QtyToOrder] DEFAULT ((0)) NOT NULL,
    [WOQty]              BIGINT          CONSTRAINT [DF_PartsNeeded_WOQty] DEFAULT ((0)) NOT NULL,
    [POQty]              BIGINT          CONSTRAINT [DF_PartsNeeded_POQty] DEFAULT ((0)) NOT NULL,
    [Balance]            BIGINT          CONSTRAINT [DF_PartsNeeded_Balance] DEFAULT ((0)) NOT NULL,
    [WOCalc]             TINYINT         CONSTRAINT [DF_PartsNeeded_WOCalc] DEFAULT ((0)) NOT NULL,
    [POCalc]             TINYINT         CONSTRAINT [DF_PartsNeeded_POCalc] DEFAULT ((0)) NOT NULL,
    [AvailableCalc]      TINYINT         CONSTRAINT [DF_PartsNeeded_AvailableCalc] DEFAULT ((0)) NOT NULL,
    [TotalMinutesNeeded] NUMERIC (10, 2) CONSTRAINT [DF_PartsNeeded_TotalMinutesNeeded] DEFAULT ((0)) NOT NULL,
    [FinishDate]         DATE            NULL,
    [MasterPart]         VARCHAR (20)    NULL,
    CONSTRAINT [PartsNeeded_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);








GO




GO
CREATE UNIQUE NONCLUSTERED INDEX [PartsNeeded_INDEX03]
    ON [dbo].[PartsNeeded]([ForecastHeaderID] ASC, [SprNum] ASC, [NeededBy] ASC, [OrderBy] ASC) WITH (FILLFACTOR = 100);




GO
CREATE UNIQUE NONCLUSTERED INDEX [PartsNeeded_INDEX02]
    ON [dbo].[PartsNeeded]([SprNum] ASC, [NeededBy] ASC, [ID] ASC) WITH (FILLFACTOR = 100);

