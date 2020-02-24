CREATE TABLE [dbo].[QARejection] (
    [ID]                           BIGINT          IDENTITY (1001, 1) NOT NULL,
    [PartNum]                      VARCHAR (20)    CONSTRAINT [DF_QARejection_PartNum] DEFAULT ('') NOT NULL,
    [Status]                       CHAR (1)        CONSTRAINT [DF_QARejection_Status] DEFAULT ('') NOT NULL,
    [StatusDate]                   DATETIME2 (3)   CONSTRAINT [DF_QARejection_StatusDate] DEFAULT (getdate()) NOT NULL,
    [Source]                       CHAR (1)        CONSTRAINT [DF_QARejection_Source] DEFAULT ('') NOT NULL,
    [SourceNumber]                 NUMERIC (10, 2) CONSTRAINT [DF_QARejection_SourceNumber] DEFAULT ((0)) NOT NULL,
    [Reason]                       VARCHAR (100)   CONSTRAINT [DF_QARejection_Reason] DEFAULT ('') NOT NULL,
    [DefectCode]                   CHAR (10)       CONSTRAINT [DF_QARejection_DefectCode] DEFAULT ('') NOT NULL,
    [Quantity]                     INT             CONSTRAINT [DF_QARejection_Quantity] DEFAULT ((0)) NOT NULL,
    [UnitPrice]                    NUMERIC (12, 6) CONSTRAINT [DF_QARejection_UnitPrice] DEFAULT ((0)) NOT NULL,
    [POVendorID]                   CHAR (8)        CONSTRAINT [DF_QARejection_POVendorID] DEFAULT ('') NOT NULL,
    [SpringfieldDepartment]        CHAR (10)       CONSTRAINT [DF_QARejection_SpringfieldDepartment] DEFAULT ('') NOT NULL,
    [Disposition]                  CHAR (10)       CONSTRAINT [DF_QARejection_Disposition] DEFAULT ('') NOT NULL,
    [ReworkCost]                   NUMERIC (12, 6) CONSTRAINT [DF_QARejection_ReworkCost] DEFAULT ((0)) NOT NULL,
    [ReworkTime]                   NUMERIC (6, 2)  CONSTRAINT [DF_QARejection_ReworkTime] DEFAULT ((0)) NOT NULL,
    [ReworkAdditionalCharges]      NUMERIC (10, 2) CONSTRAINT [DF_QARejection_ReworkAdditionalCharges] DEFAULT ((0)) NOT NULL,
    [BilledAmount]                 NUMERIC (10, 2) CONSTRAINT [DF_QARejection_BilledAmount] DEFAULT ((0)) NOT NULL,
    [CorrectiveAction]             VARCHAR (512)   CONSTRAINT [DF_QARejection_CorrectiveAction] DEFAULT ('') NOT NULL,
    [Drawing]                      VARCHAR (20)    CONSTRAINT [DF_QARejection_Drawing] DEFAULT ('') NOT NULL,
    [Revision]                     SMALLINT        CONSTRAINT [DF_QARejection_Revision] DEFAULT ((0)) NOT NULL,
    [Lot]                          CHAR (6)        CONSTRAINT [DF_QARejection_Lot] DEFAULT ('') NOT NULL,
    [CreatedBy]                    CHAR (4)        CONSTRAINT [DF_QARejection_CreatedBy] DEFAULT ('') NOT NULL,
    [CreatedDate]                  DATETIME2 (3)   CONSTRAINT [DF_QARejection_CreatedDate] DEFAULT (getdate()) NOT NULL,
    [DefectSubCategory]            CHAR (10)       CONSTRAINT [DF_QARejection_DefectSubCategory] DEFAULT ('') NOT NULL,
    [ActionAuthorizedDepartment]   VARCHAR (20)    CONSTRAINT [DF_QARejection_ActionAuthorizedDepartment] DEFAULT ('') NOT NULL,
    [ActionAuthorizedBy]           CHAR (4)        CONSTRAINT [DF_QARejection_ActionAuthorizedBy] DEFAULT ('') NOT NULL,
    [ActionAuthorizedDate]         DATETIME2 (3)   CONSTRAINT [DF_QARejection_ActionAuthorizedDate] DEFAULT ('1753-01-01') NOT NULL,
    [ActionExecutedDepartment]     VARCHAR (20)    CONSTRAINT [DF_QARejection_ActionExecutedDepartment] DEFAULT ('') NOT NULL,
    [ActionExecutedBy]             CHAR (4)        CONSTRAINT [DF_QARejection_ActionExecutedBy] DEFAULT ('') NOT NULL,
    [ActionExecutedDate]           DATETIME2 (3)   CONSTRAINT [DF_QARejection_ActionExecutedDate] DEFAULT ('1753-01-01') NOT NULL,
    [LogisticsExecutedBy]          CHAR (4)        CONSTRAINT [DF_QARejection_LogisticsExecutedBy] DEFAULT ('') NOT NULL,
    [LogisticsExecutedDate]        DATETIME2 (3)   CONSTRAINT [DF_QARejection_LogisticsExecutedDate] DEFAULT ('1753-01-01') NOT NULL,
    [CorrectiveActionApprovedBy]   CHAR (4)        CONSTRAINT [DF_QARejection_CorrectiveActionApprovedBy] DEFAULT ('') NOT NULL,
    [CorrectiveActionApprovedDate] DATETIME2 (3)   CONSTRAINT [DF_QARejection_CorrectiveActionApprovedDate] DEFAULT ('1753-01-01') NOT NULL,
    [VendorContactedBy]            CHAR (4)        CONSTRAINT [DF_QARejection_VendorContactedBy] DEFAULT ('') NOT NULL,
    [VendorContactedDate]          DATETIME2 (3)   CONSTRAINT [DF_QARejection_VendorContactedDate] DEFAULT ('1753-01-01') NOT NULL,
    [VendorBilled]                 CHAR (1)        CONSTRAINT [DF_QARejection_VendorBilled] DEFAULT ('N') NOT NULL,
    [CostAccountedAmount]          NUMERIC (10, 2) DEFAULT ((0)) NULL,
    [CostAccounted]                CHAR (1)        DEFAULT ('N') NOT NULL,
    CONSTRAINT [QARejection_INDEX01] PRIMARY KEY CLUSTERED ([ID] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [QARejection_INDEX03]
    ON [dbo].[QARejection]([CreatedDate] ASC, [ID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [QARejection_INDEX04]
    ON [dbo].[QARejection]([Status] ASC, [ID] ASC);

