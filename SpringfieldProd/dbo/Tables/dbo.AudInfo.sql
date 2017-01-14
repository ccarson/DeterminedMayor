CREATE TABLE [dbo].[AudInfo] (
    [Recnum]       BIGINT       IDENTITY (1, 1) NOT NULL,
    [ID]           DECIMAL (8)  DEFAULT ((0)) NOT NULL,
    [ViewName]     VARCHAR (30) DEFAULT (' ') NOT NULL,
    [TableName]    VARCHAR (31) DEFAULT (' ') NULL,
    [User]         VARCHAR (10) DEFAULT (' ') NOT NULL,
    [WorkStation]  VARCHAR (20) DEFAULT (' ') NOT NULL,
    [CDate]        DATETIME     DEFAULT ('01/01/1753') NOT NULL,
    [CTime]        VARCHAR (8)  DEFAULT (' ') NOT NULL,
    [RecordNumber] DECIMAL (8)  DEFAULT ((0)) NOT NULL,
    [Deleted]      VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [RecordRowID]  VARCHAR (30) NULL,
    CONSTRAINT [AudInfo_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [AudInfo_INDEX00]
    ON [dbo].[AudInfo]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AudInfo_INDEX02]
    ON [dbo].[AudInfo]([TableName] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AudInfo_INDEX03]
    ON [dbo].[AudInfo]([User] ASC, [CDate] ASC, [CTime] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AudInfo_INDEX04]
    ON [dbo].[AudInfo]([ViewName] ASC, [User] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AudInfo_INDEX05]
    ON [dbo].[AudInfo]([CDate] ASC, [CTime] ASC, [TableName] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

