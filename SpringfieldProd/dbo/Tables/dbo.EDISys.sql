CREATE TABLE [dbo].[EDISys] (
    [FTPHost]        VARCHAR (50)  DEFAULT (' ') NOT NULL,
    [FTPPort]        INT           NULL,
    [UserID]         VARCHAR (50)  NULL,
    [Password]       VARCHAR (50)  NULL,
    [HostInFolder]   VARCHAR (100) NULL,
    [HostOutFolder]  VARCHAR (100) NULL,
    [LocalInFolder]  VARCHAR (100) NULL,
    [LocalOutFolder] VARCHAR (100) NULL,
    CONSTRAINT [EDISys_INDEX01] PRIMARY KEY CLUSTERED ([FTPHost] ASC)
);

