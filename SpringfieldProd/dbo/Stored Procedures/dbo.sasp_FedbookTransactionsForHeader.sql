
CREATE PROCEDURE [dbo].[sasp_FedbookTransactionsForHeader] 
(
  @HeaderID bigint
  , @BookName varchar(9)
)
AS

IF @BookName = 'MAIN'
BEGIN
  SELECT ft.ID, ft.LineNum, ft.TransactionDate, ft.TransactionType, CM.[DESCRIPTION] AS TranTypeDesc, ft.Name, ft.[Description] as TransDesc
  FROM FedTransMain ft
  LEFT JOIN CodeMast cm
    ON ft.TransactionType = cm.CODE
        AND cm.TYPE = 'FBTRANTYPE'
  WHERE ft.HeaderID = @HeaderID
      AND ft.CorrectedBy = 0
      AND ft.LineNum <> 0
  ORDER BY ft.LineNum DESC;
END
IF @BookName = 'XD3'
BEGIN
  SELECT ft.ID, ft.LineNum, ft.TransactionDate, ft.TransactionType, CM.[DESCRIPTION] AS TranTypeDesc, ft.Name, ft.[Description] as TransDesc
  FROM FedTransXD3 ft
  LEFT JOIN CodeMast cm
    ON ft.TransactionType = cm.CODE
        AND cm.TYPE = 'FBTRANTYPE'
  WHERE ft.HeaderID = @HeaderID
      AND ft.CorrectedBy = 0
      AND ft.LineNum <> 0
  ORDER BY ft.LineNum DESC;
END
IF @BookName = 'FARM'
BEGIN
  SELECT ft.ID, ft.LineNum, ft.TransactionDate, ft.TransactionType, CM.[DESCRIPTION] AS TranTypeDesc, ft.Name, ft.[Description] as TransDesc
  FROM FedTransFarm ft
  LEFT JOIN CodeMast cm
    ON ft.TransactionType = cm.CODE
        AND cm.TYPE = 'FBTRANTYPE'
  WHERE ft.HeaderID = @HeaderID
      AND ft.CorrectedBy = 0
      AND ft.LineNum <> 0
  ORDER BY ft.LineNum DESC;
END
IF @BookName = 'IMPORT'
BEGIN
  SELECT ft.ID, ft.LineNum, ft.TransactionDate, ft.TransactionType, CM.[DESCRIPTION] AS TranTypeDesc, ft.Name, ft.[Description] as TransDesc
  FROM FedTransImport ft
  LEFT JOIN CodeMast cm
    ON ft.TransactionType = cm.CODE
        AND cm.TYPE = 'FBTRANTYPE'
  WHERE ft.HeaderID = @HeaderID
      AND ft.CorrectedBy = 0
      AND ft.LineNum <> 0
  ORDER BY ft.LineNum DESC;
END
IF @BookName = 'CAMPPERRY'
BEGIN
  SELECT ft.ID, ft.LineNum, ft.TransactionDate, ft.TransactionType, CM.[DESCRIPTION] AS TranTypeDesc, ft.Name, ft.[Description] as TransDesc
  FROM FedTransCampPerry ft
  LEFT JOIN CodeMast cm
    ON ft.TransactionType = cm.CODE
        AND cm.TYPE = 'FBTRANTYPE'
  WHERE ft.HeaderID = @HeaderID
      AND ft.CorrectedBy = 0
      AND ft.LineNum <> 0
  ORDER BY ft.LineNum DESC;
END