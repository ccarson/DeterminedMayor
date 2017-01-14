CREATE TABLE [dbo].[PREmployeeFob] (
    [ID]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [Employee_ID] VARCHAR (10) NOT NULL,
    [FobID]       VARCHAR (5)  NOT NULL,
    CONSTRAINT [PREmployeeFob_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PREmployeeFob_INDEX03]
    ON [dbo].[PREmployeeFob]([FobID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PREmployeeFob_INDEX02]
    ON [dbo].[PREmployeeFob]([Employee_ID] ASC, [FobID] ASC);

