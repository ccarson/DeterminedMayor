﻿CREATE TABLE [dbo].[WOMACHIN] (
    [Recnum] BIGINT       IDENTITY (1, 1) NOT NULL,
    [NUM]    VARCHAR (3)  DEFAULT (' ') NOT NULL,
    [NAME]   VARCHAR (20) DEFAULT (' ') NOT NULL,
    [TYPE]   VARCHAR (20) DEFAULT (' ') NOT NULL,
    CONSTRAINT [WOMACHIN_INDEX01] PRIMARY KEY CLUSTERED ([NUM] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [WOMACHIN_INDEX00]
    ON [dbo].[WOMACHIN]([Recnum] ASC) WITH (FILLFACTOR = 70);

