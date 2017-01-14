
CREATE PROCEDURE
	[dbo].[sasp_LoadBudgetDetail]
( 
		@pBudgetID			int 
	  , @pProjectionType	varchar(10) 
	  , @pProjectionDate	varchar(10)	
	  , @pManagementGroup	varchar(20) 
	  , @pCategory			varchar(20) 
	  , @pSubCategory		varchar(20) 
	  , @pUnits				int 
	  , @pRevenue			int 
)
AS

SET XACT_ABORT, NOCOUNT ON ; 

DECLARE	
	@lBudgetID			int			=	@pBudgetID	
  , @lProjectionDate	date		=	CONVERT( date, @pProjectionDate, 120 ) 
  , @lManagementGroup	varchar(20)	=	@pManagementGroup	
  , @lCategory			varchar(20)
  , @lSubCategory		varchar(20) ; 
  
DECLARE 
	@DetailID			bigint ; 	

/*
	Validate Category
*/
SELECT 
	@lCategory	=	category.CODE
FROM
	dbo.INPRTGRP AS category
WHERE 
	category.CODE = @pCategory ;


/*
	Validate SubCategory
*/
SELECT DISTINCT
	@lSubCategory	=	subcat.SubCategory
FROM
	dbo.PartsSubCategory AS subcat
WHERE 
	subcat.SubCategory = @pSubCategory ;

/*
	SELECT existing budget detail record
*/

SELECT 
	@DetailID = ID
FROM 
	dbo.BudgetDetail
WHERE 
	BudgetID = @lBudgetID 
		AND ProjectionDate	= @lProjectionDate 
		AND ManagementGroup = @lManagementGroup
		AND PartCategory	= @lCategory
		AND PartSubCategory = @lSubCategory ; 

IF( @DetailID IS NOT NULL ) 
	BEGIN
		IF( @pProjectionType = 'UNITS' )
			UPDATE
				dbo.BudgetDetail
			SET
				BudgetUnits = @pUnits
			WHERE 
				ID = @DetailID ; 
		
		IF( @pProjectionType = 'REVENUE' )
			UPDATE
				dbo.BudgetDetail
			SET
				BudgetRevenue = @pRevenue
			WHERE 
				ID = @DetailID ; 		
	END
ELSE
	BEGIN
		INSERT INTO
			dbo.BudgetDetail( 
				BudgetID, ProjectionDate, ManagementGroup
					, PartCategory, PartSubCategory, BudgetUnits, BudgetRevenue )
		SELECT 
			BudgetID			=	@lBudgetID
		  , ProjectionDate		=	@lProjectionDate
		  , ManagementGroup		=	@lManagementGroup
		  , PartCategory		=	ISNULL( @lCategory, 'TBD' )
		  , PartSubCategory		=	ISNULL( @lSubCategory, 'TBD' )
		  , BudgetUnits			=	CASE @pProjectionType 
										WHEN 'UNITS' THEN @pUnits
										ELSE 0 
									END 
		  , BudgetRevenue		=	CASE @pProjectionType 
										WHEN 'REVENUE' THEN @pRevenue
										ELSE 0 
									END 
	END 

RETURN