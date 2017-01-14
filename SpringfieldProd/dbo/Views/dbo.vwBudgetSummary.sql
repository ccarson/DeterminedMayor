


CREATE VIEW 
	[dbo].[vwBudgetSummary]
AS
SELECT 
	BudgetID		=	hdr.ID 
  , BudgetName
  , ShortName
  , Description
  , ActiveScenario
  , CreatedBy
  , CreatedOn
  , UpdatedOn
  , ManagementGroup
  , ProjectionDate
  , BudgetUnits		=	Sum( BudgetUnits )
  , BudgetRevenue	=	Sum( BudgetRevenue )
FROM
	dbo.BudgetHeader AS hdr 
INNER JOIN
	dbo.BudgetDetail AS dtl 
		ON dtl.BudgetID = hdr.ID 
GROUP BY 
	hdr.ID 
  , BudgetName
  , ShortName
  , Description
  , ActiveScenario
  , CreatedBy
  , CreatedOn
  , UpdatedOn
  , ProjectionDate
  , ManagementGroup
;