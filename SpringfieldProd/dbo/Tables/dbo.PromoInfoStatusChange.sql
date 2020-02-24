CREATE TABLE [dbo].[PromoInfoStatusChange] (
    [ID]             BIGINT          IDENTITY (1, 1) NOT NULL,
    [PromoInfoID]    BIGINT          CONSTRAINT [DF_PromoInfoStatusChange_PromoInfoID] DEFAULT ((0)) NOT NULL,
    [FirstName]      VARCHAR (30)    CONSTRAINT [DF_PromoInfoStatusChange_FirstName] DEFAULT ('') NOT NULL,
    [LastName]       VARCHAR (50)    CONSTRAINT [DF_PromoInfoStatusChange_LastName] DEFAULT ('') NOT NULL,
    [Email]          VARCHAR (100)   NULL,
    [DateSubmitted]  DATETIME        NULL,
    [SubmissionType] VARCHAR (1)     CONSTRAINT [DF_PromoInfoStatusChange_SubmissionType] DEFAULT ('') NOT NULL,
    [SerialNumber]   VARCHAR (14)    CONSTRAINT [DF_PromoInfoStatusChange_SerialNumber] DEFAULT ('') NOT NULL,
    [SprNum]         VARCHAR (20)    NULL,
    [OrdNum]         NUMERIC (10, 2) CONSTRAINT [DF_PromoInfoStatusChange_OrdNum] DEFAULT ((0)) NOT NULL,
    [BillName]       VARCHAR (50)    CONSTRAINT [DF_PromoInfoStatusChange_BillName] DEFAULT ('') NOT NULL,
    [OrderTotal]     NUMERIC (10, 2) NULL,
    [CardNum]        VARCHAR (19)    NULL,
    [CardKind]       VARCHAR (1)     NULL,
    [CCToken]        VARCHAR (25)    NULL,
    [AVSResult]      VARCHAR (1)     NULL,
    [AvaStatus]      VARCHAR (20)    NULL,
    [AvaType]        VARCHAR (20)    NULL,
    [PrevStatus]     CHAR (1)        CONSTRAINT [DF_PromoInfoStatusChange_PrevStatus] DEFAULT ('') NOT NULL,
    [NewStatus]      CHAR (1)        CONSTRAINT [DF_PromoInfoStatusChange_NewStatus] DEFAULT ('') NOT NULL,
    [ChangeTime]     DATETIME2 (7)   DEFAULT (getdate()) NOT NULL,
    [ChangeUser]     NVARCHAR (128)  NULL,
    CONSTRAINT [PromoInfoStatusChange_INDEX01] PRIMARY KEY CLUSTERED ([PromoInfoID] ASC, [ChangeTime] DESC, [ID] ASC) WITH (FILLFACTOR = 90)
);


GO
CREATE NONCLUSTERED INDEX [PromoInfoStatusChange_INDEX02]
    ON [dbo].[PromoInfoStatusChange]([ChangeTime] DESC, [PromoInfoID] ASC, [ID] ASC);

