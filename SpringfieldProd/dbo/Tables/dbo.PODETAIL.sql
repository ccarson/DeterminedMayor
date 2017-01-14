﻿CREATE TABLE [dbo].[PODETAIL] (
    [Recnum]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [VENDOR_ID]       VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [PO_#]            DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [UNUSED]          VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [LINE_#]          DECIMAL (8)     NOT NULL,
    [SPRNUM]          VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [QTY_ORD]         DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [QTY_RECD]        DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [QTY_RECD_TD]     DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [DATE_RECD]       DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [DELIV_DATE]      DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [PRICE_EA]        DECIMAL (10, 4) DEFAULT ((0)) NOT NULL,
    [EXTENSION]       DECIMAL (12, 4) DEFAULT ((0)) NOT NULL,
    [CLOSED_FLAG]     VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [COMMENT_FLAG]    VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [UPDATED_OO_FLAG] VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [UPDATED_OH_FLAG] VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [NEW_FLAG]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [DESCRIPTION]     VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [UOM_CODE]        VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [PRINT_PRICE]     VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [QTY_UPDATED]     DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [COST_CLOSE]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [RELEASE_#]       DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [RAWFIN]          VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [QTY_INVOICED]    DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [INVOICED_AMT]    DECIMAL (12, 4) DEFAULT ((0)) NOT NULL,
    [PRINT_DRAW]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [SAPartNum]       VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [Notes]           VARCHAR (256)   NULL,
    [VendPartNum]     VARCHAR (20)    NULL,
    CONSTRAINT [PODETAIL_INDEX01] PRIMARY KEY CLUSTERED ([VENDOR_ID] ASC, [PO_#] ASC, [LINE_#] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PODETAIL_INDEX00]
    ON [dbo].[PODETAIL]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PODETAIL_INDEX02]
    ON [dbo].[PODETAIL]([SPRNUM] ASC, [VENDOR_ID] ASC, [PO_#] ASC, [LINE_#] ASC, [Recnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PODETAIL_INDEX03]
    ON [dbo].[PODETAIL]([VENDOR_ID] ASC, [SPRNUM] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PODETAIL_INDEX04]
    ON [dbo].[PODETAIL]([VENDOR_ID] ASC, [PO_#] ASC, [SPRNUM] ASC, [Recnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PODETAIL_INDEX05]
    ON [dbo].[PODETAIL]([PO_#] ASC, [LINE_#] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PODETAIL_INDEX06]
    ON [dbo].[PODETAIL]([SPRNUM] ASC, [PO_#] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);

