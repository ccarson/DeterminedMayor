CREATE TABLE [dbo].[Employment] (
    [IDX]         INT           IDENTITY (1, 1) NOT NULL,
    [JobTitle]    VARCHAR (50)  NOT NULL,
    [StartDate]   DATETIME      NOT NULL,
    [EndDate]     DATETIME      NOT NULL,
    [Description] TEXT          NOT NULL,
    [Filename]    VARCHAR (100) NOT NULL
);

