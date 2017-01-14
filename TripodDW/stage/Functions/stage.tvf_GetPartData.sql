
CREATE FUNCTION
    stage.tvf_GetPartData(
        @pSPRNUM varchar(20) )

RETURNS TABLE AS
/*
************************************************************************************************************************************

   Function:    stage.tvf_GetPartData
     Author:    Chris Carson
    Purpose:    Gets data for dimension.Part record from Springfield data, computes checksum for record

    revisor         date                description
    ---------       -----------         ----------------------------
    ccarson         2016-10-01          created

    Notes:
        Use checksums to compare legacy data to Tripod to determine changes

************************************************************************************************************************************
*/
RETURN

SELECT DISTINCT
    SPRNUM              =   part.SPRNUM
  , SPRDescription      =   part.[DESC]
  , SourceRecnum        =   part.Recnum
  , LastSoldDate        =   part.LSALE
  , ReorderPointQty     =   part.REORDPNT
  , FullyStockedQty     =   part.[FULL]
  , SafetyStockQty      =   0
  , LeadTimeDays        =   part.LEAD_TIME
  , UPC                 =   part.UPC
  , GunType             =   ISNULL(gunType.[DESC], '')
  , GunStock            =   part.GUNSTOCK
  , GroupCode           =   part.GROUP1
  , ReportingGroup      =   part.RPT_GROUP
  , SPRCategory         =   CASE ISNULL(category.DESCRIPTION, '')
								WHEN 'AR Rifle Parts' THEN 'AR Rifle'
								ELSE ISNULL( category.DESCRIPTION, '' ) 
							END
  , SPRSubCategory      =   ISNULL(subCategory.Description, '')
  , VendorIDCode        =   part.VENDOR_ID
  , IsTaxable           =   part.TAX_FLAG
  , ExciseTaxType       =   part.EXCISE_TYPE
  , IsGunPart           =   CASE
                                WHEN part.SERIAL_FLAG = 'Y' AND part.EXCISE > 0 THEN 'Y'
                                ELSE 'N'
                            END
  , BarrelLength        =   part.BARREL_LENGTH
  , HasThreadedBarrel   =   ISNULL( part.ThreadedBarrel, '' )
  , FinishDescription   =   part.FINISH
  , IsSellable          =   part.SELLABLE
  , PartStatus          =   part.ACTIVE
  , PartTypeCode        =   part.Part_Type
  , PartCategory        =   part.Part_Category
  , CapacityCode        =   ISNULL( part.Capacity, '' )
  , LocationCode        =   ISNULL( part.Location, '' )
  , IsReportable 		=	CASE
								WHEN doNotReport.SPRNUM IS NULL THEN 'Y'
								ELSE 'N'
							END
  , IsAssembly 			=	CASE 
								WHEN assembly.AssemblyPartKey IS NOT NULL THEN 'Y'
								ELSE 'N'
							END 
  , AssemblyPartKey 	=	CASE 
								WHEN assembly.AssemblyPartKey IS NOT NULL THEN assembly.AssemblySPRNUM 
								WHEN component.AssemblyPartKey IS NOT NULL THEN component.AssemblySPRNUM 
								ELSE '' 
							END			
  , DWChecksum          =   CAST( HASHBYTES ( 'SHA2_256', part.SPRNUM
                                                            + part.[DESC]
                                                            + CONVERT( varchar(20), part.Recnum )
                                                            + CONVERT( varchar(10), part.LSALE, 120 )
                                                            + CONVERT( varchar(20), part.REORDPNT )
                                                            + CONVERT( varchar(20), part.[FULL] )
                                                            + CONVERT( varchar(20), 0 )
                                                            + CONVERT( varchar(20), part.LEAD_TIME )
                                                            + part.UPC
                                                            + ISNULL(gunType.[DESC], '')
                                                            + part.GUNSTOCK
                                                            + part.GROUP1
                                                            + part.RPT_GROUP
                                                            + CASE ISNULL(category.DESCRIPTION, '')
																WHEN 'AR Rifle Parts' THEN 'AR Rifle'
																ELSE ISNULL( category.DESCRIPTION, '' ) 
															  END		
                                                            + ISNULL(subCategory.Description, '')
                                                            + part.VENDOR_ID
                                                            + part.TAX_FLAG
                                                            + part.EXCISE_TYPE
                                                            + part.SERIAL_FLAG
                                                            + CONVERT( varchar(20), part.EXCISE )
                                                            + CONVERT( varchar(20), part.BARREL_LENGTH )
                                                            + ISNULL( part.ThreadedBarrel, '' )
                                                            + part.FINISH
                                                            + part.SELLABLE
                                                            + part.ACTIVE
                                                            + part.Part_Type
                                                            + part.Part_Category
                                                            + ISNULL( part.Capacity, '' )
                                                            + ISNULL( part.Location, '' ) 
															+ CASE
																WHEN doNotReport.SPRNUM IS NULL THEN 'Y'
																ELSE 'N'
															  END
															+ CASE 
																WHEN assembly.AssemblyPartKey IS NOT NULL THEN 'Y'
																ELSE 'N'
															  END 
															+ ISNULL( assembly.AssemblySPRNUM, '' )
															+ ISNULL( component.AssemblySPRNUM, '' ) 
															) AS BINARY(32) )
FROM
    stage.parts AS part
LEFT OUTER JOIN
	stage.PartAssembly AS component 
		ON component.ComponentSPRNUM = part.SPRNUM 
LEFT OUTER JOIN
	stage.PartAssembly AS assembly 
		ON assembly.AssemblySPRNUM = part.SPRNUM  
LEFT OUTER JOIN
	stage.DoNotReportPart AS doNotReport
		ON doNotReport.SPRNUM = part.SPRNUM
LEFT OUTER JOIN
    [$(SpringfieldProd)].dbo.INPRTGRP AS category
        ON category.CODE = part.RPT_GROUP
LEFT OUTER JOIN
    [$(SpringfieldProd)].dbo.PartsSubCategory AS subCategory
        ON subCategory.Category = part.RPT_GROUP
            AND subCategory.SubCategory = part.SubCategory
LEFT OUTER JOIN
    [$(SpringfieldProd)].dbo.GUNTYPES AS gunType 
		ON gunType.CODE = part.GUNTYPE
WHERE
    part.SPRNUM = @pSPRNUM ;
