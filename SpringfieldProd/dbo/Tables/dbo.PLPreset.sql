CREATE TABLE [dbo].[PLPreset] (
    [ID]             BIGINT        IDENTITY (1, 1) NOT NULL,
    [DisplayName]    VARCHAR (30)  CONSTRAINT [DF_PLPreset_DisplayName] DEFAULT ('') NOT NULL,
    [PLDescription]  VARCHAR (100) CONSTRAINT [DF_PLPreset_PLDescription] DEFAULT ('') NOT NULL,
    [OutputPath]     VARCHAR (200) CONSTRAINT [DF_PLPreset_OutputPath] DEFAULT ('') NOT NULL,
    [OutputFileName] VARCHAR (100) CONSTRAINT [DF_PLPreset_OutputFileName] DEFAULT ('') NOT NULL,
    [OutputType]     CHAR (1)      CONSTRAINT [DF_PLPreset_OutputType] DEFAULT ('') NOT NULL,
    [ColumnCount]    INT           CONSTRAINT [DF_PLPreset_ColumnCount] DEFAULT ((3)) NOT NULL,
    [ItemCategory]   CHAR (1)      CONSTRAINT [DF_PLPreset_ItemCategory] DEFAULT ('') NOT NULL,
    [CreatedBy]      CHAR (4)      CONSTRAINT [DF_PLPreset_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate]    DATETIME2 (3) CONSTRAINT [DF_PLPreset_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [ChangedBy]      CHAR (4)      CONSTRAINT [DF_PLPreset_ChangedBy] DEFAULT ('') NOT NULL,
    [ChangedDate]    DATETIME2 (3) CONSTRAINT [DF_PLPreset_ChangedDate] DEFAULT ('01/01/0001') NOT NULL,
    CONSTRAINT [PLPreset_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLPreset_INDEX02]
    ON [dbo].[PLPreset]([DisplayName] ASC, [PLDescription] ASC, [ID] ASC);

