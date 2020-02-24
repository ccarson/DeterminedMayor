CREATE TABLE [dbo].[CartonHeader] (
    [ID]                BIGINT          IDENTITY (1000, 1) NOT NULL,
    [ManifestPackageID] BIGINT          NOT NULL,
    [OrdNum]            DECIMAL (10, 2) NOT NULL,
    [Dimensions]        VARCHAR (40)    NULL,
    [CreatedDate]       DATE            NULL,
    [CreatedBy]         VARCHAR (10)    NULL,
    [ChangedDate]       DATE            NULL,
    [ChangedBy]         VARCHAR (10)    NULL,
    [CartonNumber]      SMALLINT        NOT NULL,
    [Status]            VARCHAR (1)     NULL,
    [Weight]            NUMERIC (6, 2)  CONSTRAINT [DF_CartonHeader_Weight] DEFAULT ((0)) NULL,
    [TotalQty]          INT             NULL,
    [Pallet]            SMALLINT        NULL,
    [Carton_ID]         BIGINT          NULL,
    [Carton_Length]     NUMERIC (6, 2)  NULL,
    [Carton_Width]      NUMERIC (6, 2)  NULL,
    [Carton_Height]     NUMERIC (6, 2)  NULL,
    [Carton_DimWeight]  NUMERIC (6, 2)  NULL,
    CONSTRAINT [CartonHeader_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 100),
    CONSTRAINT [FK_CartonHeader_OrdNum] FOREIGN KEY ([OrdNum]) REFERENCES [dbo].[CUSTINFO] ([ORDNUM])
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [CartonHeader_INDEX02]
    ON [dbo].[CartonHeader]([OrdNum] ASC, [CartonNumber] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CartonHeader_INDEX03]
    ON [dbo].[CartonHeader]([ManifestPackageID] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO



GO



GO
CREATE STATISTICS [_WA_Sys_0000000E_0E1D4752]
    ON [dbo].[CartonHeader]([Carton_ID]);

