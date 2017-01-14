
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sasp_CalcNeeded] 
	-- Add the parameters for the stored procedure here
	@MasterPart varchar(20)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT SUBPART, AMOUNT
    ,(Case WHEN SUBPART IN
    (SELECT subref.MASTPART
    FROM subref INNER JOIN parts p ON p.SPRNUM = subref.MASTPART and p.PURCH_FLAG <> 'P') THEN 'Yes' Else '' End) as IsAssembly
    ,REPLACE_FLAG, LEAD_TIME
    FROM subref
    INNER JOIN parts ON subref.SUBPART = parts.SPRNUM
    WHERE MASTPART = @MasterPart
END