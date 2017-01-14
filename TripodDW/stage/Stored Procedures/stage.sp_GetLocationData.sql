
CREATE PROCEDURE
    stage.sp_GetLocationData
AS
/*
************************************************************************************************************************************

   Function:    stage.sp_GetLocationData
     Author:    Chris Carson
    Purpose:    Gets data for dimension.Location record from stage data

    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         2016-10-01          created


    Notes

************************************************************************************************************************************
*/

SET NOCOUNT, XACT_ABORT ON ;

WITH
    cteCUSTINFO AS(
        SELECT
            City        =   LTRIM( RTRIM( ISNULL( SCity, '' ) ) )
          , StateName   =   ISNULL( SState, '' )
          , Country     =   CASE ISNULL( SCountry, '' )
                                WHEN '' THEN 'US'
                                ELSE SCountry
                            END
        FROM
            stage.CUSTINFO
        WHERE
            LTRIM( RTRIM( ISNULL( SCity, '' ) ) ) != ''
                AND ISNULL( SState, '' ) != '' ) ,

    cteCMASTER AS(
        SELECT
            City        =   LTRIM( RTRIM( BCITY ) )
          , StateName   =   BSTATE
          , Country     =   ISNULL( NULLIF( LEFT( LTRIM( RTRIM( COUNTRY ) ), 2 ), '' ), 'US' )
        FROM
            stage.CMASTER
        WHERE
            LTRIM( RTRIM( BCITY ) ) != ''
                AND BSTATE != '' )
SELECT
    City        =   CONVERT( varchar(30), UPPER( City ) )
  , StateName   =   CONVERT( char(02), UPPER( StateName ) )
  , Country     =   CONVERT( char(02), UPPER( Country ) )
FROM
    cteCUSTINFO

UNION

SELECT
    City        =   CONVERT( varchar(30), UPPER( City ) )
  , StateName   =   CONVERT( char(02), UPPER( StateName ) )
  , Country     =   CONVERT( char(02), UPPER( Country ) )
FROM
    cteCMASTER
;