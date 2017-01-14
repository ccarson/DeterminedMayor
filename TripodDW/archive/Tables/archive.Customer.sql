CREATE TABLE [archive].[Customer] (
    [CustomerKey]  BIGINT       NOT NULL,
    [SourceRecnum] BIGINT       NOT NULL,
    [CustomerID]   VARCHAR (10) NOT NULL,
    [CustomerName] VARCHAR (36) NOT NULL,
    [PriceType]    VARCHAR (20) NOT NULL,
    [DWChecksum]   BINARY (32)  NOT NULL,
    [DWVersion]    INT          NOT NULL,
    [DWTimestamp]  DATETIME     NOT NULL,
    CONSTRAINT [pk_Customer_archive] PRIMARY KEY CLUSTERED ([CustomerKey] ASC, [DWVersion] ASC)
);

