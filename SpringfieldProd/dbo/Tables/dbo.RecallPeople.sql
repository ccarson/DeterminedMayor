﻿CREATE TABLE [dbo].[RecallPeople] (
    [RECNUM]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [ID]         INT           DEFAULT ((0)) NOT NULL,
    [CUSTID]     BIGINT        DEFAULT ((0)) NOT NULL,
    [PREFIX]     VARCHAR (4)   NULL,
    [FIRST_NAME] VARCHAR (20)  DEFAULT (' ') NOT NULL,
    [INITIAL]    VARCHAR (1)   NULL,
    [LAST_NAME]  VARCHAR (30)  DEFAULT (' ') NOT NULL,
    [SUFFIX]     VARCHAR (4)   DEFAULT (' ') NOT NULL,
    [EMAIL]      VARCHAR (100) DEFAULT (' ') NOT NULL,
    [TITLE]      VARCHAR (20)  NULL,
    [EXT]        VARCHAR (4)   NULL,
    [HOME_PHONE] VARCHAR (14)  NULL,
    [D_O_B]      DATE          NULL,
    [COMMENTS]   VARCHAR (112) NULL,
    [CELL_PHONE] VARCHAR (14)  NULL,
    [GetInvoice] VARCHAR (1)   NULL,
    CONSTRAINT [RecallPeople_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_RecallPeople_CUSTID] FOREIGN KEY ([CUSTID]) REFERENCES [dbo].[RecallDealer] ([CUSTID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallPeople_INDEX00]
    ON [dbo].[RecallPeople]([RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallPeople_INDEX02]
    ON [dbo].[RecallPeople]([LAST_NAME] ASC, [FIRST_NAME] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallPeople_INDEX03]
    ON [dbo].[RecallPeople]([CUSTID] ASC, [FIRST_NAME] ASC, [LAST_NAME] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallPeople_INDEX04]
    ON [dbo].[RecallPeople]([CUSTID] ASC, [LAST_NAME] ASC, [FIRST_NAME] ASC, [SUFFIX] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallPeople_INDEX05]
    ON [dbo].[RecallPeople]([CUSTID] ASC, [EMAIL] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

