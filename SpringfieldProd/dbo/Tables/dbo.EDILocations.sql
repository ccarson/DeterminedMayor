CREATE TABLE [dbo].[EDILocations] (
    [ID]               BIGINT        IDENTITY (1, 1) NOT NULL,
    [TradingPartnerID] VARCHAR (20)  CONSTRAINT [DF__EDILocati__Tradi__4ADC3CCF] DEFAULT (' ') NOT NULL,
    [LocationNumber]   VARCHAR (10)  CONSTRAINT [DF__EDILocati__Locat__4BD06108] DEFAULT (' ') NOT NULL,
    [CustID]           VARCHAR (10)  NULL,
    [EmailPL]          VARCHAR (100) NULL,
    CONSTRAINT [EDILocations_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);








GO
CREATE UNIQUE NONCLUSTERED INDEX [EDILocations_INDEX02]
    ON [dbo].[EDILocations]([TradingPartnerID] ASC, [LocationNumber] ASC);





