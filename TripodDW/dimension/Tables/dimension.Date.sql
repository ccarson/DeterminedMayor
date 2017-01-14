CREATE TABLE 
	dimension.Date(
		DateKey						BIGINT       	NOT NULL
			CONSTRAINT pk_Date PRIMARY KEY CLUSTERED
      , FullDateKey       			DATE         	NOT NULL
      , DisplayDate       			VARCHAR(10) 	NOT NULL
      , DayOfMonth        			TINYINT      	NOT NULL
      , DayOfWeek         			TINYINT      	NOT NULL
      , DayOfWeekName     			VARCHAR(10) 	NOT NULL
      , MonthName         			VARCHAR(10) 	NOT NULL
	  , MonthShortName				AS	LEFT( MonthName, 3 )    
      , CalendarYear      			SMALLINT     	NOT NULL
      , CalendarQuarter   			TINYINT      	NOT NULL
      , CalendarQuarterName			AS 	CONVERT( CHAR(04), CalendarYear ) + ' - Q' + CONVERT( CHAR(01), CalendarQuarter ) 
	  , CalendarQuarterShortName	AS 	'Q' + CONVERT( CHAR(01), CalendarQuarter ) 
	  , CalendarMonth     			TINYINT      	NOT NULL
      ,	CalendarMonthName			AS 	CONVERT( CHAR(04), CalendarYear ) + ' - ' + LEFT( MonthName, 3 ) 
	  ,	CalendarMonthShortName		AS 	LEFT( MonthName, 3 ) + ' ' + DATENAME( yy, FullDateKey ) 
	  , CalendarWeek      			TINYINT      	NOT NULL
      , CalendarWeekName			AS 	CONVERT( CHAR(04), CalendarYear ) + ' - W' + RIGHT( '00' + CONVERT( VARCHAR(02), CalendarWeek ), 2 ) 
	  , CalendarWeekShortName		AS 	'W' + RIGHT( '00' + CONVERT( VARCHAR(02), CalendarWeek ), 2 ) 
	  , CalendarDayOfYear 			SMALLINT     	NOT NULL
      , FiscalYear        			SMALLINT     	NOT NULL
      , FiscalYearName				AS 	'FY ' + CONVERT( CHAR(04), FiscalYear ) 
	  , FiscalQuarter    			TINYINT      	NOT NULL
      , FiscalQuarterName			AS 	'FY ' + CONVERT( CHAR(04), FiscalYear ) + ' - Q' + CONVERT( CHAR(01), FiscalQuarter ) 
	  , FiscalQuarterShortName		AS 	'Q' + CONVERT( CHAR(01), FiscalQuarter ) 
	  , FiscalMonth       			TINYINT      	NOT NULL
      , FiscalMonthName				AS 	'FY ' + CONVERT( CHAR(04), FiscalYear ) + ' - ' + LEFT( MonthName, 3 ) 
	  , FiscalWeek        			TINYINT      	NOT NULL
      , FiscalWeekName				AS 	'FY ' + CONVERT( CHAR(04), FiscalYear ) + ' - W' + RIGHT( '00' + CONVERT( VARCHAR(02), FiscalWeek ), 2 )  
	  , FiscalWeekShortName			AS 'W' + RIGHT( '00' + CONVERT( VARCHAR(02), FiscalWeek ), 2 ) 
	  , FiscalDayOfYear   			SMALLINT     	NOT NULL
      , IsWorkingDay      			TINYINT      	NOT NULL
      , IsWeekday         			TINYINT      	NOT NULL
      , IsHoliday         			TINYINT      	NOT NULL
)
;


GO
CREATE UNIQUE NONCLUSTERED INDEX UX_Date_00
    ON dimension.Date(FullDateKey ASC);
