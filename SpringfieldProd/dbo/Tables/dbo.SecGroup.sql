CREATE TABLE [dbo].[SecGroup] (
    [Recnum]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [GroupName]  VARCHAR (30)  DEFAULT (' ') NOT NULL,
    [ViewName]   VARCHAR (100) DEFAULT (' ') NOT NULL,
    [Rights]     DECIMAL (2)   DEFAULT ((0)) NOT NULL,
    [ActivateIt] VARCHAR (50)  DEFAULT (' ') NOT NULL,
    [Note]       VARCHAR (MAX) NULL,
    CONSTRAINT [SecGroup_INDEX01] PRIMARY KEY CLUSTERED ([GroupName] ASC, [ViewName] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecGroup_INDEX00]
    ON [dbo].[SecGroup]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecGroup_INDEX02]
    ON [dbo].[SecGroup]([ViewName] ASC, [GroupName] ASC) WITH (FILLFACTOR = 70);

