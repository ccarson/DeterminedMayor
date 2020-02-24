CREATE TABLE [dbo].[PODetailChange] (
    [ID]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [PONumber]        DECIMAL (6)    CONSTRAINT [DF_PODetailChange_PONumber] DEFAULT ((0)) NOT NULL,
    [POLine]          DECIMAL (8)    CONSTRAINT [DF_PODetailChange_POLine] DEFAULT ((0)) NOT NULL,
    [ChangeType]      CHAR (1)       CONSTRAINT [DF_PODetailChange_ChangeType] DEFAULT ('') NOT NULL,
    [PreviousValue]   VARCHAR (20)   CONSTRAINT [DF_PODetailChange_PreviousValue] DEFAULT ('') NOT NULL,
    [NewValue]        VARCHAR (20)   CONSTRAINT [DF_PODetailChange_NewValue] DEFAULT ('') NOT NULL,
    [ReceivingTicket] DECIMAL (6)    CONSTRAINT [DF_PODetailChange_ReceivingTicket] DEFAULT ((0)) NOT NULL,
    [Note]            VARCHAR (1024) CONSTRAINT [DF_PODetailChange_Note] DEFAULT ('') NOT NULL,
    [CreatedBy]       CHAR (4)       NOT NULL,
    [CreatedDate]     DATETIME2 (3)  CONSTRAINT [DF_PODetailChange_CreatedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PODetailChange_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PODetailChange_INDEX02]
    ON [dbo].[PODetailChange]([PONumber] ASC, [POLine] ASC, [ID] ASC);

