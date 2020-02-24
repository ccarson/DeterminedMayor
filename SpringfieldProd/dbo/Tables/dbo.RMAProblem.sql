CREATE TABLE [dbo].[RMAProblem] (
    [ID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [ItemID]      BIGINT         DEFAULT ((0)) NOT NULL,
    [Code]        CHAR (10)      NOT NULL,
    [Problem]     VARCHAR (255)  NULL,
    [CreatedBy]   CHAR (4)       NULL,
    [CreatedDate] DATETIME2 (0)  NULL,
    [Note]        VARCHAR (2048) NULL,
    CONSTRAINT [RMAProblem_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RMAProblem_INDEX02]
    ON [dbo].[RMAProblem]([ItemID] ASC, [ID] ASC) WITH (FILLFACTOR = 100);

