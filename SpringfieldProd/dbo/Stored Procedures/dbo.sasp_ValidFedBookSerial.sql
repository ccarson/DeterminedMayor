-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sasp_ValidFedBookSerial]
@Serial varchar(14)
WITH EXEC AS CALLER
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select Serial, SprNum, Caliber, GunType, Model, Manufacturer from FedHeaderMain
	Where LEFT(SPRnum, 4) <> 'RP90'
	and LEFT(SPRNum, 4) <> 'RC90'
	and SUBSTRING ( SPRNum , 3 , 2 ) <> '99' 
	and not( 
		SUBSTRING ( SPRNum, 4, 2) = '99' and SUBSTRING ( SPRNum, 3, 1) not in ('0','1','2','3','4','5','6','7','8','9')
	)
	and Serial = @Serial
	and Manufacturer in ('IMBEL', 'HS PRODUKT', 'S I', 'SPG ARMORY', 'SI')
END