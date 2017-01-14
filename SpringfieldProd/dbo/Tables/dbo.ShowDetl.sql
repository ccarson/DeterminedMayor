CREATE TABLE [dbo].[ShowDetl] (
    [RECNUM]       BIGINT         IDENTITY (1, 1) NOT NULL,
    [ShowOrderNum] DECIMAL (10)   NOT NULL,
    [LineNum]      DECIMAL (4)    CONSTRAINT [DF_ShowDetl_LineNum] DEFAULT ((0)) NOT NULL,
    [SprNum]       VARCHAR (20)   NULL,
    [QtyOrdered]   DECIMAL (8)    NULL,
    [QtyShipped]   DECIMAL (8)    NULL,
    [Price]        DECIMAL (8, 2) NULL,
    [Desc]         VARCHAR (38)   NULL,
    [Total]        DECIMAL (8, 2) NULL,
    CONSTRAINT [ShowDetl_INDEX00] PRIMARY KEY CLUSTERED ([RECNUM] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_ShowDetl_ShowOrderNum] FOREIGN KEY ([ShowOrderNum]) REFERENCES [dbo].[ShowHead] ([ShowOrderNum])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ShowDetl_INDEX01]
    ON [dbo].[ShowDetl]([ShowOrderNum] ASC, [LineNum] ASC);

