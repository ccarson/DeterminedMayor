CREATE PROCEDURE [dbo].[sasp_MinimumPalletNumber] @numOrder NUMERIC(12,2)
AS
  SELECT MIN(ISNULL(Pallet, 0)) AS MinPallet
  FROM CartonHeader
  WHERE OrdNum = @numOrder