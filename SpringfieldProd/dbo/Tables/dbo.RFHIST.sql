﻿CREATE TABLE [dbo].[RFHIST] (
    [Recnum]           BIGINT          IDENTITY (1, 1) NOT NULL,
    [ORDNUM]           DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [AMOUNT]           DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [CHECKNUM]         DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [CHKDTE]           DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [CASH_ACCOUNT]     VARCHAR (9)     DEFAULT (' ') NOT NULL,
    [REFUND_ACCOUNT]   VARCHAR (9)     DEFAULT (' ') NOT NULL,
    [BATCH_#]          DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [CUSTID]           VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [CRMEMO_#]         DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [PAYMENT_#]        DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [CASH_REFUND_FLG]  VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [DEP_DATE]         DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [Voided]           VARCHAR (1)     NULL,
    [Signature1]       VARCHAR (10)    DEFAULT ('') NOT NULL,
    [Signature2]       VARCHAR (10)    DEFAULT ('') NOT NULL,
    [InvoiceNum]       DECIMAL (10, 2) NULL,
    [CHECK_CREATED_BY] VARCHAR (10)    DEFAULT ('') NOT NULL,
    CONSTRAINT [RFHIST_INDEX01] PRIMARY KEY CLUSTERED ([CHECKNUM] ASC) WITH (FILLFACTOR = 70)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [RFHIST_INDEX00]
    ON [dbo].[RFHIST]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RFHIST_INDEX02]
    ON [dbo].[RFHIST]([BATCH_#] ASC, [ORDNUM] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RFHIST_INDEX03]
    ON [dbo].[RFHIST]([ORDNUM] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RFHIST_INDEX04]
    ON [dbo].[RFHIST]([CUSTID] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RFHIST_INDEX05]
    ON [dbo].[RFHIST]([CRMEMO_#] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RFHIST_INDEX06]
    ON [dbo].[RFHIST]([DEP_DATE] ASC, [ORDNUM] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RFHIST_INDEX07]
    ON [dbo].[RFHIST]([CHKDTE] ASC, [CHECKNUM] ASC) WITH (FILLFACTOR = 70);

