CREATE TABLE [dbo].[ClampackLabel] (
    [ID]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [PartNum]          VARCHAR (20)  CONSTRAINT [DF_ClampackLabel_PartNum] DEFAULT ('') NOT NULL,
    [ImageFileName]    VARCHAR (100) CONSTRAINT [DF_ClampackLabel_ImageFileName] DEFAULT ('') NOT NULL,
    [DescriptionLine1] VARCHAR (15)  CONSTRAINT [DF_ClampackLabel_DescriptionLine1] DEFAULT ('') NOT NULL,
    [DescriptionLine2] VARCHAR (15)  CONSTRAINT [DF_ClampackLabel_DescriptionLine2] DEFAULT ('') NOT NULL,
    [DescriptionLine3] VARCHAR (15)  CONSTRAINT [DF_ClampackLabel_DescriptionLine3] DEFAULT ('') NOT NULL,
    [DescriptionLine4] VARCHAR (15)  DEFAULT ('') NOT NULL,
    CONSTRAINT [ClampackLabel_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ClampackLabel_INDEX02]
    ON [dbo].[ClampackLabel]([PartNum] ASC);

