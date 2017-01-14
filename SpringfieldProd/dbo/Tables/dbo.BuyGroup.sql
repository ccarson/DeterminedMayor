CREATE TABLE [dbo].[BuyGroup] (
    [Code]        VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [Desc]        VARCHAR (35) NULL,
    [CustID]      VARCHAR (10) NULL,
    [YardCode]    VARCHAR (4)  NULL,
    [WebYardCode] VARCHAR (4)  NULL,
    CONSTRAINT [BuyGroup_INDEX01] PRIMARY KEY CLUSTERED ([Code] ASC)
);









