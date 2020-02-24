
CREATE PROCEDURE [dbo].[sasp_SerialsReceivedForReceivingTicketLine] 
(
  @ReceivingTicket int
  , @Line int
)
AS

SELECT COUNT(*)
FROM ReceiveSerial rs
WHERE rs.ReceivingTicket = @ReceivingTicket
  AND rs.[Line] = @Line
;