﻿CREATE TABLE [dbo].[CHKCITY] (
    [Recnum]         BIGINT       IDENTITY (1, 1) NOT NULL,
    [CITY]           VARCHAR (30) CONSTRAINT [DF__CHKCITY__CITY__1373CBF0] DEFAULT (' ') NOT NULL,
    [STATE]          VARCHAR (2)  CONSTRAINT [DF__CHKCITY__STATE__1467F029] DEFAULT (' ') NOT NULL,
    [SPRNUM]         VARCHAR (20) CONSTRAINT [DF__CHKCITY__SPRNUM__155C1462] DEFAULT (' ') NOT NULL,
    [PistolCapacity] TINYINT      NULL,
    [RifleCapacity]  TINYINT      NULL,
    [Exemption]      VARCHAR (1)  NULL,
    [ChangedBy]      VARCHAR (4)  NULL,
    [ChangedDate]    DATETIME     CONSTRAINT [DF_CHKCITY_ChangedDate] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    CONSTRAINT [CHKCITY_INDEX01] PRIMARY KEY CLUSTERED ([CITY] ASC, [STATE] ASC, [SPRNUM] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CHKCITY_INDEX00]
    ON [dbo].[CHKCITY]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CHKCITY_INDEX02]
    ON [dbo].[CHKCITY]([STATE] ASC, [CITY] ASC, [SPRNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CHKCITY_INDEX03]
    ON [dbo].[CHKCITY]([SPRNUM] ASC, [CITY] ASC, [STATE] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CHKCITY_INDEX04]
    ON [dbo].[CHKCITY]([ChangedDate] ASC, [CITY] ASC, [STATE] ASC, [SPRNUM] ASC);
