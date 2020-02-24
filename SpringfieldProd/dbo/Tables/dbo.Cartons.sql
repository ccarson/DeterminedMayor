CREATE TABLE [dbo].[Cartons] (
    [Carton_ID]    NUMERIC (10)   IDENTITY (1, 1) NOT NULL,
    [Vendor_PN]    VARCHAR (10)   CONSTRAINT [DF__Cartons__Vendor___7ACB4713] DEFAULT (' ') NOT NULL,
    [Length]       NUMERIC (6, 2) CONSTRAINT [DF_Cartons_Length] DEFAULT ((0)) NOT NULL,
    [Width]        NUMERIC (6, 2) CONSTRAINT [DF_Cartons_Width] DEFAULT ((0)) NOT NULL,
    [Height]       NUMERIC (6, 2) CONSTRAINT [DF_Cartons_Height] DEFAULT ((0)) NOT NULL,
    [Cubic_Inches] NUMERIC (6, 2) NULL,
    [Cubic_Feet]   NUMERIC (6, 2) NULL,
    [DimWeight]    NUMERIC (6, 2) NULL,
    [Description]  VARCHAR (50)   CONSTRAINT [DF_Cartons_Description] DEFAULT (' ') NOT NULL,
    [Active]       TINYINT        NULL,
    CONSTRAINT [PK_Cartons] PRIMARY KEY CLUSTERED ([Carton_ID] ASC) WITH (FILLFACTOR = 100)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Cartons_INDEX04]
    ON [dbo].[Cartons]([Description] ASC, [Vendor_PN] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Cartons_INDEX03]
    ON [dbo].[Cartons]([Length] ASC, [Width] ASC, [Height] ASC, [Vendor_PN] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Cartons_INDEX02]
    ON [dbo].[Cartons]([Vendor_PN] ASC) WITH (FILLFACTOR = 100);

