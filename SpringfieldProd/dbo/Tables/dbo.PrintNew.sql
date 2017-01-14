CREATE TABLE [dbo].[PrintNew] (
    [Recnum]  BIGINT          IDENTITY (1, 1) NOT NULL,
    [OrdNum]  DECIMAL (10, 2) DEFAULT ((0)) NOT NULL,
    [Type]    VARCHAR (1)     DEFAULT (' ') NOT NULL,
    [Printed] VARCHAR (1)     DEFAULT (' ') NOT NULL,
    CONSTRAINT [PrintNew_INDEX01] PRIMARY KEY CLUSTERED ([OrdNum] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PrintNew_INDEX00]
    ON [dbo].[PrintNew]([Recnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PrintNew_INDEX02]
    ON [dbo].[PrintNew]([Type] ASC, [OrdNum] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PrintNew_INDEX03]
    ON [dbo].[PrintNew]([Printed] ASC, [Type] ASC, [OrdNum] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE NONCLUSTERED INDEX [PrintNew_INDEX04]
    ON [dbo].[PrintNew]([Printed] ASC, [Recnum] ASC);

