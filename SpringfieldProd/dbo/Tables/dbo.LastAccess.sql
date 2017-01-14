CREATE TABLE [dbo].[LastAccess] (
    [ID]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [ViewName]    VARCHAR (100) CONSTRAINT [DF__LastAcces__ViewN__6F58C910] DEFAULT (' ') NOT NULL,
    [ViewType]    CHAR (1)      CONSTRAINT [DF__LastAcces__ViewT__704CED49] DEFAULT (' ') NOT NULL,
    [UserName]    VARCHAR (10)  CONSTRAINT [DF__LastAcces__UserN__71411182] DEFAULT (' ') NOT NULL,
    [RightsLevel] TINYINT       CONSTRAINT [DF_LastAccess_RightsLevel] DEFAULT ((0)) NOT NULL,
    [AccessDate]  DATETIME      CONSTRAINT [DF_LastAccess_AccessDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [LastAccess_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [LastAccess_INDEX02]
    ON [dbo].[LastAccess]([ViewName] ASC, [UserName] ASC, [AccessDate] DESC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [LastAccess_INDEX03]
    ON [dbo].[LastAccess]([UserName] ASC, [ViewName] ASC, [AccessDate] DESC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [LastAccess_INDEX04]
    ON [dbo].[LastAccess]([AccessDate] DESC, [ViewName] ASC, [UserName] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [LastAccess_INDEX05]
    ON [dbo].[LastAccess]([ViewType] ASC, [ViewName] ASC, [AccessDate] DESC, [UserName] ASC);

