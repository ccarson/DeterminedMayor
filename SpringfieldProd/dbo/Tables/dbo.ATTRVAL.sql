﻿CREATE TABLE [dbo].[ATTRVAL] (
    [RECNUM]        INT           IDENTITY (58000, 1) NOT NULL,
    [TID]           INT           NOT NULL,
    [NOUN]          VARCHAR (20)  NOT NULL,
    [MODIFIER]      VARCHAR (30)  NOT NULL,
    [ATTRIBUTE]     VARCHAR (30)  NOT NULL,
    [VALUE]         VARCHAR (196) NOT NULL,
    [DATE_APPROVED] DATE          NULL,
    [APPROVED_BY]   CHAR (4)      NULL,
    [APPROVED]      CHAR (1)      NOT NULL,
    [DEFAULT]       CHAR (1)      NULL,
    [STATUS]        CHAR (1)      NULL,
    CONSTRAINT [ATTRVAL001_PK] PRIMARY KEY CLUSTERED ([TID] ASC, [VALUE] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ATTRVAL003]
    ON [dbo].[ATTRVAL]([APPROVED] ASC, [APPROVED_BY] ASC, [DATE_APPROVED] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ATTRVAL002]
    ON [dbo].[ATTRVAL]([NOUN] ASC, [MODIFIER] ASC, [ATTRIBUTE] ASC, [RECNUM] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ATTRVAL000]
    ON [dbo].[ATTRVAL]([RECNUM] ASC) WITH (FILLFACTOR = 100);
