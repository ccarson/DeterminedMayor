/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/*

Populate dimension.Date table

*/

IF NOT EXISTS( SELECT 1 FROM dimension.Date ) 
BEGIN 
	DECLARE 
		@startdate	date = '2014-01-01'
	  , @enddate	date = '2018-12-31' ;

	DECLARE 
		@datelist	table(	FullDate	date ) ; 

	WHILE	@startdate <= @enddate
	BEGIN 
		INSERT INTO @datelist SELECT @startdate ;
		SELECT @startdate = DATEADD( dd, 1 , @startdate ) ;
	END 

	INSERT INTO 
		dimension.Date( 
			DateKey
		  , FullDateAlternateKey
		  , DayNumberOfWeek
		  , DayNameOfWeek
		  , DayNumberOfMonth
		  , DayNumberOfYear
		  , WeekNumberOfYear
		  , MonthName
		  , MonthNumberOfYear
		  , CalendarQuarter
		  , CalendarYear 
		  , FiscalQuarter
		  , FiscalYear
		  , DisplayDate ) 
	
	SELECT 
		DateKey					= CONVERT( INT, CONVERT( VARCHAR, dl.FullDate, 112 ) ) 
	  , FullDateAlternateKey	= dl.FullDate
	  , DayNumberOfWeek			= DATEPART( dw, dl.FullDate )
	  , DayNameOfWeek			= DATENAME( weekday, dl.FullDate ) 
      , DayNumberOfMonth		= DATEPART( d, dl.FullDate )		
      , DayNumberOfYear			= DATEPART( dy, dl.FullDate )		
      , WeekNumberOfYear		= DATEPART( wk, dl.FUllDate )		
      , EnglishMonthName		= DATENAME( MONTH, dl.FullDate )	
	  , MonthNumberOfYear		= MONTH( dl.FullDate ) 
	  , CalendarQuarter			= DATEPART( qq, dl.FullDate ) 
	  , CalendarYear			= YEAR( dl.FullDate ) 
	  , FiscalQuarter			= DATEPART( qq, dl.FullDate ) 
	  , FiscalYear				= YEAR( dl.FullDate ) 
	  , DisplayDate				= CONVERT( VARCHAR(10), dl.FullDate, 110 )
	FROM 
		@datelist AS dl ; 

	INSERT INTO 
		dimension.Date( 
			DateKey
		  , FullDateAlternateKey
		  , DayNumberOfWeek
		  , DayNameOfWeek
		  , DayNumberOfMonth
		  , DayNumberOfYear
		  , WeekNumberOfYear
		  , MonthName
		  , MonthNumberOfYear
		  , CalendarQuarter
		  , CalendarYear 
		  , FiscalQuarter
		  , FiscalYear
		  , DisplayDate ) 
	
	SELECT 
		DateKey					= 99999999 
	  , FullDateAlternateKey	= '1900-01-01'
	  , DayNumberOfWeek			= 0
	  , DayNameOfWeek			= 'Unknown'
      , DayNumberOfMonth		= 0
      , DayNumberOfYear			= 0	
      , WeekNumberOfYear		= 0	
      , EnglishMonthName		= 'Unknown'
	  , MonthNumberOfYear		= 0
	  , CalendarQuarter			= 0 
	  , CalendarYear			= 0
	  , FiscalQuarter			= 0 
	  , FiscalYear				= 0
	  , DisplayDate				= 'Unknown' ;

END


/*

Populate dimension.Location table

*/
IF NOT EXISTS( SELECT 1 FROM dimension.Location )
BEGIN
	SET IDENTITY_INSERT dimension.Location ON ;
	INSERT INTO
		dimension.Location( LocationKey, City, StateName, Country )
	VALUES
		( 0, '', '', '' ) ;

	SET IDENTITY_INSERT dimension.Location OFF ;
	
	INSERT INTO
		dimension.Location( City, StateName, Country )
	SELECT 
		City		=	LTRIM( RTRIM( ISNULL( SCity, '' ) ) ) 
	  ,	StateName	=	ISNULL( SState, '' )
	  , Country		=	CASE ISNULL( SCountry, '' ) 
							WHEN '' THEN 'US'
							ELSE SCountry 
						END
	FROM 
		[$(SpringfieldProd)].dbo.CUSTINFO
	WHERE
		[DATE] > '2014-01-01' 
			AND LTRIM( RTRIM( ISNULL( SCity, '' ) ) )  != '' 
			AND ISNULL( SState, '' ) != ''
	UNION
	SELECT 
		City		=	LTRIM( RTRIM( BCity ) )
	  , StateName	=	BState
	  , Country		=	ISNULL( NULLIF( LEFT( LTRIM( RTRIM( COUNTRY ) ), 2 ), '' ), 'US' )
	FROM 
		[$(SpringfieldProd)].dbo.CMASTER
	WHERE
		LTRIM( RTRIM( BCity ) )  != '' 
			AND BState != ''
			AND CUSTID IN( SELECT SCUSTID FROM [$(SpringfieldProd)].dbo.CUSTINFO WHERE [DATE] > '2014-01-01'
							UNION
						   SELECT BCUSTID FROM [$(SpringfieldProd)].dbo.CUSTINFO WHERE [DATE] > '2014-01-01' )
	ORDER BY 
		City, StateName, Country ; 
END
GO


/*

Populate dimension.Customer table


IF NOT EXISTS( SELECT 1 FROM dimension.Customer )
BEGIN
	INSERT INTO
		dimension.Customer( CustomerID, CustomerName )
	SELECT 
		CustomerID		=	CMASTER.CUSTID
	  ,	CustomerName	=	CMASTER.BNAME

	FROM 
		[$(SpringfieldProd)].dbo.CMASTER
	INNER JOIN 
		[$(SpringfieldProd)].dbo.CUSTINFO ON CUSTINFO.SCUSTID = CMASTER.CUSTID 
			UNION
	SELECT 
		CustomerID		=	CMASTER.CUSTID
	  ,	CustomerName	=	CMASTER.BNAME

	FROM 
		[$(SpringfieldProd)].dbo.CMASTER
	INNER JOIN 
		[$(SpringfieldProd)].dbo.CUSTINFO ON CUSTINFO.BCUSTID = CMASTER.CUSTID 
END
GO
*/
/*

Populate stage.LastChangeVersion table

*/
DECLARE 
	@SQL			nvarchar( 500 ) = N'USE [$(SpringfieldProd)]; INSERT INTO #data( CurrentVersion ) SELECT CHANGE_TRACKING_CURRENT_VERSION() '
  , @CurrentVersion	bigint ; 

IF NOT EXISTS( SELECT 1 FROM stage.LastChangeVersion )
BEGIN
	CREATE TABLE 
		#data( CurrentVersion bigint ) ; 

	EXEC( @SQL ) ; 

	SELECT @CurrentVersion = CurrentVersion FROM #data ;

	INSERT INTO 
		stage.LastChangeVersion
	SELECT
		ID = 1 
	  , SourceTableName = N'CUSTINFO'
	  , SourceSchemaName = N'dbo'
	  , LastChangeVersionID = ISNULL( @CurrentVersion, 0 ) 
	  , CurrentStageVersion = NULL
			UNION
	SELECT
		ID = 2
	  , SourceTableName = N'MASTERLN'
	  , SourceSchemaName = N'dbo'
	  , LastChangeVersionID = ISNULL( @CurrentVersion, 0 ) 
	  , CurrentStageVersion = NULL
			UNION
	SELECT
		ID = 3 
	  , SourceTableName = N'CMASTER'
	  , SourceSchemaName = N'dbo'
	  , LastChangeVersionID = ISNULL( @CurrentVersion, 0 ) 
	  , CurrentStageVersion = NULL ;

	DROP TABLE #data ; 
		
END
GO

IF EXISTS( SELECT 1 FROM sys.server_principals WHERE name = 'CA-UNUA\SQLSSASService' ) 
BEGIN 
	IF NOT EXISTS( SELECT 1 FROM sys.database_principals WHERE name = 'CA-UNUA\SQLSSASService' ) 
	BEGIN 
		CREATE USER [CA-UNUA\SQLSSASService] FOR LOGIN [CA-UNUA\SQLSSASService] ;
		ALTER ROLE [db_owner] ADD MEMBER [CA-UNUA\SQLSSASService] ;
	END
END
