CREATE TABLE [dbo].[PONote] (
    [ID]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [PONumber]       DECIMAL (6)    NOT NULL,
    [POLine]         DECIMAL (8)    CONSTRAINT [DF_PONote_POLine] DEFAULT ((0)) NOT NULL,
    [Note]           VARCHAR (1024) NOT NULL,
    [CreatedBy]      CHAR (4)       NOT NULL,
    [CreatedDate]    DATETIME2 (3)  CONSTRAINT [DF_PONote_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [PrintIt]        CHAR (1)       CONSTRAINT [DF_PONote_Print] DEFAULT ('N') NOT NULL,
    [DisplayLineNum] INT            CONSTRAINT [DF_PONote_DisplayLineNum] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PONote_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PONote_INDEX03]
    ON [dbo].[PONote]([PONumber] ASC, [DisplayLineNum] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PONote_INDEX02]
    ON [dbo].[PONote]([PONumber] ASC, [POLine] ASC, [ID] ASC);

