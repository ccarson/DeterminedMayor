CREATE TABLE [dbo].[SecLogin] (
    [Recnum]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [ID_Key]          VARCHAR (14)  DEFAULT (' ') NOT NULL,
    [Login]           VARCHAR (10)  DEFAULT (' ') NOT NULL,
    [Password]        VARCHAR (20)  DEFAULT (' ') NOT NULL,
    [Name]            VARCHAR (40)  DEFAULT (' ') NOT NULL,
    [Group1]          VARCHAR (30)  DEFAULT (' ') NOT NULL,
    [Group2]          VARCHAR (30)  DEFAULT (' ') NOT NULL,
    [Group3]          VARCHAR (30)  DEFAULT (' ') NOT NULL,
    [Group4]          VARCHAR (30)  DEFAULT (' ') NOT NULL,
    [Group5]          VARCHAR (30)  DEFAULT (' ') NOT NULL,
    [IT_Developer]    VARCHAR (1)   DEFAULT (' ') NOT NULL,
    [PHONE]           VARCHAR (14)  DEFAULT (' ') NOT NULL,
    [EXT]             VARCHAR (4)   DEFAULT (' ') NOT NULL,
    [EMailAddr]       VARCHAR (120) DEFAULT (' ') NOT NULL,
    [Initials]        VARCHAR (5)   DEFAULT (' ') NOT NULL,
    [ChangePassword]  VARCHAR (1)   DEFAULT (' ') NOT NULL,
    [PwdChangedDate]  DATETIME      DEFAULT ('01/01/1753') NOT NULL,
    [PLPrinter]       VARCHAR (1)   NULL,
    [VacationView]    VARCHAR (20)  NULL,
    [WindowsUserName] VARCHAR (50)  DEFAULT (' ') NOT NULL,
    [Active]          VARCHAR (1)   NULL,
    CONSTRAINT [SecLogin_INDEX00] PRIMARY KEY CLUSTERED ([Recnum] ASC)
);




GO



GO
CREATE UNIQUE NONCLUSTERED INDEX [SecLogin_INDEX02]
    ON [dbo].[SecLogin]([Login] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecLogin_INDEX03]
    ON [dbo].[SecLogin]([Name] ASC, [Login] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecLogin_INDEX04]
    ON [dbo].[SecLogin]([Initials] ASC, [Name] ASC, [Login] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecLogin_INDEX05]
    ON [dbo].[SecLogin]([Initials] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecLogin_INDEX06]
    ON [dbo].[SecLogin]([WindowsUserName] ASC, [Login] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecLogin_INDEX01]
    ON [dbo].[SecLogin]([ID_Key] ASC, [Recnum] ASC);

