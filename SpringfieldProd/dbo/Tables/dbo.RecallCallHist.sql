﻿CREATE TABLE [dbo].[RecallCallHist] (
    [RECNUM]      BIGINT         IDENTITY (1, 1) NOT NULL,
    [ID]          BIGINT         CONSTRAINT [DF__RecallCallHi__ID__28865974] DEFAULT ((0)) NOT NULL,
    [CUSTID]      BIGINT         CONSTRAINT [DF__RecallCal__CUSTI__297A7DAD] DEFAULT ((0)) NOT NULL,
    [INITIALS]    VARCHAR (10)   CONSTRAINT [DF__RecallCal__INITI__2A6EA1E6] DEFAULT (' ') NOT NULL,
    [CALL_DATE]   DATETIME       CONSTRAINT [DF_RecallCallHist_CALL_DATE] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [CALL_NOTES]  VARCHAR (1008) NULL,
    [CALL_TYPE]   VARCHAR (10)   CONSTRAINT [DF__RecallCal__CALL___2C56EA58] DEFAULT (' ') NOT NULL,
    [FOLLOW_DATE] DATETIME       CONSTRAINT [DF_RecallCallHist_FOLLOW_DATE] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    CONSTRAINT [RecallCallHist_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_RecallCallHist_CUSTID] FOREIGN KEY ([CUSTID]) REFERENCES [dbo].[RecallDealer] ([CUSTID])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallCallHist_INDEX00]
    ON [dbo].[RecallCallHist]([RECNUM] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallCallHist_INDEX02]
    ON [dbo].[RecallCallHist]([CUSTID] ASC, [CALL_DATE] DESC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallCallHist_INDEX03]
    ON [dbo].[RecallCallHist]([CUSTID] ASC, [CALL_DATE] ASC, [INITIALS] ASC, [CALL_TYPE] ASC, [ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [RecallCallHist_INDEX04]
    ON [dbo].[RecallCallHist]([FOLLOW_DATE] ASC, [INITIALS] ASC, [ID] ASC) WITH (FILLFACTOR = 70);

