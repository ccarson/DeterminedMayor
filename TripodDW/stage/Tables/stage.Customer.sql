CREATE TABLE [stage].[Customer] (
    [ID]           BIGINT       IDENTITY (1, 1) NOT NULL,
    [SourceRecnum] BIGINT       NOT NULL,
    [CustomerID]   VARCHAR (10) NOT NULL,
    [CustomerName] VARCHAR (36) NOT NULL,
    [PriceType]    VARCHAR (20) NOT NULL,
    [DWChecksum]   BINARY (32)  NOT NULL,
    [DWTimestamp]  DATETIME     DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_Customer] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Customer_00]
    ON [stage].[Customer]([CustomerID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Customer_01]
    ON [stage].[Customer]([SourceRecnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Customer_02]
    ON [stage].[Customer]([DWChecksum] ASC);

