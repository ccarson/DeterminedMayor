CREATE TABLE [dbo].[RprTech] (
    [Recnum]   BIGINT         IDENTITY (1, 1) NOT NULL,
    [Initials] VARCHAR (3)    DEFAULT (' ') NOT NULL,
    [Name]     VARCHAR (40)   DEFAULT (' ') NOT NULL,
    [Position] VARCHAR (50)   DEFAULT (' ') NOT NULL,
    [ID_Key]   VARCHAR (14)   DEFAULT (' ') NOT NULL,
    [Rate]     NUMERIC (6, 2) NULL,
    CONSTRAINT [RprTech_INDEX01] PRIMARY KEY CLUSTERED ([Initials] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RprTech_INDEX00]
    ON [dbo].[RprTech]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RprTech_INDEX02]
    ON [dbo].[RprTech]([Position] ASC, [Initials] ASC) WITH (FILLFACTOR = 70);

