CREATE PROCEDURE [dbo].[sasp_ResequenceFedbookRecords] @numOrder NUMERIC(12,2)
AS
  --Create a table variable for getting the correct Number
  DECLARE @ProperSequence TABLE
  (Recnum BigInt, 
  Seq int);

  --Fill the numbers in
  INSERT INTO @ProperSequence (Recnum, Seq) 
  SELECT Recnum, ROW_NUMBER() OVER (PARTITION BY ORDNUM, LineNum ORDER BY SERIAL) 
  FROM FEDBOOK 
  WHERE ORDNUM = @numOrder;

  --Fix OrderSeq
  UPDATE FEDBOOK 
  SET OrderSeq = ps.Seq 
  FROM @ProperSequence ps 
  WHERE ps.Recnum = FEDBOOK.Recnum;

