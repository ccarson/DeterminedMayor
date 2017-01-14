CREATE TABLE [dbo].[CustWOMain] (
    [CustWONum]   BIGINT        IDENTITY (1, 1) NOT NULL,
    [NumReceived] TINYINT       NULL,
    [Note]        VARCHAR (512) NULL,
    [Type]        VARCHAR (1)   NULL,
    CONSTRAINT [CustWOMain_INDEX01] PRIMARY KEY CLUSTERED ([CustWONum] ASC)
);

