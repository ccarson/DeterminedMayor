
CREATE PROCEDURE [dbo].[sasp_ResequenceFedbookRecordsForReprint] @sBCustID varchar(10), @sShipDate varchar(20)
AS
  --Create a table variable for getting the correct Number
  DECLARE @ProperSequence TABLE
  (Recnum BigInt, 
  Seq int);

  DECLARE @sql nvarchar(max);

  --Declare local copies of the parameters to fix parameter sniffing problems.
  DECLARE @BCustID varchar(10);
  DECLARE @ShipDate date;
  SET @BCustID = @sBCustID;
  SET @ShipDate = CONVERT(date, @sShipDate);

  --Fill the numbers in
  INSERT INTO @ProperSequence (Recnum, Seq) 
  SELECT Recnum, ROW_NUMBER() OVER (PARTITION BY fb.ORDNUM, fb.LineNum ORDER BY fb.SERIAL) 
  FROM FEDBOOK fb 
    INNER JOIN ManifestDetail md 
      ON fb.ORDNUM = md.OrdNum 
          AND fb.ORDNUM <> 0 
          AND md.Status <> 'C'
          AND CONVERT(date, md.ShipDate) = @ShipDate
          AND md.BCustID = CASE WHEN (LEN(@BCustID) > 0) THEN @BCustID ELSE md.BCustID END;

  --Fix OrderSeq
  UPDATE FEDBOOK 
  SET OrderSeq = ps.Seq 
  FROM @ProperSequence ps 
  WHERE ps.Recnum = FEDBOOK.Recnum;

