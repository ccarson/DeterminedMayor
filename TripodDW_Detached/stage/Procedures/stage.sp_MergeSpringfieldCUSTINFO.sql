CREATE PROCEDURE
    stage.sp_MergeSpringfieldCUSTINFO
/*
***********************************************************************************************************************************

    Procedure:      stage.sp_MergeSpringfieldCUSTINFO
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       MERGE existing SpringfieldProd data from CUSTINFO into stage

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

MERGE
    INTO    stage.CUSTINFO AS stage
    USING   [$(SpringfieldProd)].dbo.CUSTINFO AS CUSTINFO
                ON CUSTINFO.ORDNUM = stage.ORDNUM

WHEN MATCHED
    THEN UPDATE
    SET
        Recnum                  =   CUSTINFO.Recnum
      , BCUSTID                 =   CUSTINFO.BCUSTID
      , SCUSTID                 =   CUSTINFO.SCUSTID
      , [DATE]                  =   CUSTINFO.[DATE]
      , SHIPDATE                =   CUSTINFO.SHIPDATE
      , COM                     =   CUSTINFO.COM
      , SNAME                   =   CUSTINFO.SNAME
      , SUB                     =   CUSTINFO.SUB
      , DISC                    =   CUSTINFO.DISC
      , POST                    =   CUSTINFO.POST
      , DEP                     =   CUSTINFO.DEP
      , COD                     =   CUSTINFO.COD
      , TAX                     =   CUSTINFO.TAX
      , RECEIVED                =   CUSTINFO.RECEIVED
      , CARDKIND                =   CUSTINFO.CARDKIND
      , CARDNUM                 =   CUSTINFO.CARDNUM
      , N1                      =   CUSTINFO.N1
      , N2                      =   CUSTINFO.N2
      , N3                      =   CUSTINFO.N3
      , N4                      =   CUSTINFO.N4
      , N5                      =   CUSTINFO.N5
      , N6                      =   CUSTINFO.N6
      , N7                      =   CUSTINFO.N7
      , [STATUS]                =   CUSTINFO.[STATUS]
      , ACCTYPE                 =   CUSTINFO.ACCTYPE
      , EXPIRE                  =   CUSTINFO.EXPIRE
      , EXCISE_FLAG             =   CUSTINFO.EXCISE_FLAG
      , CHECK_TYPE              =   CUSTINFO.CHECK_TYPE
      , EXCISE_DATE             =   CUSTINFO.EXCISE_DATE
      , PAID_DATE               =   CUSTINFO.PAID_DATE
      , LAST_CHANGE             =   CUSTINFO.LAST_CHANGE
      , ORIGINAL                =   CUSTINFO.ORIGINAL
      , DATE_WANTED             =   CUSTINFO.DATE_WANTED
      , CANCEL_DATE             =   CUSTINFO.CANCEL_DATE
      , OVER60_FLAG             =   CUSTINFO.OVER60_FLAG
      , OTOTAL                  =   CUSTINFO.OTOTAL
      , BACKORDER               =   CUSTINFO.BACKORDER
      , CUST_PO#                =   CUSTINFO.CUST_PO#
      , TAXRATE                 =   CUSTINFO.TAXRATE
      , TRADE_AMOUNT            =   CUSTINFO.TRADE_AMOUNT
      , TRADE_TAX_FLAG          =   CUSTINFO.TRADE_TAX_FLAG
      , COMPANY_#               =   CUSTINFO.COMPANY_#
      , ACCR_DISC               =   CUSTINFO.ACCR_DISC
      , WHLE_DISC               =   CUSTINFO.WHLE_DISC
      , STATEID                 =   CUSTINFO.STATEID
      , TELEWHO                 =   CUSTINFO.TELEWHO
      , FREIGHT_FLAG            =   CUSTINFO.FREIGHT_FLAG
      , COD_FLAG                =   CUSTINFO.COD_FLAG
      , CID                     =   CUSTINFO.CID
      , StoreSale_Flag          =   CUSTINFO.StoreSale_Flag
      , YardCode                =   CUSTINFO.YardCode
      , Packing_Notes           =   CUSTINFO.Packing_Notes
      , Balance                 =   CUSTINFO.Balance
      , RefundTotal             =   CUSTINFO.RefundTotal
      , Invoice_Notes           =   CUSTINFO.Invoice_Notes
      , Programming_Ver         =   CUSTINFO.Programming_Ver
      , Sub_Taxable             =   CUSTINFO.Sub_Taxable
      , OrderedBy               =   CUSTINFO.OrderedBy
      , Date_Due                =   CUSTINFO.Date_Due
      , O_Sub                   =   CUSTINFO.O_Sub
      , O_Disc                  =   CUSTINFO.O_Disc
      , O_Post                  =   CUSTINFO.O_Post
      , O_Tax                   =   CUSTINFO.O_Tax
      , O_SubTaxable            =   CUSTINFO.O_SubTaxable
      , O_Total                 =   CUSTINFO.O_Total
      , SUBTOT                  =   CUSTINFO.SUBTOT
      , USERINITIALS            =   CUSTINFO.USERINITIALS
      , ShippedBy               =   CUSTINFO.ShippedBy
      , TaxStateRate            =   CUSTINFO.TaxStateRate
      , TaxCountyRate           =   CUSTINFO.TaxCountyRate
      , TaxCityRate             =   CUSTINFO.TaxCityRate
      , TaxSpecialRate          =   CUSTINFO.TaxSpecialRate
      , TaxByZipID              =   CUSTINFO.TaxByZipID
      , InvoiceNum              =   CUSTINFO.InvoiceNum
      , ShipToPO                =   CUSTINFO.ShipToPO
      , Form4473                =   CUSTINFO.Form4473
      , CalcTax                 =   CUSTINFO.CalcTax
      , CreatedBy               =   CUSTINFO.CreatedBy
      , CreatedDate             =   CUSTINFO.CreatedDate
      , ChangedBy               =   CUSTINFO.ChangedBy
      , ChangedDate             =   CUSTINFO.ChangedDate
      , [Version]               =   CUSTINFO.[Version]
      , ForceTax                =   CUSTINFO.ForceTax
      , NoPLPrint               =   CUSTINFO.NoPLPrint
      , ReleaseDate             =   CUSTINFO.ReleaseDate
      , SAddress                =   CUSTINFO.SAddress
      , SAddress2               =   CUSTINFO.SAddress2
      , SCity                   =   CUSTINFO.SCity
      , SState                  =   CUSTINFO.SState
      , SZip                    =   CUSTINFO.SZip
      , SCountry                =   CUSTINFO.SCountry
      , ExternalOrderType       =   CUSTINFO.ExternalOrderType
      , ExternalOrdNum          =   CUSTINFO.ExternalOrdNum
      , CCToken                 =   CUSTINFO.CCToken
      , CCApprovalCode          =   CUSTINFO.CCApprovalCode
      , NoTaxChange             =   CUSTINFO.NoTaxChange
      , CCRetRef                =   CUSTINFO.CCRetRef
      , Sub_Labor               =   CUSTINFO.Sub_Labor
      , Sub_LaborRepair         =   CUSTINFO.Sub_LaborRepair
      , Sub_Apparel             =   CUSTINFO.Sub_Apparel
      , CouponDiscount          =   CUSTINFO.CouponDiscount
      , ReadyToShip             =   CUSTINFO.ReadyToShip
      , PostType                =   CUSTINFO.PostType
      , ShipDestinationType     =   CUSTINFO.ShipDestinationType
      , ShipUPS                 =   CUSTINFO.ShipUPS
      , IAS_Sub                 =   CUSTINFO.IAS_Sub
      , IAS_Disc                =   CUSTINFO.IAS_Disc
      , IAS_Post                =   CUSTINFO.IAS_Post
      , IAS_Tax                 =   CUSTINFO.IAS_Tax
      , IAS_OTotal              =   CUSTINFO.IAS_OTotal
      , IAS_Sub_Taxable         =   CUSTINFO.IAS_Sub_Taxable
      , IAS_Sub_Labor           =   CUSTINFO.IAS_Sub_Labor
      , IAS_Sub_LaborRepair     =   CUSTINFO.IAS_Sub_LaborRepair
      , IAS_Sub_Apparel         =   CUSTINFO.IAS_Sub_Apparel
      , NumberOfCartons         =   CUSTINFO.NumberOfCartons
      , Packed                  =   CUSTINFO.Packed
      , ShipLocation            =   CUSTINFO.ShipLocation
      , CustApproval            =   CUSTINFO.CustApproval
      , MgrApproval             =   CUSTINFO.MgrApproval
      , ReadyToShipDate         =   CUSTINFO.ReadyToShipDate
      , CancelAfter             =   CUSTINFO.CancelAfter
      , AuthorizedAmount        =   CUSTINFO.AuthorizedAmount
      , AVSResult               =   CUSTINFO.AVSResult
      , CCTranStatus            =   CUSTINFO.CCTranStatus
      , CCLatestTransID         =   CUSTINFO.CCLatestTransID
      , AdultSig                =   CUSTINFO.AdultSig ;
