CREATE TABLE [fact].[ForecastOrder] (
    [ForecastOrderFactKey] BIGINT       IDENTITY (1, 1) NOT NULL,
    [BudgetKey]            BIGINT       NOT NULL,
    [ProjectionDateKey]    BIGINT       NOT NULL,
    [ReportingGroup]       VARCHAR (6)  NOT NULL,
    [ManagementGroup]      VARCHAR (20) NOT NULL,
    [SPRSubCategory]       VARCHAR (30) NOT NULL,
    [BudgetUnits]          INT          NOT NULL,
    [BudgetRevenue]        INT          NOT NULL,
    [DWTimestamp]          DATETIME     DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_ForecastOrder] PRIMARY KEY CLUSTERED ([ForecastOrderFactKey] ASC)
);

