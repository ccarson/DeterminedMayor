CREATE TABLE [dbo].[SecSigners] (
    [Login]        VARCHAR (10)  DEFAULT (' ') NOT NULL,
    [User_Name]    VARCHAR (25)  NULL,
    [Graphic_Name] VARCHAR (100) NULL,
    CONSTRAINT [SecSigners_INDEX01] PRIMARY KEY CLUSTERED ([Login] ASC) WITH (FILLFACTOR = 100)
);

