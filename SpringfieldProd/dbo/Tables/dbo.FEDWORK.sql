﻿CREATE TABLE [dbo].[FEDWORK] (
    [Recnum]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [GUNTYPE]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [SERIAL]       VARCHAR (14)    DEFAULT (' ') NOT NULL,
    [SOLD]         DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [NAME]         VARCHAR (25)    DEFAULT (' ') NOT NULL,
    [STREET]       VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [CITY]         VARCHAR (15)    DEFAULT (' ') NOT NULL,
    [STATE]        VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [SPRNUM]       VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [SOLDFFL]      VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [PRINTED]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [INVOICE#]     DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [FedRecnum]    DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [Book]         VARCHAR (8)     DEFAULT (' ') NOT NULL,
    [Country]      VARCHAR (2)     NULL,
    [Manufacturer] VARCHAR (10)    NULL,
    [Location]     VARCHAR (20)    NULL,
    [Street2]      VARCHAR (20)    NULL,
    [OrdNum]       NUMERIC (10, 2) DEFAULT ((0)) NOT NULL,
    [LineNum]      SMALLINT        DEFAULT ((0)) NOT NULL,
    CONSTRAINT [FEDWORK_INDEX01] PRIMARY KEY CLUSTERED ([GUNTYPE] ASC, [SERIAL] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_FEDWORK_GUNTYPE] FOREIGN KEY ([GUNTYPE]) REFERENCES [dbo].[GUNTYPES] ([CODE]),
    CONSTRAINT [FK_FEDWORK_SPRNUM] FOREIGN KEY ([SPRNUM]) REFERENCES [dbo].[parts] ([SPRNUM])
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [FEDWORK_INDEX00]
    ON [dbo].[FEDWORK]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FEDWORK_INDEX02]
    ON [dbo].[FEDWORK]([GUNTYPE] ASC, [SPRNUM] ASC, [NAME] ASC, [SERIAL] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FEDWORK_INDEX03]
    ON [dbo].[FEDWORK]([SPRNUM] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);

