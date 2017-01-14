CREATE TABLE [dbo].[RecallUpdate] (
    [RecallName] VARCHAR (20)  NOT NULL,
    [UpdateDate] DATETIME2 (3) NOT NULL,
    [Text]       VARCHAR (MAX) NULL,
    [Publish]    VARCHAR (1)   NOT NULL,
    CONSTRAINT [FK_RecallUpdate_RecallName] FOREIGN KEY ([RecallName]) REFERENCES [dbo].[Recall] ([RecallName])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallUpdate_INDEX01]
    ON [dbo].[RecallUpdate]([RecallName] ASC, [UpdateDate] ASC) WITH (FILLFACTOR = 70);

