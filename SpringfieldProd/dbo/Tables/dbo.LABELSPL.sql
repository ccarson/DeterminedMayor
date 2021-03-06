﻿CREATE TABLE [dbo].[LABELSPL] (
    [Recnum]    BIGINT          IDENTITY (1, 1) NOT NULL,
    [PAYMENT_#] DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [ORDNUM]    DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [BNAME]     VARCHAR (36)    DEFAULT (' ') NOT NULL,
    CONSTRAINT [LABELSPL_INDEX01] PRIMARY KEY CLUSTERED ([BNAME] ASC, [PAYMENT_#] ASC, [ORDNUM] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [LABELSPL_INDEX00]
    ON [dbo].[LABELSPL]([Recnum] ASC) WITH (FILLFACTOR = 70);

