
CREATE PROCEDURE [dbo].[sasp_FedbookSerialsForStatus] 
(
  @BookName varchar(8)
  , @Status char(1)
)
AS
BEGIN
DECLARE @SerialInfo TABLE
(
  Book char(10)
  , Serial varchar(14)
  , PartNum varchar(20)
  , GunType char(1)
  , Manufacturer char(10)
  , LineNum int
  , TransType char(1)
  , TransDate date
  , TypeDescription varchar(30)
  , Name varchar(25)
  , CorrectedBy bigint
  , HeaderID bigint
  , TransID bigint
  , CreatedBy char(4)
  , Location varchar(20)
);

IF ((@BookName = 'ALL') OR (@BookName = 'MAIN'))
BEGIN
  INSERT INTO @SerialInfo(Book, Serial, PartNum, GunType, Manufacturer, LineNum, TransType, TransDate, TypeDescription, Name, CorrectedBy, HeaderID, TransID, CreatedBy, Location)
  SELECT 'MAIN', fh.Serial, fh.SPRNum, fh.GunType, fh.Manufacturer, ft.LineNum, ft.TransactionType, ft.TransactionDate, cm.[DESCRIPTION], ft.Name, ft.CorrectedBy, fh.ID, ft.ID, ft.CreatedBy, fh.Location
  FROM FedHeaderMain fh
    INNER JOIN FedTransMain ft
      ON fh.ID = ft.HeaderID
          AND ft.LineNum > 0
          AND fh.CurrentState = @Status
          AND ft.CorrectedBy = 0
          AND ft.LineNum = (SELECT MAX(LineNum) FROM FedTransMain WHERE HeaderID = fh.ID AND TransactionType = @Status)
    INNER JOIN CodeMast cm
      ON ft.TransactionType = cm.CODE
          AND cm.[TYPE] = 'FBTRANTYPE'
END

IF ((@BookName = 'ALL') OR (@BookName = 'XD3'))
BEGIN
  INSERT INTO @SerialInfo(Book, Serial, PartNum, GunType, Manufacturer, LineNum, TransType, TransDate, TypeDescription, Name, CorrectedBy, HeaderID, TransID, CreatedBy, Location)
  SELECT 'XD3', fh.Serial, fh.SPRNum, fh.GunType, fh.Manufacturer, ft.LineNum, ft.TransactionType, ft.TransactionDate, cm.[DESCRIPTION], ft.Name, ft.CorrectedBy, fh.ID, ft.ID, ft.CreatedBy, fh.Location
  FROM FedHeaderXD3 fh
    INNER JOIN FedTransXD3 ft
      ON fh.ID = ft.HeaderID
          AND ft.LineNum > 0
          AND fh.CurrentState = @Status
          AND ft.CorrectedBy = 0
          AND ft.LineNum = (SELECT MAX(LineNum) FROM FedTransXD3 WHERE HeaderID = fh.ID AND TransactionType = @Status)
    INNER JOIN CodeMast cm
      ON ft.TransactionType = cm.CODE
          AND cm.[TYPE] = 'FBTRANTYPE'
END

IF ((@BookName = 'ALL') OR (@BookName = 'FARM'))
BEGIN
  INSERT INTO @SerialInfo(Book, Serial, PartNum, GunType, Manufacturer, LineNum, TransType, TransDate, TypeDescription, Name, CorrectedBy, HeaderID, TransID, CreatedBy, Location)
  SELECT 'FARM', fh.Serial, fh.SPRNum, fh.GunType, fh.Manufacturer, ft.LineNum, ft.TransactionType, ft.TransactionDate, cm.[DESCRIPTION], ft.Name, ft.CorrectedBy, fh.ID, ft.ID, ft.CreatedBy, fh.Location
  FROM FedHeaderFarm fh
    INNER JOIN FedTransFarm ft
      ON fh.ID = ft.HeaderID
          AND ft.LineNum > 0
          AND fh.CurrentState = @Status
          AND ft.CorrectedBy = 0
          AND ft.LineNum = (SELECT MAX(LineNum) FROM FedTransFarm WHERE HeaderID = fh.ID AND TransactionType = @Status)
    INNER JOIN CodeMast cm
      ON ft.TransactionType = cm.CODE
          AND cm.[TYPE] = 'FBTRANTYPE'
END

IF ((@BookName = 'ALL') OR (@BookName = 'IMPORT'))
BEGIN
  INSERT INTO @SerialInfo(Book, Serial, PartNum, GunType, Manufacturer, LineNum, TransType, TransDate, TypeDescription, Name, CorrectedBy, HeaderID, TransID, CreatedBy, Location)
  SELECT 'IMPORT', fh.Serial, fh.SPRNum, fh.GunType, fh.Manufacturer, ft.LineNum, ft.TransactionType, ft.TransactionDate, cm.[DESCRIPTION], ft.Name, ft.CorrectedBy, fh.ID, ft.ID, ft.CreatedBy, fh.Location
  FROM FedHeaderImport fh
    INNER JOIN FedTransImport ft
      ON fh.ID = ft.HeaderID
          AND ft.LineNum > 0
          AND fh.CurrentState = @Status
          AND ft.CorrectedBy = 0
          AND ft.LineNum = (SELECT MAX(LineNum) FROM FedTransImport WHERE HeaderID = fh.ID AND TransactionType = @Status)
    INNER JOIN CodeMast cm
      ON ft.TransactionType = cm.CODE
          AND cm.[TYPE] = 'FBTRANTYPE'
END

SELECT Book, Serial, PartNum, GunType, Manufacturer, LineNum, TransType, TransDate, TypeDescription, Name, CorrectedBy, HeaderID, TransID, CreatedBy, Location
FROM @SerialInfo
ORDER BY Book, Serial, Manufacturer, LineNum
END