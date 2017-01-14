CREATE TABLE [dbo].[ManifestPackage] (
    [ID]         BIGINT         IDENTITY (1, 1) NOT NULL,
    [DetailID]   BIGINT         CONSTRAINT [DF__ManifestP__Detai__373E8D1F] DEFAULT ((0)) NOT NULL,
    [Weight]     NUMERIC (5, 2) NULL,
    [Cost]       NUMERIC (6, 2) NULL,
    [COD]        NUMERIC (6, 2) NULL,
    [TrackingID] VARCHAR (50)   NULL,
    CONSTRAINT [ManifestPackage_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_ManifestPackage_DetailID] FOREIGN KEY ([DetailID]) REFERENCES [dbo].[ManifestDetail] ([ID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ManifestPackage_INDEX02]
    ON [dbo].[ManifestPackage]([DetailID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

