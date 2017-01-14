CREATE TABLE [dbo].[BudgetHeader] (
    [ID]             BIGINT       IDENTITY (1, 1) NOT NULL,
    [BudgetName]     VARCHAR (30) CONSTRAINT [DF__BudgetHea__Budge__774FBBEA] DEFAULT ('') NOT NULL,
    [ShortName]      VARCHAR (10) CONSTRAINT [DF__BudgetHea__Short__7843E023] DEFAULT ('') NOT NULL,
    [Description]    VARCHAR (50) CONSTRAINT [DF__BudgetHea__Descr__7938045C] DEFAULT ('') NOT NULL,
    [ActiveScenario] INT          CONSTRAINT [DF__BudgetHea__Activ__7A2C2895] DEFAULT (0x01) NOT NULL,
    [CreatedBy]      VARCHAR (20) CONSTRAINT [DF__BudgetHea__Creat__7B204CCE] DEFAULT ('') NOT NULL,
    [CreatedOn]      DATETIME     CONSTRAINT [DF__BudgetHea__Creat__7C147107] DEFAULT (getdate()) NOT NULL,
    [UpdatedOn]      DATETIME     CONSTRAINT [DF__BudgetHea__Updat__7D089540] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_BudgetHeader] PRIMARY KEY CLUSTERED ([ID] ASC)
);




