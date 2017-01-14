CREATE TABLE [dbo].[PartsForecast] (
    [ID]                BIGINT       IDENTITY (1, 1) NOT NULL,
    [ForecastHeaderID]  BIGINT       CONSTRAINT [DF__PartsFore__Forec__51F34EB2] DEFAULT ((0)) NOT NULL,
    [SprNum]            VARCHAR (20) CONSTRAINT [DF__PartsFore__SprNu__52E772EB] DEFAULT (' ') NOT NULL,
    [YearMonth]         VARCHAR (6)  CONSTRAINT [DF__PartsFore__YearM__53DB9724] DEFAULT (' ') NOT NULL,
    [New]               VARCHAR (1)  NULL,
    [Quan]              INT          NULL,
    [QuanShip]          INT          NULL,
    [OrigQuan]          INT          NULL,
    [Approved]          VARCHAR (1)  NULL,
    [ParametersApplied] VARCHAR (1)  NULL,
    [GunTypeCode]       CHAR (1)     NULL,
    CONSTRAINT [PartsForecast_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [PartsForecast_INDEX02]
    ON [dbo].[PartsForecast]([ForecastHeaderID] ASC, [SprNum] ASC, [YearMonth] ASC);


GO
CREATE NONCLUSTERED INDEX [PartsForecast_INDEX03]
    ON [dbo].[PartsForecast]([ForecastHeaderID] ASC, [GunTypeCode] ASC, [ID] ASC) WITH (FILLFACTOR = 100);

