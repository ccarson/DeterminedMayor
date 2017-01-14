
CREATE PROCEDURE [dbo].[sasp_FedbookTransactionsForSerialRange] 
(
  @BookName varchar(8)
  , @SerialPrefix varchar(6)
  , @StartSerialNum bigint
  , @EndSerialNum bigint
  , @MostRecentOnly tinyint
)
AS
BEGIN
DECLARE @SerialInfo TABLE
(
  Book char(10)
  , Serial varchar(14)
  , SerialIntPart bigint
  , PartNum varchar(20)
  , GunType char(1)
  , Manufacturer char(10)
  , LineNum int
  , TransType char(1)
  , TransDate date
  , Name varchar(25)
  , OrdNum numeric(12,2)
  , CorrectedBy bigint
  , HeaderID bigint
  , TransID bigint
  , CreatedBy char(4)
  , Location varchar(20)
);

IF ((@BookName = 'ALL') OR (@BookName = 'MAIN'))
BEGIN
  INSERT INTO @SerialInfo(Book, Serial, SerialIntPart, PartNum, GunType, Manufacturer, LineNum, TransType, TransDate, Name, OrdNum, CorrectedBy, HeaderID, TransID, CreatedBy, Location)
  SELECT 'MAIN', fh.Serial, SerLen.IntPart, fh.SPRNum, fh.GunType, fh.Manufacturer, ft.LineNum, ft.TransactionType, ft.TransactionDate, ft.Name, ft.OrdNum, ft.CorrectedBy, fh.ID, ft.ID, ft.CreatedBy, fh.Location
  FROM FedHeaderMain fh
    INNER JOIN FedTransMain ft
      ON fh.ID = ft.HeaderID
          AND ft.LineNum > 0
          AND ft.LineNum = CASE WHEN @MostRecentOnly = 1 THEN (SELECT MAX(LineNum) FROM FedTransMain WHERE HeaderID = fh.ID) ELSE ft.LineNum END
    CROSS APPLY (SELECT IntPart = CAST(LEFT(SUBSTRING(Serial, PATINDEX('%[0-9]%', Serial), LEN(Serial)),PATINDEX('%[^0-9]%', SUBSTRING(Serial, PATINDEX('%[0-9]%', Serial), LEN(Serial))+'a')-1) AS bigint)) SerLen 
  WHERE Serial LIKE @SerialPrefix AND IntPart >= @StartSerialNum AND IntPart <= @EndSerialNum 
  ORDER BY SerLen.IntPart
END

IF ((@BookName = 'ALL') OR (@BookName = 'XD3'))
BEGIN
  INSERT INTO @SerialInfo(Book, Serial, SerialIntPart, PartNum, GunType, Manufacturer, LineNum, TransType, TransDate, Name, OrdNum, CorrectedBy, HeaderID, TransID, CreatedBy, Location)
  SELECT 'XD3', fh.Serial, SerLen.IntPart, fh.SPRNum, fh.GunType, fh.Manufacturer, ft.LineNum, ft.TransactionType, ft.TransactionDate, ft.Name, ft.OrdNum, ft.CorrectedBy, fh.ID, ft.ID, ft.CreatedBy, fh.Location
  FROM FedHeaderXD3 fh
    INNER JOIN FedTransXD3 ft
      ON fh.ID = ft.HeaderID
          AND ft.LineNum > 0
          AND ft.LineNum = CASE WHEN @MostRecentOnly = 1 THEN (SELECT MAX(LineNum) FROM FedTransXD3 WHERE HeaderID = fh.ID) ELSE ft.LineNum END
    CROSS APPLY (SELECT IntPart = CAST(LEFT(SUBSTRING(Serial, PATINDEX('%[0-9]%', Serial), LEN(Serial)),PATINDEX('%[^0-9]%', SUBSTRING(Serial, PATINDEX('%[0-9]%', Serial), LEN(Serial))+'a')-1) AS bigint)) SerLen 
  WHERE Serial LIKE @SerialPrefix AND IntPart >= @StartSerialNum AND IntPart <= @EndSerialNum 
  ORDER BY SerLen.IntPart
END

IF ((@BookName = 'ALL') OR (@BookName = 'FARM'))
BEGIN
  INSERT INTO @SerialInfo(Book, Serial, SerialIntPart, PartNum, GunType, Manufacturer, LineNum, TransType, TransDate, Name, OrdNum, CorrectedBy, HeaderID, TransID, CreatedBy, Location)
  SELECT 'FARM', fh.Serial, SerLen.IntPart, fh.SPRNum, fh.GunType, fh.Manufacturer, ft.LineNum, ft.TransactionType, ft.TransactionDate, ft.Name, ft.OrdNum, ft.CorrectedBy, fh.ID, ft.ID, ft.CreatedBy, fh.Location
  FROM FedHeaderFarm fh
    INNER JOIN FedTransFarm ft
      ON fh.ID = ft.HeaderID
          AND ft.LineNum > 0
          AND ft.LineNum = CASE WHEN @MostRecentOnly = 1 THEN (SELECT MAX(LineNum) FROM FedTransFarm WHERE HeaderID = fh.ID) ELSE ft.LineNum END
    CROSS APPLY (SELECT IntPart = CAST(LEFT(SUBSTRING(Serial, PATINDEX('%[0-9]%', Serial), LEN(Serial)),PATINDEX('%[^0-9]%', SUBSTRING(Serial, PATINDEX('%[0-9]%', Serial), LEN(Serial))+'a')-1) AS bigint)) SerLen 
  WHERE Serial LIKE @SerialPrefix AND IntPart >= @StartSerialNum AND IntPart <= @EndSerialNum 
  ORDER BY SerLen.IntPart
END

IF ((@BookName = 'ALL') OR (@BookName = 'IMPORT'))
BEGIN
  INSERT INTO @SerialInfo(Book, Serial, SerialIntPart, PartNum, GunType, Manufacturer, LineNum, TransType, TransDate, Name, OrdNum, CorrectedBy, HeaderID, TransID, CreatedBy, Location)
  SELECT 'IMPORT', fh.Serial, SerLen.IntPart, fh.SPRNum, fh.GunType, fh.Manufacturer, ft.LineNum, ft.TransactionType, ft.TransactionDate, ft.Name, ft.OrdNum, ft.CorrectedBy, fh.ID, ft.ID, ft.CreatedBy, fh.Location
  FROM FedHeaderImport fh
    INNER JOIN FedTransImport ft
      ON fh.ID = ft.HeaderID
          AND ft.LineNum > 0
          AND ft.LineNum = CASE WHEN @MostRecentOnly = 1 THEN (SELECT MAX(LineNum) FROM FedTransImport WHERE HeaderID = fh.ID) ELSE ft.LineNum END
    CROSS APPLY (SELECT IntPart = CAST(LEFT(SUBSTRING(Serial, PATINDEX('%[0-9]%', Serial), LEN(Serial)),PATINDEX('%[^0-9]%', SUBSTRING(Serial, PATINDEX('%[0-9]%', Serial), LEN(Serial))+'a')-1) AS bigint)) SerLen 
  WHERE Serial LIKE @SerialPrefix AND IntPart >= @StartSerialNum AND IntPart <= @EndSerialNum 
  ORDER BY SerLen.IntPart
END

IF ((@BookName = 'ALL') OR (@BookName = 'CAMPPERRY'))
BEGIN
  INSERT INTO @SerialInfo(Book, Serial, SerialIntPart, PartNum, GunType, Manufacturer, LineNum, TransType, TransDate, Name, OrdNum, CorrectedBy, HeaderID, TransID, CreatedBy, Location)
  SELECT 'CAMPPERRY', fh.Serial, SerLen.IntPart, fh.SPRNum, fh.GunType, fh.Manufacturer, ft.LineNum, ft.TransactionType, ft.TransactionDate, ft.Name, ft.OrdNum, ft.CorrectedBy, fh.ID, ft.ID, ft.CreatedBy, fh.Location
  FROM FedHeaderCampPerry fh
    INNER JOIN FedTransCampPerry ft
      ON fh.ID = ft.HeaderID
          AND ft.LineNum > 0
          AND ft.LineNum = CASE WHEN @MostRecentOnly = 1 THEN (SELECT MAX(LineNum) FROM FedTransCampPerry WHERE HeaderID = fh.ID) ELSE ft.LineNum END
    CROSS APPLY (SELECT IntPart = CAST(LEFT(SUBSTRING(Serial, PATINDEX('%[0-9]%', Serial), LEN(Serial)),PATINDEX('%[^0-9]%', SUBSTRING(Serial, PATINDEX('%[0-9]%', Serial), LEN(Serial))+'a')-1) AS bigint)) SerLen 
  WHERE Serial LIKE @SerialPrefix AND IntPart >= @StartSerialNum AND IntPart <= @EndSerialNum 
  ORDER BY SerLen.IntPart
END

SELECT Book, Serial, PartNum, GunType, Manufacturer, LineNum, TransType, TransDate, Name, OrdNum, CorrectedBy, HeaderID, TransID, CreatedBy, Location
FROM @SerialInfo
ORDER BY SerialIntPart, Serial, Book, Manufacturer, LineNum, TransID
END