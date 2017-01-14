CREATE TABLE [dbo].[EDISetupQual] (
    [ID]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [EDISetupID]  BIGINT       DEFAULT ((0)) NOT NULL,
    [Segment]     VARCHAR (3)  DEFAULT (' ') NOT NULL,
    [Qualifier]   VARCHAR (2)  NULL,
    [Description] VARCHAR (50) NULL,
    CONSTRAINT [EDISetupQual_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EDISetupQual_INDEX02]
    ON [dbo].[EDISetupQual]([EDISetupID] ASC, [ID] ASC);

