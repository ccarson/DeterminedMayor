CREATE TABLE [dbo].[ReceiveSerial] (
    [ID]               BIGINT       IDENTITY (1, 1) NOT NULL,
    [ReceivingTicket]  INT          DEFAULT ((0)) NOT NULL,
    [Serial]           VARCHAR (14) DEFAULT (' ') NOT NULL,
    [SprNum]           VARCHAR (20) DEFAULT (' ') NOT NULL,
    [GunType]          VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [Model]            VARCHAR (10) DEFAULT (' ') NOT NULL,
    [ModelDescription] VARCHAR (35) DEFAULT (' ') NOT NULL,
    [Caliber]          VARCHAR (10) DEFAULT (' ') NOT NULL,
    [SemiOrFullAuto]   VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [Manufacturer]     VARCHAR (10) DEFAULT (' ') NOT NULL,
    [Updated]          VARCHAR (1)  DEFAULT ('N') NOT NULL,
    [Line]             INT          DEFAULT ((0)) NOT NULL,
    CONSTRAINT [ReceiveSerial_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);




GO
CREATE UNIQUE NONCLUSTERED INDEX [ReceiveSerial_INDEX02]
    ON [dbo].[ReceiveSerial]([ReceivingTicket] ASC, [SprNum] ASC, [Serial] ASC);

