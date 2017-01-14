CREATE TABLE [dbo].[FedHeaderCampPerry] (
    [ID]                  BIGINT         IDENTITY (1, 1) NOT NULL,
    [Serial]              VARCHAR (14)   DEFAULT ('') NOT NULL,
    [GunType]             VARCHAR (1)    DEFAULT ('') NOT NULL,
    [Manufacturer]        VARCHAR (10)   DEFAULT ('') NOT NULL,
    [SPRNum]              VARCHAR (20)   DEFAULT ('') NOT NULL,
    [Model]               VARCHAR (10)   DEFAULT ('') NOT NULL,
    [ModelDescription]    VARCHAR (35)   DEFAULT ('') NOT NULL,
    [Caliber]             VARCHAR (10)   DEFAULT ('') NOT NULL,
    [SemiOrFullAuto]      VARCHAR (1)    DEFAULT ('') NOT NULL,
    [BoltNum]             VARCHAR (6)    DEFAULT ('') NOT NULL,
    [Headspace]           NUMERIC (4, 3) DEFAULT ((0)) NOT NULL,
    [Importer]            VARCHAR (10)   DEFAULT ('') NOT NULL,
    [FirstReceivedDate]   DATE           DEFAULT (getdate()) NOT NULL,
    [Location]            VARCHAR (20)   DEFAULT ('') NOT NULL,
    [ExciseTaxPaidDate]   DATE           DEFAULT ('1753/01/01') NOT NULL,
    [ExciseTaxPaidAmount] NUMERIC (8, 4) DEFAULT ((0)) NOT NULL,
    [CurrentState]        VARCHAR (1)    DEFAULT ('') NOT NULL,
    [LastLineNum]         SMALLINT       DEFAULT ((0)) NOT NULL,
    [CreatedBy]           VARCHAR (4)    DEFAULT ('') NOT NULL,
    [CreatedDate]         DATETIME       DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [FedHeaderCampPerry_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FedHeaderCampPerry_INDEX02]
    ON [dbo].[FedHeaderCampPerry]([Serial] ASC, [GunType] ASC, [Manufacturer] ASC);

