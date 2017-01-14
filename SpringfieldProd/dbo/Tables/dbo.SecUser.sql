CREATE TABLE [dbo].[SecUser] (
    [Recnum]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [Login]      VARCHAR (10)  DEFAULT (' ') NOT NULL,
    [ViewName]   VARCHAR (100) DEFAULT (' ') NOT NULL,
    [Rights]     DECIMAL (2)   DEFAULT ((0)) NOT NULL,
    [ShowView]   VARCHAR (1)   DEFAULT (' ') NOT NULL,
    [ActivateIt] VARCHAR (50)  DEFAULT (' ') NOT NULL,
    [Note]       VARCHAR (MAX) NULL,
    CONSTRAINT [SecUser_INDEX01] PRIMARY KEY CLUSTERED ([Login] ASC, [ViewName] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecUser_INDEX00]
    ON [dbo].[SecUser]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecUser_INDEX02]
    ON [dbo].[SecUser]([ViewName] ASC, [Login] ASC) WITH (FILLFACTOR = 70);

