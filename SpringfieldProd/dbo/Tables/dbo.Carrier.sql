CREATE TABLE [dbo].[Carrier] (
    [ID]                  BIGINT        IDENTITY (1, 1) NOT NULL,
    [Name]                VARCHAR (20)  CONSTRAINT [DF__Carrier__Name__3B0F1E03] DEFAULT (' ') NOT NULL,
    [TrackingURL]         VARCHAR (100) NULL,
    [CreateDailyManifest] VARCHAR (1)   NULL,
    [SortOrder]           SMALLINT      DEFAULT ((0)) NOT NULL,
    [EDIRoutingCode]      VARCHAR (4)   NULL,
    CONSTRAINT [Carrier_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Carrier_INDEX02]
    ON [dbo].[Carrier]([Name] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Carrier_INDEX03]
    ON [dbo].[Carrier]([SortOrder] ASC, [ID] ASC);

