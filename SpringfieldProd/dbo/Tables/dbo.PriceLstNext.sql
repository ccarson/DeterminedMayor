﻿CREATE TABLE [dbo].[PriceLstNext] (
    [RECNUM]         BIGINT         IDENTITY (1, 1) NOT NULL,
    [ID]             BIGINT         CONSTRAINT [DF__PriceLstNext__ID__6797ABB7] DEFAULT ((0)) NOT NULL,
    [SPRNUM]         VARCHAR (20)   CONSTRAINT [DF__PriceLstN__SPRNU__688BCFF0] DEFAULT (' ') NOT NULL,
    [DESC]           VARCHAR (35)   NOT NULL,
    [PR_SHT_DESC]    VARCHAR (102)  NOT NULL,
    [BARREL_LENGTH]  DECIMAL (4, 2) CONSTRAINT [DF__PriceLstN__BARRE__697FF429] DEFAULT ((0)) NOT NULL,
    [FINISH]         VARCHAR (20)   NOT NULL,
    [ACTIVE]         VARCHAR (1)    CONSTRAINT [DF__PriceLstN__ACTIV__6A741862] DEFAULT (' ') NOT NULL,
    [CATEGORY]       VARCHAR (20)   CONSTRAINT [DF__PriceLstN__CATEG__6B683C9B] DEFAULT (' ') NOT NULL,
    [NEW]            VARCHAR (1)    NOT NULL,
    [CALIBER]        VARCHAR (10)   NOT NULL,
    [RPT_GROUP]      VARCHAR (6)    CONSTRAINT [DF__PriceLstN__RPT_G__6C5C60D4] DEFAULT (' ') NOT NULL,
    [GUNSTOCK]       VARCHAR (6)    NOT NULL,
    [USE]            VARCHAR (10)   NOT NULL,
    [CHECK_DIGIT]    VARCHAR (1)    NOT NULL,
    [Sortby]         INT            CONSTRAINT [DF__PriceLstN__Sortb__6D50850D] DEFAULT ((0)) NOT NULL,
    [OrgPrice]       NUMERIC (8, 2) NOT NULL,
    [Distributor]    NUMERIC (8, 2) NOT NULL,
    [Dealer]         NUMERIC (8, 2) NOT NULL,
    [Retail]         NUMERIC (8, 2) NOT NULL,
    [LastChangeDate] DATETIME       NOT NULL,
    [LastChangeBy]   VARCHAR (10)   NOT NULL,
    [InactiveDate]   DATETIME       CONSTRAINT [DF_PriceLstNext_InactiveDate] DEFAULT ('1753-01-01') NOT NULL,
    [InactiveBy]     VARCHAR (5)    NOT NULL,
    [InactiveReqBy]  VARCHAR (30)   NOT NULL,
    [InactiveReason] VARCHAR (128)  NULL,
    [UPC]            VARCHAR (15)   NULL,
    CONSTRAINT [PriceLstNext_INDEX01] PRIMARY KEY CLUSTERED ([SPRNUM] ASC, [ID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_PriceLstNext_BARREL_LENGTH] FOREIGN KEY ([BARREL_LENGTH]) REFERENCES [dbo].[PLBarrel] ([Barrel_Length]),
    CONSTRAINT [FK_PriceLstNext_CALIBER] FOREIGN KEY ([CALIBER]) REFERENCES [dbo].[PLCalib] ([Caliber]),
    CONSTRAINT [FK_PriceLstNext_CATEGORY] FOREIGN KEY ([CATEGORY]) REFERENCES [dbo].[PLCateg] ([Category_Name]),
    CONSTRAINT [FK_PriceLstNext_FINISH] FOREIGN KEY ([FINISH]) REFERENCES [dbo].[PLFinish] ([FINISH]),
    CONSTRAINT [FK_PriceLstNext_RPT_GROUP] FOREIGN KEY ([RPT_GROUP]) REFERENCES [dbo].[PLModel] ([Model])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PriceLstNext_INDEX00]
    ON [dbo].[PriceLstNext]([RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PriceLstNext_INDEX02]
    ON [dbo].[PriceLstNext]([ACTIVE] ASC, [RPT_GROUP] ASC, [CATEGORY] ASC, [BARREL_LENGTH] ASC, [SPRNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PriceLstNext_INDEX03]
    ON [dbo].[PriceLstNext]([RPT_GROUP] ASC, [CATEGORY] ASC, [BARREL_LENGTH] ASC, [Sortby] ASC, [SPRNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PriceLstNext_INDEX04]
    ON [dbo].[PriceLstNext]([ID] ASC) WITH (FILLFACTOR = 70);

