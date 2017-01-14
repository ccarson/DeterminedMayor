﻿CREATE TABLE [dbo].[EMAILATT] (
    [Recnum]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [EmailID]   DECIMAL (8)   DEFAULT ((0)) NOT NULL,
    [AttachNum] DECIMAL (2)   DEFAULT ((0)) NOT NULL,
    [FileName]  VARCHAR (100) DEFAULT (' ') NOT NULL,
    CONSTRAINT [EMAILATT_INDEX01] PRIMARY KEY CLUSTERED ([EmailID] ASC, [AttachNum] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EMAILATT_INDEX00]
    ON [dbo].[EMAILATT]([Recnum] ASC) WITH (FILLFACTOR = 70);

