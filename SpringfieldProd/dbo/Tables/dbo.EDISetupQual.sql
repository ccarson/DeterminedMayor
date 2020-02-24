CREATE TABLE [dbo].[EDISetupQual] (
    [ID]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [EDISetupID]  BIGINT       DEFAULT ((0)) NOT NULL,
    [Type]        VARCHAR (10) NOT NULL,
    [Qualifier]   VARCHAR (10) CONSTRAINT [DF_EDISetupQual_Qualifier] DEFAULT (' ') NOT NULL,
    [Description] VARCHAR (50) NULL,
    CONSTRAINT [EDISetupQual_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [EDISetupQual_INDEX02]
    ON [dbo].[EDISetupQual]([EDISetupID] ASC, [Qualifier] ASC, [Type] ASC) WITH (FILLFACTOR = 100);



