CREATE TABLE [dbo].[CarrierService] (
    [ID]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [CarrierID]   BIGINT       CONSTRAINT [DF__CarrierSe__Carri__3EDFAEE7] DEFAULT ((0)) NOT NULL,
    [DisplayName] VARCHAR (36) CONSTRAINT [DF__CarrierSe__Displ__3FD3D320] DEFAULT (' ') NOT NULL,
    [CarrierCode] VARCHAR (36) NOT NULL,
    [Residential] VARCHAR (1)  NULL,
    CONSTRAINT [CarrierService_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_CarrierService_CarrierID] FOREIGN KEY ([CarrierID]) REFERENCES [dbo].[Carrier] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CarrierService_INDEX02]
    ON [dbo].[CarrierService]([CarrierID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CarrierService_INDEX03]
    ON [dbo].[CarrierService]([CarrierID] ASC, [DisplayName] ASC) WITH (FILLFACTOR = 70);

