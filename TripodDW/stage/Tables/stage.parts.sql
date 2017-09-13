﻿CREATE TABLE [stage].[parts] (
    [Recnum]                   BIGINT          NULL,
    [SPRNUM]                   VARCHAR (20)    NOT NULL,
    [DESC]                     VARCHAR (35)    NULL,
    [ORIGAMNT]                 DECIMAL (8)     NULL,
    [RAW]                      DECIMAL (10)    NULL,
    [WIP]                      DECIMAL (10)    NULL,
    [FIN]                      DECIMAL (10)    NULL,
    [ASSIGNED]                 DECIMAL (10)    NULL,
    [REORDPNT]                 DECIMAL (10)    NULL,
    [ONORD]                    DECIMAL (10)    NULL,
    [FULL]                     DECIMAL (10)    NULL,
    [YSHIP]                    DECIMAL (10)    NULL,
    [YA]                       DECIMAL (10)    NULL,
    [YP]                       DECIMAL (10)    NULL,
    [LSALE]                    DATETIME        NULL,
    [COSTRAW]                  DECIMAL (12, 6) NULL,
    [COSTWIP]                  DECIMAL (12, 6) NULL,
    [COSTFIN]                  DECIMAL (12, 6) NULL,
    [DEALER]                   DECIMAL (8, 2)  NULL,
    [RETAIL]                   DECIMAL (8, 2)  NULL,
    [Z]                        VARCHAR (1)     NULL,
    [UPC]                      VARCHAR (15)    NULL,
    [DEFRAW]                   DECIMAL (8)     NULL,
    [DEFWIP]                   DECIMAL (8)     NULL,
    [DEFFIN]                   DECIMAL (8)     NULL,
    [GUNTYPE]                  VARCHAR (1)     NULL,
    [GUNSTOCK]                 VARCHAR (6)     NULL,
    [DELIVERY]                 DATETIME        NULL,
    [NOTE]                     VARCHAR (40)    NULL,
    [Overhead]                 DECIMAL (10, 4) NULL,
    [IndirectLabor]            DECIMAL (10, 4) NULL,
    [DirectLabor]              DECIMAL (10, 4) NULL,
    [MaterialCost]             DECIMAL (10, 4) NULL,
    [SubContractor]            DECIMAL (10, 4) NULL,
    [SUB2]                     DECIMAL (10, 4) NULL,
    [SUB3]                     DECIMAL (10, 4) NULL,
    [FREIGHT]                  DECIMAL (10, 4) NULL,
    [EXCISE]                   DECIMAL (10, 4) NULL,
    [CALIBER]                  VARCHAR (10)    NULL,
    [COMPANY_#]                VARCHAR (2)     NULL,
    [DIVISION_#]               VARCHAR (2)     NULL,
    [ACCOUNT_ID]               VARCHAR (5)     NULL,
    [NSN_#]                    VARCHAR (12)    NULL,
    [FS_#]                     VARCHAR (10)    NULL,
    [VENDOR_INFO]              VARCHAR (50)    NULL,
    [DESC_2]                   VARCHAR (35)    NULL,
    [RESERVED]                 DECIMAL (8)     NULL,
    [INTERNAT_FLAG]            VARCHAR (1)     NULL,
    [PRICE_EDIT]               VARCHAR (1)     NULL,
    [INSPECT_FLAG]             VARCHAR (1)     NULL,
    [SCRAP]                    DECIMAL (8)     NULL,
    [COSTSCRAP]                DECIMAL (10, 4) NULL,
    [PURCH_FLAG]               VARCHAR (1)     NULL,
    [RECEIVE_TO]               VARCHAR (1)     NULL,
    [SCOMPANY_#]               VARCHAR (2)     NULL,
    [SDIVISION_#]              VARCHAR (2)     NULL,
    [SACCOUNT_ID]              VARCHAR (5)     NULL,
    [PR_SHT_DESC]              VARCHAR (102)   NULL,
    [RAW_ASSIGNED]             DECIMAL (10)    NULL,
    [FREIGHT_FLAG]             VARCHAR (1)     NULL,
    [BREAKDOWN_FLAG]           VARCHAR (1)     NULL,
    [GROUP1]                   VARCHAR (1)     NULL,
    [RPT_GROUP]                VARCHAR (6)     NULL,
    [LOT_SIZE]                 DECIMAL (8)     NULL,
    [CUSTOM_COUNT]             DECIMAL (8)     NULL,
    [SERIAL_FLAG]              VARCHAR (1)     NULL,
    [WHLS_QTY1]                DECIMAL (6)     NULL,
    [WHLS_PRCNT1]              DECIMAL (4, 2)  NULL,
    [WHLS_QTY2]                DECIMAL (6)     NULL,
    [WHLS_PRCNT2]              DECIMAL (4, 2)  NULL,
    [WHLS_QTY3]                DECIMAL (6)     NULL,
    [WHLS_PRCNT3]              DECIMAL (4, 2)  NULL,
    [WHLS_QTY4]                DECIMAL (6)     NULL,
    [WHLS_PRCNT4]              DECIMAL (4, 2)  NULL,
    [DLR_QTY1]                 DECIMAL (6)     NULL,
    [DLR_PRCNT1]               DECIMAL (4, 2)  NULL,
    [DLR_QTY2]                 DECIMAL (6)     NULL,
    [DLR_PRCNT2]               DECIMAL (4, 2)  NULL,
    [DLR_QTY3]                 DECIMAL (6)     NULL,
    [DLR_PRCNT3]               DECIMAL (4, 2)  NULL,
    [DLR_QTY4]                 DECIMAL (6)     NULL,
    [DLR_PRCNT4]               DECIMAL (4, 2)  NULL,
    [RTL_QTY1]                 DECIMAL (6)     NULL,
    [RTL_PRCNT1]               DECIMAL (4, 2)  NULL,
    [RTL_QTY2]                 DECIMAL (6)     NULL,
    [RTL_PRCNT2]               DECIMAL (4, 2)  NULL,
    [RTL_QTY3]                 DECIMAL (6)     NULL,
    [RTL_PRCNT3]               DECIMAL (4, 2)  NULL,
    [RTL_QTY4]                 DECIMAL (6)     NULL,
    [RTL_PRCNT4]               DECIMAL (4, 2)  NULL,
    [WHOLESALE]                DECIMAL (8, 2)  NULL,
    [VENDOR_ID]                VARCHAR (8)     NULL,
    [FIREARM_FLAG]             VARCHAR (1)     NULL,
    [TAX_FLAG]                 VARCHAR (1)     NULL,
    [EXCISE_TYPE]              VARCHAR (1)     NULL,
    [UOM_DESC]                 VARCHAR (4)     NULL,
    [LEAD_TIME]                DECIMAL (6)     NULL,
    [INVAVGPRICE]              DECIMAL (14, 4) NULL,
    [WOASSIGNED]               DECIMAL (10)    NULL,
    [OEASSIGNED]               DECIMAL (10)    NULL,
    [BARREL_LENGTH]            DECIMAL (4, 2)  NULL,
    [FINISH]                   VARCHAR (20)    NULL,
    [SELLABLE]                 VARCHAR (1)     NULL,
    [ACTIVE]                   VARCHAR (1)     NULL,
    [DRAWING_NUMBER]           VARCHAR (20)    NULL,
    [REVISION_NUMBER]          DECIMAL (4)     NULL,
    [Sale_Notes]               VARCHAR (MAX)   NULL,
    [Tech_Notes]               VARCHAR (MAX)   NULL,
    [Part_Type]                VARCHAR (1)     NULL,
    [Part_Category]            VARCHAR (10)    NULL,
    [LawEnf_Price]             DECIMAL (10, 2) NULL,
    [Star_Price]               DECIMAL (10, 2) NULL,
    [BoxStore_Price]           DECIMAL (10, 2) NULL,
    [BuyGroup_Price]           DECIMAL (10, 2) NULL,
    [HASSERIAL]                VARCHAR (1)     NULL,
    [CreatedBy]                VARCHAR (4)     NULL,
    [CreatedDate]              DATETIME        NULL,
    [ChangedBy]                VARCHAR (4)     NULL,
    [ChangedDate]              DATETIME        NULL,
    [Version]                  VARCHAR (15)    NULL,
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
    [Packed]                   BIGINT          NULL,
    [PulledToWO]               BIGINT          NULL,
    CONSTRAINT [pk_parts] PRIMARY KEY CLUSTERED ([SPRNUM] ASC)
);
