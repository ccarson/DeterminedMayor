CREATE TABLE [dbo].[DealerAgent] (
    [ID]                   BIGINT        IDENTITY (1, 1) NOT NULL,
    [Agency]               VARCHAR (30)  DEFAULT ('') NOT NULL,
    [FirstName]            VARCHAR (20)  DEFAULT ('') NOT NULL,
    [LastName]             VARCHAR (30)  DEFAULT ('') NOT NULL,
    [OfficePhone]          VARCHAR (14)  DEFAULT ('') NOT NULL,
    [OfficePhoneExtension] VARCHAR (6)   DEFAULT (' ') NOT NULL,
    [CellPhone]            VARCHAR (14)  DEFAULT ('') NOT NULL,
    [Fax]                  VARCHAR (14)  DEFAULT ('') NOT NULL,
    [Email]                VARCHAR (100) DEFAULT ('') NOT NULL,
    [Title]                VARCHAR (20)  DEFAULT ('') NOT NULL,
    [Street1]              VARCHAR (35)  DEFAULT ('') NOT NULL,
    [Street2]              VARCHAR (35)  DEFAULT ('') NOT NULL,
    [City]                 VARCHAR (20)  DEFAULT ('') NOT NULL,
    [State]                VARCHAR (2)   DEFAULT ('') NOT NULL,
    [ZIP]                  VARCHAR (10)  DEFAULT ('') NOT NULL,
    [Notes]                VARCHAR (256) DEFAULT ('') NOT NULL,
    CONSTRAINT [DealerAgent_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [DealerAgent_INDEX02]
    ON [dbo].[DealerAgent]([Agency] ASC, [LastName] ASC, [FirstName] ASC, [ID] ASC);

