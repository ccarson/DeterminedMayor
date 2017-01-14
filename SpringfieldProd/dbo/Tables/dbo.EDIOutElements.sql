CREATE TABLE [dbo].[EDIOutElements] (
    [ID]              BIGINT       IDENTITY (1, 1) NOT NULL,
    [Type]            VARCHAR (10) NOT NULL,
    [DataElementName] VARCHAR (40) CONSTRAINT [DF__EDIOutEle__DataE__593F6ABF] DEFAULT (' ') NOT NULL,
    [Active]          VARCHAR (1)  NULL,
    [TableName]       VARCHAR (20) NULL,
    [FieldNumber]     SMALLINT     NULL,
    [FieldName]       VARCHAR (30) NULL,
    [Instructions]    VARCHAR (20) NULL,
    [Fixed_Value]     VARCHAR (40) NULL,
    CONSTRAINT [EDIOutElements_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EDIOutElements_INDEX02]
    ON [dbo].[EDIOutElements]([Type] ASC, [DataElementName] ASC);

