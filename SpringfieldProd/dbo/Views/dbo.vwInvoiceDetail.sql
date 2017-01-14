

CREATE VIEW [dbo].[vwInvoiceDetail]
--WITH SCHEMABINDING
AS

SELECT ci.ORDNUM, 
ci.CUST_PO#, 
ci.[DATE], 
ci.SHIPDATE, 
ci.InvoiceNum, 
ci.YardCode, 
ci.POST, 
ci.OTOTAL, 
ci.TAX, 
ci.RECEIVED, 
ci.RefundTotal, 
ci.Balance, 
ci.SUB, 
ci.DISC, 
ci.O_Disc, 
ci.ShipToPO, 
ci.Programming_Ver, 
ci.N1, 
ci.N2, 
ci.N3, 
ci.N4, 
ci.N5, 
ci.Invoice_Notes,
ml.[IN] AS LineNum, 
ml.SPRNUM, 
ml.[DESC], 
ml.QUAN, 
ml.UPRICE, 
ml.TPRICE, 
ml.QUANS, 
BCust.CUSTID AS BCUSTID, 
BCust.BNAME, 
BCust.BSTREET, 
BCust.BSTREET2, 
BCust.BCITY, 
BCust.BSTATE, 
BCust.BZIP, 
BCust.COUNTRY AS BCOUNTRY, 
BCust.ILLTAX, 
ci.SNAME AS SNAME, 
ci.SAddress, 
ci.SAddress2, 
ci.SCity AS SCITY, 
ci.SState AS SSTATE, 
ci.SZip AS SZIP, 
ci.SCountry AS SCOUNTRY, 
SCust.CUSTID AS SCUSTID, 
SCust.FFLNUM, 
SCust.FFLEXPR, 
cmat.ACCTYPE, 
cmat.[DESCRIPTION]
FROM         dbo.CUSTINFO AS ci WITH (NOLOCK) INNER JOIN
                      dbo.MASTERLN AS ml WITH (NOLOCK) 
ON ci.ORDNUM = ml.ORDNUM INNER JOIN
                      dbo.CMASTER AS SCust WITH (NOLOCK) 
ON ci.SCUSTID = SCust.CUSTID INNER JOIN
                      dbo.CMASTER AS BCust WITH (NOLOCK) 
ON ci.BCUSTID = BCust.CUSTID INNER JOIN
                      dbo.cmacctyp AS cmat WITH (NOLOCK) 
ON ci.ACCTYPE = cmat.ACCTYPE 


