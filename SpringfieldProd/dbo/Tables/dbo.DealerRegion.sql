CREATE TABLE [dbo].[DealerRegion] (
    [ID]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [Region] VARCHAR (20)  DEFAULT ('') NOT NULL,
    [Rep]    VARCHAR (10)  DEFAULT ('') NOT NULL,
    [Notes]  VARCHAR (256) DEFAULT ('') NOT NULL,
    CONSTRAINT [DealerRegion_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [DealerRegion_INDEX03]
    ON [dbo].[DealerRegion]([Rep] ASC, [Region] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [DealerRegion_INDEX02]
    ON [dbo].[DealerRegion]([Region] ASC);

