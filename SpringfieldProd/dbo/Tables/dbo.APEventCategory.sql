CREATE TABLE [dbo].[APEventCategory] (
    [ID]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [Category]    VARCHAR (30)  CONSTRAINT [DF_APEventCategory_CustID] DEFAULT ('') NOT NULL,
    [Active]      CHAR (1)      CONSTRAINT [DF_APEventCategory_Active] DEFAULT ('Y') NOT NULL,
    [CreatedBy]   CHAR (4)      CONSTRAINT [DF_APEventCategory_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate] DATETIME2 (3) CONSTRAINT [DF_APEventCategory_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [ChangedBy]   CHAR (4)      CONSTRAINT [DF_APEventCategory_ChangedBy] DEFAULT ('') NOT NULL,
    [ChangedDate] DATETIME2 (3) CONSTRAINT [DF_APEventCategory_ChangedDate] DEFAULT ('01/01/0001') NOT NULL,
    CONSTRAINT [PK_APEventCategory] PRIMARY KEY CLUSTERED ([ID] ASC)
);

