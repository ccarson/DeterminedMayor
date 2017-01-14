CREATE PROCEDURE
    stage.sp_UpdateCustomerOrderFromCustomer
/*
***********************************************************************************************************************************

    Procedure:      stage.sp_UpdateCustomerOrderFromCustomer
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       UPDATE existing stage.CustomerOrder records from stage CUSTINFO and Tripod Customer

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

UPDATE
    customerOrder
SET
    BillToCustomerKey   =   billTo.CustomerKey
  , ShipToCustomerKey   =   shipTo.CustomerKey

FROM
    stage.CustomerOrder AS customerOrder
INNER JOIN
    stage.CUSTINFO AS stage
        ON stage.ORDNUM = customerOrder.OrderNumber
INNER JOIN
    dimension.Customer AS billTo
        ON billTo.CustomerID = stage.BCUSTID
INNER JOIN
    dimension.Customer AS shipTo
        ON shipTo.CustomerID = stage.SCUSTID ;