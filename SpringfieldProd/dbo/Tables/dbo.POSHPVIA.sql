﻿CREATE TABLE [dbo].[POSHPVIA] (
    [Recnum]      BIGINT       IDENTITY (1, 1) NOT NULL,
    [CODE]        VARCHAR (2)  DEFAULT (' ') NOT NULL,
    [DESCRIPTION] VARCHAR (20) DEFAULT (' ') NOT NULL,
    CONSTRAINT [POSHPVIA_INDEX01] PRIMARY KEY CLUSTERED ([CODE] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POSHPVIA_INDEX00]
    ON [dbo].[POSHPVIA]([Recnum] ASC) WITH (FILLFACTOR = 70);

