CREATE TABLE [dbo].[InvTrans] (
    [Recnum]      BIGINT       IDENTITY (1, 1) NOT NULL,
    [ID]          DECIMAL (6)  DEFAULT ((0)) NOT NULL,
    [SprNum]      VARCHAR (20) DEFAULT (' ') NOT NULL,
    [AdjDate]     DATETIME     DEFAULT ('01/01/1753') NOT NULL,
    [QtyBefore]   DECIMAL (10) DEFAULT ((0)) NOT NULL,
    [QtyAfter]    DECIMAL (10) DEFAULT ((0)) NOT NULL,
    [RawFin]      VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [Reason]      VARCHAR (30) DEFAULT (' ') NOT NULL,
    [CreatedDate] DATETIME     DEFAULT ('01/01/1753') NOT NULL,
    [CreatedTime] VARCHAR (8)  DEFAULT (' ') NOT NULL,
    [CreatedBy]   VARCHAR (10) DEFAULT (' ') NOT NULL,
    CONSTRAINT [InvTrans_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [InvTrans_INDEX00]
    ON [dbo].[InvTrans]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [InvTrans_INDEX02]
    ON [dbo].[InvTrans]([SprNum] ASC, [AdjDate] ASC, [CreatedTime] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [InvTrans_INDEX03]
    ON [dbo].[InvTrans]([CreatedBy] ASC, [AdjDate] ASC, [CreatedTime] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

