CREATE TABLE [dbo].[CustWOCust] (
    [CustWONum]   NUMERIC (12, 2) NOT NULL,
    [Description] VARCHAR (60)    DEFAULT (' ') NOT NULL,
    [Code]        SMALLINT        NULL,
    CONSTRAINT [CustWOCust_INDEX01] PRIMARY KEY CLUSTERED ([CustWONum] ASC, [Description] ASC)
);



