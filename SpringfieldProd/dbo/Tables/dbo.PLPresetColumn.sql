CREATE TABLE [dbo].[PLPresetColumn] (
    [ID]           BIGINT        IDENTITY (1, 1) NOT NULL,
    [PLPresetID]   BIGINT        NOT NULL,
    [ColumnNum]    INT           CONSTRAINT [DF_PLPresetColumn_ColumnNum] DEFAULT ((0)) NOT NULL,
    [PriceType]    VARCHAR (20)  CONSTRAINT [DF_PLPresetColumn_NoteType] DEFAULT ('') NOT NULL,
    [ColumnHeader] VARCHAR (50)  CONSTRAINT [DF_PLPresetColumn_ColumnHeader] DEFAULT ('') NOT NULL,
    [CreatedBy]    CHAR (4)      CONSTRAINT [DF_PLPresetColumn_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate]  DATETIME2 (3) CONSTRAINT [DF_PLPresetColumn_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [ChangedBy]    CHAR (4)      CONSTRAINT [DF_PLPresetColumn_ChangedBy] DEFAULT ('') NOT NULL,
    [ChangedDate]  DATETIME2 (3) CONSTRAINT [DF_PLPresetColumn_ChangedDate] DEFAULT ('01/01/0001') NOT NULL,
    CONSTRAINT [PLPresetColumn_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_PLPresetColumn_PLPreset] FOREIGN KEY ([PLPresetID]) REFERENCES [dbo].[PLPreset] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLPresetColumn_INDEX02]
    ON [dbo].[PLPresetColumn]([PLPresetID] ASC, [ColumnNum] ASC);

