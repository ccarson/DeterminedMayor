CREATE TABLE [dbo].[ForecastLabor] (
    [ID]                 BIGINT          IDENTITY (1, 1) NOT NULL,
    [ForecastID]         BIGINT          CONSTRAINT [DF_ForecastLabor_ForecastID] DEFAULT ((0)) NOT NULL,
    [Month]              DATE            CONSTRAINT [DF__ForecastL__Month__2F14F220] DEFAULT ('0001-01-01') NOT NULL,
    [Department]         VARCHAR (3)     CONSTRAINT [DF__ForecastL__Depar__30091659] DEFAULT (' ') NOT NULL,
    [MinutesAvailable]   NUMERIC (10, 2) NULL,
    [EffectiveRate]      SMALLINT        NULL,
    [EffectiveAvailable] NUMERIC (10, 2) NULL,
    [ExtraTime]          NUMERIC (10, 2) CONSTRAINT [DF_ForecastLabor_ExtraTime] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [ForecastLabor_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);

