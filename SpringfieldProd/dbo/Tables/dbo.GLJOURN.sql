﻿CREATE TABLE [dbo].[GLJOURN] (
    [Recnum]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [COMPANY_#]    VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DIVISION_#]   VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [DEPARTMENT_#] VARCHAR (2)     DEFAULT (' ') NOT NULL,
    [ACCOUNT_#]    VARCHAR (3)     DEFAULT (' ') NOT NULL,
    [PERIOD_#]     DECIMAL (2)     DEFAULT ((0)) NOT NULL,
    [CREDITS1]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS1]      DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDITS2]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS2]      DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDITS3]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS3]      DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDITS4]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS4]      DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDITS5]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS5]      DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDITS6]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS6]      DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDITS7]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS7]      DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDITS8]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS8]      DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDITS9]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS9]      DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDITS10]    DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS10]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDITS11]    DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS11]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDITS12]    DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS12]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [CREDITS13]    DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [DEBITS13]     DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [ID]           DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [GLCOMPAN_ID]  DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [GLMASTER_ID]  DECIMAL (10)    DEFAULT ((0)) NOT NULL,
    [YEAR]         DECIMAL (4)     DEFAULT ((0)) NOT NULL,
    CONSTRAINT [GLJOURN_INDEX01] PRIMARY KEY CLUSTERED ([COMPANY_#] ASC, [DIVISION_#] ASC, [DEPARTMENT_#] ASC, [ACCOUNT_#] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_GLJOURN_GLCOMPAN_ID] FOREIGN KEY ([GLCOMPAN_ID]) REFERENCES [dbo].[GLCOMPAN] ([ID]),
    CONSTRAINT [FK_GLJOURN_GLMASTER_ID] FOREIGN KEY ([GLMASTER_ID]) REFERENCES [dbo].[GLMASTER] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLJOURN_INDEX00]
    ON [dbo].[GLJOURN]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLJOURN_INDEX02]
    ON [dbo].[GLJOURN]([ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLJOURN_INDEX03]
    ON [dbo].[GLJOURN]([GLCOMPAN_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLJOURN_INDEX04]
    ON [dbo].[GLJOURN]([GLMASTER_ID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLJOURN_INDEX05]
    ON [dbo].[GLJOURN]([COMPANY_#] ASC, [DIVISION_#] ASC, [DEPARTMENT_#] ASC, [YEAR] ASC, [PERIOD_#] ASC, [ACCOUNT_#] ASC) WITH (FILLFACTOR = 70);
