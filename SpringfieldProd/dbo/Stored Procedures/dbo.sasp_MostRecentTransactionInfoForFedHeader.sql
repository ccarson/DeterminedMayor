
CREATE PROCEDURE [dbo].[sasp_MostRecentTransactionInfoForFedHeader] 
(
  @idHeader bigint
  , @BookName varchar(8)
)
AS

IF @BookName = 'MAIN'
BEGIN
  WITH TransInfo (TransactionDate, Name, TransOrder)
  AS
  (
    SELECT ftm.TransactionDate, ftm.Name, ROW_NUMBER() OVER (PARTITION BY HeaderID ORDER BY ID DESC)
    FROM FedTransMain ftm 
    WHERE ftm.HeaderID = @idHeader
      AND ftm.CorrectedBy = 0
      AND ftm.LineNum <> 0
  )
  SELECT ti.TransactionDate, ti.Name
  FROM TransInfo ti
  WHERE ti.TransOrder = 1;
END
IF @BookName = 'XD3'
BEGIN
  WITH TransInfo (TransactionDate, Name, TransOrder)
  AS
  (
    SELECT ftx.TransactionDate, ftx.Name, ROW_NUMBER() OVER (PARTITION BY HeaderID ORDER BY ID DESC)
    FROM FedTransXD3 ftx 
    WHERE ftx.HeaderID = @idHeader
      AND ftx.CorrectedBy = 0
      AND ftx.LineNum <> 0
  )
  SELECT ti.TransactionDate, ti.Name
  FROM TransInfo ti
  WHERE ti.TransOrder = 1;
END
IF @BookName = 'FARM'
BEGIN
  WITH TransInfo (TransactionDate, Name, TransOrder)
  AS
  (
    SELECT ftf.TransactionDate, ftf.Name, ROW_NUMBER() OVER (PARTITION BY HeaderID ORDER BY ID DESC)
    FROM FedTransFarm ftf 
    WHERE ftf.HeaderID = @idHeader
      AND ftf.CorrectedBy = 0
      AND ftf.LineNum <> 0
  )
  SELECT ti.TransactionDate, ti.Name
  FROM TransInfo ti
  WHERE ti.TransOrder = 1;
END
IF @BookName = 'IMPORT'
BEGIN
  WITH TransInfo (TransactionDate, Name, TransOrder)
  AS
  (
    SELECT fti.TransactionDate, fti.Name, ROW_NUMBER() OVER (PARTITION BY HeaderID ORDER BY ID DESC)
    FROM FedTransImport fti 
    WHERE fti.HeaderID = @idHeader
      AND fti.CorrectedBy = 0
      AND fti.LineNum <> 0
  )
  SELECT ti.TransactionDate, ti.Name
  FROM TransInfo ti
  WHERE ti.TransOrder = 1;
END
IF @BookName = 'CAMPPERRY'
BEGIN
  WITH TransInfo (TransactionDate, Name, TransOrder)
  AS
  (
    SELECT fti.TransactionDate, fti.Name, ROW_NUMBER() OVER (PARTITION BY HeaderID ORDER BY ID DESC)
    FROM FedTransCampPerry fti 
    WHERE fti.HeaderID = @idHeader
      AND fti.CorrectedBy = 0
      AND fti.LineNum <> 0
  )
  SELECT ti.TransactionDate, ti.Name
  FROM TransInfo ti
  WHERE ti.TransOrder = 1;
END