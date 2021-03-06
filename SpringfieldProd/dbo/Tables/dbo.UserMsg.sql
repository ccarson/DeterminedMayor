﻿CREATE TABLE [dbo].[UserMsg] (
    [Recnum]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [ID]       DECIMAL (8)   DEFAULT ((0)) NOT NULL,
    [FromUser] VARCHAR (10)  DEFAULT (' ') NOT NULL,
    [ToUser]   VARCHAR (10)  DEFAULT (' ') NOT NULL,
    [Date]     DATETIME      DEFAULT ('01/01/1753') NOT NULL,
    [Time]     VARCHAR (5)   DEFAULT (' ') NOT NULL,
    [Read]     VARCHAR (1)   DEFAULT (' ') NOT NULL,
    [Received] VARCHAR (1)   DEFAULT (' ') NOT NULL,
    [Message]  VARCHAR (MAX) NULL,
    CONSTRAINT [UserMsg_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UserMsg_INDEX00]
    ON [dbo].[UserMsg]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UserMsg_INDEX02]
    ON [dbo].[UserMsg]([ToUser] ASC, [Received] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UserMsg_INDEX03]
    ON [dbo].[UserMsg]([FromUser] ASC, [Read] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UserMsg_INDEX04]
    ON [dbo].[UserMsg]([Date] ASC, [Time] ASC, [ToUser] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

