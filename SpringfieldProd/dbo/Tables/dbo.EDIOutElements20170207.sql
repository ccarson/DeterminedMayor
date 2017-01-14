CREATE TABLE [dbo].[EDIOutElements20170207] (
    [ID]              BIGINT       NOT NULL,
    [Type]            VARCHAR (10) NOT NULL,
    [DataElementName] VARCHAR (40) NOT NULL,
    [Active]          VARCHAR (1)  NULL,
    [TableName]       VARCHAR (20) NULL,
    [FieldNumber]     SMALLINT     NULL,
    [FieldName]       VARCHAR (30) NULL,
    [Instructions]    VARCHAR (20) NULL,
    [Fixed_Value]     VARCHAR (40) NULL
);

