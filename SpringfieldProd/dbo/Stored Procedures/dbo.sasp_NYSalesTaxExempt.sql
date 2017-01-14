
CREATE PROCEDURE [dbo].[sasp_NYSalesTaxExempt]
   @dFrom DATE, @dThru DATE
   WITH
   EXEC AS CALLER
AS
   SELECT MASTERLN.ORDNUM,
          MASTERLN.TPRICE,
          CUSTINFO.SHIPDATE,
          CUSTINFO.TAX,
          CUSTINFO.OTOTAL,
          MASTERLN.SPRNUM,
          MASTERLN.[DESC],
          MASTERLN.SalesTax,
          MASTERLN.TaxRate,
          SalesTax.State,
          SalesTax.County,
          SalesTax.City
     FROM (dbo.MASTERLN MASTERLN
           INNER JOIN dbo.parts parts ON (MASTERLN.SPRNUM = parts.SPRNUM))
          INNER JOIN dbo.CUSTINFO CUSTINFO
             ON (MASTERLN.ORDNUM = CUSTINFO.ORDNUM)
          INNER JOIN dbo.SalesTax SalesTax
             ON (CUSTINFO.TaxByZipID = SalesTax.ID)
    WHERE     (CAST ([CUSTINFO].[SHIPDATE] AS DATE) >= @dFrom)
          AND (CAST ([CUSTINFO].[SHIPDATE] AS DATE) <= @dThru)
          AND (CUSTINFO.SState = 'NY')
          AND (parts.RPT_GROUP = 'CLTH')
          AND (MASTERLN.UPRICE < 110.00)
   ORDER BY SalesTax.County
GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date Thru', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'sasp_NYSalesTaxExempt', @level2type = N'PARAMETER', @level2name = N'@dThru';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Date From', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'PROCEDURE', @level1name = N'sasp_NYSalesTaxExempt', @level2type = N'PARAMETER', @level2name = N'@dFrom';

