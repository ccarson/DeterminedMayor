CREATE TABLE [dbo].[CartonDetail] (
    [ID]             BIGINT       IDENTITY (1000, 1) NOT NULL,
    [CartonHeaderID] BIGINT       NOT NULL,
    [Qty]            SMALLINT     NULL,
    [SprNum]         VARCHAR (20) NOT NULL,
    [Serial]         VARCHAR (14) NULL,
    [LineNumber]     SMALLINT     NULL,
    [CreatedDate]    DATE         NULL,
    [CreatedBy]      VARCHAR (10) NULL,
    [ChangedDate]    DATE         NULL,
    [ChangedBy]      VARCHAR (10) NULL,
    [Barcode]        VARCHAR (14) NULL,
    [FedHeaderID]    BIGINT       NULL,
    CONSTRAINT [CartonDetail_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_CartonDetail_CartonHeaderID] FOREIGN KEY ([CartonHeaderID]) REFERENCES [dbo].[CartonHeader] ([ID])
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [CartonDetail_INDEX02]
    ON [dbo].[CartonDetail]([CartonHeaderID] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [CartonDetail_INDEX03]
    ON [dbo].[CartonDetail]([CartonHeaderID] ASC, [SprNum] ASC, [ID] ASC);

