﻿CREATE TABLE [dbo].[EdiSetup20170206] (
    [ID]                       BIGINT        NOT NULL,
    [Customer]                 VARCHAR (40)  NULL,
    [FTPFolder]                VARCHAR (12)  NULL,
    [IncomingDirectory]        VARCHAR (100) NULL,
    [OutgoingDirectory]        VARCHAR (100) NULL,
    [LastRun]                  VARCHAR (26)  NULL,
    [FileType]                 VARCHAR (12)  NULL,
    [Active]                   VARCHAR (1)   NOT NULL,
    [CustBillingID]            INT           NOT NULL,
    [SenderCode]               VARCHAR (10)  NULL,
    [UseCRLF]                  VARCHAR (1)   NULL,
    [FTPHost]                  VARCHAR (40)  NULL,
    [UserID]                   VARCHAR (40)  NULL,
    [Password]                 VARCHAR (40)  NULL,
    [HostInFolder]             VARCHAR (20)  NULL,
    [HostOutFolder]            VARCHAR (20)  NULL,
    [Type850PO]                VARCHAR (1)   NULL,
    [Type856Ship]              VARCHAR (1)   NULL,
    [Type997Ack]               VARCHAR (1)   NULL,
    [Type810Invoice]           VARCHAR (1)   NULL,
    [InFileExtension]          VARCHAR (3)   NULL,
    [OutFileExtension]         VARCHAR (3)   NULL,
    [ReplaceIncomingDelimiter] VARCHAR (1)   NULL,
    [FTPPort]                  INT           NULL,
    [TradingPartnerID]         VARCHAR (20)  NOT NULL,
    [ShippingTemplatePrefix]   VARCHAR (30)  NULL,
    [InvoiceTemplatePrefix]    VARCHAR (30)  NULL,
    [AckTemplatePrefix]        VARCHAR (30)  NULL,
    [LabelTemplatePrefix]      VARCHAR (30)  NULL,
    [LabelUID]                 INT           NULL,
    [Type855Ack]               VARCHAR (1)   NULL,
    [DefaultBillToID]          VARCHAR (10)  NULL,
    [LocationInLines]          VARCHAR (1)   NULL,
    [Resend860ReplacesLines]   VARCHAR (1)   NULL,
    [UseLineNumbers]           VARCHAR (1)   NULL
);
