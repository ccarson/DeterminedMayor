
CREATE VIEW [dbo].[vwPackingListDetail]
AS
SELECT        ci.ORDNUM, ci.CUST_PO#, ci.DATE, ci.SHIPDATE, ci.DATE_WANTED, ci.TELEWHO, ci.CARDKIND, ci.CARDNUM, ci.EXPIRE, ci.CID, ci.YardCode, ci.[STATUS], ci.ShipToPO, ci.Form4473, ci.Packing_Notes, 
                         ml.[IN] AS LineNum, ml.SPRNUM
--,  CASE WHEN (ml.SPRNUM = 'MISCEL') OR (ml.SPRNUM = 'NOTE') THEN ml.[DESC] ELSE p.[DESC] END AS PartDescription
, ml.[DESC] AS PartDescription
, ml.QUAN, ml.QUANS, ml.Quan_BO, BCust.CUSTID AS BCUSTID, BCust.BNAME, BCust.BSTREET, BCust.BSTREET2, BCust.BCITY, BCust.BSTATE, BCust.BZIP, 
                         BCust.COUNTRY AS BCOUNTRY, BCust.ILLTAX, ci.SNAME, ci.SAddress AS SSTREET, ci.SAddress2 AS SSTREET2, ci.SCity, ci.SState, ci.SZip, ci.SCountry, SCust.CUSTID AS SCUSTID, SCust.FFLNUM, 
                         SCust.FFLEXPR, cmat.ACCTYPE, cmat.DESCRIPTION, p.SERIAL_FLAG, ci.FREIGHT_FLAG, ci.PostType, ci.ShipUPS, ci.ShipDestinationType, cm.[DESCRIPTION] AS ShipDestDescription, ci.CancelAfter
FROM            dbo.CUSTINFO AS ci WITH (NOLOCK) INNER JOIN
                         dbo.MASTERLN AS ml WITH (NOLOCK) ON ci.ORDNUM = ml.ORDNUM INNER JOIN
                         dbo.CMASTER AS SCust WITH (NOLOCK) ON ci.SCUSTID = SCust.CUSTID INNER JOIN
                         dbo.CMASTER AS BCust WITH (NOLOCK) ON ci.BCUSTID = BCust.CUSTID INNER JOIN
                         dbo.cmacctyp AS cmat WITH (NOLOCK) ON ci.ACCTYPE = cmat.ACCTYPE LEFT OUTER JOIN
                         dbo.parts AS p WITH (NOLOCK) ON ml.SPRNUM = p.SPRNUM LEFT OUTER JOIN
                         dbo.CodeMast AS cm WITH (NOLOCK) ON ci.ShipDestinationType = cm.CODE AND cm.TYPE = 'SHIPDEST'

GO



GO



GO


