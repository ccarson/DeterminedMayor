﻿CREATE TABLE [dbo].[APAUTOVO] (
    [Recnum]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [COMPANY_#]    VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DIVISION_#]   VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [VENDOR_#]     VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [INVOICE_#]    VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [VOUCH_FLAG]   VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [DUE_DATE]     DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [LAST_PAID]    DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [DEBIT_AMOUNT] DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [DISC_DATE]    DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [DISC_AMOUNT]  DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [DISC_PERCENT] DECIMAL (8, 4)  DEFAULT ((0)) NOT NULL,
    [DISC_FLAG]    VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [PRINT_FLAG]   VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [SUBNUM]       DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [ID]           DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [APVENDOR_ID]  DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [APCOMPAN_ID]  DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [LAST_LINE#]   DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [DOLLDIST]     DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [APAUTOVO_INDEX01] PRIMARY KEY CLUSTERED ([COMPANY_#] ASC, [DIVISION_#] ASC, [VENDOR_#] ASC, [INVOICE_#] ASC, [VOUCH_FLAG] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_APAUTOVO_APVENDOR_ID] FOREIGN KEY ([APVENDOR_ID]) REFERENCES [dbo].[APVENDOR] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APAUTOVO_INDEX00]
    ON [dbo].[APAUTOVO]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APAUTOVO_INDEX02]
    ON [dbo].[APAUTOVO]([ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APAUTOVO_INDEX03]
    ON [dbo].[APAUTOVO]([APVENDOR_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APAUTOVO_INDEX04]
    ON [dbo].[APAUTOVO]([APCOMPAN_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

