CREATE TABLE [dbo].[WorkOrderNote] (
    [ID]          BIGINT         IDENTITY (1, 1) NOT NULL,
    [WONumber]    DECIMAL (6)    CONSTRAINT [DF_WorkOrderNote_WONumber] DEFAULT ((0)) NOT NULL,
    [Note]        VARCHAR (1024) CONSTRAINT [DF_WorkOrderNote_Note] DEFAULT ('') NOT NULL,
    [CreatedBy]   CHAR (10)      CONSTRAINT [DF_WorkOrderNote_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate] DATETIME       CONSTRAINT [DF_WorkOrderNote_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [WorkOrderNote_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_WorkOrderNote_WOHeader] FOREIGN KEY ([WONumber]) REFERENCES [dbo].[WOHeader] ([WO_#])
);


GO
CREATE NONCLUSTERED INDEX [WorkOrderNote_INDEX02]
    ON [dbo].[WorkOrderNote]([WONumber] ASC, [CreatedDate] ASC, [ID] ASC);

