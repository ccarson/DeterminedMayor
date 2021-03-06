﻿CREATE TABLE [dbo].[WODEPART] (
    [Recnum]      BIGINT       IDENTITY (1, 1) NOT NULL,
    [DEPARTMENT]  VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [DESCRIPTION] VARCHAR (25) DEFAULT (' ') NOT NULL,
    [SCR_FLAG]    VARCHAR (1)  DEFAULT (' ') NOT NULL,
    CONSTRAINT [WODEPART_INDEX01] PRIMARY KEY CLUSTERED ([DEPARTMENT] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [WODEPART_INDEX00]
    ON [dbo].[WODEPART]([Recnum] ASC) WITH (FILLFACTOR = 70);

