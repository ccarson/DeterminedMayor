CREATE TABLE [dbo].[CustomerNote] (
    [ID]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [CustID]         VARCHAR (10)   CONSTRAINT [DF_CustomerNote_CustID] DEFAULT ('') NOT NULL,
    [Initials]       CHAR (4)       CONSTRAINT [DF_CustomerNote_Initials] DEFAULT ('') NOT NULL,
    [FollowUpDate]   DATETIME2 (3)  CONSTRAINT [DF_CustomerNote_FollowUpDate] DEFAULT ('01/01/0001') NOT NULL,
    [FollowedUpDate] DATETIME2 (3)  CONSTRAINT [DF_CustomerNote_FollowedUpDate] DEFAULT ('01/01/0001') NOT NULL,
    [Note]           VARCHAR (1024) CONSTRAINT [DF_CustomerNote_Note] DEFAULT ('') NOT NULL,
    [CreatedBy]      CHAR (4)       CONSTRAINT [DF_CustomerNote_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate]    DATETIME2 (3)  CONSTRAINT [DF_CustomerNote_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_CustomerNote] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [CustomerNote_INDEX02]
    ON [dbo].[CustomerNote]([CustID] ASC, [ID] ASC);

