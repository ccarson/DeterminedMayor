CREATE TABLE [dbo].[OrderLineHistory] (
    [ID]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [Recnum]          BIGINT          NOT NULL,
    [ORDNUM]          DECIMAL (10, 2) NOT NULL,
    [QUAN]            DECIMAL (8)     NOT NULL,
    [QUANS]           DECIMAL (8)     NOT NULL,
    [SPRNUM]          VARCHAR (20)    NOT NULL,
    [DESC]            VARCHAR (38)    NOT NULL,
    [UPRICE]          DECIMAL (8, 2)  NOT NULL,
    [TPRICE]          DECIMAL (8, 2)  NOT NULL,
    [BACKORDER]       VARCHAR (1)     NOT NULL,
    [QUANSHIP]        DECIMAL (8)     NOT NULL,
    [DATE]            DATETIME        NOT NULL,
    [SHIPDATE]        DATETIME        NOT NULL,
    [IN]              DECIMAL (4)     NOT NULL,
    [YARD]            VARCHAR (4)     NOT NULL,
    [COM]             VARCHAR (1)     NOT NULL,
    [TELEYARD]        VARCHAR (4)     NOT NULL,
    [EXCISE_DATE]     DATETIME        NOT NULL,
    [IN2]             DECIMAL (2)     NOT NULL,
    [TCOST]           DECIMAL (10, 4) NOT NULL,
    [REGPRICE]        DECIMAL (8, 2)  NOT NULL,
    [BACKREL]         DECIMAL (8)     NOT NULL,
    [LIST_PRICE]      DECIMAL (8, 2)  NOT NULL,
    [CUSTOM_FLAG]     VARCHAR (1)     NOT NULL,
    [Quan_BO]         DECIMAL (8)     NOT NULL,
    [Status]          VARCHAR (1)     NOT NULL,
    [Programming_Ver] DECIMAL (2)     NOT NULL,
    [Purchase_Time]   VARCHAR (5)     NOT NULL,
    [RawCostEach]     DECIMAL (12, 6) NOT NULL,
    [FinCostEach]     DECIMAL (12, 6) NOT NULL,
    [USERINITIALS]    VARCHAR (4)     NOT NULL,
    [MovedToBO]       VARCHAR (1)     NULL,
    [QuanA]           INT             NULL,
    [QuanPacked]      DECIMAL (8)     NULL,
    [QuanSOriginal]   INT             NULL,
    [SalesTax]        NUMERIC (8, 2)  NULL,
    [TaxRate]         NUMERIC (6, 4)  NULL,
    [ChangeTime]      DATETIME2 (7)   NOT NULL,
    [ChangeUser]      NVARCHAR (128)  NULL,
    [HostName]        NVARCHAR (128)  NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [OrderLineHistory_INDEX02]
    ON [dbo].[OrderLineHistory]([ChangeTime] DESC, [ORDNUM] ASC, [IN] ASC, [ID] ASC) WITH (FILLFACTOR = 100);


GO
CREATE NONCLUSTERED INDEX [OrderLineHistory_Index03]
    ON [dbo].[OrderLineHistory]([ORDNUM] ASC, [IN] ASC, [ChangeTime] DESC, [ID] ASC) WITH (FILLFACTOR = 100);


GO
ALTER TABLE [dbo].[OrderLineHistory]
    ADD CONSTRAINT [OrderLineHistory_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100);


