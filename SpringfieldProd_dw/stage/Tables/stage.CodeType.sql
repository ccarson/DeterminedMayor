CREATE TABLE [stage].[CodeType] (
    [ID]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [Recnum]      BIGINT        NULL,
    [TYPE]        VARCHAR (10)  NULL,
    [DESCRIPTION] VARCHAR (30)  NULL,
    [COMMENT]     VARCHAR (MAX) NULL,
    CONSTRAINT [pk_CodeType] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CodeType_INDEX00]
    ON [stage].[CodeType]([TYPE] ASC);

