CREATE TABLE [dbo].[RMANote] (
    [ID]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [HeaderID]       BIGINT         CONSTRAINT [DF_RMANote_HeaderID] DEFAULT ((0)) NOT NULL,
    [Initials]       CHAR (4)       CONSTRAINT [DF_RMANote_Initials] DEFAULT ('') NOT NULL,
    [FollowUpDate]   DATETIME       CONSTRAINT [DF_RMANote_FollowUpDate] DEFAULT ('1753-01-01') NOT NULL,
    [FollowedUpDate] DATETIME       CONSTRAINT [DF_RMANote_FollowedUpDate] DEFAULT ('1753-01-01') NOT NULL,
    [Note]           VARCHAR (1024) NOT NULL,
    [CreatedBy]      CHAR (4)       CONSTRAINT [DF_RMANote_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate]    DATETIME       CONSTRAINT [DF_RMANote_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [NoteType]       CHAR (10)      CONSTRAINT [DF_RMANote_NoteType] DEFAULT ('') NOT NULL,
    CONSTRAINT [PK_RMANote] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_RMANote_RMAHeader] FOREIGN KEY ([HeaderID]) REFERENCES [dbo].[RMAHeader] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [RMANote_INDEX02]
    ON [dbo].[RMANote]([HeaderID] ASC, [ID] ASC);

