CREATE PROCEDURE
    stage.sp_MergeSpringfieldCMASTER
/*
***********************************************************************************************************************************

    Procedure:      stage.sp_MergeSpringfieldCMASTER
    Author:         Chris Carson, Intertech
    Client:         Springfield Armory
    Created:        2016-10-01

    Abstract:       MERGE existing SpringfieldProd data from CMASTER into stage

***********************************************************************************************************************************
*/
AS

SET NOCOUNT, XACT_ABORT ON ;

MERGE
    INTO    stage.CMASTER AS stage
    USING   [$(SpringfieldProd)].dbo.CMASTER AS CMASTER
                ON CMASTER.CUSTID = stage.CUSTID

WHEN MATCHED
    THEN UPDATE
    SET
        Recnum                  =   CMASTER.Recnum
      , BNAME                   =   CMASTER.BNAME
      , BSTREET                 =   CMASTER.BSTREET
      , BSTREET2                =   CMASTER.BSTREET2
      , BCITY                   =   CMASTER.BCITY
      , BSTATE                  =   CMASTER.BSTATE
      , BZIP                    =   CMASTER.BZIP
      , COUNTRY                 =   CMASTER.COUNTRY
      , FFLEXPR                 =   CMASTER.FFLEXPR
      , ACCTYPE                 =   CMASTER.ACCTYPE
      , CLASS                   =   CMASTER.CLASS
      , CONTACT_NAME_1          =   CMASTER.CONTACT_NAME_1
      , PHONE                   =   CMASTER.PHONE
      , CONTACT_NAME_2          =   CMASTER.CONTACT_NAME_2
      , PHONE_2                 =   CMASTER.PHONE_2
      , FAX_NUMBER              =   CMASTER.FAX_NUMBER
      , ILLTAX                  =   CMASTER.ILLTAX
      , YTDSHIP                 =   CMASTER.YTDSHIP
      , YTDPAY                  =   CMASTER.YTDPAY
      , TELESTAT                =   CMASTER.TELESTAT
      , TELEWHO                 =   CMASTER.TELEWHO
      , FFLNUM                  =   CMASTER.FFLNUM
      , LPAYOPEN                =   CMASTER.LPAYOPEN
      , LPAYCOD                 =   CMASTER.LPAYCOD
      , STOCKING                =   CMASTER.STOCKING
      , EXCISE_FLAG             =   CMASTER.EXCISE_FLAG
      , DISCOUNT                =   CMASTER.DISCOUNT
      , TIME_ZONE               =   CMASTER.TIME_ZONE
      , TERMS                   =   CMASTER.TERMS
      , GROUP_CODE              =   CMASTER.GROUP_CODE
      , PROF_GUNSMITH           =   CMASTER.PROF_GUNSMITH
      , MATCH_FLAG              =   CMASTER.MATCH_FLAG
      , DL_NUMBER               =   CMASTER.DL_NUMBER
      , DL_STATE                =   CMASTER.DL_STATE
      , CUSTYPE                 =   CMASTER.CUSTYPE
      , NOW                     =   CMASTER.NOW
      , OTHIRTY                 =   CMASTER.OTHIRTY
      , OSIXTY                  =   CMASTER.OSIXTY
      , ONINETY                 =   CMASTER.ONINETY
      , O1TWENTY                =   CMASTER.O1TWENTY
      , FINANCE                 =   CMASTER.FINANCE
      , LASTCALC                =   CMASTER.LASTCALC
      , FIRSTPUR                =   CMASTER.FIRSTPUR
      , HICREDIT                =   CMASTER.HICREDIT
      , CRLIMIT                 =   CMASTER.CRLIMIT
      , TOTPAID                 =   CMASTER.TOTPAID
      , PAIDNOW                 =   CMASTER.PAIDNOW
      , PAID30                  =   CMASTER.PAID30
      , PAID60                  =   CMASTER.PAID60
      , PAID90                  =   CMASTER.PAID90
      , PAID120                 =   CMASTER.PAID120
      , INTRATE                 =   CMASTER.INTRATE
      , WFINANCE                =   CMASTER.WFINANCE
      , CURBAL                  =   CMASTER.CURBAL
      , N1                      =   CMASTER.N1
      , N2                      =   CMASTER.N2
      , N3                      =   CMASTER.N3
      , N4                      =   CMASTER.N4
      , N5                      =   CMASTER.N5
      , LABEL_FLAG              =   CMASTER.LABEL_FLAG
      , YTDBILL                 =   CMASTER.YTDBILL
      , DELETE_FLAG             =   CMASTER.DELETE_FLAG
      , MEDIA_CODE              =   CMASTER.MEDIA_CODE
      , ACCRUAL_DISC            =   CMASTER.ACCRUAL_DISC
      , SALES_TAX_DATE          =   CMASTER.SALES_TAX_DATE
      , EXCISE_#                =   CMASTER.EXCISE_#
      , EXCISE_DATE             =   CMASTER.EXCISE_DATE
      , CREDIT_DATE             =   CMASTER.CREDIT_DATE
      , STATEID                 =   CMASTER.STATEID
      , EMAIL                   =   CMASTER.EMAIL
      , REP_ID                  =   CMASTER.REP_ID
      , SA_REP                  =   CMASTER.SA_REP
      , ADDED_REP               =   CMASTER.ADDED_REP
      , DATE_ADDED              =   CMASTER.DATE_ADDED
      , TOTALAMOUNTDUE          =   CMASTER.TOTALAMOUNTDUE
      , PAIDCURRENTPER          =   CMASTER.PAIDCURRENTPER
      , PAID30PER               =   CMASTER.PAID30PER
      , PAID60PER               =   CMASTER.PAID60PER
      , PAID90PER               =   CMASTER.PAID90PER
      , PAID120PER              =   CMASTER.PAID120PER
      , ONMAILING_FLAG          =   CMASTER.ONMAILING_FLAG
      , APPLYSHIPPING           =   CMASTER.APPLYSHIPPING
      , WEBSITE                 =   CMASTER.WEBSITE
      , LAST_NAME               =   CMASTER.LAST_NAME
      , FIRST_NAME              =   CMASTER.FIRST_NAME
      , Customer_Type           =   CMASTER.Customer_Type
      , TAX_FORM_EXP            =   CMASTER.TAX_FORM_EXP
      , USERINITIALS            =   CMASTER.USERINITIALS
      , DUE_0_20                =   CMASTER.DUE_0_20
      , DUE_21_30               =   CMASTER.DUE_21_30
      , DUE_31_45               =   CMASTER.DUE_31_45
      , DUE_46_60               =   CMASTER.DUE_46_60
      , DUE_60PLUS              =   CMASTER.DUE_60PLUS
      , PriceType               =   CMASTER.PriceType
      , DefaultPrice            =   CMASTER.DefaultPrice
      , EMailInvoice            =   CMASTER.EMailInvoice
      , EMailMerge              =   CMASTER.EMailMerge
      , EMailSubject            =   CMASTER.EMailSubject
      , CreatedBy               =   CMASTER.CreatedBy
      , CreatedDate             =   CMASTER.CreatedDate
      , ChangedBy               =   CMASTER.ChangedBy
      , ChangedDate             =   CMASTER.ChangedDate
      , [Version]               =   CMASTER.[Version]
      , BuyGroup                =   CMASTER.BuyGroup
      , BuyGroupNum             =   CMASTER.BuyGroupNum
      , OptInRecallEmails       =   CMASTER.OptInRecallEmails
      , OptInEmails             =   CMASTER.OptInEmails
      , OptInRecallEmailsDate   =   CMASTER.OptInRecallEmailsDate
      , OptInEmailsDate         =   CMASTER.OptInEmailsDate
      , ExternalCustID          =   CMASTER.ExternalCustID
      , ShipDestinationType     =   CMASTER.ShipDestinationType
      , Hold                    =   CMASTER.Hold
      , HoldDate                =   CMASTER.HoldDate
      , HoldReason              =   CMASTER.HoldReason
      , PostType                =   CMASTER.PostType
      , ShipUPS                 =   CMASTER.ShipUPS
      , HoldBy                  =   CMASTER.HoldBy
      , ShipApprovalRequired    =   CMASTER.ShipApprovalRequired
      , ExternalCustType        =   CMASTER.ExternalCustType
      , AssuredDiscount         =   CMASTER.AssuredDiscount
      , ADToDiscountedOnly      =   CMASTER.ADToDiscountedOnly ;