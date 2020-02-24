CREATE TABLE [dbo].[SerAud] (
    [Recnum]        BIGINT       IDENTITY (1, 1) NOT NULL,
    [Report_ID]     DECIMAL (14) DEFAULT ((0)) NOT NULL,
    [Serial]        VARCHAR (14) DEFAULT (' ') NOT NULL,
    [GunType]       VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [Location]      VARCHAR (20) DEFAULT (' ') NOT NULL,
    [ReportDate]    DATETIME     DEFAULT ('01/01/1753') NOT NULL,
    [ReportMonth]   VARCHAR (20) DEFAULT (' ') NOT NULL,
    [ReportYear]    DECIMAL (4)  DEFAULT ((0)) NOT NULL,
    [Old_Serial]    VARCHAR (14) DEFAULT (' ') NOT NULL,
    [AuditLocation] VARCHAR (50) DEFAULT (' ') NULL,
    [Building]      VARCHAR (20) DEFAULT (' ') NOT NULL,
    [EntryDate]     DATETIME     DEFAULT ('01/01/1753') NOT NULL,
    [UserName]      VARCHAR (20) DEFAULT (' ') NOT NULL,
    [ComputerName]  VARCHAR (30) DEFAULT (' ') NOT NULL,
    [HeaderID]      BIGINT       DEFAULT ((0)) NOT NULL,
    [Book]          CHAR (9)     DEFAULT ('') NOT NULL,
    [Manufacturer]  VARCHAR (10) DEFAULT ('') NOT NULL,
    [RegisteredNFA] CHAR (1)     DEFAULT ('N') NOT NULL,
    CONSTRAINT [SerAud_INDEX01] PRIMARY KEY CLUSTERED ([Serial] ASC, [Report_ID] ASC, [GunType] ASC, [Manufacturer] ASC) WITH (FILLFACTOR = 100),
    CONSTRAINT [FK_SerAud_Report_ID] FOREIGN KEY ([Report_ID]) REFERENCES [dbo].[SerAudHD] ([Report_ID])
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [SerAud_INDEX00]
    ON [dbo].[SerAud]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SerAud_INDEX02]
    ON [dbo].[SerAud]([Report_ID] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);

