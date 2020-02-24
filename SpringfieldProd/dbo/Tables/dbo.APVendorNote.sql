CREATE TABLE [dbo].[APVendorNote] (
    [ID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [VendorID]    DECIMAL (10)   NOT NULL,
    [Note]        VARCHAR (1024) NULL,
    [CreatedBy]   CHAR (4)       NULL,
    [CreatedDate] DATETIME       NULL,
    CONSTRAINT [APVendorNote_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [APVendorNote_INDEX02]
    ON [dbo].[APVendorNote]([VendorID] ASC, [ID] ASC) WITH (FILLFACTOR = 100);

