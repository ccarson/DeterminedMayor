CREATE TABLE [dbo].[EMAIL] (
    [Recnum]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [ID]              DECIMAL (8)   DEFAULT ((0)) NOT NULL,
    [SentBy]          VARCHAR (10)  DEFAULT (' ') NOT NULL,
    [ComposeDate]     DATETIME      DEFAULT ('01/01/1753') NOT NULL,
    [ComposeTime]     VARCHAR (7)   DEFAULT (' ') NOT NULL,
    [SentDate]        DATETIME      DEFAULT ('01/01/1753') NOT NULL,
    [SentTime]        VARCHAR (7)   DEFAULT (' ') NOT NULL,
    [SentOK]          VARCHAR (1)   DEFAULT (' ') NOT NULL,
    [SendError]       VARCHAR (MAX) NULL,
    [SentTo]          VARCHAR (120) DEFAULT (' ') NOT NULL,
    [Subject]         VARCHAR (150) DEFAULT (' ') NOT NULL,
    [Body]            VARCHAR (MAX) NULL,
    [PredefinedEmail] DECIMAL (8)   DEFAULT ((0)) NOT NULL,
    [Attachments]     DECIMAL (2)   DEFAULT ((0)) NOT NULL,
    [CustID]          VARCHAR (20)  DEFAULT (' ') NOT NULL,
    [CC]              VARCHAR (100) DEFAULT (' ') NOT NULL,
    [BC]              VARCHAR (100) DEFAULT (' ') NOT NULL,
    [HighPriority]    VARCHAR (1)   DEFAULT (' ') NOT NULL,
    [SignatureName]   VARCHAR (50)  DEFAULT (' ') NOT NULL,
    [SendAfter]       DATETIME2 (3) NULL,
    [ReplyTo]         VARCHAR (120) NULL,
    [EmailSource]     VARCHAR (10)  CONSTRAINT [DF_Email_EmailSource] DEFAULT ('') NOT NULL,
    [SourceID]        VARCHAR (10)  CONSTRAINT [DF_Email_SourceID] DEFAULT ('') NOT NULL,
    CONSTRAINT [EMAIL_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [EMAIL_INDEX00]
    ON [dbo].[EMAIL]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EMAIL_INDEX02]
    ON [dbo].[EMAIL]([SentBy] ASC, [ComposeDate] ASC, [ComposeTime] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EMAIL_INDEX03]
    ON [dbo].[EMAIL]([SentTo] ASC, [SentDate] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EMAIL_INDEX04]
    ON [dbo].[EMAIL]([SentDate] ASC, [SentTime] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EMAIL_INDEX05]
    ON [dbo].[EMAIL]([SentDate] ASC, [ComposeDate] ASC, [ComposeTime] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EMAIL_INDEX06]
    ON [dbo].[EMAIL]([SentOK] ASC, [ComposeDate] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EMAIL_INDEX07]
    ON [dbo].[EMAIL]([EmailSource] ASC, [SourceID] ASC, [ID] ASC);

