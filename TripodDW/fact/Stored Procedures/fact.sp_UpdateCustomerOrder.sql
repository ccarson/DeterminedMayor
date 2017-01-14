CREATE PROCEDURE
    fact.sp_UpdateCustomerOrder
/*
***********************************************************************************************************************************

    Procedure:      fact.sp_UpdateCustomerOrder
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       UPDATEs existing fact.CustomerOrder records with new data

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

UPDATE
    tripod
SET
    BillToCustomerKey   =   stage.BillToCustomerKey
  , BillToLocationKey   =   stage.BillToLocationKey
  , ShipToCustomerKey   =   stage.ShipToCustomerKey
  , ShipToLocationKey   =   stage.ShipToLocationKey
  , OrderDateKey        =   stage.OrderDateKey
  , ShipDateKey         =   stage.ShipDateKey
  , WantedDateKey       =   stage.WantedDateKey
  , PartKey             =   stage.PartKey
  , SourceOrderRecnum   =   stage.SourceOrderRecnum
  , SourceLineRecnum    =   stage.SourceLineRecnum
  , ShipToName          =   stage.ShipToName
  , OrderStatus         =   stage.OrderStatus
  , LineItemStatus      =   stage.LineItemStatus
  , CustomerPO          =   stage.CustomerPO
  , ShipToPO            =   stage.ShipToPO
  , PaidDate            =   stage.PaidDate
  , CancelDate          =   stage.CancelDate
  , SubtotalAmount      =   stage.SubtotalAmount
  , DiscountAmount      =   stage.DiscountAmount
  , PostageAmount       =   stage.PostageAmount
  , DepositAmount       =   stage.DepositAmount
  , CODAmount           =   stage.CODAmount
  , TaxAmount           =   stage.TaxAmount
  , ReceivedAmount      =   stage.ReceivedAmount
  , TotalAmount         =   stage.TotalAmount
  , BalanceAmount       =   stage.BalanceAmount
  , RefundAmount        =   stage.RefundAmount
  , UnitPrice           =   stage.UnitPrice
  , TotalPrice          =   stage.TotalPrice
  , RegularPrice        =   stage.RegularPrice
  , ListPrice           =   stage.ListPrice
  , TotalCost           =   stage.TotalCost
  , UnitRawCost         =   stage.UnitRawCost
  , UnitFinalCost       =   stage.UnitFinalCost
  , ItemQuantity        =   stage.ItemQuantity
  , ShippedQuantity     =   stage.ShippedQuantity
  , BackorderQuantity   =   stage.BackorderQuantity
  , QuanS               =   stage.QuanS
  , Quan_BO             =   stage.Quan_BO
  , YardCode            =   stage.YardCode
  , Programming_Ver     =   stage.Programming_Ver
  , DWChecksum          =   stage.DWChecksum
  , DWVersion           =   tripod.DWVersion + 1
  , DWTimestamp         =   GETDATE()
FROM
    fact.CustomerOrder AS tripod
INNER JOIN
    stage.CustomerOrder AS stage
        ON stage.OrderNumber = tripod.OrderNumber
            AND stage.LineItemNumber = tripod.LineItemNumber
WHERE
    stage.DWChecksum != tripod.DWChecksum ;