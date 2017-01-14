CREATE PROCEDURE sasp_UnpaidBalance @OrdNum INT
AS
  SELECT
    (ci.SUB - ci.DISC + ci.POST + ci.TAX)
    - ISNULL(p.Paid, 0) + ISNULL(r.Refund, 0)
    AS UnpaidBalance
  FROM CUSTINFO ci
      LEFT JOIN
          (SELECT MAX(ad.ORDNUM) AS OrdNum, SUM(ad.AMOUNT) AS Paid
            FROM ARDETAIL ad
            WHERE ad.ORDNUM = @OrdNum
          ) AS p
          ON ci.ORDNUM = p.OrdNum
      LEFT JOIN
          (SELECT rw.ORDNUM, rw.AMOUNT + rh.RHAmount AS Refund
          FROM RFWORK rw
              INNER JOIN
                  (SELECT MAX(rh.ORDNUM) AS OrdNum, SUM(rh.AMOUNT) AS RHAmount
                  FROM RFHIST rh
                  WHERE rh.ORDNUM = @OrdNum
                  ) AS rh
                  ON rw.ORDNUM = rh.OrdNum
          ) AS r
          ON ci.ORDNUM = r.ORDNUM
  WHERE ci.ORDNUM = @OrdNum
