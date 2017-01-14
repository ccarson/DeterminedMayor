CREATE TABLE [dbo].[Recall] (
    [RecallName]    VARCHAR (20)  DEFAULT (' ') NOT NULL,
    [RMAReason]     VARCHAR (40)  NULL,
    [GunType]       VARCHAR (1)   NULL,
    [StartDate]     DATE          NULL,
    [EndDate]       DATE          NULL,
    [Notes]         VARCHAR (512) NULL,
    [Product]       VARCHAR (25)  NULL,
    [SQL]           VARCHAR (512) NULL,
    [CustIDPrefix]  VARCHAR (2)   NULL,
    [ShipHighCap45] VARCHAR (1)   NULL,
    [ShipLowCap45]  VARCHAR (1)   NULL,
    [ShipHighCap9]  VARCHAR (1)   NULL,
    [ShipLowCap9]   VARCHAR (1)   NULL,
    CONSTRAINT [Recall_INDEX01] PRIMARY KEY CLUSTERED ([RecallName] ASC) WITH (FILLFACTOR = 70)
);

