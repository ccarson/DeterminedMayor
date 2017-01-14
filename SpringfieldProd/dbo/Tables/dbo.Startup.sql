CREATE TABLE [dbo].[Startup] (
    [ProgramName] VARCHAR (100) NOT NULL,
    [ExeName]     VARCHAR (100) NOT NULL,
    [BuildNumber] INT           NULL,
    CONSTRAINT [Startup_INDEX01] PRIMARY KEY CLUSTERED ([ProgramName] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE NONCLUSTERED INDEX [Startup_INDEX02]
    ON [dbo].[Startup]([ExeName] ASC) WITH (FILLFACTOR = 70);

