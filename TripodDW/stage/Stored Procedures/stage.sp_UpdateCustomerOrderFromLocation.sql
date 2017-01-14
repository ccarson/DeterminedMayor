CREATE PROCEDURE
    stage.sp_UpdateCustomerOrderFromLocation
/*
***********************************************************************************************************************************

    Procedure:      stage.sp_UpdateCustomerOrderFromLocation
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       UPDATE existing stage.CustomerOrder records from stage CUSTINFO and Tripod Customer

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

BEGIN TRANSACTION ;

WITH
    cteShipTo AS(
        SELECT
            SourceOrderRecnum   =   Recnum
          , City                =   LTRIM( RTRIM( ISNULL( SCity, '' ) ) )
          , StateName           =   ISNULL( SState, '' )
          , Country             =   CASE ISNULL( SCountry, '' )
                                        WHEN '' THEN 'US'
                                        ELSE SCountry
                                    END
            FROM
                stage.CUSTINFO
            WHERE
                LTRIM( RTRIM( ISNULL( SCity, '' ) ) ) != ''
                    AND ISNULL( SState, '' ) != '' )
UPDATE
    customerOrder
SET
    ShipToLocationKey   =   ISNULL( tripod.LocationKey, 0 )
FROM
    stage.CustomerOrder AS customerOrder
LEFT JOIN
    cteShipTo AS stage
        ON stage.SourceOrderRecnum = customerOrder.SourceOrderRecnum
LEFT JOIN
    dimension.Location AS tripod
        ON tripod.City = stage.City
            AND tripod.StateName = stage.StateName
            AND tripod.Country = stage.Country ;

WITH
    cteBillTo AS(
        SELECT
            SourceOrderRecnum   =   CUSTINFO.Recnum
          , City                =   LTRIM( RTRIM( CMASTER.BCITY ) )
          , StateName           =   CMASTER.BSTATE
          , Country             =   ISNULL( NULLIF( LEFT( LTRIM( RTRIM( CMASTER.COUNTRY ) ), 2 ), '' ), 'US' )
        FROM
            stage.CMASTER AS CMASTER
        INNER JOIN
            stage.CUSTINFO
                ON CUSTINFO.BCUSTID = CMASTER.CUSTID
        WHERE
            LTRIM( RTRIM( CMASTER.BCITY ) ) != ''
                AND CMASTER.BSTATE != '' )
UPDATE
    customerOrder
SET
    BillToLocationKey   =   ISNULL( tripod.LocationKey, 0 )
FROM
    stage.CustomerOrder AS customerOrder
LEFT JOIN
    cteBillTo AS stage
        ON stage.SourceOrderRecnum = customerOrder.SourceOrderRecnum
LEFT JOIN
    dimension.Location AS tripod
        ON tripod.City = stage.City
            AND tripod.StateName = stage.StateName
            AND tripod.Country = stage.Country ;

COMMIT TRANSACTION ;