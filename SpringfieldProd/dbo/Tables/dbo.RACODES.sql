﻿CREATE TABLE [dbo].[RACODES] (
    [Recnum]      BIGINT       IDENTITY (1, 1) NOT NULL,
    [CODE]        DECIMAL (6)  DEFAULT ((0)) NOT NULL,
    [DESCRIPTION] VARCHAR (35) DEFAULT (' ') NOT NULL,
    [DEPARTMENT]  VARCHAR (3)  DEFAULT (' ') NOT NULL,
    [DI_FLAG]     VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [DIVID]       VARCHAR (4)  DEFAULT (' ') NOT NULL,
    [ACCOUNT_ID]  VARCHAR (5)  DEFAULT (' ') NOT NULL,
    CONSTRAINT [RACODES_INDEX01] PRIMARY KEY CLUSTERED ([CODE] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RACODES_INDEX00]
    ON [dbo].[RACODES]([Recnum] ASC) WITH (FILLFACTOR = 70);

