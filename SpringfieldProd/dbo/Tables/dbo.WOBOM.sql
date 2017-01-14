﻿CREATE TABLE [dbo].[WOBOM] (
    [Recnum]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [WO_#]         DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [MASTPART]     VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [SUBPART]      VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [NEEDED]       DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [SHORT]        DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [PULLED]       DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [DEFECTIVE]    DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [MISSING]      DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [INV_STATE]    VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [FLAG]         VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [REPLACE_FLAG] VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [STD_UCOST]    DECIMAL (10, 4) DEFAULT ((0)) NOT NULL,
    [CreatedBy]    VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [CreatedDate]  DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [ChangedBy]    VARCHAR (4)     DEFAULT (' ') NOT NULL,
    [ChangedDate]  DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [Version]      VARCHAR (15)    DEFAULT (' ') NOT NULL,
    CONSTRAINT [WOBOM_INDEX01] PRIMARY KEY CLUSTERED ([WO_#] ASC, [MASTPART] ASC, [SUBPART] ASC) WITH (FILLFACTOR = 70)
);


GO
ALTER TABLE [dbo].[WOBOM] ENABLE CHANGE_TRACKING WITH (TRACK_COLUMNS_UPDATED = OFF);




GO
CREATE UNIQUE NONCLUSTERED INDEX [WOBOM_INDEX00]
    ON [dbo].[WOBOM]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [WOBOM_INDEX02]
    ON [dbo].[WOBOM]([SUBPART] ASC, [WO_#] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [WOBOM_INDEX03]
    ON [dbo].[WOBOM]([MASTPART] ASC, [SUBPART] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [WOBOM_INDEX04]
    ON [dbo].[WOBOM]([SUBPART] ASC, [MASTPART] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);

