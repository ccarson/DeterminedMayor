CREATE TABLE [dbo].[RMAItemIssue] (
    [ID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [ItemID]      BIGINT         NOT NULL,
    [Code]        CHAR (10)      NULL,
    [Issue]       VARCHAR (255)  NULL,
    [CreatedBy]   CHAR (4)       NULL,
    [CreatedDate] DATETIME2 (0)  NULL,
    [Note]        VARCHAR (2048) NULL,
    CONSTRAINT [RMAItemIssue_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RMAItemIssue_INDEX02]
    ON [dbo].[RMAItemIssue]([ItemID] ASC, [ID] ASC) WITH (FILLFACTOR = 100);

