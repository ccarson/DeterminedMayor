CREATE TABLE dimension.Date (
    DateKey                 BIGINT			NOT NULL
        CONSTRAINT pk_Date 
			PRIMARY KEY CLUSTERED
  , FullDateAlternateKey    DATE			NOT NULL
  , DayNumberOfWeek         TINYINT			NOT NULL
  , DayNameOfWeek           VARCHAR (10)	NOT NULL
  , DayNumberOfMonth        TINYINT			NOT NULL
  , DayNumberOfYear         SMALLINT		NOT NULL
  , WeekNumberOfYear        TINYINT			NOT NULL
  , MonthName               VARCHAR (10)	NOT NULL
  , MonthNumberOfYear       TINYINT			NOT NULL
  , CalendarQuarter         TINYINT			NOT NULL
  , CalendarYear            SMALLINT		NOT NULL 
  , FiscalQuarter			TINYINT			NOT NULL
  , FiscalYear				SMALLINT		NOT NULL 
  , DisplayDate				VARCHAR(10)		NOT NULL
);
GO

