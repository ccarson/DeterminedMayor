﻿CREATE TABLE [dbo].[Country] (
    [Recnum] BIGINT       IDENTITY (1, 1) NOT NULL,
    [CODE]   VARCHAR (2)  DEFAULT (' ') NOT NULL,
    [NAME]   VARCHAR (50) DEFAULT (' ') NOT NULL,
    CONSTRAINT [Country_INDEX01] PRIMARY KEY CLUSTERED ([CODE] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Country_INDEX00]
    ON [dbo].[Country]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Country_INDEX02]
    ON [dbo].[Country]([NAME] ASC, [CODE] ASC) WITH (FILLFACTOR = 70);

