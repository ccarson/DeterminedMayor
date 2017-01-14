CREATE PROCEDURE
    dimension.sp_UpdateCustomer
/*
***********************************************************************************************************************************

    Procedure:      dimension.sp_UpdateCustomer
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       UPDATEs existing dimension.Customer records with new data

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

UPDATE
    tripod
SET
    SourceRecnum    =   stage.SourceRecnum
  , CustomerName    =   stage.CustomerName
  , PriceType       =   stage.PriceType
  , DWChecksum      =   stage.DWChecksum
  , DWVersion       =   tripod.DWVersion + 1
  , DWTimestamp     =   GETDATE()
FROM
    dimension.Customer AS tripod
INNER JOIN
    stage.Customer AS stage
        ON stage.CustomerID = tripod.CustomerID
WHERE
    stage.DWChecksum != tripod.DWChecksum ;