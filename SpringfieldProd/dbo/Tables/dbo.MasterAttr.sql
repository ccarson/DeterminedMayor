CREATE TABLE [dbo].[MasterAttr] (
    [ID]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [POS]         SMALLINT      NOT NULL,
    [ATTRIBUTE]   VARCHAR (30)  NOT NULL,
    [REQ]         CHAR (1)      NULL,
    [CK]          CHAR (1)      NULL,
    [DPOS]        SMALLINT      NULL,
    [Status]      CHAR (1)      NULL,
    [CreatedBy]   CHAR (10)     NULL,
    [Created]     DATETIME2 (0) NULL,
    [ChangedBy]   CHAR (10)     NULL,
    [ChangedDate] DATETIME2 (0) NULL,
    CONSTRAINT [MasterAttr_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [MasterAttr_INDEX03]
    ON [dbo].[MasterAttr]([POS] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [MasterAttr_INDEX02]
    ON [dbo].[MasterAttr]([ATTRIBUTE] ASC) WITH (FILLFACTOR = 100);

