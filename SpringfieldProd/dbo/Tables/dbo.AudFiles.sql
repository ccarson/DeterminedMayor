﻿CREATE TABLE [dbo].[AudFiles] (
    [Recnum] BIGINT        IDENTITY (1, 1) NOT NULL,
    [Table]  VARCHAR (31)  DEFAULT (' ') NOT NULL,
    [Desc]   VARCHAR (30)  DEFAULT (' ') NOT NULL,
    [Audit]  VARCHAR (1)   DEFAULT (' ') NOT NULL,
    [Notes]  VARCHAR (MAX) NULL,
    CONSTRAINT [AudFiles_INDEX01] PRIMARY KEY CLUSTERED ([Table] ASC)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [AudFiles_INDEX00]
    ON [dbo].[AudFiles]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [AudFiles_INDEX02]
    ON [dbo].[AudFiles]([Desc] ASC) WITH (FILLFACTOR = 70);

