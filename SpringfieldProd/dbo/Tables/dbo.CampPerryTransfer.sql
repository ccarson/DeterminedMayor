CREATE TABLE [dbo].[CampPerryTransfer] (
    [ID]           BIGINT       IDENTITY (1, 1) NOT NULL,
    [HeaderID]     BIGINT       CONSTRAINT [DF_CampPerryTransfer_HeaderID] DEFAULT ((0)) NOT NULL,
    [Serial]       VARCHAR (14) CONSTRAINT [DF__CampPerry__Seria__4E189C2D] DEFAULT (' ') NOT NULL,
    [GunType]      VARCHAR (1)  CONSTRAINT [DF__CampPerry__GunTy__4F0CC066] DEFAULT (' ') NOT NULL,
    [Manufacturer] VARCHAR (10) CONSTRAINT [DF__CampPerry__Manuf__5000E49F] DEFAULT (' ') NOT NULL,
    CONSTRAINT [CampPerryTransfer_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CampPerryTransfer_INDEX03]
    ON [dbo].[CampPerryTransfer]([Serial] ASC, [GunType] ASC, [Manufacturer] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CampPerryTransfer_INDEX02]
    ON [dbo].[CampPerryTransfer]([HeaderID] ASC);

