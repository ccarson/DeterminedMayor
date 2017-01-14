CREATE PROCEDURE
    stage.sp_GetCustomerOrderFromMASTERLN
/*
***********************************************************************************************************************************

    Procedure:      stage.sp_GetCustomerOrderFromMASTERLN
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       SELECT stage.CustomerOrder records from Springfield MASTERLN and Tripod Part

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

SELECT
    PartKey             =   tripod.PartKey
  , SourceLineRecnum    =   stage.Recnum
  , OrderNumber         =   stage.ORDNUM
  , ItemQuantity        =   stage.QUAN
  , QuanS               =   stage.QUANS
  , Quan_BO             =   stage.Quan_BO
  , Programming_Ver     =   stage.Programming_Ver
  , UnitPrice           =   stage.UPRICE
  , TotalPrice          =   stage.TPRICE
  , ShippedQuantity     =   stage.QUANSHIP
  , LineItemNumber      =   stage.[IN]
  , RegularPrice        =   stage.REGPRICE
  , ListPrice           =   stage.LIST_PRICE
  , LineItemStatus      =   stage.Status
  , TotalCost           =   stage.TCOST
  , UnitRawCost         =   stage.RawCostEach
  , UnitFinalCost       =   stage.FinCostEach
  , YardCode            =   stage.YARD
FROM
    stage.MASTERLN AS stage

INNER JOIN
    dimension.Part AS tripod
        ON tripod.SPRNUM = stage.SPRNUM
;