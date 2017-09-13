﻿CREATE TABLE [dbo].[GLTRANS] (
    [Recnum]         BIGINT          IDENTITY (1, 1) NOT NULL,
    [COMPANY_#]      VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DIVISION_#]     VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DEPARTMENT_#]   VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [ACCOUNT_#]      VARCHAR (3)     DEFAULT (' ') NOT NULL,
    [YEAR_#]         DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [BATCH_#]        DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [LINE_#]         DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [BATCH_TYPE]     VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [SOURCE]         VARCHAR (3)     DEFAULT (' ') NOT NULL,
    [TRANS_DATE]     DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [DEBIT_AMOUNT]   DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDIT_AMOUNT]  DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [REFERENCE_DESC] VARCHAR (45)    DEFAULT (' ') NOT NULL,
    [POSTED_FLAG]    VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [PERIOD_#]       DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [ID]             DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [GLMASTER_ID]    DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [GLBATCH_ID]     DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [DIVACCT]        VARCHAR (5)     DEFAULT (' ') NOT NULL,
    CONSTRAINT [GLTRANS_INDEX01] PRIMARY KEY CLUSTERED ([COMPANY_#] ASC, [DIVISION_#] ASC, [DEPARTMENT_#] ASC, [ACCOUNT_#] ASC, [PERIOD_#] ASC, [YEAR_#] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_GLTRANS_GLBATCH_ID] FOREIGN KEY ([GLBATCH_ID]) REFERENCES [dbo].[GLBATCH] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLTRANS_INDEX00]
    ON [dbo].[GLTRANS]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLTRANS_INDEX02]
    ON [dbo].[GLTRANS]([COMPANY_#] ASC, [DIVISION_#] ASC, [YEAR_#] ASC, [BATCH_#] ASC, [LINE_#] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLTRANS_INDEX03]
    ON [dbo].[GLTRANS]([COMPANY_#] ASC, [DIVISION_#] ASC, [DEPARTMENT_#] ASC, [ACCOUNT_#] ASC, [BATCH_#] ASC, [LINE_#] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLTRANS_INDEX04]
    ON [dbo].[GLTRANS]([COMPANY_#] ASC, [YEAR_#] ASC, [BATCH_#] ASC, [LINE_#] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLTRANS_INDEX05]
    ON [dbo].[GLTRANS]([ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLTRANS_INDEX06]
    ON [dbo].[GLTRANS]([GLMASTER_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLTRANS_INDEX07]
    ON [dbo].[GLTRANS]([GLBATCH_ID] ASC, [LINE_#] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLTRANS_INDEX08]
    ON [dbo].[GLTRANS]([COMPANY_#] ASC, [YEAR_#] ASC, [PERIOD_#] ASC, [GLMASTER_ID] ASC, [POSTED_FLAG] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLTRANS_INDEX09]
    ON [dbo].[GLTRANS]([YEAR_#] ASC, [PERIOD_#] ASC, [DIVACCT] ASC, [ID] ASC) WITH (FILLFACTOR = 70);
