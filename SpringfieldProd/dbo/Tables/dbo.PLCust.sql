﻿CREATE TABLE [dbo].[PLCust] (
    [Recnum]      BIGINT        IDENTITY (1, 1) NOT NULL,
    [ID]          VARCHAR (20)  DEFAULT (' ') NOT NULL,
    [DisplayName] VARCHAR (50)  DEFAULT (' ') NOT NULL,
    [Price]       VARCHAR (20)  DEFAULT (' ') NOT NULL,
    [ShowPriceAs] VARCHAR (20)  DEFAULT (' ') NOT NULL,
    [Notes]       VARCHAR (MAX) NULL,
    CONSTRAINT [PLCust_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PLCust_INDEX00]
    ON [dbo].[PLCust]([Recnum] ASC) WITH (FILLFACTOR = 70);

