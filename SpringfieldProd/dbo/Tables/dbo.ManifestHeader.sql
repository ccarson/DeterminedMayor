CREATE TABLE [dbo].[ManifestHeader] (
    [ID]               BIGINT       IDENTITY (1, 1) NOT NULL,
    [PickupDate]       DATETIME     DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [Location]         VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [PackageCount]     INT          DEFAULT ((0)) NOT NULL,
    [OrderCount]       INT          DEFAULT ((0)) NOT NULL,
    [Status]           VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [CarrierID]        BIGINT       DEFAULT ((0)) NOT NULL,
    [Batch]            TINYINT      DEFAULT ((0)) NOT NULL,
    [SCustID]          VARCHAR (10) DEFAULT ('') NOT NULL,
    [ExpectedShipDate] DATE         DEFAULT ('1753-01-01') NOT NULL,
    CONSTRAINT [ManifestHeader_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_ManifestHeader_CarrierID] FOREIGN KEY ([CarrierID]) REFERENCES [dbo].[Carrier] ([ID])
);



GO
CREATE UNIQUE NONCLUSTERED INDEX [ManifestHeader_INDEX03]
    ON [dbo].[ManifestHeader]([Status] ASC, [ID] ASC)  ;


GO
CREATE UNIQUE NONCLUSTERED INDEX [ManifestHeader_INDEX02]
    ON [dbo].[ManifestHeader]([Status] ASC, [Location] ASC, [CarrierID] ASC, [Batch] ASC, [PickupDate] ASC)  ;


GO
CREATE UNIQUE NONCLUSTERED INDEX [ManifestHeader_INDEX04]
    ON [dbo].[ManifestHeader]([Location] ASC, [PickupDate] ASC, [CarrierID] ASC, [Batch] ASC)  ;


GO
CREATE UNIQUE NONCLUSTERED INDEX [ManifestHeader_INDEX05]
    ON [dbo].[ManifestHeader]([PickupDate] DESC, [Location] ASC, [CarrierID] ASC, [Batch] ASC)  ;

