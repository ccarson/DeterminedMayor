
CREATE PROCEDURE
	[dbo].[sasp_LoadBudgetTripod]
AS

SET XACT_ABORT, NOCOUNT ON ; 

DELETE 
	[$(TripodDW)].dimension.Budget 

INSERT INTO	
	[$(TripodDW)].dimension.Budget( 
		BudgetKey, BudgetName, ShortName, Description, IsActive, CreatedBy, CreatedOn, UpdatedOn )
SELECT
	BudgetKey	=	ID
  , BudgetName	=	BudgetName
  , ShortName	=	ShortName
  , Description	=	Description
  , IsActive	=	CASE ActiveScenario WHEN 1 THEN 'Y' ELSE 'N' END
  , CreatedBy	=	CreatedBy
  , CreatedOn	=	CreatedOn
  , UpdatedOn	=	UpdatedOn
FROM
	dbo.BudgetHeader ;

TRUNCATE TABLE 
	[$(TripodDW)].fact.ForecastOrder ;

INSERT INTO 
	[$(TripodDW)].fact.ForecastOrder( 
		BudgetKey, ProjectionDateKey, ManagementGroup, ReportingGroup, SPRSubCategory, BudgetUnits, BudgetRevenue )
SELECT
	BudgetKey			=	BudgetID
  , ProjectionDateKey	=	CONVERT( int, CONVERT( varchar(08), ProjectionDate, 112 ) )
  , ManagementGroup		=	ManagementGroup
  , ReportingGroup		=	PartCategory
  , SPRSubCategory		=	PartSubCategory
  , BudgetUnits			=	BudgetUnits
  , BudgetRevenue		=	BudgetRevenue
FROM
	dbo.BudgetDetail ;
  

RETURN