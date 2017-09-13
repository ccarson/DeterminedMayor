﻿CREATE TABLE [dbo].[FEDCODE] (
    [Recnum]      BIGINT       IDENTITY (1, 1) NOT NULL,
    [GROUP_CODE]  VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [DESCRIPTION] VARCHAR (30) DEFAULT (' ') NOT NULL,
    CONSTRAINT [FEDCODE_INDEX01] PRIMARY KEY CLUSTERED ([GROUP_CODE] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FEDCODE_INDEX00]
    ON [dbo].[FEDCODE]([Recnum] ASC) WITH (FILLFACTOR = 70);
