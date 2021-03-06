﻿CREATE TABLE [dbo].[RADETAIL] (
    [Recnum]        BIGINT         IDENTITY (1, 1) NOT NULL,
    [RMA#]          DECIMAL (8)    DEFAULT ((0)) NOT NULL,
    [LINE#]         DECIMAL (4)    DEFAULT ((0)) NOT NULL,
    [CODE]          DECIMAL (6)    DEFAULT ((0)) NOT NULL,
    [DESCRIPTION]   VARCHAR (35)   DEFAULT (' ') NOT NULL,
    [START_DATE]    DATETIME       DEFAULT ('01/01/1753') NOT NULL,
    [FINISH_DATE]   DATETIME       DEFAULT ('01/01/1753') NOT NULL,
    [DONE_BY]       VARCHAR (3)    DEFAULT (' ') NOT NULL,
    [TOTAL_HOURS]   DECIMAL (6, 2) DEFAULT ((0)) NOT NULL,
    [TEMP_HOURS]    DECIMAL (4, 2) DEFAULT ((0)) NOT NULL,
    [TOTAL_DOLLARS] DECIMAL (8, 2) DEFAULT ((0)) NOT NULL,
    [TEMP_DOLLARS]  DECIMAL (8, 2) DEFAULT ((0)) NOT NULL,
    [SPRNUM]        VARCHAR (20)   DEFAULT (' ') NOT NULL,
    [Warranty]      VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [Qty]           DECIMAL (4)    DEFAULT ((0)) NOT NULL,
    [Price]         DECIMAL (8, 2) DEFAULT ((0)) NOT NULL,
    [Serial]        VARCHAR (14)   NULL,
    CONSTRAINT [RADETAIL_INDEX01] PRIMARY KEY CLUSTERED ([RMA#] ASC, [LINE#] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RADETAIL_INDEX00]
    ON [dbo].[RADETAIL]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RADETAIL_INDEX02]
    ON [dbo].[RADETAIL]([SPRNUM] ASC, [RMA#] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RADETAIL_INDEX03]
    ON [dbo].[RADETAIL]([CODE] ASC, [RMA#] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);

