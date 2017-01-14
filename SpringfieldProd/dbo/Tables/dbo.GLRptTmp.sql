CREATE TABLE [dbo].[GLRptTmp] (
    [Recnum]       BIGINT          IDENTITY (1, 1) NOT NULL,
    [USER]         VARCHAR (12)    DEFAULT (' ') NOT NULL,
    [GLREPORT_ID]  VARCHAR (7)     DEFAULT (' ') NOT NULL,
    [NU1]          DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [NU2]          DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [NU3]          DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [NU4]          DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [NU5]          DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [NU6]          DECIMAL (12, 2) DEFAULT ((0)) NOT NULL,
    [LINE_PRINT]   VARCHAR (12)    DEFAULT (' ') NOT NULL,
    [REPORT_LINE#] DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [PE1]          DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [PE2]          DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [PE3]          DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [PE4]          DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [ST1]          VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [ST2]          VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [ST3]          VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [ST4]          VARCHAR (40)    DEFAULT (' ') NOT NULL,
    CONSTRAINT [GLRptTmp_INDEX01] PRIMARY KEY CLUSTERED ([USER] ASC, [GLREPORT_ID] ASC, [REPORT_LINE#] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLRptTmp_INDEX00]
    ON [dbo].[GLRptTmp]([Recnum] ASC) WITH (FILLFACTOR = 70);

