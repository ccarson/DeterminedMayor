CREATE TABLE [dbo].[GLPostAudit] (
    [ID]               DECIMAL (10)    IDENTITY (1, 1) NOT NULL,
    [GLTransID]        DECIMAL (10)    NULL,
    [GLMasterID]       DECIMAL (10)    NULL,
    [DIVACCT]          VARCHAR (5)     CONSTRAINT [DF__GLPostAud__DIVAC__00AD7244] DEFAULT (' ') NOT NULL,
    [CreditAmount]     NUMERIC (12, 2) NULL,
    [DebitAmount]      NUMERIC (12, 2) NULL,
    [PreviousGLAmount] NUMERIC (12, 2) NULL,
    [CurrentGLAmount]  NUMERIC (12, 2) NULL,
    [Period]           SMALLINT        NULL,
    [CreatedDate]      DATETIME        CONSTRAINT [DF_GLPostAudit_CreatedDate] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [CreatedBy]        VARCHAR (4)     NULL,
    [Year]             VARCHAR (4)     NULL,
    [Type]             VARCHAR (1)     NULL,
    [CompanyNo]        VARCHAR (2)     CONSTRAINT [DF__GLPostAud__Compa__0295BAB6] DEFAULT (' ') NOT NULL,
    [DivisionNo]       VARCHAR (2)     CONSTRAINT [DF__GLPostAud__Divis__0389DEEF] DEFAULT (' ') NOT NULL,
    CONSTRAINT [PK_GLPostAudit] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_GLPostAudit_GLMasterID] FOREIGN KEY ([GLMasterID]) REFERENCES [dbo].[GLMASTER] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [GLPostAudit_INDEX02]
    ON [dbo].[GLPostAudit]([CompanyNo] ASC, [DivisionNo] ASC, [DIVACCT] ASC, [CreatedDate] ASC, [ID] ASC);

