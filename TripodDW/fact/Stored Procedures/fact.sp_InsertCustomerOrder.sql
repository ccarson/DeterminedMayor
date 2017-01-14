CREATE PROCEDURE
    fact.sp_InsertCustomerOrder
/*
***********************************************************************************************************************************

    Procedure:      fact.sp_InsertCustomerOrder
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       INSERT new fact.CustomerOrder records into Tripod

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

INSERT INTO
    fact.CustomerOrder(
        BillToCustomerKey
      , BillToLocationKey
      , ShipToCustomerKey
      , ShipToLocationKey
      , OrderDateKey
      , ShipDateKey
      , WantedDateKey
      , PartKey
      , SourceOrderRecnum
      , SourceLineRecnum
      , ShipToName
      , OrderNumber
      , OrderStatus
      , LineItemNumber
      , LineItemStatus
      , CustomerPO
      , ShipToPO
      , PaidDate
      , CancelDate
      , SubtotalAmount
      , DiscountAmount
      , PostageAmount
      , DepositAmount
      , CODAmount
      , TaxAmount
      , ReceivedAmount
      , TotalAmount
      , BalanceAmount
      , RefundAmount
      , UnitPrice
      , TotalPrice
      , RegularPrice
      , ListPrice
      , TotalCost
      , UnitRawCost
      , UnitFinalCost
      , ItemQuantity
      , ShippedQuantity
      , BackorderQuantity
      , QuanS
      , Quan_BO
      , YardCode
      , Programming_Ver
      , DWChecksum )

SELECT
        BillToCustomerKey       =   stage.BillToCustomerKey
      , BillToLocationKey       =   stage.BillToLocationKey
      , ShipToCustomerKey       =   stage.ShipToCustomerKey
      , ShipToLocationKey       =   stage.ShipToLocationKey
      , OrderDateKey            =   stage.OrderDateKey
      , ShipDateKey             =   stage.ShipDateKey
      , WantedDateKey           =   stage.WantedDateKey
      , PartKey                 =   stage.PartKey
      , SourceOrderRecnum       =   stage.SourceOrderRecnum
      , SourceLineRecnum        =   stage.SourceLineRecnum
      , ShipToName              =   stage.ShipToName
      , OrderNumber             =   stage.OrderNumber
      , OrderStatus             =   stage.OrderStatus
      , LineItemNumber          =   stage.LineItemNumber
      , LineItemStatus          =   stage.LineItemStatus
      , CustomerPO              =   stage.CustomerPO
      , ShipToPO                =   stage.ShipToPO
      , PaidDate                =   stage.PaidDate
      , CancelDate              =   stage.CancelDate
      , SubtotalAmount          =   stage.SubtotalAmount
      , DiscountAmount          =   stage.DiscountAmount
      , PostageAmount           =   stage.PostageAmount
      , DepositAmount           =   stage.DepositAmount
      , CODAmount               =   stage.CODAmount
      , TaxAmount               =   stage.TaxAmount
      , ReceivedAmount          =   stage.ReceivedAmount
      , TotalAmount             =   stage.TotalAmount
      , BalanceAmount           =   stage.BalanceAmount
      , RefundAmount            =   stage.RefundAmount
      , UnitPrice               =   stage.UnitPrice
      , TotalPrice              =   stage.TotalPrice
      , RegularPrice            =   stage.RegularPrice
      , ListPrice               =   stage.ListPrice
      , TotalCost               =   stage.TotalCost
      , UnitRawCost             =   stage.UnitRawCost
      , UnitFinalCost           =   stage.UnitFinalCost
      , ItemQuantity            =   stage.ItemQuantity
      , ShippedQuantity         =   stage.ShippedQuantity
      , BackorderQuantity       =   stage.BackorderQuantity
      , QuanS                   =   stage.QuanS
      , Quan_BO                 =   stage.Quan_BO
      , YardCode                =   stage.YardCode
      , Programming_Ver         =   stage.Programming_Ver
      , DWChecksum              =   stage.DWChecksum
FROM
    stage.CustomerOrder AS stage
LEFT JOIN
    fact.CustomerOrder AS tripod
        ON tripod.OrderNumber = stage.OrderNumber
            AND tripod.LineItemNumber = stage.LineItemNumber
WHERE
    tripod.OrderNumber IS NULL ;