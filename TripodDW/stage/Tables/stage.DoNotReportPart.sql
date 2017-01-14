CREATE TABLE [stage].[DoNotReportPart] (
    [SPRNUM]         VARCHAR (20) NOT NULL,
    [SPRDescription] VARCHAR (35) NOT NULL,
    [CreatedDate]    DATETIME     DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_DoNotReportPart] PRIMARY KEY CLUSTERED ([SPRNUM] ASC)
);

