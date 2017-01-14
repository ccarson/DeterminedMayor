CREATE TABLE [dbo].[VacaDetS] (
    [Recnum]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [ID]            DECIMAL (10)   DEFAULT ((0)) NOT NULL,
    [HeaderID]      DECIMAL (10)   DEFAULT ((0)) NOT NULL,
    [AccruedOrUsed] VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [VDate]         DATETIME       DEFAULT ('01/01/1753') NOT NULL,
    [Year]          DECIMAL (4)    DEFAULT ((0)) NOT NULL,
    [Amount]        DECIMAL (6, 2) DEFAULT ((0)) NOT NULL,
    CONSTRAINT [VacaDetS_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_VacaDetS_HeaderID] FOREIGN KEY ([HeaderID]) REFERENCES [dbo].[VacaHdr] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [VacaDetS_INDEX00]
    ON [dbo].[VacaDetS]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [VacaDetS_INDEX02]
    ON [dbo].[VacaDetS]([HeaderID] ASC, [VDate] ASC, [Year] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

