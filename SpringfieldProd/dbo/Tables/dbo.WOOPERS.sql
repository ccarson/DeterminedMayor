﻿CREATE TABLE [dbo].[WOOPERS] (
    [Recnum]     BIGINT       IDENTITY (1, 1) NOT NULL,
    [ID]         VARCHAR (3)  DEFAULT (' ') NOT NULL,
    [DESC]       VARCHAR (20) DEFAULT (' ') NOT NULL,
    [DEF_NOTE]   VARCHAR (3)  DEFAULT (' ') NOT NULL,
    [PCS_PER_HR] DECIMAL (4)  DEFAULT ((0)) NOT NULL,
    CONSTRAINT [WOOPERS_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_WOOPERS_DEF_NOTE] FOREIGN KEY ([DEF_NOTE]) REFERENCES [dbo].[WOMNOTE] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [WOOPERS_INDEX00]
    ON [dbo].[WOOPERS]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [WOOPERS_INDEX02]
    ON [dbo].[WOOPERS]([DESC] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);

