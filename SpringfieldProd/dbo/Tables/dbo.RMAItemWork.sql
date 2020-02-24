CREATE TABLE [dbo].[RMAItemWork] (
    [ID]            BIGINT         IDENTITY (1, 1) NOT NULL,
    [ItemID]        BIGINT         CONSTRAINT [DF_RMAItemWork_ItemID] DEFAULT ((0)) NOT NULL,
    [Code]          INT            CONSTRAINT [DF_RMAItemWork_Code] DEFAULT ((0)) NOT NULL,
    [StartDate]     DATETIME       CONSTRAINT [DF_RMAItemWork_StartDate] DEFAULT ('1753-01-01') NOT NULL,
    [FinishDate]    DATETIME       CONSTRAINT [DF_RMAItemWork_FinishDate] DEFAULT ('1753-01-01') NOT NULL,
    [Initials]      CHAR (4)       CONSTRAINT [DF_RMAItemWork_Initials] DEFAULT ('') NOT NULL,
    [WorkType]      CHAR (1)       CONSTRAINT [DF_RMAItemWork_WorkType] DEFAULT ('W') NOT NULL,
    [BillableHours] NUMERIC (6, 2) CONSTRAINT [DF_RMAItemWork_BillableHours] DEFAULT ((0)) NOT NULL,
    [WarrantyHours] NUMERIC (6, 2) CONSTRAINT [DF_RMAItemWork_WarrantyHours] DEFAULT ((0)) NOT NULL,
    [CreatedBy]     CHAR (4)       CONSTRAINT [DF_RMAItemWork_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate]   DATETIME       CONSTRAINT [DF_RMAItemWork_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [ExtraService]  CHAR (1)       DEFAULT ('N') NOT NULL,
    CONSTRAINT [PK_RMAItemWork] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_RMAItemWork_RMAItem] FOREIGN KEY ([ItemID]) REFERENCES [dbo].[RMAItem] ([ID])
);


GO
CREATE NONCLUSTERED INDEX [RMAItemWork_INDEX03]
    ON [dbo].[RMAItemWork]([Code] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RMAItemWork_INDEX02]
    ON [dbo].[RMAItemWork]([ItemID] ASC, [ID] ASC) WITH (FILLFACTOR = 100);

