CREATE TABLE [dbo].[RAHDR] (
    [Recnum]         BIGINT          IDENTITY (1, 1) NOT NULL,
    [RMA#]           DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [CUST_NAME]      VARCHAR (36)    DEFAULT (' ') NOT NULL,
    [CUSTID]         VARCHAR (10)    DEFAULT (' ') NOT NULL,
    [SPRNUM]         VARCHAR (20)    DEFAULT (' ') NOT NULL,
    [ENTER_DATE]     DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [SERIAL#]        VARCHAR (14)    DEFAULT (' ') NOT NULL,
    [REASON]         VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [COMMENT1]       VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [COMMENT2]       VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [ENT_INIT]       VARCHAR (4)     NOT NULL,
    [REC_DATE]       DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [REC_INIT]       VARCHAR (3)     DEFAULT (' ') NOT NULL,
    [OTHER_PARTS]    VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [CALL_TAG]       DECIMAL (8)     DEFAULT ((0)) NOT NULL,
    [COMPLETE_DATE]  DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [ACKNOWL_DATE]   DATETIME        DEFAULT ('01/01/1753') NOT NULL,
    [CALL_FLAG]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [DONE_FLAG]      VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [ORDNUM]         DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [FEDEXTRACKING]  VARCHAR (50)    DEFAULT (' ') NOT NULL,
    [Description]    VARCHAR (MAX)   NULL,
    [TotBillHours]   DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [TotWarrHours]   DECIMAL (8, 2)  DEFAULT ((0)) NOT NULL,
    [Product]        VARCHAR (25)    DEFAULT (' ') NOT NULL,
    [ReceiveTicket]  DECIMAL (6)     DEFAULT ((0)) NOT NULL,
    [CustNotes]      VARCHAR (MAX)   NULL,
    [InternalNotes]  VARCHAR (MAX)   NULL,
    [CompleteGun]    VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [LawEnforcement] VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [ShipEmail]      VARCHAR (100)   DEFAULT (' ') NOT NULL,
    [ShipMethod]     VARCHAR (40)    DEFAULT (' ') NOT NULL,
    [ProdType]       VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [CreatedBy]      VARCHAR (4)     NULL,
    [CreatedDate]    DATE            NULL,
    [ChangedBy]      VARCHAR (4)     NULL,
    [ChangedDate]    DATE            NULL,
    [Version]        VARCHAR (15)    NULL,
    [LabelURL]       VARCHAR (150)   NULL,
    [URLUser]        VARCHAR (30)    NULL,
    [URLPassword]    VARCHAR (30)    NULL,
    CONSTRAINT [RAHDR_INDEX01] PRIMARY KEY CLUSTERED ([RMA#] ASC) 
);
GO

CREATE UNIQUE NONCLUSTERED INDEX [RAHDR_INDEX00]
    ON [dbo].[RAHDR]([Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [RAHDR_INDEX02]
    ON [dbo].[RAHDR]([CUST_NAME] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [RAHDR_INDEX03]
    ON [dbo].[RAHDR]([CALL_TAG] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [RAHDR_INDEX04]
    ON [dbo].[RAHDR]([CUSTID] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [RAHDR_INDEX05]
    ON [dbo].[RAHDR]([SPRNUM] ASC, [Recnum] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [RAHDR_INDEX06]
    ON [dbo].[RAHDR]([SERIAL#] ASC, [RMA#] ASC) ;
GO

CREATE UNIQUE NONCLUSTERED INDEX [RAHDR_INDEX07]
    ON [dbo].[RAHDR]([FEDEXTRACKING] ASC, [RMA#] ASC) ;
