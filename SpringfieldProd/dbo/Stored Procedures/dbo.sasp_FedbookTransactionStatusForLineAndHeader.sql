
CREATE PROCEDURE [dbo].[sasp_FedbookTransactionStatusForLineAndHeader] 
(
  @HeaderID bigint
  , @LineNum int
  , @BookName varchar(9)
)
AS

IF @BookName = 'MAIN'
BEGIN
  SELECT ft.ID, ft.TransactionType
  FROM FedTransMain ft
  WHERE ft.HeaderID = @HeaderID
      AND ft.CorrectedBy = 0
      AND ft.LineNum = @LineNum;
END
IF @BookName = 'XD3'
BEGIN
  SELECT ft.ID, ft.TransactionType
  FROM FedTransXD3 ft
  WHERE ft.HeaderID = @HeaderID
      AND ft.CorrectedBy = 0
      AND ft.LineNum = @LineNum;
END
IF @BookName = 'FARM'
BEGIN
  SELECT ft.ID, ft.TransactionType
  FROM FedTransFarm ft
  WHERE ft.HeaderID = @HeaderID
      AND ft.CorrectedBy = 0
      AND ft.LineNum = @LineNum;
END
IF @BookName = 'IMPORT'
BEGIN
  SELECT ft.ID, ft.TransactionType
  FROM FedTransImport ft
  WHERE ft.HeaderID = @HeaderID
      AND ft.CorrectedBy = 0
      AND ft.LineNum = @LineNum;
END
IF @BookName = 'CAMPPERRY'
BEGIN
  SELECT ft.ID, ft.TransactionType
  FROM FedTransCampPerry ft
  WHERE ft.HeaderID = @HeaderID
      AND ft.CorrectedBy = 0
      AND ft.LineNum = @LineNum;
END