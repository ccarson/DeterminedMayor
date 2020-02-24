CREATE TABLE [dbo].[PartsForecastDetail] (
    [ID]                 BIGINT          IDENTITY (1, 1) NOT NULL,
    [PartsForecastID]    BIGINT          CONSTRAINT [DF__PartsFore__Parts__1A4EDF64] DEFAULT ((0)) NOT NULL,
    [ForecastHeaderID]   BIGINT          CONSTRAINT [DF__PartsFore__Forec__1B43039D] DEFAULT ((0)) NOT NULL,
    [SprNum]             VARCHAR (20)    CONSTRAINT [DF__PartsFore__SprNu__1C3727D6] DEFAULT (' ') NOT NULL,
    [FinishDate]         DATE            NULL,
    [NeededBy]           DATE            CONSTRAINT [DF__PartsFore__Neede__1D2B4C0F] DEFAULT ('0001-01-01') NOT NULL,
    [OrderBy]            DATE            CONSTRAINT [DF__PartsFore__Order__1E1F7048] DEFAULT ('0001-01-01') NOT NULL,
    [Quantity]           INT             NULL,
    [MasterPart]         VARCHAR (20)    CONSTRAINT [DF_PartsForecastDetail_MasterPart] DEFAULT (' ') NOT NULL,
    [Usage]              INT             NULL,
    [TotalMinutesNeeded] NUMERIC (10, 2) CONSTRAINT [DF_PartsForecastDetail_TotalMinutesNeeded] DEFAULT ((0)) NOT NULL,
    [ParentUsageApplied] TINYINT         CONSTRAINT [DF_PartsForecastDetail_ParentUsageApplied] DEFAULT ((0)) NOT NULL,
    [BalanceApplied]     TINYINT         CONSTRAINT [DF_PartsForecastDetail_BalanceApplied] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PartsForecastDetail_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);

