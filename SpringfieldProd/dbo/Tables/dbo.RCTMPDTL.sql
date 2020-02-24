﻿CREATE TABLE [dbo].[RCTMPDTL] (
    [Recnum]         BIGINT       IDENTITY (1, 1) NOT NULL,
    [TICKET]         DECIMAL (6)  DEFAULT ((0)) NOT NULL,
    [LINE]           DECIMAL (4)  DEFAULT ((0)) NOT NULL,
    [REFERENCE_LINE] DECIMAL (4)  DEFAULT ((0)) NOT NULL,
    [DATE_RECV]      DATETIME     DEFAULT ('01/01/1753') NOT NULL,
    [SPRNUM]         VARCHAR (20) DEFAULT (' ') NOT NULL,
    [DESC]           VARCHAR (30) DEFAULT (' ') NOT NULL,
    [QTY]            DECIMAL (8)  DEFAULT ((0)) NOT NULL,
    [RAWFIN]         VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [CLOSE_FLAG]     VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [INSPECT_FLAG]   VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [DELIV_DATE]     DATETIME     DEFAULT ('01/01/1753') NOT NULL,
    [ReceiveFlag]    CHAR (1)     DEFAULT ('N') NOT NULL,
    CONSTRAINT [RCTMPDTL_INDEX01] PRIMARY KEY CLUSTERED ([TICKET] ASC, [LINE] ASC),
    CONSTRAINT [FK_RCTMPDTL_TICKET] FOREIGN KEY ([TICKET]) REFERENCES [dbo].[RCHEADER] ([TICKET])
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [RCTMPDTL_INDEX00]
    ON [dbo].[RCTMPDTL]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RCTMPDTL_INDEX02]
    ON [dbo].[RCTMPDTL]([SPRNUM] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RCTMPDTL_INDEX03]
    ON [dbo].[RCTMPDTL]([TICKET] ASC, [REFERENCE_LINE] ASC);



