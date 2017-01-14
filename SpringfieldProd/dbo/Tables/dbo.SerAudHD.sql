CREATE TABLE [dbo].[SerAudHD] (
    [Recnum]        BIGINT       IDENTITY (1, 1) NOT NULL,
    [Report_ID]     DECIMAL (14) DEFAULT ((0)) NOT NULL,
    [Report_Name]   VARCHAR (50) DEFAULT (' ') NOT NULL,
    [Report_Book]   VARCHAR (8)  DEFAULT (' ') NOT NULL,
    [Report_Date]   DATETIME     DEFAULT ('01/01/1753') NOT NULL,
    [Month]         VARCHAR (10) DEFAULT (' ') NOT NULL,
    [User_Name]     VARCHAR (20) DEFAULT (' ') NOT NULL,
    [Computer_Name] VARCHAR (30) DEFAULT (' ') NOT NULL,
    [CountofOpen]   DECIMAL (14) DEFAULT ((0)) NOT NULL,
    [Open]          VARCHAR (1)  DEFAULT (' ') NOT NULL,
    CONSTRAINT [SerAudHD_INDEX01] PRIMARY KEY CLUSTERED ([Report_ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SerAudHD_INDEX00]
    ON [dbo].[SerAudHD]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SerAudHD_INDEX02]
    ON [dbo].[SerAudHD]([Report_Date] ASC, [Report_ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SerAudHD_INDEX03]
    ON [dbo].[SerAudHD]([Report_Book] ASC, [Report_ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SerAudHD_INDEX04]
    ON [dbo].[SerAudHD]([Report_Name] ASC) WITH (FILLFACTOR = 70);

