CREATE TABLE [dbo].[PNPrefixSeq] (
    [ID]       BIGINT       IDENTITY (1, 1) NOT NULL,
    [Prefix]   VARCHAR (10) NOT NULL,
    [Sequence] INT          NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PNPrefixSeq_INDEX02]
    ON [dbo].[PNPrefixSeq]([Prefix] ASC) WITH (FILLFACTOR = 100);

