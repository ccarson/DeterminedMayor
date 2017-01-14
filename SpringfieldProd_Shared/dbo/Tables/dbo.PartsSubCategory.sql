CREATE TABLE [dbo].[PartsSubCategory] (
    [ID]            BIGINT        IDENTITY (1, 1) NOT NULL,
    [Category]      VARCHAR (6)   CONSTRAINT [DF__PartsSubC__Categ__21EF35D5] DEFAULT (' ') NOT NULL,
    [SubCategory]   VARCHAR (10)  CONSTRAINT [DF__PartsSubC__SubCa__22E35A0E] DEFAULT (' ') NOT NULL,
    [Description]   VARCHAR (30)  NULL,
    [ImageFileName] VARCHAR (100) NULL,
    CONSTRAINT [PartsSubCategory_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC),
    CONSTRAINT [FK_PartsSubCategory_Category] FOREIGN KEY ([Category]) REFERENCES [dbo].[INPRTGRP] ([CODE])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PartsSubCategory_INDEX02]
    ON [dbo].[PartsSubCategory]([Category] ASC, [SubCategory] ASC);

