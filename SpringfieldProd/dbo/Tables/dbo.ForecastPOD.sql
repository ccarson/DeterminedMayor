CREATE TABLE [dbo].[ForecastPOD] (
    [ForecastPOD_ID] BIGINT       IDENTITY (1, 1) NOT NULL,
    [ForecastPOH_ID] BIGINT       NOT NULL,
    [SprNum]         VARCHAR (20) NULL,
    [Sugg_Qty_Ord]   NUMERIC (8)  NULL,
    [Actual_Qty_Ord] INT          NULL,
    [Delivery_Date]  DATE         NULL,
    [Line_#]         INT          CONSTRAINT [DF__ForecastP__Line___7E71BAC5] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [ForecastPOD_INDEX01] PRIMARY KEY CLUSTERED ([ForecastPOD_ID] ASC)
);

