CREATE TABLE [dbo].[SecViews] (
    [Recnum]     BIGINT        IDENTITY (1, 1) NOT NULL,
    [ViewName]   VARCHAR (100) DEFAULT (' ') NOT NULL,
    [Desc]       VARCHAR (50)  DEFAULT (' ') NOT NULL,
    [ActivateIt] VARCHAR (50)  DEFAULT (' ') NOT NULL,
    [Note]       VARCHAR (MAX) NULL,
    CONSTRAINT [SecViews_INDEX01] PRIMARY KEY CLUSTERED ([ViewName] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [SecViews_INDEX00]
    ON [dbo].[SecViews]([Recnum] ASC) WITH (FILLFACTOR = 70);

