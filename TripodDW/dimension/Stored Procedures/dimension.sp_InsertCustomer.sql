CREATE PROCEDURE
    dimension.sp_InsertCustomer
/*
***********************************************************************************************************************************

    Procedure:      dimension.sp_InsertCustomer
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       INSERT dimension.Customer records from stage.Customer where CustomerID is not already present in dimension.Customer
                        This loads new Customer records into dimension.Customer

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

INSERT INTO
    dimension.Customer(
        SourceRecnum
      , CustomerID
      , CustomerName
      , PriceType
      , DWChecksum )
SELECT
    stage.SourceRecnum
  , stage.CustomerID
  , stage.CustomerName
  , stage.PriceType
  , stage.DWChecksum
FROM
    stage.Customer AS stage
WHERE NOT EXISTS(
    SELECT 1 FROM dimension.Customer AS tripod
        WHERE tripod.CustomerID = stage.CustomerID )
;