CREATE TABLE [dbo].[QARejectionDefectSubCategory] (
    [ID]                     BIGINT       IDENTITY (1, 1) NOT NULL,
    [DefectCode]             VARCHAR (10) CONSTRAINT [DF_QARejectionDefectSubCategory_DefectCode] DEFAULT ('') NOT NULL,
    [SubCategory]            VARCHAR (10) CONSTRAINT [DF_QARejectionDefectSubCategory_SubCategory] DEFAULT ('') NOT NULL,
    [SubCategoryDescription] VARCHAR (30) CONSTRAINT [DF_QARejectionDefectSubCategory_SubCategoryDescription] DEFAULT ('') NOT NULL,
    CONSTRAINT [QARejectionDefectSubCategory_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [QARejectionDefectSubCategory_INDEX02]
    ON [dbo].[QARejectionDefectSubCategory]([DefectCode] ASC, [SubCategory] ASC);

