﻿CREATE TABLE [dbo].[MASTERLN] (
    [Recnum]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [ORDNUM]          DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [QUAN]            DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [QUANS]           DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [SPRNUM]          VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [DESC]            VARCHAR (38)    DEFAULT (' ') NOT NULL,
    [UPRICE]          DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [TPRICE]          DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [BACKORDER]       VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [QUANSHIP]        DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [DATE]            DATETIME        NOT NULL,
    [SHIPDATE]        DATETIME        NOT NULL,
    [IN]              DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    [YARD]            VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [COM]             VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [TELEYARD]        VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [EXCISE_DATE]     DATETIME        NOT NULL,
    [IN2]             DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [TCOST]           DECIMAL (10, 4) DEFAULT ((0)) NOT NULL,
    [REGPRICE]        DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [BACKREL]         DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [LIST_PRICE]      DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [CUSTOM_FLAG]     VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [Quan_BO]         DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [Status]          VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [Programming_Ver] DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [Purchase_Time]   VARCHAR (5)     DEFAULT (' ') NOT NULL,
    [RawCostEach]     DECIMAL (12, 6) DEFAULT ((0)) NOT NULL,
    [FinCostEach]     DECIMAL (12, 6) DEFAULT ((0)) NOT NULL,
    [USERINITIALS]    VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [MovedToBO]       VARCHAR (1)     DEFAULT ('') NULL,
    [QuanA]           INT             DEFAULT ((0)) NULL,
    [QuanPacked]      DECIMAL (8)     NULL,
    [QuanSOriginal]   INT             NULL,
    [SalesTax]        NUMERIC (8, 2)  NULL,
    [TaxRate]         NUMERIC (6, 4)  NULL,
    CONSTRAINT [MASTERLN_INDEX01] PRIMARY KEY CLUSTERED ([ORDNUM] ASC, [IN] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_MasterLn_ORDNUM] FOREIGN KEY ([ORDNUM]) REFERENCES [dbo].[CUSTINFO] ([ORDNUM])
);






GO


ALTER TABLE [dbo].[MASTERLN] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);
GO

CREATE UNIQUE NONCLUSTERED INDEX [MASTERLN_INDEX00]
    ON [dbo].[MASTERLN]([Recnum] ASC)  ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [MASTERLN_INDEX03]
    ON [dbo].[MASTERLN]([YARD] ASC, [SPRNUM] ASC, [Recnum] ASC)  ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [MASTERLN_INDEX04]
    ON [dbo].[MASTERLN]([TELEYARD] ASC, [Recnum] ASC)  ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [MASTERLN_INDEX05]
    ON [dbo].[MASTERLN]([ORDNUM] ASC, [SPRNUM] ASC, [IN] ASC);
GO

CREATE UNIQUE NONCLUSTERED INDEX [MASTERLN_INDEX06]
    ON [dbo].[MASTERLN]([TELEYARD] ASC, [SPRNUM] ASC, [ORDNUM] ASC, [IN] ASC)  ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [MASTERLN_INDEX08]
    ON [dbo].[MASTERLN]([SPRNUM] ASC, [QUAN] ASC, [Recnum] ASC)  ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [MASTERLN_INDEX09]
    ON [dbo].[MASTERLN]([SPRNUM] ASC, [ORDNUM] ASC, [Recnum] ASC)  ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [MASTERLN_INDEX02]
    ON [dbo].[MASTERLN]([SPRNUM] ASC, [DATE] ASC, [Recnum] ASC);
GO
CREATE UNIQUE NONCLUSTERED INDEX [MASTERLN_INDEX07]
    ON [dbo].[MASTERLN]([SPRNUM] ASC, [SHIPDATE] ASC, [Recnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [MASTERLN_INDEX10]
    ON [dbo].[MASTERLN]([DATE] ASC, [Purchase_Time] ASC, [Recnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [MASTERLN_INDEX11]
    ON [dbo].[MASTERLN]([SHIPDATE] ASC, [ORDNUM] ASC, [IN] ASC, [SPRNUM] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [MasterLn_INDEX12]
    ON [dbo].[MASTERLN]([DATE] ASC, [ORDNUM] ASC, [SPRNUM] ASC, [Recnum] ASC);


GO
CREATE NONCLUSTERED INDEX [MASTERLN_INDEX13]
    ON [dbo].[MASTERLN]([SPRNUM] ASC, [ORDNUM] ASC)
    INCLUDE([QUANS]) WITH (FILLFACTOR = 100);

