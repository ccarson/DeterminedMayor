﻿CREATE TABLE [dbo].[PRPYMSTR] (
    [Recnum]               BIGINT          IDENTITY (1, 1) NOT NULL,
    [LAST_NAME]            VARCHAR (16)    CONSTRAINT [DF__PRPYMSTR__LAST_N__38C61787] DEFAULT (' ') NOT NULL,
    [FIRST]                VARCHAR (12)    CONSTRAINT [DF__PRPYMSTR__FIRST__39BA3BC0] DEFAULT (' ') NOT NULL,
    [MI]                   VARCHAR (2)     CONSTRAINT [DF__PRPYMSTR__MI__3AAE5FF9] DEFAULT (' ') NOT NULL,
    [NULL]                 VARCHAR (10)    CONSTRAINT [DF__PRPYMSTR__NULL__3BA28432] DEFAULT (' ') NOT NULL,
    [SS1]                  VARCHAR (3)     CONSTRAINT [DF__PRPYMSTR__SS1__3C96A86B] DEFAULT (' ') NOT NULL,
    [SS2]                  VARCHAR (2)     CONSTRAINT [DF__PRPYMSTR__SS2__3D8ACCA4] DEFAULT (' ') NOT NULL,
    [SS3]                  VARCHAR (4)     CONSTRAINT [DF__PRPYMSTR__SS3__3E7EF0DD] DEFAULT (' ') NOT NULL,
    [STREET]               VARCHAR (30)    CONSTRAINT [DF__PRPYMSTR__STREET__3F731516] DEFAULT (' ') NOT NULL,
    [ADDL_ADDRESS]         VARCHAR (16)    CONSTRAINT [DF__PRPYMSTR__ADDL_A__4067394F] DEFAULT (' ') NOT NULL,
    [CITY]                 VARCHAR (17)    CONSTRAINT [DF__PRPYMSTR__CITY__415B5D88] DEFAULT (' ') NOT NULL,
    [STATE]                VARCHAR (2)     CONSTRAINT [DF__PRPYMSTR__STATE__424F81C1] DEFAULT (' ') NOT NULL,
    [ZIP_CODE]             VARCHAR (10)    CONSTRAINT [DF__PRPYMSTR__ZIP_CO__4343A5FA] DEFAULT (' ') NOT NULL,
    [AREA]                 VARCHAR (3)     CONSTRAINT [DF__PRPYMSTR__AREA__4437CA33] DEFAULT (' ') NOT NULL,
    [EXCH]                 VARCHAR (3)     CONSTRAINT [DF__PRPYMSTR__EXCH__452BEE6C] DEFAULT (' ') NOT NULL,
    [NUMB]                 VARCHAR (4)     CONSTRAINT [DF__PRPYMSTR__NUMB__462012A5] DEFAULT (' ') NOT NULL,
    [BIRTH_DATE]           DATETIME        CONSTRAINT [DF_PRPYMSTR_BIRTH_DATE] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [SEX]                  VARCHAR (1)     CONSTRAINT [DF__PRPYMSTR__SEX__48085B17] DEFAULT (' ') NOT NULL,
    [MAR]                  VARCHAR (1)     CONSTRAINT [DF__PRPYMSTR__MAR__48FC7F50] DEFAULT (' ') NOT NULL,
    [EMERGCY_CONTACT]      VARCHAR (20)    CONSTRAINT [DF__PRPYMSTR__EMERGC__49F0A389] DEFAULT (' ') NOT NULL,
    [EMERGCY_TEL]          VARCHAR (14)    CONSTRAINT [DF__PRPYMSTR__EMERGC__4AE4C7C2] DEFAULT (' ') NOT NULL,
    [JOB_NO]               VARCHAR (4)     CONSTRAINT [DF__PRPYMSTR__JOB_NO__4BD8EBFB] DEFAULT (' ') NOT NULL,
    [LOC_NO]               VARCHAR (4)     CONSTRAINT [DF__PRPYMSTR__LOC_NO__4CCD1034] DEFAULT (' ') NOT NULL,
    [SH]                   VARCHAR (1)     CONSTRAINT [DF__PRPYMSTR__SH__4DC1346D] DEFAULT (' ') NOT NULL,
    [ST]                   VARCHAR (1)     CONSTRAINT [DF__PRPYMSTR__ST__4EB558A6] DEFAULT (' ') NOT NULL,
    [HIRE_DATE]            DATETIME        CONSTRAINT [DF_PRPYMSTR_HIRE_DATE] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [TERM_DATE]            DATETIME        CONSTRAINT [DF_PRPYMSTR_TERM_DATE] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [NULL_2]               VARCHAR (10)    CONSTRAINT [DF__PRPYMSTR__NULL_2__5191C551] DEFAULT (' ') NOT NULL,
    [HRLY_RATE]            DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__HRLY_R__5285E98A] DEFAULT ((0)) NOT NULL,
    [ANN_RATE]             DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__ANN_RA__537A0DC3] DEFAULT ((0)) NOT NULL,
    [SALARY_RATE]          DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__SALARY__546E31FC] DEFAULT ((0)) NOT NULL,
    [REVIEW_DATE]          DATETIME        CONSTRAINT [DF_PRPYMSTR_REVIEW_DATE] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [SH_DIFF]              DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__SH_DIF__56567A6E] DEFAULT ((0)) NOT NULL,
    [PER]                  VARCHAR (2)     CONSTRAINT [DF__PRPYMSTR__PER__574A9EA7] DEFAULT (' ') NOT NULL,
    [TYP]                  VARCHAR (1)     CONSTRAINT [DF__PRPYMSTR__TYP__583EC2E0] DEFAULT (' ') NOT NULL,
    [PREV_ANN]             DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__PREV_A__5932E719] DEFAULT ((0)) NOT NULL,
    [TM]                   VARCHAR (1)     CONSTRAINT [DF__PRPYMSTR__TM__5A270B52] DEFAULT (' ') NOT NULL,
    [F_EX]                 DECIMAL (2)     CONSTRAINT [DF__PRPYMSTR__F_EX__5B1B2F8B] DEFAULT ((0)) NOT NULL,
    [ADD_FED]              DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__ADD_FE__5C0F53C4] DEFAULT ((0)) NOT NULL,
    [S_EX]                 DECIMAL (2)     CONSTRAINT [DF__PRPYMSTR__S_EX__5D0377FD] DEFAULT ((0)) NOT NULL,
    [ADD_ST]               DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__ADD_ST__5DF79C36] DEFAULT ((0)) NOT NULL,
    [L_EX]                 DECIMAL (2)     CONSTRAINT [DF__PRPYMSTR__L_EX__5EEBC06F] DEFAULT ((0)) NOT NULL,
    [L_CD]                 VARCHAR (2)     CONSTRAINT [DF__PRPYMSTR__L_CD__5FDFE4A8] DEFAULT (' ') NOT NULL,
    [LOC_ADD]              DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__LOC_AD__60D408E1] DEFAULT ((0)) NOT NULL,
    [SICK_ALL]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__SICK_A__61C82D1A] DEFAULT ((0)) NOT NULL,
    [SICK_TAK]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__SICK_T__62BC5153] DEFAULT ((0)) NOT NULL,
    [SICK_BAL]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__SICK_B__63B0758C] DEFAULT ((0)) NOT NULL,
    [VAC_ALL]              DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__VAC_AL__64A499C5] DEFAULT ((0)) NOT NULL,
    [VAC_TAK]              DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__VAC_TA__6598BDFE] DEFAULT ((0)) NOT NULL,
    [VAC_BAL]              DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__VAC_BA__668CE237] DEFAULT ((0)) NOT NULL,
    [PER_ALL]              DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__PER_AL__67810670] DEFAULT ((0)) NOT NULL,
    [PER_TAK]              DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__PER_TA__68752AA9] DEFAULT ((0)) NOT NULL,
    [PER_BAL]              DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__PER_BA__69694EE2] DEFAULT ((0)) NOT NULL,
    [CHK_NUM]              DECIMAL (6)     CONSTRAINT [DF__PRPYMSTR__CHK_NU__6A5D731B] DEFAULT ((0)) NOT NULL,
    [CHK_DATE]             DATETIME        CONSTRAINT [DF_PRPYMSTR_CHK_DATE] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [CHK_AMT]              DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__CHK_AM__6C45BB8D] DEFAULT ((0)) NOT NULL,
    [GROSS_AMT]            DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__GROSS___6D39DFC6] DEFAULT ((0)) NOT NULL,
    [MTD_GROSS]            DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_GR__6E2E03FF] DEFAULT ((0)) NOT NULL,
    [MTD_FICA]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_FI__6F222838] DEFAULT ((0)) NOT NULL,
    [MTD_FED_WITH]         DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_FE__70164C71] DEFAULT ((0)) NOT NULL,
    [MTD_STATE]            DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_ST__710A70AA] DEFAULT ((0)) NOT NULL,
    [MTD_LOCAL]            DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_LO__71FE94E3] DEFAULT ((0)) NOT NULL,
    [MTD_MISC]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_MI__72F2B91C] DEFAULT ((0)) NOT NULL,
    [MTD_NET]              DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_NE__73E6DD55] DEFAULT ((0)) NOT NULL,
    [QTR_GROSS]            DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__QTR_GR__74DB018E] DEFAULT ((0)) NOT NULL,
    [QTR_FICA]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__QTR_FI__75CF25C7] DEFAULT ((0)) NOT NULL,
    [QTR_FED_WITH]         DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__QTR_FE__76C34A00] DEFAULT ((0)) NOT NULL,
    [QTR_STATE]            DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__QTR_ST__77B76E39] DEFAULT ((0)) NOT NULL,
    [QTR_LOCAL]            DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__QTR_LO__78AB9272] DEFAULT ((0)) NOT NULL,
    [QTR_MISC]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__QTR_MI__799FB6AB] DEFAULT ((0)) NOT NULL,
    [QTR_NET]              DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__QTR_NE__7A93DAE4] DEFAULT ((0)) NOT NULL,
    [ANN_GROSS]            DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__ANN_GR__7B87FF1D] DEFAULT ((0)) NOT NULL,
    [ANN_FICA]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__ANN_FI__7C7C2356] DEFAULT ((0)) NOT NULL,
    [ANN_FED_WITH]         DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__ANN_FE__7D70478F] DEFAULT ((0)) NOT NULL,
    [ANN_STATE]            DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__ANN_ST__7E646BC8] DEFAULT ((0)) NOT NULL,
    [ANN_LOCAL]            DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__ANN_LO__7F589001] DEFAULT ((0)) NOT NULL,
    [ANN_MISC]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__ANN_MI__004CB43A] DEFAULT ((0)) NOT NULL,
    [ANN_NET]              DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__ANN_NE__0140D873] DEFAULT ((0)) NOT NULL,
    [TOT_HRS]              DECIMAL (4, 2)  CONSTRAINT [DF__PRPYMSTR__TOT_HR__0234FCAC] DEFAULT ((0)) NOT NULL,
    [TOT_OT]               DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__TOT_OT__032920E5] DEFAULT ((0)) NOT NULL,
    [MTD_VAC]              DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_VA__041D451E] DEFAULT ((0)) NOT NULL,
    [MTD_SICK]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_SI__05116957] DEFAULT ((0)) NOT NULL,
    [MTD_PERS]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_PE__06058D90] DEFAULT ((0)) NOT NULL,
    [QTR_VAC]              DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__QTR_VA__06F9B1C9] DEFAULT ((0)) NOT NULL,
    [QTR_SICK]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__QTR_SI__07EDD602] DEFAULT ((0)) NOT NULL,
    [QTR_PERS]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__QTR_PE__08E1FA3B] DEFAULT ((0)) NOT NULL,
    [ANN_VAC]              DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__ANN_VA__09D61E74] DEFAULT ((0)) NOT NULL,
    [ANN_SICK]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__ANN_SI__0ACA42AD] DEFAULT ((0)) NOT NULL,
    [ANN_PERS]             DECIMAL (6, 2)  CONSTRAINT [DF__PRPYMSTR__ANN_PE__0BBE66E6] DEFAULT ((0)) NOT NULL,
    [COMPANY_NO]           VARCHAR (2)     CONSTRAINT [DF__PRPYMSTR__COMPAN__0CB28B1F] DEFAULT (' ') NOT NULL,
    [DIVISION_NO]          VARCHAR (2)     CONSTRAINT [DF__PRPYMSTR__DIVISI__0DA6AF58] DEFAULT (' ') NOT NULL,
    [EMPLOYEE_ID]          VARCHAR (10)    CONSTRAINT [DF__PRPYMSTR__EMPLOY__0E9AD391] DEFAULT (' ') NOT NULL,
    [GL_ACCT_NO]           VARCHAR (9)     CONSTRAINT [DF__PRPYMSTR__GL_ACC__0F8EF7CA] DEFAULT (' ') NOT NULL,
    [LAST_GROSS]           DECIMAL (10, 2) CONSTRAINT [DF__PRPYMSTR__LAST_G__1177403C] DEFAULT ((0)) NOT NULL,
    [LAST_UPDATE]          DATETIME        CONSTRAINT [DF_PRPYMSTR_LAST_UPDATE] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [MTD_REG_GROSS]        DECIMAL (10, 2) CONSTRAINT [DF__PRPYMSTR__MTD_RE__135F88AE] DEFAULT ((0)) NOT NULL,
    [MTD_FICA_GROSS]       DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_FI__1453ACE7] DEFAULT ((0)) NOT NULL,
    [QTD_FICA_GROSS]       DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__QTD_FI__1547D120] DEFAULT ((0)) NOT NULL,
    [YTD_FICA_GROSS]       DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__YTD_FI__163BF559] DEFAULT ((0)) NOT NULL,
    [MTD_TIPS_GROSS]       DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_TI__17301992] DEFAULT ((0)) NOT NULL,
    [QTD_TIPS_GROSS]       DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__QTD_TI__18243DCB] DEFAULT ((0)) NOT NULL,
    [YTD_TIPS_GROSS]       DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__YTD_TI__19186204] DEFAULT ((0)) NOT NULL,
    [WORK_COMP_TYPE]       VARCHAR (3)     CONSTRAINT [DF__PRPYMSTR__WORK_C__1A0C863D] DEFAULT (' ') NOT NULL,
    [MTD_WORK_COMP]        DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_WO__1B00AA76] DEFAULT ((0)) NOT NULL,
    [QTD_WORK_COMP]        DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__QTD_WO__1BF4CEAF] DEFAULT ((0)) NOT NULL,
    [YTD_WORK_COMP]        DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__YTD_WO__1CE8F2E8] DEFAULT ((0)) NOT NULL,
    [WORK_COMP_STATE]      VARCHAR (2)     CONSTRAINT [DF__PRPYMSTR__WORK_C__1DDD1721] DEFAULT (' ') NOT NULL,
    [MTD_PENSION_401]      DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_PE__1ED13B5A] DEFAULT ((0)) NOT NULL,
    [QTD_PENSION_401]      DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__QTD_PE__1FC55F93] DEFAULT ((0)) NOT NULL,
    [YTD_PENSION_401]      DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__YTD_PE__20B983CC] DEFAULT ((0)) NOT NULL,
    [MTD_401_GROSS]        DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__MTD_40__21ADA805] DEFAULT ((0)) NOT NULL,
    [QTD_401_GROSS]        DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__QTD_40__22A1CC3E] DEFAULT ((0)) NOT NULL,
    [YTD_401_GROSS]        DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__YTD_40__2395F077] DEFAULT ((0)) NOT NULL,
    [PENSION_401]          DECIMAL (8, 2)  CONSTRAINT [DF__PRPYMSTR__PENSIO__248A14B0] DEFAULT ((0)) NOT NULL,
    [RACE_CODE]            VARCHAR (2)     CONSTRAINT [DF__PRPYMSTR__RACE_C__257E38E9] DEFAULT (' ') NOT NULL,
    [TYPE_401]             VARCHAR (1)     CONSTRAINT [DF__PRPYMSTR__TYPE_4__26725D22] DEFAULT (' ') NOT NULL,
    [LOGIN_FLAG]           VARCHAR (1)     CONSTRAINT [DF__PRPYMSTR__LOGIN___2766815B] DEFAULT (' ') NOT NULL,
    [ELIG_401]             VARCHAR (1)     CONSTRAINT [DF__PRPYMSTR__ELIG_4__285AA594] DEFAULT (' ') NOT NULL,
    [LOGIN_DATE]           DATETIME        CONSTRAINT [DF_PRPYMSTR_LOGIN_DATE] DEFAULT ('1753-01-01 00:00:00') NOT NULL,
    [LOGIN_HR]             VARCHAR (2)     CONSTRAINT [DF__PRPYMSTR__LOGIN___2A42EE06] DEFAULT (' ') NOT NULL,
    [DEPARTMENT]           VARCHAR (1)     CONSTRAINT [DF__PRPYMSTR__DEPART__2B37123F] DEFAULT (' ') NOT NULL,
    [Email]                VARCHAR (100)   CONSTRAINT [DF__PRPYMSTR__Email__2C2B3678] DEFAULT (' ') NOT NULL,
    [Notes]                VARCHAR (MAX)   NULL,
    [AccrueVacation]       VARCHAR (1)     NULL,
    [WeeklyHoursAvailable] NUMERIC (4, 2)  NULL,
    CONSTRAINT [PRPYMSTR_INDEX01] PRIMARY KEY CLUSTERED ([COMPANY_NO] ASC, [DIVISION_NO] ASC, [LAST_NAME] ASC, [FIRST] ASC, [MI] ASC, [EMPLOYEE_ID] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_PRPYMSTR_RACE_CODE] FOREIGN KEY ([RACE_CODE]) REFERENCES [dbo].[PRACECOD] ([RACE_CODE]),
    CONSTRAINT [FK_PRPYMSTR_WORK_COMP_TYPE] FOREIGN KEY ([WORK_COMP_TYPE]) REFERENCES [dbo].[PRWKCOMP] ([TYPE])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PRPYMSTR_INDEX00]
    ON [dbo].[PRPYMSTR]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PRPYMSTR_INDEX02]
    ON [dbo].[PRPYMSTR]([COMPANY_NO] ASC, [DIVISION_NO] ASC, [EMPLOYEE_ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PRPYMSTR_INDEX03]
    ON [dbo].[PRPYMSTR]([COMPANY_NO] ASC, [DIVISION_NO] ASC, [LOC_NO] ASC, [SH] ASC, [LAST_NAME] ASC, [FIRST] ASC, [MI] ASC, [EMPLOYEE_ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PRPYMSTR_INDEX04]
    ON [dbo].[PRPYMSTR]([COMPANY_NO] ASC, [DIVISION_NO] ASC, [GL_ACCT_NO] ASC, [EMPLOYEE_ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PRPYMSTR_INDEX05]
    ON [dbo].[PRPYMSTR]([COMPANY_NO] ASC, [DIVISION_NO] ASC, [WORK_COMP_STATE] ASC, [EMPLOYEE_ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PRPYMSTR_INDEX06]
    ON [dbo].[PRPYMSTR]([COMPANY_NO] ASC, [DIVISION_NO] ASC, [WORK_COMP_TYPE] ASC, [LAST_NAME] ASC, [FIRST] ASC, [MI] ASC, [SS1] ASC, [SS2] ASC, [SS3] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PRPYMSTR_INDEX07]
    ON [dbo].[PRPYMSTR]([EMPLOYEE_ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PRPYMSTR_INDEX08]
    ON [dbo].[PRPYMSTR]([COMPANY_NO] ASC, [DIVISION_NO] ASC, [DEPARTMENT] ASC, [LAST_NAME] ASC, [FIRST] ASC, [MI] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PRPYMSTR_INDEX10]
    ON [dbo].[PRPYMSTR]([LAST_NAME] ASC, [FIRST] ASC, [EMPLOYEE_ID] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [PRPYMSTR_INDEX11]
    ON [dbo].[PRPYMSTR]([FIRST] ASC, [LAST_NAME] ASC, [EMPLOYEE_ID] ASC) WITH (FILLFACTOR = 70);

