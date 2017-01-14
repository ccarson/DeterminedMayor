CREATE PROCEDURE
    stage.sp_MergeSpringfieldMASTERLN
/*
***********************************************************************************************************************************

    Procedure:      stage.sp_MergeSpringfieldMASTERLN
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       MERGE existing SpringfieldProd data from MASTERLN into stage

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

MERGE
    INTO    stage.MASTERLN AS stage
    USING   [$(SpringfieldProd)].dbo.MASTERLN AS MASTERLN
                ON MASTERLN.ORDNUM = stage.ORDNUM
                    AND MASTERLN.[IN] = stage.[IN]

WHEN MATCHED
    THEN UPDATE
    SET
        Recnum              =   MASTERLN.Recnum
      , QUAN                =   MASTERLN.QUAN
      , QUANS               =   MASTERLN.QUANS
      , SPRNUM              =   MASTERLN.SPRNUM
      , [DESC]              =   MASTERLN.[DESC]
      , UPRICE              =   MASTERLN.UPRICE
      , TPRICE              =   MASTERLN.TPRICE
      , BACKORDER           =   MASTERLN.BACKORDER
      , QUANSHIP            =   MASTERLN.QUANSHIP
      , [DATE]              =   MASTERLN.[DATE]
      , SHIPDATE            =   MASTERLN.SHIPDATE
      , YARD                =   MASTERLN.YARD
      , COM                 =   MASTERLN.COM
      , TELEYARD            =   MASTERLN.TELEYARD
      , EXCISE_DATE         =   MASTERLN.EXCISE_DATE
      , IN2                 =   MASTERLN.IN2
      , TCOST               =   MASTERLN.TCOST
      , REGPRICE            =   MASTERLN.REGPRICE
      , BACKREL             =   MASTERLN.BACKREL
      , LIST_PRICE          =   MASTERLN.LIST_PRICE
      , CUSTOM_FLAG         =   MASTERLN.CUSTOM_FLAG
      , Quan_BO             =   MASTERLN.Quan_BO
      , [Status]            =   MASTERLN.[Status]
      , Programming_Ver     =   MASTERLN.Programming_Ver
      , Purchase_Time       =   MASTERLN.Purchase_Time
      , RawCostEach         =   MASTERLN.RawCostEach
      , FinCostEach         =   MASTERLN.FinCostEach
      , USERINITIALS        =   MASTERLN.USERINITIALS
      , MovedToBO           =   MASTERLN.MovedToBO
      , QuanA               =   MASTERLN.QuanA
      , QuanPacked          =   MASTERLN.QuanPacked
      , QuanSOriginal       =   MASTERLN.QuanSOriginal ;