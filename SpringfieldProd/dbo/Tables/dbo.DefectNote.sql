CREATE TABLE [dbo].[DefectNote] (
    [ID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [DefectID]    BIGINT         NOT NULL,
    [Code]        CHAR (3)       CONSTRAINT [DF_DefectNote_Code] DEFAULT ('') NOT NULL,
    [NoteType]    CHAR (1)       CONSTRAINT [DF_DefectNote_NoteType] DEFAULT ('') NOT NULL,
    [Note]        VARCHAR (1024) CONSTRAINT [DF_DefectNote_Note] DEFAULT ('') NOT NULL,
    [CreatedBy]   CHAR (4)       CONSTRAINT [DF_DefectNote_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate] DATETIME2 (3)  CONSTRAINT [DF_DefectNote_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [DefectNote_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_DefectNote_Defect] FOREIGN KEY ([DefectID]) REFERENCES [dbo].[Defect] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [DefectNote_INDEX02]
    ON [dbo].[DefectNote]([DefectID] ASC, [ID] ASC);

