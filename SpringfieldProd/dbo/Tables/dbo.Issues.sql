CREATE TABLE [dbo].[Issues] (
    [Recnum]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [ID]              DECIMAL (6)   NOT NULL,
    [CreateDate]      DATETIME      NOT NULL,
    [Title]           VARCHAR (50)  NOT NULL,
    [Attachment]      VARCHAR (100) NOT NULL,
    [Text]            VARCHAR (MAX) NULL,
    [User]            VARCHAR (10)  NOT NULL,
    [UserPriority]    DECIMAL (2)   NOT NULL,
    [Verified]        VARCHAR (1)   NOT NULL,
    [Priority]        DECIMAL (2)   NOT NULL,
    [StartWork]       VARCHAR (1)   NOT NULL,
    [StartWorkDate]   DATETIME      NOT NULL,
    [Fixed]           VARCHAR (1)   NOT NULL,
    [FixedDate]       DATETIME      NOT NULL,
    [NotFixedDesc]    VARCHAR (MAX) NULL,
    [NewID]           DECIMAL (8)   NOT NULL,
    [OldID]           DECIMAL (8)   NOT NULL,
    [ViewName]        VARCHAR (60)  NOT NULL,
    [Time]            VARCHAR (24)  NOT NULL,
    [AssignedTo]      VARCHAR (10)  NOT NULL,
    [LastChangedDate] DATETIME      NULL,
    [LastChangedBy]   VARCHAR (10)  NULL,
    CONSTRAINT [Issues_INDEX00] PRIMARY KEY CLUSTERED ([Recnum] ASC)
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [Issues_INDEX01]
    ON [dbo].[Issues]([ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Issues_INDEX02]
    ON [dbo].[Issues]([CreateDate] ASC, [Priority] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Issues_INDEX03]
    ON [dbo].[Issues]([Priority] ASC, [CreateDate] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Issues_INDEX04]
    ON [dbo].[Issues]([User] ASC, [CreateDate] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Issues_INDEX05]
    ON [dbo].[Issues]([Verified] ASC, [CreateDate] ASC, [UserPriority] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Issues_INDEX06]
    ON [dbo].[Issues]([AssignedTo] ASC, [CreateDate] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Issues_INDEX07]
    ON [dbo].[Issues]([ViewName] ASC, [Title] ASC, [User] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

