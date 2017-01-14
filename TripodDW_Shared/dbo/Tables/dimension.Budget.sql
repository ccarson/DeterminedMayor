CREATE TABLE [dimension].[Budget] (
    [BudgetKey]   BIGINT       NOT NULL,
    [BudgetName]  VARCHAR (30) NOT NULL,
    [ShortName]   VARCHAR (10) NOT NULL,
    [Description] VARCHAR (50) NOT NULL,
    [IsActive]    CHAR (1)     NOT NULL,
    [CreatedBy]   VARCHAR (20) NOT NULL,
    [CreatedOn]   DATETIME     NOT NULL,
    [UpdatedOn]   DATETIME     NOT NULL,
    [DWTimestamp] DATETIME     DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_Budget] PRIMARY KEY CLUSTERED ([BudgetKey] ASC)
);

