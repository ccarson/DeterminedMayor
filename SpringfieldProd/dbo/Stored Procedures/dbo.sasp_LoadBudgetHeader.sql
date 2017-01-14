
CREATE PROCEDURE
	[dbo].[sasp_LoadBudgetHeader]
( 
		@pScenarioName	varchar(30) 
	  , @pShortName		varchar(10) 
	  , @pDescription	varchar(50) 
	  , @pCreatedBy		varchar(20) 
	  , @pIsActive		varchar(05) 
	  , @pBudgetID		int OUTPUT
)
AS

SET XACT_ABORT, NOCOUNT ON ; 

/*
	Determine whether scenario exists
*/

IF EXISTS( SELECT 1 FROM dbo.BudgetHeader WHERE BudgetName = @pScenarioName )
	BEGIN
		SELECT @pBudgetID = ID FROM dbo.BudgetHeader WHERE BudgetName = @pScenarioName

		UPDATE
			dbo.BudgetHeader
		SET
			ShortName		=	@pShortName		
		  , Description		=	@pDescription	
		  , ActiveScenario	=	CASE @pIsActive		
									WHEN 'Yes' THEN 1 
									WHEN 'No' THEN 0
								END
		  , UpdatedOn		=	GETDATE() 		
		WHERE 
			ID = @pBudgetID	; 

	END 
ELSE
	BEGIN 
		INSERT INTO
			dbo.BudgetHeader( 
				BudgetName, ShortName, Description, ActiveScenario, CreatedBy )
		SELECT 
			BudgetName		=	@pScenarioName	
		  , ShortName		=	@pShortName		
		  , Description		=	@pDescription	
		  , ActiveScenario	=	CASE @pIsActive
									WHEN 'Yes' THEN 1 
									WHEN 'No' THEN 0 
								END 
		  , CreatedBy 		=	@pCreatedBy	; 

		  SELECT @pBudgetID = @@IDENTITY ;
	END

/*
	If @pIsActive is set to 'Yes', remove active indicator from any other scenarios
*/

UPDATE
	dbo.BudgetHeader
SET
	ActiveScenario	=	0 
WHERE 
	@pIsActive = 'Yes' 
		AND ID != @pBudgetID ; 

/*
	Remove budget details for corresponding budgetID 
*/

DELETE
	dbo.BudgetDetail
WHERE
	BudgetID = @pBudgetID ;


RETURN

