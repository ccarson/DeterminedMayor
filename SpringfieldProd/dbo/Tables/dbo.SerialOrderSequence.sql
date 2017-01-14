CREATE TABLE [dbo].[SerialOrderSequence] (
    [ID]              BIGINT          IDENTITY (1, 1) NOT NULL,
    [OrdNum]          DECIMAL (12, 2) NOT NULL,
    [OrderLineNumber] INT             NOT NULL,
    [Serial]          VARCHAR (14)    NOT NULL,
    [OrderSeq]        INT             NOT NULL,
    CONSTRAINT [TempSerialOrderSequence_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [TempSerialOrderSequence_INDEX02]
    ON [dbo].[SerialOrderSequence]([OrdNum] ASC, [OrderLineNumber] ASC, [OrderSeq] ASC, [Serial] ASC);

