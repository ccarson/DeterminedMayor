CREATE TABLE [dimension].[Location] (
    [LocationKey] BIGINT       IDENTITY (1, 1) NOT NULL,
    [City]        VARCHAR (30) NOT NULL,
    [StateName]   CHAR (2)     NOT NULL,
    [Country]     CHAR (2)     NOT NULL,
    [DWTimestamp] DATETIME     DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_Location] PRIMARY KEY CLUSTERED ([LocationKey] ASC)
);

