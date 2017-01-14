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

USE [master]
GO

ALTER DATABASE [$(DatabaseName)]
    SET RECOVERY SIMPLE WITH NO_WAIT ;
GO

--ALTER DATABASE [$(DatabaseName)]
--    MODIFY FILE ( NAME = N'$(DatabaseName)', SIZE = 2048MB , FILEGROWTH = 512MB, MAXSIZE = UNLIMITED ) ;
--GO

--ALTER DATABASE [$(DatabaseName)]
--    MODIFY FILE ( NAME = N'$(DatabaseName)_log', SIZE = 1024MB , MAXSIZE = UNLIMITED, FILEGROWTH = 128MB )
GO

USE [$(DatabaseName)]
GO

/*  Populate dimension.Date table   */

IF NOT EXISTS( SELECT 1 FROM dimension.Date )
BEGIN
    WITH
        cteA AS(
            SELECT
                TOP 40000
                FullDateKey = DATEADD( day, ROW_NUMBER() OVER( ORDER BY ( SELECT NULL ) ), '1949-09-30' )
            FROM
                master.sys.sysobjects A, master.sys.sysobjects B )

    INSERT INTO
        dimension.Date(
            DateKey
          , FullDateKey
          , DisplayDate
          , DayOfMonth
          , DayOfWeek
          , DayOfWeekName
          , MonthName
          , CalendarYear
          , CalendarQuarter
          , CalendarMonth
          , CalendarWeek
          , CalendarDayOfYear
          , FiscalYear
          , FiscalQuarter
          , FiscalMonth
          , FiscalWeek
          , FiscalDayOfYear
          , IsWorkingDay
          , IsWeekday
          , IsHoliday )

    SELECT
        DateKey             =   CONVERT( INT, CONVERT( VARCHAR(10), FullDateKey, 112 ) )
      , FullDateKey         =   FullDateKey
      , DisplayDate         =   CONVERT( VARCHAR(10), FullDateKey, 110 )
      , DayOfMonth          =   DAY( FullDateKey )
      , DayOfWeek           =   DATEPART( weekday, FullDateKey )
      , DayOfWeekName       =   DATENAME( weekday, FullDateKey )
      , MonthName           =   DATENAME( month, FullDateKey )
      , CalendarYear        =   YEAR( FullDateKey )
      , CalendarQuarter     =   DATEPART( quarter, FullDateKey )
      , CalendarMonth       =   MONTH( FullDateKey )
      , CalendarWeek        =   DATEPART( week, FullDateKey )
      , CalendarDayOfYear   =   DATEPART( dayofyear, FullDateKey )
      , FiscalYear          =   CASE
                                    WHEN MONTH( FullDateKey ) > 9 THEN YEAR( FullDateKey ) + 1
                                    ELSE YEAR( FullDateKey )
                                END
      , FiscalQuarter       =   CASE
                                    WHEN MONTH( FullDateKey ) > 9 THEN 1
                                    ELSE DATEPART( quarter, FullDateKey ) + 1
                                END
      , FiscalMonth         =   CASE
                                    WHEN MONTH( FullDateKey ) > 9 THEN MONTH( FullDateKey )  - 9
                                    ELSE MONTH( FullDateKey ) + 3
                                END
      , FiscalWeek          =   CASE
                                    WHEN MONTH( FullDateKey ) > 9 THEN DATEPART( week, FullDateKey ) - DATEDIFF( week, '1/1/' + CAST( YEAR( FullDateKey ) AS CHAR(04) ), '10/1/' + CAST( YEAR( FullDateKey ) AS CHAR(04) ) )
                                    ELSE DATEPART( week, FullDateKey ) + DATEDIFF( week, '10/1/' + CAST( YEAR( FullDateKey ) - 1 AS CHAR(04) ), '12/31/' + CAST( YEAR( FullDateKey ) - 1 AS CHAR(04) ) )
                                END
      , FiscalDayOfYear     =   CASE
                                    WHEN MONTH( FullDateKey ) > 9 THEN DATEPART( dayofyear, FullDateKey ) - DATEDIFF( day, '1/1/' + CAST( YEAR( FullDateKey ) AS CHAR(04) ), '10/1/' + CAST( YEAR( FullDateKey ) AS CHAR(04) ) )
                                    ELSE DATEPART( dayofyear, FullDateKey ) + DATEDIFF( dayofyear, '9/30/' + CAST( YEAR( FullDateKey ) - 1 AS CHAR(04) ), '12/31/' + CAST( YEAR( FullDateKey ) - 1 AS CHAR(04) ) )
                                END
      , IsWorkingDay        =   CASE
                                    WHEN DATENAME( weekday, FullDateKey ) IN ( 'Saturday', 'Sunday' ) THEN 0
                                    ELSE 1
                                END
      , IsWeekday           =   CASE
                                    WHEN DATENAME( weekday, FullDateKey ) IN ( 'Saturday', 'Sunday' ) THEN 0
                                    ELSE 1
                                END
      , IsHoliday           =   0
    FROM
        cteA

    UNION ALL

    SELECT
        DateKey             = 0
      , FullDateKey         = '1900-01-01'
      , DisplayDate         = ''
      , DayOfMonth          = 0
      , DayOfWeek           = 0
      , DayOfWeekName       = ''
      , MonthName           = ''
      , CalendarYear        = 0
      , CalendarQuarter     = 0
      , CalendarMonth       = 0
      , CalendarWeek        = 0
      , CalendarDayOfYear   = 0
      , FiscalYear          = 0
      , FiscalQuarter       = 0
      , FiscalMonth         = 0
      , FiscalWeek          = 0
      , FiscalDayOfYear     = 0
      , IsWorkingDay        = 0
      , IsWeekday           = 0
      , IsHoliday           = 0 ;

END


/*  Populate dimension.Location table   */
IF NOT EXISTS( SELECT 1 FROM dimension.Location )
BEGIN
    SET IDENTITY_INSERT dimension.Location ON ;
    INSERT INTO
        dimension.Location( LocationKey, City, StateName, Country )
    VALUES
        ( 0, '', '', '' ) ;

    SET IDENTITY_INSERT dimension.Location OFF ;
END

GO


/*  Populate dimension.Part table   */
IF NOT EXISTS( SELECT 1 FROM dimension.Part )
BEGIN

    INSERT INTO
        stage.parts
    SELECT * FROM [$(SpringfieldProd)].dbo.parts ;

    INSERT INTO
        stage.Part(
            SourceRecnum
          , SPRNUM
          , SPRDescription
          , LastSoldDate
          , ReorderPointQty
          , FullyStockedQty
          , SafetyStockQty
          , LeadTimeDays
          , UPC
          , GunType
          , GunStock
          , GroupCode
          , ReportingGroup
          , SPRCategory
          , SPRSubCategory
          , VendorIDCode
          , IsTaxable
          , ExciseTaxType
          , IsGunPart
          , BarrelLength
          , HasThreadedBarrel
          , FinishDescription
          , IsSellable
          , PartStatus
          , PartTypeCode
          , PartCategory
          , CapacityCode
          , LocationCode
          , DWChecksum )

    SELECT
        SourceRecnum        =   partData.SourceRecnum
      , SPRNUM              =   partData.SPRNUM
      , SPRDescription      =   partData.SPRDescription
      , LastSoldDate        =   partData.LastSoldDate
      , ReorderPointQty     =   partData.ReorderPointQty
      , FullyStockedQty     =   partData.FullyStockedQty
      , SafetyStockQty      =   partData.SafetyStockQty
      , LeadTimeDays        =   partData.LeadTimeDays
      , UPC                 =   partData.UPC
      , GunType             =   partData.GunType
      , GunStock            =   partData.GunStock
      , GroupCode           =   partData.GroupCode
      , ReportingGroup      =   partData.ReportingGroup
      , SPRCategory         =   partData.SPRCategory
      , SPRSubCategory      =   partData.SPRSubCategory
      , VendorIDCode        =   partData.VendorIDCode
      , IsTaxable           =   partData.IsTaxable
      , ExciseTaxType       =   partData.ExciseTaxType
      , IsGunPart           =   partData.IsGunPart
      , BarrelLength        =   partData.BarrelLength
      , HasThreadedBarrel   =   partData.HasThreadedBarrel
      , FinishDescription   =   partData.FinishDescription
      , IsSellable          =   partData.IsSellable
      , PartStatus          =   partData.PartStatus
      , PartTypeCode        =   partData.PartTypeCode
      , PartCategory        =   partData.PartCategory
      , CapacityCode        =   partData.CapacityCode
      , LocationCode        =   partData.LocationCode
      , DWChecksum          =   partData.DWChecksum
    FROM
        stage.parts AS parts
    CROSS APPLY
        stage.tvf_GetPartData( parts.SPRNUM ) AS partData ;

    EXECUTE dimension.sp_InsertPart ;

END

GO


/*  Populate stage.LastChangeVersion table  */
IF NOT EXISTS( SELECT 1 FROM stage.LastChangeTrackingVersion )
BEGIN

    DECLARE
        @SQL            nvarchar(500) = N'USE [$(SpringfieldProd)]; INSERT INTO #data( CurrentVersion ) SELECT CHANGE_TRACKING_CURRENT_VERSION() '
      , @CurrentVersion bigint ;

    CREATE TABLE
        #data( CurrentVersion bigint ) ;

    EXECUTE( @SQL ) ;

    INSERT INTO
        stage.LastChangeTrackingVersion( LastChangeTrackingVersion )
    SELECT
        LastChangeTrackingVersion   =   CurrentVersion
    FROM
        #data ;

    DROP TABLE #data ;
END

/*  Populate stage.DoNotReportPart table  */
IF NOT EXISTS( SELECT 1 FROM stage.DoNotReportPart )
BEGIN

    INSERT INTO 
		stage.DoNotReportPart(
			SPRNUM, SPRDescription )
	SELECT 
		SPRNUM			=	SPRNUM
	  , SPRDescription	=	[DESC]
	FROM
		[$(SpringfieldProd)].dbo.parts 
	WHERE 
		SPRNUM IN ('NOTE', 'MISCEL') 
			OR SPRNUM LIKE 'RC900%' 
			OR SPRNUM LIKE 'RP900%' 
			OR SPRNUM LIKE 'LA%' 
			OR [DESC] LIKE '%CUTAW%' ; 

END


IF EXISTS( SELECT 1 FROM sys.server_principals WHERE name = 'CA-LAB\CALabSQLService' )
BEGIN
    IF NOT EXISTS( SELECT 1 FROM sys.database_principals WHERE name = 'CA-LAB\CALabSQLService' )
    BEGIN
        CREATE USER [CA-LAB\CALabSQLService] FOR LOGIN [CA-LAB\CALabSQLService] ;
        ALTER ROLE [db_owner] ADD MEMBER [CA-LAB\CALabSQLService] ;
    END
END


IF EXISTS( SELECT 1 FROM sys.server_principals WHERE name = 'NT Service\MSSQLServerOLAPService' )
BEGIN
    IF NOT EXISTS( SELECT 1 FROM sys.database_principals WHERE name = 'NT Service\MSSQLServerOLAPService' )
    BEGIN
        CREATE USER [NT Service\MSSQLServerOLAPService] FOR LOGIN [NT Service\MSSQLServerOLAPService] ;
        ALTER ROLE [db_owner] ADD MEMBER [NT Service\MSSQLServerOLAPService] ;
    END
END


IF EXISTS( SELECT 1 FROM sys.server_principals WHERE name = 'SPRINGFIELD\Dashboard Tripod Users' )
BEGIN
    IF NOT EXISTS( SELECT 1 FROM sys.database_principals WHERE name = 'SPRINGFIELD\Dashboard Tripod Users' )
    BEGIN
        CREATE USER [SPRINGFIELD\Dashboard Tripod Users] FOR LOGIN [SPRINGFIELD\Dashboard Tripod Users] ;
        ALTER ROLE [db_datareader] ADD MEMBER [SPRINGFIELD\Dashboard Tripod Users] ;
    END
END
