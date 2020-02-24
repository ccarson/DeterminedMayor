CREATE TABLE [dbo].[PLFactor] (
    [ID]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [PriceType] VARCHAR (20)   CONSTRAINT [DF_PLFactor_PriceType] DEFAULT ('') NOT NULL,
    [Model]     CHAR (6)       CONSTRAINT [DF_PLFactor_Model] DEFAULT ('') NOT NULL,
    [Factor]    NUMERIC (8, 4) CONSTRAINT [DF_PLFactor_Factor] DEFAULT ((0)) NOT NULL,
    [CalcHow]   CHAR (1)       CONSTRAINT [DF_PLFactor_CalcHow] DEFAULT ('') NOT NULL,
    CONSTRAINT [PLFactor_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLFactor_INDEX02]
    ON [dbo].[PLFactor]([PriceType] ASC, [Model] ASC);

