CREATE TABLE [dbo].[ScanDoc] (
    [ID]          BIGINT        IDENTITY (1, 1) NOT NULL,
    [ScanDate]    DATE          NOT NULL,
    [VendorID]    VARCHAR (8)   NOT NULL,
    [CheckNo]     INT           NOT NULL,
    [FileDir]     VARCHAR (254) NULL,
    [Filename]    VARCHAR (254) NOT NULL,
    [UserName]    VARCHAR (32)  NOT NULL,
    [CreatedDate] DATETIME2 (7) DEFAULT (getdate()) NOT NULL
);


GO
CREATE NONCLUSTERED INDEX [idx_Nonclustered_ScanDoc_CheckNo_ID]
    ON [dbo].[ScanDoc]([CheckNo] ASC, [ID] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ScanDoc_INDEX03]
    ON [dbo].[ScanDoc]([VendorID] ASC, [CheckNo] ASC, [ID] ASC) WITH (FILLFACTOR = 100);


GO
CREATE UNIQUE NONCLUSTERED INDEX [ScanDoc_INDEX02]
    ON [dbo].[ScanDoc]([ScanDate] ASC, [ID] ASC) WITH (FILLFACTOR = 100);

