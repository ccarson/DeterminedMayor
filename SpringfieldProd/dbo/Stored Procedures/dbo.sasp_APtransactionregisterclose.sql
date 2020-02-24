
CREATE PROCEDURE [dbo].[sasp_APtransactionregisterclose]
   @PeriodStart DATETIME, @PeriodEnd DATETIME
   WITH
   EXEC AS CALLER
AS
   SET  NOCOUNT , XACT_ABORT ON;

   DECLARE @CreditBal   NUMERIC (10, 2);
   DECLARE @APCreditBal   NUMERIC (10, 2);
   DECLARE @APDebitBal   NUMERIC (10, 2);
   DECLARE @DiscBal   NUMERIC (10, 2);

   DECLARE @DivID   VARCHAR (50);
   DECLARE @Invoice   VARCHAR (50);

   DECLARE @APDept   VARCHAR (50);
   DECLARE @APAccount   VARCHAR (50);


   DECLARE @CheckDept   VARCHAR (50);
   DECLARE @CheckingAcct   VARCHAR (50);

   DECLARE @DiscDept   VARCHAR (50);
   DECLARE @DiscAcct   VARCHAR (50);

   -- Constants
   SET @Invoice = 'EOM Summary';
   SET @DivID = '0101';

   -- do all this in one transaction
   BEGIN TRANSACTION

   -- automatically clear APWork
   --TRUNCATE TABLE APWORK;
   DELETE FROM APWORK;

   SET @APDept = (SELECT A_P_DEPT FROM dbo.APCOMPAN);
   SET @APAccount = (SELECT A_P_ACCOUNT FROM dbo.APCOMPAN);

   SET @CheckDept = (SELECT CASH_DEPT FROM dbo.APCOMPAN);
   SET @CheckingAcct = (SELECT CASH_ACCOUNT FROM dbo.APCOMPAN);

   SET @DiscDept = (SELECT DISC_DEPT FROM dbo.APCOMPAN);
   SET @DiscAcct = (SELECT DISC_ACCOUNT FROM APCOMPAN);

   SET @APDebitBal =
          (SELECT SUM (APPERM.AMOUNT_DUE + APPERM.FREIGHT + APPERM.TAX)
             FROM APPerm
            WHERE (    (   ([APPerm].[VOUCH_FLAG] = '5')
                        OR ([APPerm].[VOUCH_FLAG] = '3'))
                   AND [APPerm].[VOUCHER_DATE] BETWEEN @PeriodStart
                                                   AND @PeriodEnd
                   AND [APPERM].[EOM_FLAG] <> 'Y'));

   IF @APDebitBal IS NULL
      SET @APDebitBal = 0;

   SET @CreditBal =
          (SELECT SUM (APPERM.ORIG_AMOUNT) AS Orig_Amt_CreditBal
             FROM APPerm
            WHERE (    ([APPerm].[VOUCH_FLAG] = '5')
                   AND [APPerm].[VOUCHER_DATE] BETWEEN @PeriodStart
                                                   AND @PeriodEnd
                   AND [APPERM].[EOM_FLAG] <> 'Y'));

   IF @CreditBal IS NULL
      SET @CreditBal = 0;

   SET @DiscBal =
          (SELECT SUM (APPERM.DISCOUNT_AMOUNT) AS Discount_CreditBal
             FROM APPerm
            WHERE (    ([APPerm].[VOUCH_FLAG] = '5')
                   AND [APPerm].[VOUCHER_DATE] BETWEEN @PeriodStart
                                                   AND @PeriodEnd
                   AND [APPERM].[EOM_FLAG] <> 'Y'));

   IF @DiscBal IS NULL
      SET @DiscBal = 0;

   -- Because of grouping sets the total is at the top
   SET @APCreditBal =
          (SELECT TOP 1 SUM (AMOUNT)
             FROM APPERLED
            WHERE APPERM_ID IN (SELECT ID
                                  FROM APPerm
                                 WHERE (    ([APPerm].[VOUCH_FLAG] = '1')
                                        AND [APPerm].[VOUCHER_DATE] BETWEEN @PeriodStart
                                                                        AND @PeriodEnd
                                        AND [APPERM].[EOM_FLAG] <> 'Y'))
           GROUP BY GROUPING SETS ( (DEPT_# , ACCOUNT_#), (  ))
           ORDER BY DEPT_#, ACCOUNT_#);

   IF @APCreditBal IS NULL
      SET @APCreditBal = 0;

   -- Now write the AP Trade, Checking and Misc Income summary records
   -- AP Trade totals
   INSERT INTO APWORK (COMPANY_#,
                       DIVISION_#,
                       DIVID,
                       DEPARTMENT_#,
                       ACCOUNT_#,
                       VOUCHER_DATE,
                       INVOICE_#,
                       CREDIT_BAL,
                       DEBIT_BAL,
                       INVOICE_DATE,
                       ID,
                       GLXREF_ID,
                       APCOMPAN_ID)
      VALUES (
                '01',
                '01',
                @DivID,
                @APDept,
                @APAccount,
                @PeriodEnd,
                @Invoice,
                @APCreditBal,
                @APDebitBal,
                @PeriodEnd,
                (NEXT VALUE FOR [Seq_APWORK_ID]),
                (SELECT ID
                   FROM GLXREF
                  WHERE     GLXREF.DEPARTMENT_# = @APDept
                        AND GLXREF.ACCOUNT_# = @APAccount),
                '1')

   -- Checking totals
   INSERT INTO APWORK (COMPANY_#,
                       DIVISION_#,
                       DIVID,
                       DEPARTMENT_#,
                       ACCOUNT_#,
                       VOUCHER_DATE,
                       INVOICE_#,
                       CREDIT_BAL,
                       DEBIT_BAL,
                       INVOICE_DATE,
                       ID,
                       GLXREF_ID,
                       APCOMPAN_ID)
      VALUES (
                '01',
                '01',
                @DivID,
                @CheckDept,
                @CheckingAcct,
                @PeriodEnd,
                @Invoice,
                @CreditBal,
                0,
                @PeriodEnd,
                (NEXT VALUE FOR [Seq_APWORK_ID]),
                (SELECT ID
                   FROM GLXREF
                  WHERE     GLXREF.DEPARTMENT_# = @CheckDept
                        AND GLXREF.ACCOUNT_# = @CheckingAcct),
                '1');

   INSERT INTO APWORK (COMPANY_#,
                       DIVISION_#,
                       DIVID,
                       DEPARTMENT_#,
                       ACCOUNT_#,
                       VOUCHER_DATE,
                       INVOICE_#,
                       CREDIT_BAL,
                       DEBIT_BAL,
                       INVOICE_DATE,
                       ID,
                       GLXREF_ID,
                       APCOMPAN_ID)
      VALUES (
                '01',
                '01',
                @DivID,
                @DiscDept,
                @DiscAcct,
                @PeriodEnd,
                @Invoice,
                @DiscBal,
                0,
                @PeriodEnd,
                (NEXT VALUE FOR [seq_APWORK_ID]),
                (SELECT ID
                   FROM GLXREF
                  WHERE     GLXREF.DEPARTMENT_# = @DiscDept
                        AND GLXREF.ACCOUNT_# = @DiscAcct),
                '1');

   -- do distribution
   WITH cteAPDIST (Dept_#,
                   Account_#,
                   CreditBal,
                   DebitBal)
        AS (SELECT APL.DEPT_#,
                   APL.ACCOUNT_#,
                   dbo.GetAPCreditBal (apl.dept_#,
                                       apl.account_#,
                                       @PeriodStart,
                                       @PeriodEnd)
                      AS CreditBal,
                   dbo.GetAPDebitBal (apl.dept_#,
                                      apl.account_#,
                                      @PeriodStart,
                                      @PeriodEnd)
                      AS DebitBal
              FROM APPERLED APL
                   INNER JOIN APPerm AP ON (APL.APPERM_ID = AP.id)
             WHERE (    (AP.VOUCHER_DATE BETWEEN @PeriodStart AND @PeriodEnd)
                    AND (AP.EOM_FLAG <> 'Y'))
            GROUP BY APL.DEPT_#, APL.ACCOUNT_#)
   INSERT INTO APWORK (COMPANY_#,
                       DIVISION_#,
                       DIVID,
                       DEPARTMENT_#,
                       ACCOUNT_#,
                       VENDOR_#,
                       INVOICE_#,
                       VOUCHER_DATE,
                       VOUCH_FLAG,
                       CREDIT_BAL,
                       DEBIT_BAL,
                       INVOICE_DATE,
                       ID,
                       GLXREF_ID,
                       APCOMPAN_ID)
      SELECT '01',
             '01',
             @DivID,
             cteAPDIST.DEPT_#,
             cteAPDIST.ACCOUNT_#,
             ' ',
             @Invoice,
             @PeriodEnd,
             ' ',
             cteAPDIST.CreditBal,
             cteAPDIST.DebitBal,
             @PeriodEnd,
             (NEXT VALUE FOR [Seq_APWORK_ID]),
             (SELECT ID
                FROM GLXREF
               WHERE     GLXREF.DEPARTMENT_# = cteAPDIST.DEPT_#
                     AND GLXREF.ACCOUNT_# = cteAPDIST.ACCOUNT_#),
             '1'
        FROM cteAPDIST;

   -- Set them all as Processed
   UPDATE APPerm
      SET EOM_FLAG = 'Y'
    WHERE     APPERM.VOUCH_FLAG <> '4'
          AND APPERM.VOUCHER_DATE BETWEEN @PeriodStart AND @PeriodEnd;

   -- if not errors
   COMMIT TRANSACTION