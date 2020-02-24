CREATE TABLE [dbo].[FileAttachment] (
    [ID]               BIGINT          IDENTITY (1, 1) NOT NULL,
    [SourceType]       VARCHAR (10)    CONSTRAINT [DF_FileAttachment_SourceType] DEFAULT ('') NOT NULL,
    [SourceNumber]     NUMERIC (12, 2) CONSTRAINT [DF_FileAttachment_SourceNumber] DEFAULT ((0)) NOT NULL,
    [SourceIdentifier] VARCHAR (20)    CONSTRAINT [DF_FileAttachment_SourceIdentifier] DEFAULT ('') NOT NULL,
    [FileName]         VARCHAR (255)   CONSTRAINT [DF_FileAttachment_FileName] DEFAULT ('') NOT NULL,
    [FileDescription]  VARCHAR (512)   CONSTRAINT [DF_FileAttachment_FileDescription] DEFAULT ('') NOT NULL,
    [CreatedBy]        CHAR (4)        CONSTRAINT [DF_FileAttachment_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate]      DATETIME2 (3)   CONSTRAINT [DF_FileAttachment_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [ChangedBy]        CHAR (4)        CONSTRAINT [DF_FileAttachment_ChangedBy] DEFAULT ('') NOT NULL,
    [ChangedDate]      DATETIME2 (3)   CONSTRAINT [DF_FileAttachment_ChangedDate] DEFAULT ('01/01/0001') NOT NULL,
    [DeletedBy]        CHAR (4)        CONSTRAINT [DF_FileAttachment_DeletedBy] DEFAULT ('') NOT NULL,
    [DeletedDate]      DATETIME2 (3)   CONSTRAINT [DF_FileAttachment_DeletedDate] DEFAULT ('01/01/0001') NOT NULL,
    [ReplacedBy]       CHAR (4)        CONSTRAINT [DF_FileAttachment_ReplacedBy] DEFAULT ('') NOT NULL,
    [ReplacedDate]     DATETIME2 (3)   CONSTRAINT [DF_FileAttachment_ReplacedDate] DEFAULT ('01/01/0001') NOT NULL,
    [ExpirationDate]   DATETIME2 (3)   CONSTRAINT [DF_FileAttachment_ExpirationDate] DEFAULT ('01/01/0001') NOT NULL,
    [PurposeCode]      VARCHAR (10)    CONSTRAINT [DF_FileAttachment_PurposeCode] DEFAULT ('') NOT NULL,
    CONSTRAINT [FileAttachment_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FileAttachment_INDEX04]
    ON [dbo].[FileAttachment]([FileName] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FileAttachment_INDEX03]
    ON [dbo].[FileAttachment]([SourceType] ASC, [SourceIdentifier] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FileAttachment_INDEX02]
    ON [dbo].[FileAttachment]([SourceType] ASC, [SourceNumber] ASC, [ID] ASC);

