
CREATE PROCEDURE [dbo].[sasp_HeadersForSerial] 
(
  @Serial varchar(14)
  , @BookName varchar(9)
)
AS

IF @BookName = 'MAIN'
BEGIN
  SELECT fh.ID, gt.[DESC], fh.Manufacturer, fh.SPRNum, fh.CurrentState
  FROM FedHeaderMain fh
    LEFT JOIN GUNTYPES gt
      ON fh.GunType = gt.CODE
  WHERE fh.Serial = @Serial
      AND fh.CurrentState <> 'I';
END
IF @BookName = 'XD3'
BEGIN
  SELECT fh.ID, gt.[DESC], fh.Manufacturer, fh.SPRNum, fh.CurrentState
  FROM FedHeaderXD3 fh
    LEFT JOIN GUNTYPES gt
      ON fh.GunType = gt.CODE
  WHERE fh.Serial = @Serial
      AND fh.CurrentState <> 'I';
END
IF @BookName = 'FARM'
BEGIN
  SELECT fh.ID, gt.[DESC], fh.Manufacturer, fh.SPRNum, fh.CurrentState
  FROM FedHeaderFarm fh
    LEFT JOIN GUNTYPES gt
      ON fh.GunType = gt.CODE
  WHERE fh.Serial = @Serial
      AND fh.CurrentState <> 'I';
END
IF @BookName = 'IMPORT'
BEGIN
  SELECT fh.ID, gt.[DESC], fh.Manufacturer, fh.SPRNum, fh.CurrentState
  FROM FedHeaderImport fh
    LEFT JOIN GUNTYPES gt
      ON fh.GunType = gt.CODE
  WHERE fh.Serial = @Serial
      AND fh.CurrentState <> 'I';
END
IF @BookName = 'CAMPPERRY'
BEGIN
  SELECT fh.ID, gt.[DESC], fh.Manufacturer, fh.SPRNum, fh.CurrentState
  FROM FedHeaderCampPerry fh
    LEFT JOIN GUNTYPES gt
      ON fh.GunType = gt.CODE
  WHERE fh.Serial = @Serial
      AND fh.CurrentState <> 'I';
END