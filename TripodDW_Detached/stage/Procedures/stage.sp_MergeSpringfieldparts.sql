CREATE PROCEDURE
    stage.sp_MergeSpringfieldparts
/*
***********************************************************************************************************************************

    Procedure:      stage.sp_MergeSpringfieldparts
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       MERGE existing SpringfieldProd data from parts into stage

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

MERGE
    INTO    stage.parts AS stage
    USING   [$(SpringfieldProd)].dbo.parts AS parts
                ON parts.SPRNUM= stage.SPRNUM

WHEN MATCHED
    THEN UPDATE
    SET
        Recnum                      =   parts.Recnum
      , [DESC]                      =   parts.[DESC]
      , ORIGAMNT                    =   parts.ORIGAMNT
      , [RAW]                       =   parts.[RAW]
      , WIP                         =   parts.WIP
      , FIN                         =   parts.FIN
      , ASSIGNED                    =   parts.ASSIGNED
      , REORDPNT                    =   parts.REORDPNT
      , ONORD                       =   parts.ONORD
      , [FULL]                      =   parts.[FULL]
      , YSHIP                       =   parts.YSHIP
      , YA                          =   parts.YA
      , YP                          =   parts.YP
      , LSALE                       =   parts.LSALE
      , COSTRAW                     =   parts.COSTRAW
      , COSTWIP                     =   parts.COSTWIP
      , COSTFIN                     =   parts.COSTFIN
      , DEALER                      =   parts.DEALER
      , RETAIL                      =   parts.RETAIL
      , Z                           =   parts.Z
      , UPC                         =   parts.UPC
      , DEFRAW                      =   parts.DEFRAW
      , DEFWIP                      =   parts.DEFWIP
      , DEFFIN                      =   parts.DEFFIN
      , GUNTYPE                     =   parts.GUNTYPE
      , GUNSTOCK                    =   parts.GUNSTOCK
      , DELIVERY                    =   parts.DELIVERY
      , NOTE                        =   parts.NOTE
      , Overhead                    =   parts.Overhead
      , IndirectLabor               =   parts.IndirectLabor
      , DirectLabor                 =   parts.DirectLabor
      , MaterialCost                =   parts.MaterialCost
      , SubContractor               =   parts.SubContractor
      , SUB2                        =   parts.SUB2
      , SUB3                        =   parts.SUB3
      , FREIGHT                     =   parts.FREIGHT
      , EXCISE                      =   parts.EXCISE
      , CALIBER                     =   parts.CALIBER
      , COMPANY_#                   =   parts.COMPANY_#
      , DIVISION_#                  =   parts.DIVISION_#
      , ACCOUNT_ID                  =   parts.ACCOUNT_ID
      , NSN_#                       =   parts.NSN_#
      , FS_#                        =   parts.FS_#
      , VENDOR_INFO                 =   parts.VENDOR_INFO
      , DESC_2                      =   parts.DESC_2
      , RESERVED                    =   parts.RESERVED
      , INTERNAT_FLAG               =   parts.INTERNAT_FLAG
      , PRICE_EDIT                  =   parts.PRICE_EDIT
      , INSPECT_FLAG                =   parts.INSPECT_FLAG
      , SCRAP                       =   parts.SCRAP
      , COSTSCRAP                   =   parts.COSTSCRAP
      , PURCH_FLAG                  =   parts.PURCH_FLAG
      , RECEIVE_TO                  =   parts.RECEIVE_TO
      , SCOMPANY_#                  =   parts.SCOMPANY_#
      , SDIVISION_#                 =   parts.SDIVISION_#
      , SACCOUNT_ID                 =   parts.SACCOUNT_ID
      , PR_SHT_DESC                 =   parts.PR_SHT_DESC
      , RAW_ASSIGNED                =   parts.RAW_ASSIGNED
      , FREIGHT_FLAG                =   parts.FREIGHT_FLAG
      , BREAKDOWN_FLAG              =   parts.BREAKDOWN_FLAG
      , GROUP1                      =   parts.GROUP1
      , RPT_GROUP                   =   parts.RPT_GROUP
      , LOT_SIZE                    =   parts.LOT_SIZE
      , CUSTOM_COUNT                =   parts.CUSTOM_COUNT
      , SERIAL_FLAG                 =   parts.SERIAL_FLAG
      , WHLS_QTY1                   =   parts.WHLS_QTY1
      , WHLS_PRCNT1                 =   parts.WHLS_PRCNT1
      , WHLS_QTY2                   =   parts.WHLS_QTY2
      , WHLS_PRCNT2                 =   parts.WHLS_PRCNT2
      , WHLS_QTY3                   =   parts.WHLS_QTY3
      , WHLS_PRCNT3                 =   parts.WHLS_PRCNT3
      , WHLS_QTY4                   =   parts.WHLS_QTY4
      , WHLS_PRCNT4                 =   parts.WHLS_PRCNT4
      , DLR_QTY1                    =   parts.DLR_QTY1
      , DLR_PRCNT1                  =   parts.DLR_PRCNT1
      , DLR_QTY2                    =   parts.DLR_QTY2
      , DLR_PRCNT2                  =   parts.DLR_PRCNT2
      , DLR_QTY3                    =   parts.DLR_QTY3
      , DLR_PRCNT3                  =   parts.DLR_PRCNT3
      , DLR_QTY4                    =   parts.DLR_QTY4
      , DLR_PRCNT4                  =   parts.DLR_PRCNT4
      , RTL_QTY1                    =   parts.RTL_QTY1
      , RTL_PRCNT1                  =   parts.RTL_PRCNT1
      , RTL_QTY2                    =   parts.RTL_QTY2
      , RTL_PRCNT2                  =   parts.RTL_PRCNT2
      , RTL_QTY3                    =   parts.RTL_QTY3
      , RTL_PRCNT3                  =   parts.RTL_PRCNT3
      , RTL_QTY4                    =   parts.RTL_QTY4
      , RTL_PRCNT4                  =   parts.RTL_PRCNT4
      , WHOLESALE                   =   parts.WHOLESALE
      , VENDOR_ID                   =   parts.VENDOR_ID
      , FIREARM_FLAG                =   parts.FIREARM_FLAG
      , TAX_FLAG                    =   parts.TAX_FLAG
      , EXCISE_TYPE                 =   parts.EXCISE_TYPE
      , UOM_DESC                    =   parts.UOM_DESC
      , LEAD_TIME                   =   parts.LEAD_TIME
      , INVAVGPRICE                 =   parts.INVAVGPRICE
      , WOASSIGNED                  =   parts.WOASSIGNED
      , OEASSIGNED                  =   parts.OEASSIGNED
      , BARREL_LENGTH               =   parts.BARREL_LENGTH
      , FINISH                      =   parts.FINISH
      , SELLABLE                    =   parts.SELLABLE
      , ACTIVE                      =   parts.ACTIVE
      , DRAWING_NUMBER              =   parts.DRAWING_NUMBER
      , REVISION_NUMBER             =   parts.REVISION_NUMBER
      , Sale_Notes                  =   parts.Sale_Notes
      , Tech_Notes                  =   parts.Tech_Notes
      , Part_Type                   =   parts.Part_Type
      , Part_Category               =   parts.Part_Category
      , LawEnf_Price                =   parts.LawEnf_Price
      , Star_Price                  =   parts.Star_Price
      , BoxStore_Price              =   parts.BoxStore_Price
      , BuyGroup_Price              =   parts.BuyGroup_Price
      , HASSERIAL                   =   parts.HASSERIAL
      , CreatedBy                   =   parts.CreatedBy
      , CreatedDate                 =   parts.CreatedDate
      , ChangedBy                   =   parts.ChangedBy
      , ChangedDate                 =   parts.ChangedDate
      , [Version]                   =   parts.[Version]
      , UpdateSysInven              =   parts.UpdateSysInven
      , Capacity                    =   parts.Capacity
      , Location                    =   parts.Location
      , Aisle                       =   parts.Aisle
      , Rack                        =   parts.Rack
      , Tier                        =   parts.Tier
      , [Bin]                       =   parts.[Bin]
      , ExciseTaxTotalMatCost       =   parts.ExciseTaxTotalMatCost
      , ExciseTaxTotalMatTaxCost    =   parts.ExciseTaxTotalMatTaxCost
      , ExciseTaxLaborCost          =   parts.ExciseTaxLaborCost
      , ExciseTaxRatio              =   parts.ExciseTaxRatio
      , ExciseTaxAdjustedTax        =   parts.ExciseTaxAdjustedTax
      , ExciseTaxLaborTaxCost       =   parts.ExciseTaxLaborTaxCost
      , ThreadedBarrel              =   parts.ThreadedBarrel
      , SubCategory                 =   parts.SubCategory
      , Packed                      =   parts.Packed
      , PulledToWO                  =   parts.PulledToWO ;
