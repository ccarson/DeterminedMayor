


CREATE VIEW 
	[dbo].[vwBudgetDetails]
AS
SELECT       
	BudgetID		=	hdr.ID 
  , DetailID		=	dtl.ID 
  , BudgetName
  , ShortName
  , Description
  , ActiveScenario
  , CreatedBy
  , CreatedOn
  , UpdatedOn
  , ProjectionDate
  , ManagementGroup
  , PartCategory
  , PartSubCategory
  , BudgetUnits
  , BudgetRevenue
FROM
	dbo.BudgetHeader AS hdr 
INNER JOIN
	dbo.BudgetDetail AS dtl 
		ON dtl.BudgetID = hdr.ID 
;
