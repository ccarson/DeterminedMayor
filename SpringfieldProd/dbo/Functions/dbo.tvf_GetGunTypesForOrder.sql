
CREATE FUNCTION
    dbo.tvf_GetGunTypesForOrder ( @pORDNUM varchar(20) )

RETURNS TABLE AS
/*
************************************************************************************************************************************

   Function:    dbo.tvf_GetGunTypesForOrder
     Author:    Chris Carson
    Purpose:    Returns all guntypes on a given order 

    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         2017-08-07          created


    Notes

************************************************************************************************************************************
*/
RETURN

SELECT
    ORDNUM				=   @pORDNUM
  , GunTypes			=   STUFF((	
								SELECT DISTINCT ',' + GUNTYPE 
								FROM		dbo.parts AS p
								INNER JOIN	dbo.MASTERLN ON MASTERLN.SPRNUM = p.SPRNUM
								WHERE		dbo.MASTERLN.ORDNUM = @pORDNUM
								FOR XML PATH('') ), 1, 1, '' )  
;