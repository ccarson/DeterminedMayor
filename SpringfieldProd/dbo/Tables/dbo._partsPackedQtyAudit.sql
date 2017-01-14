CREATE TABLE [dbo].[_partsPackedQtyAudit] (
    [ID]        INT          IDENTITY (1, 1) NOT NULL,
    [AuditDate] DATETIME     NOT NULL,
    [AuditType] VARCHAR (6)  NOT NULL,
    [SPRNUM]    VARCHAR (20) NOT NULL,
    [Packed]    BIGINT       NOT NULL
);

