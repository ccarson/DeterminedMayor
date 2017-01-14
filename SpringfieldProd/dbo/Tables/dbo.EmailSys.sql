CREATE TABLE [dbo].[EmailSys] (
    [Recnum]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [Port]            DECIMAL (4)   DEFAULT ((0)) NOT NULL,
    [WebSite]         VARCHAR (100) DEFAULT (' ') NOT NULL,
    [SMTP]            VARCHAR (100) DEFAULT (' ') NOT NULL,
    [SMTPUserName]    VARCHAR (100) DEFAULT (' ') NOT NULL,
    [SMTPPassword]    VARCHAR (50)  DEFAULT (' ') NOT NULL,
    [SignatureImage]  VARCHAR (100) DEFAULT (' ') NOT NULL,
    [BodyFont]        VARCHAR (50)  DEFAULT (' ') NOT NULL,
    [BodyColor]       VARCHAR (50)  DEFAULT (' ') NOT NULL,
    [DisclaimerFont]  VARCHAR (50)  DEFAULT (' ') NOT NULL,
    [DisclaimerColor] VARCHAR (50)  DEFAULT (' ') NOT NULL,
    CONSTRAINT [EmailSys_INDEX00] PRIMARY KEY CLUSTERED ([Recnum] ASC) WITH (FILLFACTOR = 70)
);

