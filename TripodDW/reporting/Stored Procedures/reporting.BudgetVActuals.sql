CREATE PROCEDURE 
	reporting.BudgetVActuals(
		@pBudgetKey			int
	  , @pReportingGroup	varchar(20)	=	''
	  , @pManagementGroup	varchar(20)	=	''
	  , @pStartMonth		varchar(10)
	  , @pEndMonth			varchar(10) )
AS 

SET NOCOUNT, XACT_ABORT ON ;

IF OBJECT_ID('tempdb..#shipments') IS NOT NULL
	DROP TABLE #shipments

SELECT
	ShipDate			=	CONVERT( int, LEFT( CONVERT( varchar(08), co.ShipDateKey), 6 ) + '01' )
  , Units				=	SUM( co.ShippedQuantity )
  , Revenue				=	SUM( co.ShippedQuantity * co.UnitPrice )
  , ReportingGroup		=   CASE 
								WHEN p.ReportingGroup LIKE 'M1%-%' THEN 'M1A-MR'
								WHEN p.ReportingGroup LIKE 'AR%-%' THEN 'AR-R'
								WHEN p.SPRSubCategory != ''  THEN sc.Category
								ELSE 'Non-Firearms'
							END
  , SPRSubCategory		=	CASE 
								WHEN p.SPRSubCategory != ''  THEN sc.SubCategory 
								ELSE ''
							END
INTO 
	#shipments
FROM
	fact.CustomerOrder AS co
INNER JOIN
	dimension.Part as p 
		ON p.PartKey = co.PartKey
LEFT OUTER JOIN
	[$(SpringfieldProd)].dbo.PartsSubCategory AS sc
		ON sc.Category = p.ReportingGroup
			AND sc.Description = p.SPRSubCategory
GROUP BY
	CONVERT( int, LEFT( CONVERT( varchar(08), co.ShipDateKey), 6 ) + '01' )	
  , CASE 
		WHEN p.ReportingGroup LIKE 'M1%-%' THEN 'M1A-MR'
		WHEN p.ReportingGroup LIKE 'AR%-%' THEN 'AR-R'
		WHEN p.SPRSubCategory != ''  THEN sc.Category
		ELSE 'Non-Firearms'
	END
  , CASE 
		WHEN p.SPRSubCategory != ''  THEN sc.SubCategory 
		ELSE ''
	END ;

WITH
	projections AS( 
		SELECT 
			ProjectionDateKey
		  , ReportingGroup		=	CASE ReportingGroup
		  								WHEN '' THEN 'Non-Firearms'
		  								WHEN 'M1A-R' THEN 'M1A-MR'
		  								WHEN 'M1-R' THEN 'M1A-MR'
										WHEN 'AR-P' THEN 'AR-R'
		  								ELSE ReportingGroup
		  							END
		  , ManagementGroup		=	CASE ReportingGroup 
										WHEN '' THEN 'Misc/Accessories'
		  								ELSE ManagementGroup
									END
		  , SPRSubCategory		=	CASE ReportingGroup 
										WHEN '' THEN ''
		  								ELSE SPRSubCategory
									END
		  , ProjectedUnits		=	SUM( BudgetUnits )
		  , ProjectedRevenue	=	SUM( BudgetRevenue ) 
		FROM 
			fact.ForecastOrder
		WHERE 
			BudgetKey = @pBudgetKey
		GROUP BY 
			ProjectionDateKey
		  , CASE ReportingGroup
				WHEN '' THEN 'Non-Firearms'
				WHEN 'M1A-R' THEN 'M1A-MR'
				WHEN 'M1-R' THEN 'M1A-MR'
				WHEN 'AR-P' THEN 'AR-R'
				ELSE ReportingGroup
			END

		  , CASE ReportingGroup 
				WHEN '' THEN 'Misc/Accessories'
		  		ELSE ManagementGroup
			END
		  , CASE ReportingGroup 
				WHEN '' THEN ''
		  		ELSE SPRSubCategory
			END  ) 


SELECT 
	ProjectionDateKey 
  , SortOrder					=	CASE ReportingGroup 
										WHEN	'XD-P'			THEN 1 
										WHEN	'1911-P'		THEN 2
										WHEN	'CUST-P'		THEN 3 
										WHEN	'M1A-MR'		THEN 4
										WHEN	'AR-R'			THEN 5 
										WHEN	'Non-Firearms'	THEN 6 
									END		
  , ReportingGroup 
  , ManagementGroup
  , ManagementGroupSortOrder	=	CASE ManagementGroup
										WHEN	'XD'			THEN 1
										WHEN	'Milspec / RO'	THEN 1
										WHEN	'XDM'			THEN 2
										WHEN	'XDS'			THEN 3
										WHEN	'XDG'			THEN 4
										WHEN	'XDE'			THEN 5
										WHEN	'TRP/EMP/MC'	THEN 2
										WHEN	'1911 - .22'	THEN 3
										WHEN	'1911 - .380'	THEN 4
										WHEN	'SAINT V1'		THEN 1
										WHEN	'SAINT V2'		THEN 2
										WHEN	'M1A'			THEN 1
										WHEN	'M1 Garand'		THEN 2
										ELSE 1
									END
  , SPRSubCategory
  , ProjectedUnits
  , ProjectedRevenue
  , ActualUnits		=	ISNULL( ActualUnits	, 0 )
  , ActualRevenue	=	ISNULL( ActualRevenue , 0 ) 		
FROM 
	projections as p
OUTER APPLY( 
	SELECT 
		ActualUnits = sum( Units ) 
	  , ActualRevenue = sum( Revenue )
	FROM 
		#shipments as s
	WHERE 
		s.ShipDate = p.ProjectionDateKey
			AND s.ReportingGroup = p.ReportingGroup 
				AND s.SPRSubCategory = p.SPRSubCategory 
			) as a
WHERE 
	p.ReportingGroup != 'Non-Firearms'
		AND	( 
				ISNULL( NULLIF( @pReportingGroup, '' ), p.ReportingGroup ) = p.ReportingGroup
					OR
				ISNULL(	NULLIF( @pReportingGroup, ' - All Groups - ' ), p.ReportingGroup ) = p.ReportingGroup
					OR
				ISNULL( NULLIF( @pReportingGroup, ' - All Firearms - ' ), p.ReportingGroup ) = p.ReportingGroup
			)
		AND p.ManagementGroup = ISNULL( NULLIF( @pManagementGroup, '' ), p.ManagementGroup )
		AND p.ProjectionDateKey BETWEEN @pStartMonth and @pEndMonth 
		
UNION

SELECT DISTINCT
	ProjectionDateKey 
  , SortOrder					=	CASE ReportingGroup 
										WHEN 'XD-P'			THEN 1 
										WHEN '1911-P'		THEN 2
										WHEN 'CUST-P'		THEN 3 
										WHEN 'M1A-MR'		THEN 4
										WHEN 'AR-R'			THEN 5 
										WHEN 'Non-Firearms' THEN 6 
									END		
  , ReportingGroup 
  , ManagementGroup				=	'Misc / Accessories'
  , ManagementGroupSortOrder	=	1
  , SPRSubCategory				=	''
  , ProjectedUnits
  , ProjectedRevenue
  , ActualUnits					=	0
  , ActualRevenue				=	ISNULL( ActualRevenue , 0 ) 		
FROM 
	projections as p
OUTER APPLY( 
	SELECT DISTINCT  
		ActualRevenue = Revenue
	FROM 
		#shipments as s
	WHERE 
		s.ShipDate = p.ProjectionDateKey
			AND s.ReportingGroup = p.ReportingGroup 
			) as a
WHERE 
	p.ReportingGroup = 'Non-Firearms'
		AND	( 
				ISNULL( NULLIF( @pReportingGroup, '' ), p.ReportingGroup ) = p.ReportingGroup
					OR
				ISNULL(	NULLIF( @pReportingGroup, ' - All Groups - ' ), p.ReportingGroup ) = p.ReportingGroup
			)		
		AND p.ProjectionDateKey BETWEEN @pStartMonth and @pEndMonth 
;
