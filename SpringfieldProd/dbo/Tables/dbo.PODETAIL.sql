CREATE TABLE [dbo].[PODETAIL] (
    [Recnum]         BIGINT          IDENTITY (1, 1) NOT NULL,
    [VENDOR_ID]      VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [PO_#]           DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [LINE_#]         DECIMAL (8)     NOT NULL,
    [SPRNUM]         VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [QTY_ORD]        DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [QTY_RECD_TD]    DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [DATE_RECD]      DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [DELIV_DATE]     DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [PRICE_EA]       DECIMAL (12, 6) DEFAULT ((0)) NOT NULL,
    [EXTENSION]      DECIMAL (14, 6) DEFAULT ((0)) NOT NULL,
    [CLOSED_FLAG]    VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [COMMENT_FLAG]   VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [DESCRIPTION]    VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [UOM_CODE]       VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [COST_CLOSE]     VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [RAWFIN]         VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [QTY_INVOICED]   DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [INVOICED_AMT]   DECIMAL (14, 6) DEFAULT ((0)) NOT NULL,
    [Notes]          VARCHAR (256)   NULL,
    [WONum]          NUMERIC (6)     CONSTRAINT [DF_PODetail_WONum] DEFAULT ((0)) NOT NULL,
    [WOLine]         NUMERIC (6)     CONSTRAINT [DF_PODetail_WOLine] DEFAULT ((0)) NOT NULL,
    [DisplayLineNum] INT             CONSTRAINT [DF_PODetail_DisplayLineNum] DEFAULT ((0)) NOT NULL,
    [CurrentStatus]  CHAR (1)        CONSTRAINT [DF_PODetail_CurrentStatus] DEFAULT ('O') NOT NULL,
    [VendorPart]     VARCHAR (20)    CONSTRAINT [DF_PODetail_VendorPart] DEFAULT ('') NOT NULL,
    CONSTRAINT [PODETAIL_INDEX01] PRIMARY KEY CLUSTERED ([VENDOR_ID] ASC, [PO_#] ASC, [LINE_#] ASC) WITH (FILLFACTOR = 100)
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


GO
CREATE UNIQUE NONCLUSTERED INDEX [PODetail_INDEX08]
    ON [dbo].[PODETAIL]([PO_#] ASC, [DisplayLineNum] ASC, [Recnum] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PODetail_INDEX07]
    ON [dbo].[PODETAIL]([WONum] ASC, [WOLine] ASC, [PO_#] ASC, [Recnum] ASC);


GO

--Create the change trigger for Update
CREATE TRIGGER trigPODetailRenumber ON PODETAIL
AFTER UPDATE
AS
BEGIN
  --Update the display line number on any related POTrans records.
  UPDATE POTRANS
  SET DisplayLineNum = i.DisplayLineNum
  FROM inserted i
  WHERE POTRANS.PO_# = i.PO_#
      AND POTRANS.LINE_# = i.LINE_#

  --Update the display line number on any related PONote records.
  UPDATE PONote
  SET DisplayLineNum = i.DisplayLineNum
  FROM inserted i
  WHERE PONote.PONumber = i.PO_#
      AND PONote.POLine = i.LINE_#

END