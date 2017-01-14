CREATE TABLE [dbo].[TabOHist] (
    [BCustID]  VARCHAR (10)    NOT NULL,
    [BName]    VARCHAR (36)    CONSTRAINT [DF_TabOHist_BName] DEFAULT (' ') NOT NULL,
    [SCustID]  VARCHAR (10)    NOT NULL,
    [SName]    VARCHAR (36)    NULL,
    [Date]     DATETIME        NOT NULL,
    [ShipDate] DATETIME        NOT NULL,
    [OrdNum]   DECIMAL (10, 2) NOT NULL,
    [OTotal]   DECIMAL (11, 2) NULL,
    [SprNum]   VARCHAR (20)    NOT NULL,
    [Quan]     DECIMAL (8)     NOT NULL,
    [QuanShip] DECIMAL (8)     NOT NULL,
    [UPrice]   DECIMAL (8, 2)  NOT NULL,
    [TPrice]   DECIMAL (8, 2)  NOT NULL,
    [IN]       DECIMAL (4)     NOT NULL
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [TabOHist_INDEX01]
    ON [dbo].[TabOHist]([BCustID] ASC, [Date] ASC, [OrdNum] ASC, [IN] ASC);




GO
CREATE UNIQUE NONCLUSTERED INDEX [TabOHist_INDEX02]
    ON [dbo].[TabOHist]([BName] ASC, [Date] ASC, [OrdNum] ASC, [IN] ASC);




GO
CREATE UNIQUE NONCLUSTERED INDEX [TabOHist_INDEX03]
    ON [dbo].[TabOHist]([Date] ASC, [OrdNum] ASC, [IN] ASC);



