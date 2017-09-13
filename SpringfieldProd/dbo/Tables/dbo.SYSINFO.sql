﻿CREATE TABLE [dbo].[SYSINFO] (
    [Recnum]               BIGINT          IDENTITY (1, 1) NOT NULL,
    [ORDNUM]               DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [ORDATE]               DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [TEMPNUM]              DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [SDATE]                DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [EDATE]                DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [SHORT]                VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [BEVEN]                DECIMAL (6, 4)  DEFAULT ((0)) NOT NULL,
    [MARKUP]               DECIMAL (6, 4)  DEFAULT ((0)) NOT NULL,
    [ID]                   VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [COD1]                 DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [COD2]                 DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [COD3]                 DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [COD4]                 DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [COD5]                 DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OPEN1]                DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OPEN2]                DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OPEN3]                DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OPEN4]                DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OPEN5]                DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OPORD1]               DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OPORD2]               DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OPORD3]               DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OPORD4]               DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [OPORD5]               DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [AGEDATE]              DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [RMA#]                 DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [CASH_ACCOUNT]         VARCHAR (9)     DEFAULT (' ') NOT NULL,
    [REFUND_ACCOUNT]       VARCHAR (9)     DEFAULT (' ') NOT NULL,
    [DIVID]                VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [CHECKNUM]             DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [DEP_SLIP_PRNTN]       VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [NEXT_PAYMENT_#]       DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [FINANCE_ACCOUNT]      VARCHAR (9)     DEFAULT (' ') NOT NULL,
    [AR_ACCOUNT]           VARCHAR (9)     DEFAULT (' ') NOT NULL,
    [PRICE_UPDATING]       VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [TM_DATE_LIMIT]        DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [REPROCESS]            VARCHAR (6)     DEFAULT (' ') NOT NULL,
    [REPROCESS_FEE]        DECIMAL (6, 2)  DEFAULT ((0)) NOT NULL,
    [REPROCESS_PERCT]      DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [FREIGHT_PCT]          DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [NEXT_DEFECT]          DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [OVERAGE]              DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [COOP_MINIMUM]         DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [COOP_PERCENT]         DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [FFL_GRACE_DAYS]       DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [PDUE_GRACE_DAYS]      DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [OLMT_GRACE_PRCT]      DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [NEXT_WO#]             DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [PASSWD]               VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [STD_CHG_PRCNT]        DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [NEXT_PO#]             DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [NEXT_REC_TICK]        DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [WOPROJ_FLAG]          VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [GLSPOOL_FLAG]         VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [FONHAND_FLAG]         VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [WANTED_LIMIT]         DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [PRICE_PSSWD]          VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [WOPRJWRK_FLAG]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [COMPANY_#]            VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [COMPANY_NAME]         VARCHAR (30)    DEFAULT (' ') NOT NULL,
    [DATE]                 DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [ADDR1]                VARCHAR (30)    DEFAULT (' ') NOT NULL,
    [ADDR2]                VARCHAR (30)    DEFAULT (' ') NOT NULL,
    [CITY]                 VARCHAR (17)    DEFAULT (' ') NOT NULL,
    [STATE]                VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [ZIP]                  VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [UPS_SHIPPER_#]        VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [CRMEMO_#]             DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [UPS_CHG_MARKUP]       DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [UPS_MAX_WT]           DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [SCREENMODE]           DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [TAG_A]                VARCHAR (6)     DEFAULT (' ') NOT NULL,
    [TAG_B]                VARCHAR (6)     DEFAULT (' ') NOT NULL,
    [MANIF#]               VARCHAR (9)     DEFAULT (' ') NOT NULL,
    [RESTRICT_SHIP]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [TAXRATE]              DECIMAL (4, 2)  DEFAULT ((0)) NOT NULL,
    [DIST_TAX_FLAG]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [PS_TAX_FLAG]          VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [MAX_USERS]            DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [NUM_USERS]            DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [SHIP_INV_FLAG]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [BARCODE_PORT]         VARCHAR (5)     DEFAULT (' ') NOT NULL,
    [BARCODE_FILE]         VARCHAR (12)    DEFAULT (' ') NOT NULL,
    [FREIGHT_FLAG]         VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [COST_FLAG]            VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [UPDATE_FLAG]          VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [GROUP_CODE]           VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [TELEWHO]              VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [CUSTYPE]              VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [ACCTYPE]              VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [LABEL_FLAG]           VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [DELETE_FLAG]          VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [POS_COMP_FLAG]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [POS_PAY_FLAG]         VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [RESTOCK_FLAG]         VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [LIST_FLAG]            VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [PHONE_AREA]           VARCHAR (3)     DEFAULT (' ') NOT NULL,
    [PHONE_EXCH]           VARCHAR (3)     DEFAULT (' ') NOT NULL,
    [PHONE_NUMB]           VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [FAX_AREA]             VARCHAR (3)     DEFAULT (' ') NOT NULL,
    [FAX_EXCH]             VARCHAR (3)     DEFAULT (' ') NOT NULL,
    [FAX_NUMB]             VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [ACCR_FLAG]            VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [WHLE_FLAG]            VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [POS_BACK_FLAG]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [POS_BACK_PSSWRD]      VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [SERIAL_DEL_PASS]      VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [N1]                   VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N2]                   VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N3]                   VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N4]                   VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [N5]                   VARCHAR (35)    DEFAULT (' ') NOT NULL,
    [WO_LOT_FLAG]          VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [SHIP_LOT_FLAG]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [GUNSTOCK]             VARCHAR (6)     DEFAULT (' ') NOT NULL,
    [UPC]                  BIGINT          NOT NULL,
    [PURCH_FLAG]           VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [BREAKDOWN_FLAG]       VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [INSPECT_FLAG]         VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [RECEIVE_TO]           VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [INTERNAT_FLAG]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [Z]                    VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [PRICE_EDIT]           VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [FREIGHT_FLAG2]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [TAX_FLAG]             VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [GROUP1]               VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [FIREARM_FLAG]         VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CALIBER]              VARCHAR (7)     DEFAULT (' ') NOT NULL,
    [SACCOUNT_ID]          VARCHAR (9)     DEFAULT (' ') NOT NULL,
    [CACCOUNT_ID]          VARCHAR (9)     DEFAULT (' ') NOT NULL,
    [UOM_DESC]             VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [EXCISE_TYPE]          VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [EXCISE]               DECIMAL (10, 4) DEFAULT ((0)) NOT NULL,
    [RPT_GROUP]            VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [VENDOR_ID]            VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [UPCGO]                VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [UPS_FLAG]             VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [RPS_FLAG]             VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [FRGHT_CHG_FLAG]       VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [FFL_CHECK_FLAG]       VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [FFL_CHECK_PASS]       VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [OVER_LIMIT_FLAG]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [OVER_LIMIT_PASS]      VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [PAST_DUE_FLAG]        VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [PAST_DUE_PASS]        VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [WAR_CON_NUM]          DECIMAL (14)    DEFAULT ((0)) NOT NULL,
    [WAR_ECO_NUM]          DECIMAL (14)    DEFAULT ((0)) NOT NULL,
    [CUSTSERV_NAME]        VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [LAST_CUSTID]          DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [InvoiceIP]            VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [InvoiceWhite]         VARCHAR (75)    DEFAULT (' ') NULL,
    [InvoiceColor]         VARCHAR (75)    DEFAULT (' ') NULL,
    [PackListIP]           VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [PackListWhite]        VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [PackListColor]        VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [PwdChangeDays]        DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [PwdChangeDate]        DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [PwdNumChar]           DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [PwdBoth]              VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [MANIFEST_INUSE]       VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [Shift1Start]          VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Shift1End]            VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Shift1LStart]         VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Shift1LEnd]           VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Shift1Allowance]      DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [Shift2Start]          VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Shift2End]            VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Shift2LStart]         VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Shift2LEnd]           VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Shift2Allowance]      DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [Shift3Start]          VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Shift3End]            VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Shift3LStart]         VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Shift3LEnd]           VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [Shift3Allowance]      DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [LastRecurDate]        DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [InvoiceNum]           DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [EMailMaxBatch]        DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [PrintAbort]           DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [DBName]               VARCHAR (30)    NULL,
    [Form4473]             INT             NULL,
    [CSExportHold]         VARCHAR (80)    NULL,
    [EMailAttLocation]     VARCHAR (100)   NULL,
    [ReportServerURL]      VARCHAR (100)   NULL,
    [SQLServer]            VARCHAR (100)   NULL,
    [MainShippingPrinter]  VARCHAR (50)    NULL,
    [MainReceivingPrinter] VARCHAR (50)    NULL,
    [XDAWarehousePrinter]  VARCHAR (50)    NULL,
    [XDDPrinter]           VARCHAR (50)    NULL,
    [HubSpotPortalID]      VARCHAR (20)    NULL,
    [HubSpotAPIKey]        VARCHAR (40)    NULL,
    [HubSpotRefreshKey]    VARCHAR (40)    NULL,
    [HubSpotExpiry]        VARCHAR (40)    NULL,
    [HubSpotClientID]      VARCHAR (40)    NULL,
    [MaxAuthIncrease]      SMALLINT        NULL,
    [CanShipCredit]        VARCHAR (1)     NULL,
    [SerialAuditRunDate]   DATE            NULL,
    CONSTRAINT [SYSINFO_INDEX00] PRIMARY KEY CLUSTERED ([Recnum] ASC) WITH (FILLFACTOR = 70)
);




