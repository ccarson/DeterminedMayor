CREATE TABLE [dbo].[BudgetDetail] (
    [ID]              BIGINT       IDENTITY (1, 1) NOT NULL,
    [BudgetID]        BIGINT       NOT NULL,
    [ProjectionDate]  DATE         NOT NULL,
    [ManagementGroup] VARCHAR (20) CONSTRAINT [DF__BudgetDet__Manag__087A47EC] DEFAULT ('') NOT NULL,
    [PartCategory]    VARCHAR (6)  NOT NULL,
    [PartSubCategory] VARCHAR (10) NOT NULL,
    [BudgetUnits]     INT          NOT NULL,
    [BudgetRevenue]   INT          NOT NULL,
    CONSTRAINT [PK_BudgetDetail] PRIMARY KEY CLUSTERED ([ID] ASC)
);




GO
CREATE NONCLUSTERED INDEX [NonClusteredIndex-20170427-033800]
    ON [dbo].[BudgetDetail]([BudgetID] ASC, [ProjectionDate] ASC, [ManagementGroup] ASC, [PartCategory] ASC, [PartSubCategory] ASC)
    INCLUDE([BudgetUnits], [BudgetRevenue]);

