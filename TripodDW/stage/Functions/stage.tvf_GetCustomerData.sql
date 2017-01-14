
CREATE FUNCTION
    stage.tvf_GetCustomerData(
        @pCUSTID varchar(10) )
RETURNS TABLE
AS
/*
************************************************************************************************************************************

   Function:    stage.tvf_GetCustomerData
     Author:    Chris Carson
    Purpose:    Gets data for dimension.Customer record from Springfield data, computes checksum for record.

    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         2016-10-01          created


    Notes
        Use checksum to compare legacy data against Tripod to determine changes

************************************************************************************************************************************
*/
RETURN

SELECT
    SourceRecnum    =   stage.Recnum
  , CustomerID      =   stage.CUSTID
  , CustomerName    =   stage.BNAME
  , PriceType       =   stage.PriceType
  , DWChecksum      =   CAST( HASHBYTES ( 'SHA2_256', CONVERT( varchar(32), stage.Recnum )
                                                        + stage.CUSTID
                                                        + stage.BNAME
                                                        + stage.PriceType ) AS BINARY(32) )
FROM
    stage.CMASTER AS stage
WHERE
    stage.CUSTID = @pCUSTID ;