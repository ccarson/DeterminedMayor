CREATE TABLE [dbo].[ExciseTaxReport] (
    [RootPart]     VARCHAR (20)   DEFAULT (' ') NOT NULL,
    [MasterPart]   VARCHAR (20)   DEFAULT (' ') NOT NULL,
    [SubPart]      VARCHAR (20)   DEFAULT (' ') NOT NULL,
    [Desc]         VARCHAR (30)   NULL,
    [SubLevel]     SMALLINT       DEFAULT ((0)) NOT NULL,
    [Time]         NUMERIC (6, 2) NULL,
    [Direct]       NUMERIC (8, 4) NULL,
    [inDirect]     NUMERIC (8, 4) NULL,
    [SubContract]  NUMERIC (8, 4) NULL,
    [Overhead]     NUMERIC (8, 4) NULL,
    [Total]        NUMERIC (8, 4) NULL,
    [Location]     VARCHAR (3)    DEFAULT (' ') NOT NULL,
    [Operation]    VARCHAR (4)    DEFAULT (' ') NOT NULL,
    [LineNumber]   SMALLINT       DEFAULT ((0)) NOT NULL,
    [Replace_Flag] VARCHAR (1)    DEFAULT (' ') NOT NULL,
    CONSTRAINT [ExciseTaxReport_INDEX01] PRIMARY KEY CLUSTERED ([RootPart] ASC, [MasterPart] ASC, [SubPart] ASC, [Location] ASC, [Operation] ASC, [LineNumber] ASC)
);



