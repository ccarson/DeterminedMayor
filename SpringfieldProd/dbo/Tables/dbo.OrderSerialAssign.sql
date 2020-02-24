CREATE TABLE [dbo].[OrderSerialAssign] (
    [ID]          BIGINT          IDENTITY (1, 1) NOT NULL,
    [OrderNum]    NUMERIC (12, 2) DEFAULT ((0)) NOT NULL,
    [Book]        CHAR (9)        DEFAULT ('') NOT NULL,
    [FedHeaderID] BIGINT          DEFAULT ((0)) NOT NULL,
    [Serial]      VARCHAR (14)    DEFAULT ('') NOT NULL,
    [OrderLine]   SMALLINT        DEFAULT ((0)) NOT NULL,
    CONSTRAINT [OrderSerialAssign_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [OrderSerialAssign_INDEX02]
    ON [dbo].[OrderSerialAssign]([OrderNum] ASC, [Serial] ASC);

