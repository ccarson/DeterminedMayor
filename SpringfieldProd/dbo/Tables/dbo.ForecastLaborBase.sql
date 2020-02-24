CREATE TABLE [dbo].[ForecastLaborBase] (
    [ID]               BIGINT          IDENTITY (1, 1) NOT NULL,
    [Num]              VARCHAR (3)     CONSTRAINT [DF__ForecastLab__Num__33D9A73D] DEFAULT (' ') NOT NULL,
    [Dept_Name]        VARCHAR (20)    NULL,
    [MonthlyBase]      NUMERIC (12, 2) NULL,
    [EffectiveRate]    SMALLINT        NULL,
    [MonthlyEffective] NUMERIC (10, 2) NULL,
    CONSTRAINT [ForecastLaborBase_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);

