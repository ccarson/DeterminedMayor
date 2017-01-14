CREATE TABLE [stage].[CodeMast] (
    [ID]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [Recnum]      BIGINT       NULL,
    [TYPE]        VARCHAR (10) NULL,
    [CODE]        VARCHAR (10) NULL,
    [DESCRIPTION] VARCHAR (30) NULL,
    CONSTRAINT [pk_CodeMast] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CodeMast_INDEX00]
    ON [stage].[CodeMast]([TYPE] ASC, [CODE] ASC);

