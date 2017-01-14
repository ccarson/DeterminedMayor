CREATE TABLE [dbo].[RptWork] (
    [Recnum]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [ID]          DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [User]        VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [Report]      VARCHAR (50)    DEFAULT (' ') NOT NULL,
    [SprNum]      VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [OrdNum]      DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [String1]     VARCHAR (50)    DEFAULT (' ') NOT NULL,
    [String2]     VARCHAR (50)    DEFAULT (' ') NOT NULL,
    [String3]     VARCHAR (50)    DEFAULT (' ') NOT NULL,
    [String4]     VARCHAR (50)    DEFAULT (' ') NOT NULL,
    [String5]     VARCHAR (50)    DEFAULT (' ') NOT NULL,
    [Integer1]    DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [Integer2]    DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [Integer3]    DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [Integer4]    DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [Integer5]    DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [Decimal2_1]  DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [Decimal2_2]  DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [Decimal2_3]  DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [Decimal2_4]  DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [Decimal2_5]  DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [Decimal2_6]  DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [Decimal2_7]  DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [Decimal2_8]  DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [Decimal2_9]  DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [Decimal2_10] DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [Decimal6_1]  DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [Decimal6_2]  DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [Decimal6_3]  DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [Decimal6_4]  DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [Decimal6_5]  DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [Decimal6_6]  DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [Decimal6_7]  DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [Decimal6_8]  DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [Decimal6_9]  DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [Decimal6_10] DECIMAL (16, 6) DEFAULT ((0)) NOT NULL,
    [CustID]      VARCHAR (20)    DEFAULT (' ') NOT NULL,
    CONSTRAINT [RptWork_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RptWork_INDEX00]
    ON [dbo].[RptWork]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RptWork_INDEX02]
    ON [dbo].[RptWork]([User] ASC, [Report] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RptWork_INDEX03]
    ON [dbo].[RptWork]([User] ASC, [Report] ASC, [SprNum] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RptWork_INDEX04]
    ON [dbo].[RptWork]([User] ASC, [Report] ASC, [OrdNum] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

