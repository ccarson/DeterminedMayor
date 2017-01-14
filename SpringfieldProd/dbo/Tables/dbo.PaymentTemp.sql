CREATE TABLE [dbo].[PaymentTemp] (
    [ID]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [UserName]    VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [OrdNum]      NUMERIC (10, 2) DEFAULT ((0)) NOT NULL,
    [InvoiceNum]  INT             DEFAULT ((0)) NOT NULL,
    [Date]        DATE            NULL,
    [ShipDate]    DATE            DEFAULT ('0001-01-01') NOT NULL,
    [OTotal]      NUMERIC (10, 2) NULL,
    [Balance]     NUMERIC (10, 2) NULL,
    [DiscountAmt] NUMERIC (10, 2) NULL,
    [TotalDue]    NUMERIC (10, 2) NULL,
    [PayNow]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CustID]      VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [PayAmt]      NUMERIC (10, 2) NULL,
    CONSTRAINT [PK_PaymentTemp] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PaymentTemp_INDEX02]
    ON [dbo].[PaymentTemp]([UserName] ASC, [OrdNum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PaymentTemp_INDEX03]
    ON [dbo].[PaymentTemp]([UserName] ASC, [InvoiceNum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PaymentTemp_INDEX04]
    ON [dbo].[PaymentTemp]([UserName] ASC, [PayNow] ASC, [OrdNum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PaymentTemp_INDEX05]
    ON [dbo].[PaymentTemp]([UserName] ASC, [CustID] ASC, [ShipDate] ASC, [OrdNum] ASC);

