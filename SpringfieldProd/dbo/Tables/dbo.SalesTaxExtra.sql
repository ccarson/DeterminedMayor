CREATE TABLE [dbo].[SalesTaxExtra] (
    [ID]             BIGINT         IDENTITY (1, 1) NOT NULL,
    [State]          VARCHAR (2)    CONSTRAINT [DF__SalesTaxE__State__481F005E] DEFAULT (' ') NOT NULL,
    [County]         VARCHAR (30)   NULL,
    [CountyID]       VARCHAR (10)   NULL,
    [City]           VARCHAR (40)   CONSTRAINT [DF__SalesTaxEx__City__49132497] DEFAULT (' ') NOT NULL,
    [CityID]         VARCHAR (10)   NULL,
    [Zip]            VARCHAR (5)    CONSTRAINT [DF__SalesTaxExt__Zip__4A0748D0] DEFAULT (' ') NOT NULL,
    [TotalRate]      NUMERIC (8, 6) NULL,
    [StateRate]      NUMERIC (8, 6) NULL,
    [CountyRate]     NUMERIC (8, 6) NULL,
    [CityRate]       NUMERIC (8, 6) NULL,
    [Other1ID]       VARCHAR (10)   NULL,
    [Other1Rate]     NUMERIC (8, 6) NULL,
    [Other2ID]       VARCHAR (10)   NULL,
    [Other2Rate]     NUMERIC (8, 6) NULL,
    [Other3ID]       VARCHAR (10)   NULL,
    [Other3Rate]     NUMERIC (8, 6) NULL,
    [Other4ID]       VARCHAR (10)   NULL,
    [Other4Rate]     NUMERIC (8, 6) NULL,
    [Other5ID]       VARCHAR (10)   NULL,
    [Other5Rate]     NUMERIC (8, 6) NULL,
    [Other6ID]       VARCHAR (10)   NULL,
    [Other6Rate]     NUMERIC (8, 6) NULL,
    [OtherTotalRate] NUMERIC (8, 6) NULL,
    CONSTRAINT [SalesTaxExtra_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SalesTaxExtra_INDEX02]
    ON [dbo].[SalesTaxExtra]([City] ASC, [State] ASC, [Zip] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SalesTaxExtra_INDEX03]
    ON [dbo].[SalesTaxExtra]([Zip] ASC, [City] ASC, [State] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SalesTaxExtra_INDEX04]
    ON [dbo].[SalesTaxExtra]([State] ASC, [City] ASC, [Zip] ASC) WITH (FILLFACTOR = 70);

