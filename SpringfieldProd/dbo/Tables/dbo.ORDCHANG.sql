﻿CREATE TABLE [dbo].[ORDCHANG] (
    [Recnum]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [ORDNUM]       DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [SPRNUM]       VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [CHANGE_#]     DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [TRANS_CODE]   VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [OLD_QUAN]     DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [OLD_QUANS]    DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [OLD_QUANSHIP] DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [OLD_UPRICE]   DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [OLD_TPRICE]   DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [OLD_CUSTID]   VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [DESC]         VARCHAR (38)    DEFAULT (' ') NOT NULL,
    [REP]          VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [DATE]         DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [LineNum]      SMALLINT        DEFAULT ((0)) NULL,
    CONSTRAINT [ORDCHANG_INDEX01] PRIMARY KEY CLUSTERED ([ORDNUM] ASC, [SPRNUM] ASC, [CHANGE_#] ASC) WITH (FILLFACTOR = 70)
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [ORDCHANG_INDEX00]
    ON [dbo].[ORDCHANG]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO



GO
CREATE UNIQUE NONCLUSTERED INDEX [ORDCHANG_INDEX03]
    ON [dbo].[ORDCHANG]([DATE] ASC, [SPRNUM] ASC, [ORDNUM] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ORDCHANG_INDEX04]
    ON [dbo].[ORDCHANG]([SPRNUM] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [ORDCHANG_INDEX02]
    ON [dbo].[ORDCHANG]([ORDNUM] ASC, [DATE] ASC, [CHANGE_#] ASC);

