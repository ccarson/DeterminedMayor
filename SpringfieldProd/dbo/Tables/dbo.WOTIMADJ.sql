﻿CREATE TABLE [dbo].[WOTIMADJ] (
    [Recnum]   BIGINT       IDENTITY (1, 1) NOT NULL,
    [EMP_ID]   VARCHAR (10) DEFAULT (' ') NOT NULL,
    [DATE]     DATETIME     DEFAULT ('01/01/1753') NOT NULL,
    [TIME]     VARCHAR (4)  DEFAULT (' ') NOT NULL,
    [SHIFT]    VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [DEPT]     VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [MINUTES]  DECIMAL (6)  DEFAULT ((0)) NOT NULL,
    [FLAG]     VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [DATE_IN]  DATETIME     DEFAULT ('01/01/1753') NOT NULL,
    [HRS_IN]   VARCHAR (2)  DEFAULT (' ') NOT NULL,
    [MIN_IN]   VARCHAR (2)  DEFAULT (' ') NOT NULL,
    [DATE_OUT] DATETIME     DEFAULT ('01/01/1753') NOT NULL,
    [HRS_OUT]  VARCHAR (2)  DEFAULT (' ') NOT NULL,
    [MIN_OUT]  VARCHAR (2)  DEFAULT (' ') NOT NULL,
    [ERRDESC]  VARCHAR (25) DEFAULT (' ') NOT NULL,
    [TIME2]    VARCHAR (4)  DEFAULT (' ') NOT NULL,
    CONSTRAINT [WOTIMADJ_INDEX01] PRIMARY KEY CLUSTERED ([EMP_ID] ASC, [DATE] ASC, [FLAG] ASC, [TIME] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [WOTIMADJ_INDEX00]
    ON [dbo].[WOTIMADJ]([Recnum] ASC) WITH (FILLFACTOR = 70);
