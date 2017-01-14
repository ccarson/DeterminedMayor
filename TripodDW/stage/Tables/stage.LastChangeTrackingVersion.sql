CREATE TABLE [stage].[LastChangeTrackingVersion] (
    [LastChangeTrackingVersion] BIGINT   NOT NULL,
    [LastChangesAppliedDate]    DATETIME DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pkLastChangeVersion] PRIMARY KEY CLUSTERED ([LastChangesAppliedDate] ASC)
);

