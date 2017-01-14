CREATE TABLE [dbo].[EDIQualifiers] (
    [QualifierType]   VARCHAR (4)   DEFAULT (' ') NOT NULL,
    [Qualifier]       VARCHAR (4)   DEFAULT (' ') NOT NULL,
    [Description]     VARCHAR (40)  NULL,
    [LongDescription] VARCHAR (200) NULL,
    CONSTRAINT [EDIQualifiers_INDEX01] PRIMARY KEY CLUSTERED ([QualifierType] ASC, [Qualifier] ASC)
);

