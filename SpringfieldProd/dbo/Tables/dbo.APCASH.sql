﻿CREATE TABLE [dbo].[APCASH] (
    [Recnum]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [COMPANY_#]       VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DIVISION_#]      VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [CHECK_NO]        DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [LINE_#]          DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [COMP_#]          VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DIV_ACC_NUM]     VARCHAR (7)     DEFAULT (' ') NOT NULL,
    [AMOUNT]          DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [PO_#]            DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [PO_LINE_#]       DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [COST_CLOSE]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [QTY]             DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [DESCRIPTION]     VARCHAR (25)    DEFAULT (' ') NOT NULL,
    [VENDOR_NAME]     VARCHAR (30)    DEFAULT (' ') NOT NULL,
    [ID]              DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [GLXREF_ID]       DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [APMANCHK_ID]     DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [APCOMPAN_ID]     DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [POLINE_PRICE_EA] DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [APCASH_INDEX01] PRIMARY KEY CLUSTERED ([COMPANY_#] ASC, [DIVISION_#] ASC, [CHECK_NO] ASC, [LINE_#] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_APCASH_APMANCHK_ID] FOREIGN KEY ([APMANCHK_ID]) REFERENCES [dbo].[APMANCHK] ([ID]),
    CONSTRAINT [FK_APCASH_GLXREF_ID] FOREIGN KEY ([GLXREF_ID]) REFERENCES [dbo].[GLXREF] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APCASH_INDEX00]
    ON [dbo].[APCASH]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APCASH_INDEX02]
    ON [dbo].[APCASH]([ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APCASH_INDEX03]
    ON [dbo].[APCASH]([GLXREF_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APCASH_INDEX04]
    ON [dbo].[APCASH]([APMANCHK_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APCASH_INDEX05]
    ON [dbo].[APCASH]([APCOMPAN_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

