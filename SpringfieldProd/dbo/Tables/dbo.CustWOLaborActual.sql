CREATE TABLE [dbo].[CustWOLaborActual] (
    [CustWOLaborID] BIGINT         DEFAULT ((0)) NOT NULL,
    [Start]         DATE           DEFAULT ('0001-01-01') NOT NULL,
    [End]           DATE           NULL,
    [ElapsedMin]    SMALLINT       NULL,
    [RprTech]       VARCHAR (3)    DEFAULT (' ') NOT NULL,
    [Rate]          NUMERIC (6, 2) NULL,
    [Cost]          NUMERIC (6, 2) NULL,
    CONSTRAINT [CustWOLaborActual_INDEX01] PRIMARY KEY CLUSTERED ([CustWOLaborID] ASC, [Start] ASC, [RprTech] ASC)
);





