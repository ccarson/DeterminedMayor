﻿CREATE TABLE [dbo].[POTRANS] (
    [Recnum]         BIGINT          IDENTITY (1, 1) NOT NULL,
    [VENDOR_ID]      VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [PO_#]           DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [UNUSED]         VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [LINE_#]         DECIMAL (8)     NOT NULL,
    [TRANS_TYPE]     VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [SPRNUM]         VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [DATE]           DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [QTY_ORD]        DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [QTY_RECD]       DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [PRICE_EA]       DECIMAL (10, 4) DEFAULT ((0)) NOT NULL,
    [PRICE_2]        DECIMAL (10, 4) DEFAULT ((0)) NOT NULL,
    [CLOSED_FLAG]    VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [WHEN_UPDATED]   DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [UOM_CODE]       VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [RECEIVE_TICKET] DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [DisplayLineNum] INT             CONSTRAINT [DF_POTrans_DisplayLineNum] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [POTRANS_INDEX01] PRIMARY KEY CLUSTERED ([SPRNUM] ASC, [DATE] ASC, [VENDOR_ID] ASC, [PO_#] ASC, [LINE_#] ASC, [TRANS_TYPE] ASC, [Recnum] ASC)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [POTRANS_INDEX00]
    ON [dbo].[POTRANS]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POTRANS_INDEX02]
    ON [dbo].[POTRANS]([DATE] ASC, [TRANS_TYPE] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POTRANS_INDEX03]
    ON [dbo].[POTRANS]([VENDOR_ID] ASC, [PO_#] ASC, [LINE_#] ASC, [TRANS_TYPE] ASC, [Recnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POTRANS_INDEX04]
    ON [dbo].[POTRANS]([PO_#] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POTRANS_INDEX05]
    ON [dbo].[POTRANS]([PO_#] ASC, [LINE_#] ASC, [Recnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [POTrans_INDEX06]
    ON [dbo].[POTRANS]([PO_#] ASC, [DisplayLineNum] ASC, [Recnum] ASC);

