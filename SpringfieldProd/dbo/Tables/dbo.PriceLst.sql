﻿CREATE TABLE [dbo].[PriceLst] (
    [Recnum]         BIGINT         IDENTITY (1, 1) NOT NULL,
    [ID]             DECIMAL (10)   DEFAULT ((0)) NOT NULL,
    [SPRNUM]         VARCHAR (20)   DEFAULT (' ') NOT NULL,
    [DESC]           VARCHAR (35)   DEFAULT (' ') NOT NULL,
    [PR_SHT_DESC]    VARCHAR (102)  DEFAULT (' ') NOT NULL,
    [BARREL_LENGTH]  DECIMAL (4, 2) DEFAULT ((0)) NOT NULL,
    [FINISH]         VARCHAR (20)   DEFAULT (' ') NOT NULL,
    [ACTIVE]         VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [CATEGORY]       VARCHAR (20)   DEFAULT (' ') NOT NULL,
    [NEW]            VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [CALIBER]        VARCHAR (10)   DEFAULT (' ') NOT NULL,
    [RPT_GROUP]      VARCHAR (6)    DEFAULT (' ') NOT NULL,
    [GUNSTOCK]       VARCHAR (6)    DEFAULT (' ') NOT NULL,
    [USE]            VARCHAR (10)   DEFAULT (' ') NOT NULL,
    [CHECK_DIGIT]    VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [Sortby]         DECIMAL (8)    DEFAULT ((0)) NOT NULL,
    [OrgPrice]       DECIMAL (8, 2) DEFAULT ((0)) NOT NULL,
    [Distributor]    DECIMAL (8, 2) DEFAULT ((0)) NOT NULL,
    [Dealer]         DECIMAL (8, 2) DEFAULT ((0)) NOT NULL,
    [Retail]         DECIMAL (8, 2) DEFAULT ((0)) NOT NULL,
    [LastChangeDate] DATETIME       DEFAULT ('01/01/1753') NOT NULL,
    [LastChangeBy]   VARCHAR (10)   DEFAULT (' ') NOT NULL,
    [InactiveDate]   DATETIME       DEFAULT ('01/01/1753') NOT NULL,
    [InactiveBy]     VARCHAR (5)    DEFAULT (' ') NOT NULL,
    [InactiveReqBy]  VARCHAR (30)   DEFAULT (' ') NOT NULL,
    [InactiveReason] VARCHAR (MAX)  NULL,
    [UPC]            VARCHAR (15)   NULL,
    CONSTRAINT [PriceLst_INDEX01] PRIMARY KEY CLUSTERED ([SPRNUM] ASC, [ID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_PriceLst_BARREL_LENGTH] FOREIGN KEY ([BARREL_LENGTH]) REFERENCES [dbo].[PLBarrel] ([Barrel_Length]),
    CONSTRAINT [FK_PriceLst_CATEGORY] FOREIGN KEY ([CATEGORY]) REFERENCES [dbo].[PLCateg] ([Category_Name]),
    CONSTRAINT [FK_PriceLst_RPT_GROUP] FOREIGN KEY ([RPT_GROUP]) REFERENCES [dbo].[PLModel] ([Model])
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [PriceLst_INDEX00]
    ON [dbo].[PriceLst]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PriceLst_INDEX02]
    ON [dbo].[PriceLst]([ACTIVE] ASC, [RPT_GROUP] ASC, [CATEGORY] ASC, [BARREL_LENGTH] ASC, [SPRNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PriceLst_INDEX03]
    ON [dbo].[PriceLst]([RPT_GROUP] ASC, [CATEGORY] ASC, [BARREL_LENGTH] ASC, [Sortby] ASC, [SPRNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PriceLst_INDEX04]
    ON [dbo].[PriceLst]([ID] ASC) WITH (FILLFACTOR = 70);

