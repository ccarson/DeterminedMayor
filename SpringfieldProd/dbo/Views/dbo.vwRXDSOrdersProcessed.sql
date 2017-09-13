﻿
CREATE VIEW dbo.vwRXDSOrdersProcessed
--WITH SCHEMABINDING
AS

SELECT MASTERLN.ORDNUM, MASTERLN.SPRNUM, MASTERLN.QUAN, MASTERLN.YARD, MASTERLN.[DATE], MASTERLN.SHIPDATE,
  CUSTINFO.SCUSTID, 
  CUSTINFO.USERINITIALS, 
  CUSTINFO.DATE_WANTED,
  RAHDR.RMA#, 
  FEDBOOK.SERIAL
FROM   MASTERLN WITH (NOLOCK)
  LEFT OUTER JOIN CUSTINFO WITH (NOLOCK) ON MASTERLN.ORDNUM=CUSTINFO.ORDNUM
  LEFT OUTER JOIN RAHDR WITH (NOLOCK) ON MASTERLN.ORDNUM=RAHDR.ORDNUM 
  LEFT OUTER JOIN FEDBOOK WITH (NOLOCK) ON MASTERLN.ORDNUM=FEDBOOK.ORDNUM
WHERE  MASTERLN.YARD='RXDS' 
  AND MASTERLN.[DATE]>='1974-01-01';
--ORDER BY CUSTINFO.USERINITIALS
