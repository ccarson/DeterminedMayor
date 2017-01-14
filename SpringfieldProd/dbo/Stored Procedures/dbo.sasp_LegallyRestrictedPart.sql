
CREATE PROCEDURE [dbo].[sasp_LegallyRestrictedPart] 
(
  @PartNum varchar(20)
  , @City varchar(30)
  , @State char(2)
  , @DealerExempt int
)
AS
BEGIN
  DECLARE @iPartsRestricted int;
  DECLARE @iPistolRestricted int;
  DECLARE @iRifleRestricted int;

  SET @iPartsRestricted =
  (SELECT COUNT(*) 
    FROM CHKCITY
    WHERE SPRNUM = @PartNum
        AND [STATE] = @State
        AND ((CITY = '') OR (CITY = @City))
  );
  IF @iPartsRestricted > 0 --There were part numbers on the order restricted for that State or City, so no need to even check capacities
  BEGIN
    SELECT @iPartsRestricted
  END
  ELSE BEGIN
    IF @DealerExempt = 1
    BEGIN
      SET @iRifleRestricted =
      (
        SELECT COUNT(*) 
        FROM CHKCITY cc
        WHERE cc.[STATE] = @State
            AND ((cc.CITY = '') OR (cc.CITY = @City))
            AND cc.Exemption <> 'E'
            AND ((cc.RifleCapacity > 0) AND (cc.RifleCapacity <
                (SELECT ISNULL(MAX(REPLACE(p.Capacity, 'N/A', '0')), 0)
                FROM parts p 
                WHERE p.SPRNUM = @PartNum
                    AND ((RIGHT(p.RPT_GROUP, 2) = '-R') OR (LEFT(p.RPT_GROUP, 2) = 'M1')) --Rifles or M1/M1A parts
                )))
      );

      SET @iPistolRestricted =
      (
        SELECT COUNT(*) 
        FROM CHKCITY cc
        WHERE cc.[STATE] = @State
            AND ((cc.CITY = '') OR (cc.CITY = @City))
            AND cc.Exemption <> 'E'
            AND ((cc.PistolCapacity > 0) AND (cc.PistolCapacity < 
                (SELECT ISNULL(MAX(REPLACE(p.Capacity, 'N/A', '0')), 0)
                FROM parts p 
                WHERE p.SPRNUM = @PartNum
                    AND ((RIGHT(p.RPT_GROUP, 2) = '-P') OR (LEFT(p.RPT_GROUP, 2) <> 'M1')) --Pistols or anything that's not M1/M1A parts
                )))
      );
    END
    ELSE BEGIN
      SET @iRifleRestricted =
      (
        SELECT COUNT(*) 
        FROM CHKCITY cc
        WHERE cc.[STATE] = @State
            AND ((cc.CITY = '') OR (cc.CITY = @City))
            AND ((cc.RifleCapacity > 0) AND (cc.RifleCapacity < 
                (SELECT ISNULL(MAX(REPLACE(p.Capacity, 'N/A', '0')), 0)
                FROM parts p 
                WHERE p.SPRNUM = @PartNum
                    AND ((RIGHT(p.RPT_GROUP, 2) = '-R') OR (LEFT(p.RPT_GROUP, 2) = 'M1')) --Rifles or M1/M1A parts
                )))
      );

      SET @iPistolRestricted =
      (
        SELECT COUNT(*) 
        FROM CHKCITY cc
        WHERE cc.[STATE] = @State
            AND ((cc.CITY = '') OR (cc.CITY = @City))
            AND ((cc.PistolCapacity > 0) AND (cc.PistolCapacity < 
                (SELECT ISNULL(MAX(REPLACE(p.Capacity, 'N/A', '0')), 0)
                FROM parts p 
                WHERE p.SPRNUM = @PartNum
                    AND ((RIGHT(p.RPT_GROUP, 2) = '-P') OR (LEFT(p.RPT_GROUP, 2) <> 'M1')) --Pistols or anything that's not M1/M1A parts
                )))

      );

    END

    SELECT ISNULL(@iRifleRestricted, 0) + ISNULL(@iPistolRestricted, 0);
  END

END