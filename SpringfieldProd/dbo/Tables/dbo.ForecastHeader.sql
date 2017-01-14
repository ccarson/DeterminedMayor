CREATE TABLE [dbo].[ForecastHeader] (
    [GunTypes]                VARCHAR (20)  NOT NULL,
    [Percentage]              SMALLINT      NULL,
    [Minimum]                 SMALLINT      NULL,
    [Round]                   TINYINT       NULL,
    [ID]                      BIGINT        IDENTITY (1, 1) NOT NULL,
    [StartMonth]              TINYINT       NULL,
    [StartYear]               VARCHAR (4)   NULL,
    [EndMonth]                TINYINT       NULL,
    [EndYear]                 VARCHAR (4)   NULL,
    [ForecastYear]            VARCHAR (4)   DEFAULT (' ') NOT NULL,
    [NeededWarningThreshhold] SMALLINT      NULL,
    [LastCalcDate]            DATETIME2 (3) NULL,
    [LastCalcBy]              VARCHAR (12)  NULL,
    [CalcRunning]             TINYINT       NULL,
    CONSTRAINT [ForecastHeader_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);










GO
CREATE UNIQUE NONCLUSTERED INDEX [ForecastHeader_INDEX02]
    ON [dbo].[ForecastHeader]([ForecastYear] ASC, [GunTypes] ASC);





