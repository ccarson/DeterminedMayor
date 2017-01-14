CREATE TABLE [dbo].[PartsHistory] (
    [ID]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [Year]        VARCHAR (4)  CONSTRAINT [DF__PartsHisto__Year__65CF5ED6] DEFAULT (' ') NOT NULL,
    [SprNum]      VARCHAR (20) CONSTRAINT [DF__PartsHist__SprNu__66C3830F] DEFAULT (' ') NOT NULL,
    [JanQuan]     INT          NULL,
    [JanQuanShip] INT          NULL,
    [FebQuan]     INT          NULL,
    [FebQuanShip] INT          NULL,
    [MarQuan]     INT          NULL,
    [MarQuanShip] INT          NULL,
    [AprQuan]     INT          NULL,
    [AprQuanShip] INT          NULL,
    [MayQuan]     INT          NULL,
    [MayQuanShip] INT          NULL,
    [JunQuan]     INT          NULL,
    [JunQuanShip] INT          NULL,
    [JulQuan]     INT          NULL,
    [JulQuanShip] INT          NULL,
    [AugQuan]     INT          NULL,
    [AugQuanShip] INT          NULL,
    [SepQuan]     INT          NULL,
    [SepQuanShip] INT          NULL,
    [OctQuan]     INT          NULL,
    [OctQuanShip] INT          NULL,
    [NovQuan]     INT          NULL,
    [NovQuanShip] INT          NULL,
    [DecQuan]     INT          NULL,
    [DecQuanShip] INT          NULL,
    CONSTRAINT [PartsHistory_INDEX01] PRIMARY KEY CLUSTERED ([SprNum] ASC, [Year] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PartsHistory_INDEX02]
    ON [dbo].[PartsHistory]([Year] ASC, [SprNum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PartsHistory_INDEX03]
    ON [dbo].[PartsHistory]([ID] ASC);

