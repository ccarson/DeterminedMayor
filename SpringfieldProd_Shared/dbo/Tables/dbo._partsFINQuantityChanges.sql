CREATE TABLE [dbo].[_partsFINQuantityChanges] (
    [ID]             INT            IDENTITY (1, 1) NOT NULL,
    [ChangeDate]     DATETIME       NOT NULL,
    [SPRNUM]         VARCHAR (20)   NOT NULL,
    [OldFINQuantity] DECIMAL (10)   NOT NULL,
    [NewFINQuantity] DECIMAL (10)   NOT NULL,
    [ChangeUser]     NVARCHAR (128) NULL,
    [ChangeSession]  NVARCHAR (128) NULL,
    [ChangeSource]   NVARCHAR (128) NULL,
    CONSTRAINT [PK__partsFINQuantityChanges] PRIMARY KEY CLUSTERED ([ID] DESC)
);

