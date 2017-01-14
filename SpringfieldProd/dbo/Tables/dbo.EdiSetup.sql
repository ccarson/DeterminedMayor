CREATE TABLE [dbo].[EdiSetup] (
    [ID]                       BIGINT        IDENTITY (1, 1) NOT NULL,
    [Customer]                 VARCHAR (40)  DEFAULT ('') NULL,
    [FTPFolder]                VARCHAR (12)  DEFAULT ('') NULL,
    [IncomingDirectory]        VARCHAR (100) DEFAULT ('') NULL,
    [OutgoingDirectory]        VARCHAR (100) DEFAULT ('') NULL,
    [LastRun]                  VARCHAR (26)  DEFAULT ('') NULL,
    [FileType]                 VARCHAR (12)  DEFAULT ('') NULL,
    [Active]                   VARCHAR (1)   DEFAULT (' ') NOT NULL,
    [CustBillingID]            INT           DEFAULT ((0)) NOT NULL,
    [SenderCode]               VARCHAR (10)  DEFAULT ('') NULL,
    [UseCRLF]                  VARCHAR (1)   DEFAULT ('') NULL,
    [FTPHost]                  VARCHAR (40)  DEFAULT ('') NULL,
    [UserID]                   VARCHAR (40)  DEFAULT ('') NULL,
    [Password]                 VARCHAR (40)  DEFAULT ('') NULL,
    [HostInFolder]             VARCHAR (20)  DEFAULT ('') NULL,
    [HostOutFolder]            VARCHAR (20)  DEFAULT ('') NULL,
    [Type850PO]                VARCHAR (1)   DEFAULT ('') NULL,
    [Type856Ship]              VARCHAR (1)   DEFAULT ('') NULL,
    [Type997Ack]               VARCHAR (1)   DEFAULT ('') NULL,
    [Type810Invoice]           VARCHAR (1)   DEFAULT ('') NULL,
    [InFileExtension]          VARCHAR (3)   DEFAULT ('') NULL,
    [OutFileExtension]         VARCHAR (3)   NULL,
    [ReplaceIncomingDelimiter] VARCHAR (1)   DEFAULT ('') NULL,
    [FTPPort]                  INT           DEFAULT ((0)) NULL,
    [TradingPartnerID]         VARCHAR (20)  DEFAULT (' ') NOT NULL,
    [ShippingTemplatePrefix]   VARCHAR (30)  NULL,
    [InvoiceTemplatePrefix]    VARCHAR (30)  NULL,
    [AckTemplatePrefix]        VARCHAR (30)  NULL,
    [LabelTemplatePrefix]      VARCHAR (30)  NULL,
    [LabelUID]                 INT           NULL,
    [Type855Ack]               VARCHAR (1)   NULL,
    [DefaultBillToID]          VARCHAR (10)  NULL,
    [LocationInLines]          VARCHAR (1)   NULL,
    [Resend860ReplacesLines]   VARCHAR (1)   NULL,
    [UseLineNumbers]           VARCHAR (1)   NULL,
    [SendRemit]                VARCHAR (1)   DEFAULT ('') NOT NULL,
    CONSTRAINT [EdiSetup_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);














GO
CREATE UNIQUE NONCLUSTERED INDEX [EdiSetup_INDEX02]
    ON [dbo].[EdiSetup]([Active] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EdiSetup_INDEX03]
    ON [dbo].[EdiSetup]([TradingPartnerID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [EdiSetup_INDEX04]
    ON [dbo].[EdiSetup]([Customer] ASC, [ID] ASC);

