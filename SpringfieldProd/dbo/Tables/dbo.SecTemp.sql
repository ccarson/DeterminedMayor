CREATE TABLE [dbo].[SecTemp] (
    [Recnum]       BIGINT        IDENTITY (1, 1) NOT NULL,
    [UserID]       VARCHAR (10)  DEFAULT (' ') NOT NULL,
    [User]         VARCHAR (10)  DEFAULT (' ') NOT NULL,
    [ViewName]     VARCHAR (100) DEFAULT (' ') NOT NULL,
    [Desc]         VARCHAR (MAX) NULL,
    [Rights]       VARCHAR (20)  DEFAULT (' ') NOT NULL,
    [FromWhere]    VARCHAR (30)  DEFAULT (' ') NOT NULL,
    [iRightsLevel] DECIMAL (2)   DEFAULT ((0)) NOT NULL,
    CONSTRAINT [SecTemp_INDEX01] PRIMARY KEY CLUSTERED ([UserID] ASC, [User] ASC, [ViewName] ASC, [FromWhere] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecTemp_INDEX00]
    ON [dbo].[SecTemp]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecTemp_INDEX02]
    ON [dbo].[SecTemp]([UserID] ASC, [ViewName] ASC, [FromWhere] ASC, [User] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecTemp_INDEX03]
    ON [dbo].[SecTemp]([UserID] ASC, [FromWhere] ASC, [User] ASC, [ViewName] ASC) WITH (FILLFACTOR = 70);

