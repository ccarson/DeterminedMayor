CREATE TABLE [dbo].[QARejectionNote] (
    [ID]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [QARejectionID] BIGINT         NOT NULL,
    [Note]          VARCHAR (1024) NOT NULL,
    [CreatedBy]     CHAR (4)       NOT NULL,
    [CreatedDate]   DATETIME2 (3)  CONSTRAINT [DF_QARejectionNote_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [PrintIt]       CHAR (1)       CONSTRAINT [DF_QARejectionNote_Print] DEFAULT ('Y') NOT NULL,
    CONSTRAINT [QARejectionNote_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_QARejectionNote_QARejection] FOREIGN KEY ([QARejectionID]) REFERENCES [dbo].[QARejection] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [QARejectionNote_INDEX02]
    ON [dbo].[QARejectionNote]([CreatedBy] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [QARejectionNote_INDEX03]
    ON [dbo].[QARejectionNote]([CreatedDate] ASC, [ID] ASC);

