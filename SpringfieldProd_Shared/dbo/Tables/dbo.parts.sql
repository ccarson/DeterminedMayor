CREATE TABLE [dbo].[parts] (
    [Recnum]                   BIGINT          IDENTITY (1, 1) NOT NULL,
    [SPRNUM]                   VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [DESC]                     VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [ORIGAMNT]                 DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [RAW]                      DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [WIP]                      DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [FIN]                      DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [ASSIGNED]                 DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [REORDPNT]                 DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [ONORD]                    DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [FULL]                     DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [YSHIP]                    DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [YA]                       DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [YP]                       DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [LSALE]                    DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [COSTRAW]                  DECIMAL (12, 6) DEFAULT ((0)) NOT NULL,
    [COSTWIP]                  DECIMAL (12, 6) DEFAULT ((0)) NOT NULL,
    [COSTFIN]                  DECIMAL (12, 6) DEFAULT ((0)) NOT NULL,
    [DEALER]                   DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [RETAIL]                   DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [Z]                        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [UPC]                      VARCHAR (15)    NOT NULL,
    [DEFRAW]                   DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [DEFWIP]                   DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [DEFFIN]                   DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [GUNTYPE]                  VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [GUNSTOCK]                 VARCHAR (6)     DEFAULT (' ') NOT NULL,
    [DELIVERY]                 DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [NOTE]                     VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [Overhead]                 DECIMAL (10, 4) NOT NULL,
    [IndirectLabor]            DECIMAL (10, 4) NOT NULL,
    [DirectLabor]              DECIMAL (10, 4) NOT NULL,
    [MaterialCost]             DECIMAL (10, 4) NOT NULL,
    [SubContractor]            DECIMAL (10, 4) NOT NULL,
    [SUB2]                     DECIMAL (10, 4) DEFAULT ((0)) NOT NULL,
    [SUB3]                     DECIMAL (10, 4) DEFAULT ((0)) NOT NULL,
    [FREIGHT]                  DECIMAL (10, 4) DEFAULT ((0)) NOT NULL,
    [EXCISE]                   DECIMAL (10, 4) DEFAULT ((0)) NOT NULL,
    [CALIBER]                  VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [COMPANY_#]                VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DIVISION_#]               VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [ACCOUNT_ID]               VARCHAR (5)     DEFAULT (' ') NOT NULL,
    [NSN_#]                    VARCHAR (12)    DEFAULT (' ') NOT NULL,
    [FS_#]                     VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [VENDOR_INFO]              VARCHAR (50)    DEFAULT (' ') NOT NULL,
    [DESC_2]                   VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [RESERVED]                 DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [INTERNAT_FLAG]            VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [PRICE_EDIT]               VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [INSPECT_FLAG]             VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [SCRAP]                    DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [COSTSCRAP]                DECIMAL (10, 4) DEFAULT ((0)) NOT NULL,
    [PURCH_FLAG]               VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [RECEIVE_TO]               VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [SCOMPANY_#]               VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [SDIVISION_#]              VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [SACCOUNT_ID]              VARCHAR (5)     DEFAULT (' ') NOT NULL,
    [PR_SHT_DESC]              VARCHAR (102)   DEFAULT (' ') NOT NULL,
    [RAW_ASSIGNED]             DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [FREIGHT_FLAG]             VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [BREAKDOWN_FLAG]           VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [GROUP1]                   VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [RPT_GROUP]                VARCHAR (6)     DEFAULT (' ') NOT NULL,
    [LOT_SIZE]                 DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [CUSTOM_COUNT]             DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [SERIAL_FLAG]              VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [WHLS_QTY1]                DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [WHLS_PRCNT1]              DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [WHLS_QTY2]                DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [WHLS_PRCNT2]              DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [WHLS_QTY3]                DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [WHLS_PRCNT3]              DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [WHLS_QTY4]                DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [WHLS_PRCNT4]              DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [DLR_QTY1]                 DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [DLR_PRCNT1]               DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [DLR_QTY2]                 DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [DLR_PRCNT2]               DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [DLR_QTY3]                 DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [DLR_PRCNT3]               DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [DLR_QTY4]                 DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [DLR_PRCNT4]               DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [RTL_QTY1]                 DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [RTL_PRCNT1]               DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [RTL_QTY2]                 DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [RTL_PRCNT2]               DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [RTL_QTY3]                 DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [RTL_PRCNT3]               DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [RTL_QTY4]                 DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [RTL_PRCNT4]               DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [WHOLESALE]                DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [VENDOR_ID]                VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [FIREARM_FLAG]             VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [TAX_FLAG]                 VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [EXCISE_TYPE]              VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [UOM_DESC]                 VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [LEAD_TIME]                DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [INVAVGPRICE]              DECIMAL (14, 4) DEFAULT ((0)) NOT NULL,
    [WOASSIGNED]               DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [OEASSIGNED]               DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [BARREL_LENGTH]            DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [FINISH]                   VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [SELLABLE]                 VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [ACTIVE]                   VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [DRAWING_NUMBER]           VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [REVISION_NUMBER]          DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [Sale_Notes]               VARCHAR (MAX)   NULL,
    [Tech_Notes]               VARCHAR (MAX)   NULL,
    [Part_Type]                VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [Part_Category]            VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [LawEnf_Price]             DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [Star_Price]               DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [BoxStore_Price]           DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [BuyGroup_Price]           DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [HASSERIAL]                VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CreatedBy]                VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [CreatedDate]              DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [ChangedBy]                VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [ChangedDate]              DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [Version]                  VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [UpdateSysInven]           VARCHAR (1)     NULL,
    [Capacity]                 VARCHAR (4)     NULL,
    [Location]                 VARCHAR (1)     NULL,
    [Aisle]                    VARCHAR (10)    NULL,
    [Rack]                     VARCHAR (10)    NULL,
    [Tier]                     VARCHAR (10)    NULL,
    [Bin]                      VARCHAR (10)    NULL,
    [ExciseTaxTotalMatCost]    NUMERIC (12, 4) NULL,
    [ExciseTaxTotalMatTaxCost] NUMERIC (12, 4) NULL,
    [ExciseTaxLaborCost]       NUMERIC (12, 4) NULL,
    [ExciseTaxRatio]           NUMERIC (12, 4) NULL,
    [ExciseTaxAdjustedTax]     NUMERIC (12, 4) NULL,
    [ExciseTaxLaborTaxCost]    NUMERIC (12, 4) NULL,
    [ThreadedBarrel]           VARCHAR (1)     NULL,
    [SubCategory]              VARCHAR (10)    NULL,
    [Packed]                   BIGINT          DEFAULT ((0)) NOT NULL,
    [PulledToWO]               BIGINT          CONSTRAINT [DF_parts_PulledToWO] DEFAULT ((0)) NOT NULL,
    [PartNumber]               VARCHAR (40)    CONSTRAINT [DF_parts_PartNumber] DEFAULT (' ') NOT NULL,
    [AttributeDescription]     VARCHAR (1024)  NULL,
    [PurchaseUOM]              CHAR (4)        CONSTRAINT [DF_Parts_PurchaseUOM] DEFAULT ('EA') NOT NULL,
 	
    CONSTRAINT [parts_INDEX01] PRIMARY KEY CLUSTERED ([SPRNUM] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_parts_GUNTYPE] FOREIGN KEY ([GUNTYPE]) REFERENCES [dbo].[GUNTYPES] ([CODE]),
    CONSTRAINT [FK_parts_RPT_GROUP] FOREIGN KEY ([RPT_GROUP]) REFERENCES [dbo].[INPRTGRP] ([CODE]),
    CONSTRAINT [FK_parts_VENDOR_ID] FOREIGN KEY ([VENDOR_ID]) REFERENCES [dbo].[POVendor] ([VENDOR_ID])
);





GO
ALTER TABLE [dbo].[parts] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);


GO
CREATE UNIQUE NONCLUSTERED INDEX [parts_INDEX00]
    ON [dbo].[parts]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [parts_INDEX02]
    ON [dbo].[parts]([RPT_GROUP] ASC, [SPRNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [parts_INDEX03]
    ON [dbo].[parts]([VENDOR_ID] ASC, [SPRNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [parts_INDEX04]
    ON [dbo].[parts]([DESC] ASC, [SPRNUM] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [parts_INDEX05]
    ON [dbo].[parts]([Part_Type] ASC, [SPRNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [parts_INDEX06]
    ON [dbo].[parts]([UPC] ASC, [SPRNUM] ASC);


GO

CREATE TRIGGER  [dbo].[tr_PartsFinQuantity]
            ON  [dbo].[parts]
AFTER UPDATE
AS
/*
************************************************************************************************************************************

    Trigger:    tr_PartsFinQuantity
    Purpose:    Detects and logs changes in FIN quantity


    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         2017-02-09          created

    Logic Summary:
    1)  log audit data to dbo._partsFINQuantityChanges when FIN quantity has changed

************************************************************************************************************************************
*/
BEGIN
    IF  @@ROWCOUNT = 0 RETURN ;

    SET NOCOUNT ON ;

--  1)  LOG FIN quantity changes to dbo._partsFINQuantityChanges
    INSERT INTO dbo._partsFINQuantityChanges
        (ChangeDate, SPRNUM, OldFINQuantity, NewFINQuantity, ChangeUser, ChangeSession, ChangeSource )
    SELECT
        GETDATE()
      , inserted.SPRNUM
      , deleted.FIN
      , inserted.FIN
      , USER_NAME()
      , SYSTEM_USER
      , APP_NAME()
    FROM
        inserted
    INNER JOIN
        deleted
            ON inserted.SPRNUM = deleted.SPRNUM
    WHERE inserted.FIN != deleted.FIN ;
END
GO
CREATE NONCLUSTERED INDEX [parts_INDEX08]
    ON [dbo].[parts]([SERIAL_FLAG] ASC) WITH (FILLFACTOR = 100);


GO
CREATE NONCLUSTERED INDEX [parts_INDEX07]
    ON [dbo].[parts]([GUNTYPE] ASC) WITH (FILLFACTOR = 100);

