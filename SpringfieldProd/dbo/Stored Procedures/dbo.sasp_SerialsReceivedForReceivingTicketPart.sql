/****** Object:  View [dbo].[PartsShippedNoFedBook]    Script Date: 10/21/2016 9:26:12 AM ******/
--ALTER VIEW [dbo].[PartsShippedNoFedBook]
--AS
--SELECT     TOP (100) PERCENT dbo.MASTERLN.ORDNUM, dbo.MASTERLN.SPRNUM, dbo.MASTERLN.QUANSHIP, dbo.MASTERLN.SHIPDATE
--FROM         dbo.MASTERLN INNER JOIN
--                      dbo.parts ON dbo.MASTERLN.SPRNUM = dbo.parts.SPRNUM
--WHERE     (dbo.MASTERLN.QUANSHIP > 0) AND (dbo.parts.SERIAL_FLAG = 'Y') AND (dbo.MASTERLN.ORDNUM NOT IN
--                          (SELECT     ORDNUM
--                            FROM          FedTransMain)) AND (dbo.MASTERLN.SHIPDATE > '2000-01-01')
--ORDER BY dbo.MASTERLN.SPRNUM, dbo.MASTERLN.ORDNUM
--GO
--SET QUOTED_IDENTIFIER ON
--GO
--SET ANSI_NULLS ON
--GO
CREATE PROCEDURE [dbo].[sasp_SerialsReceivedForReceivingTicketPart] 
(
  @ReceivingTicket int
  , @PartNum varchar(20)
)
AS

SELECT COUNT(*)
FROM ReceiveSerial rs
WHERE rs.ReceivingTicket = @ReceivingTicket
  AND rs.SprNum = @PartNum
;