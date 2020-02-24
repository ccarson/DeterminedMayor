CREATE TABLE [dbo].[PromoDealerParts] (
    [ID]          NUMERIC (10)   IDENTITY (1, 1) NOT NULL,
    [PromoID]     NUMERIC (10)   NOT NULL,
    [SprNum]      CHAR (20)      NOT NULL,
    [Points]      NUMERIC (4, 2) NULL,
    [Status]      CHAR (1)       NULL,
    [CreatedBy]   CHAR (4)       NULL,
    [CreatedDate] DATETIME       NULL,
    [ChangedBy]   CHAR (4)       NULL,
    [ChangedDate] DATETIME       NULL
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PromoDealerParts_INDEX02]
    ON [dbo].[PromoDealerParts]([PromoID] ASC, [SprNum] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE CLUSTERED INDEX [PromoDealerParts_INDEX01]
    ON [dbo].[PromoDealerParts]([ID] ASC) WITH (FILLFACTOR = 100);

