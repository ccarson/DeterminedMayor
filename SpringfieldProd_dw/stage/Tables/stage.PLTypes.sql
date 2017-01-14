CREATE TABLE [stage].[PLTypes] (
    [ID]                   BIGINT         IDENTITY (1, 1) NOT NULL,
    [Recnum]               BIGINT         NULL,
    [PriceType]            VARCHAR (20)   NULL,
    [Factor]               DECIMAL (8, 4) NULL,
    [FromPrice]            VARCHAR (12)   NULL,
    [CalcHow]              VARCHAR (1)    NULL,
    [Round]                VARCHAR (1)    NULL,
    [NoFET]                VARCHAR (1)    NULL,
    [NoAcc]                VARCHAR (1)    NULL,
    [NoXD]                 VARCHAR (1)    NULL,
    [SortBy]               DECIMAL (4)    NULL,
    [SYS_CHANGE_OPERATION] NCHAR (1)      NOT NULL,
    [SYS_CHANGE_VERSION]   BIGINT         NOT NULL,
    CONSTRAINT [pk_PLTypes] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLTypes_INDEX00]
    ON [stage].[PLTypes]([PriceType] ASC);

