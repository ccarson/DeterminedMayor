

CREATE FUNCTION [dbo].[GetAPDebitBal] (@Dept           CHAR (10),
                                       @Account        CHAR (10),
                                       @PeriodStart    DATETIME2 (3),
                                       @PeriodEnd      DATETIME2 (3))
   RETURNS NUMERIC (10, 2)
   WITH
   EXEC AS CALLER
AS
   BEGIN
      DECLARE @DebitBal   NUMERIC (10, 2);

      SELECT @DebitBal = SUM (APL.AMOUNT)
        FROM APPERLED APL INNER JOIN APPerm AP ON (APL.APPERM_ID = AP.ID)
       WHERE (    APL.DEPT_# = @Dept
              AND APL.ACCOUNT_# = @Account
              AND (APL.VOUCH_FLAG = '1')
              AND (AP.VOUCHER_DATE BETWEEN @PeriodStart AND @PeriodEnd))
      --      GROUP BY @Dept, @Account
      IF (@DebitBal IS NULL)
        Set @DebitBal = 0;
      RETURN @DebitBal
   END