CREATE TABLE [dbo].[vendorbridge] (
    [ID]         DECIMAL (10) IDENTITY (1, 1) NOT NULL,
    [POVendor_#] VARCHAR (8)  DEFAULT (' ') NOT NULL,
    [APVendor_#] VARCHAR (8)  DEFAULT (' ') NOT NULL,
    CONSTRAINT [vendorbridge_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [vendorbridge_INDEX03]
    ON [dbo].[vendorbridge]([APVendor_#] ASC, [POVendor_#] ASC, [ID] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [vendorbridge_INDEX02]
    ON [dbo].[vendorbridge]([POVendor_#] ASC, [APVendor_#] ASC, [ID] ASC) WITH (FILLFACTOR = 100);

