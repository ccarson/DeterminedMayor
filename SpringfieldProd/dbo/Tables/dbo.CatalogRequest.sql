CREATE TABLE [dbo].[CatalogRequest] (
    [ID]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [CustID]      VARCHAR (10) CONSTRAINT [DF__CatalogRe__CustI__5C25F90B] DEFAULT ('') NOT NULL,
    [RequestDate] DATETIME     CONSTRAINT [DF__CatalogRe__Reque__5D1A1D44] DEFAULT ('1753-01-01') NOT NULL,
    [CreatedBy]   VARCHAR (4)  NULL,
    [Sent]        VARCHAR (1)  CONSTRAINT [DF__CatalogReq__Sent__5E0E417D] DEFAULT ('N') NOT NULL,
    [QuanOrdered] TINYINT      CONSTRAINT [DF_CatalogRequest_QuanOrdered] DEFAULT ((1)) NULL,
    CONSTRAINT [CatalogRequest_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_CatalogRequest_CustID] FOREIGN KEY ([CustID]) REFERENCES [dbo].[CMASTER] ([CUSTID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CatalogRequest_INDEX02]
    ON [dbo].[CatalogRequest]([CustID] ASC, [RequestDate] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CatalogRequest_INDEX03]
    ON [dbo].[CatalogRequest]([Sent] ASC, [CustID] ASC, [RequestDate] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CatalogRequest_INDEX04]
    ON [dbo].[CatalogRequest]([Sent] ASC, [RequestDate] ASC, [CustID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

