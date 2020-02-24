CREATE TABLE [dbo].[AvalaraResend] (
    [ID]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [OrderNum]    DECIMAL (10, 2) NOT NULL,
    [API]         VARCHAR (255)   NULL,
    [RequestBody] VARCHAR (8000)  NULL,
    [AvaStatus]   CHAR (20)       NOT NULL,
    [CreatedBy]   CHAR (4)        NULL,
    [CreatedDate] DATETIME2 (3)   NULL,
    [ChangedBy]   CHAR (4)        NULL,
    [ChangedDate] DATETIME2 (3)   NULL,
    CONSTRAINT [AvalaraResend_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AvalaraResend_INDEX02]
    ON [dbo].[AvalaraResend]([OrderNum] ASC, [AvaStatus] ASC, [ID] ASC) WITH (FILLFACTOR = 100);

