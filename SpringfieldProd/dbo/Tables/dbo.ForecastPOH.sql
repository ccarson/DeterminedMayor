CREATE TABLE [dbo].[ForecastPOH] (
    [ForecastPOH_ID]   BIGINT       IDENTITY (1, 1) NOT NULL,
    [ForecastHeaderID] BIGINT       NOT NULL,
    [Vendor_ID]        VARCHAR (8)  CONSTRAINT [DF__ForecastP__Vendo__79AD05A8] DEFAULT (' ') NOT NULL,
    [PO_Type]          VARCHAR (1)  NULL,
    [Order_By]         DATE         NULL,
    [Date_Required]    DATE         NULL,
    [VendorName]       VARCHAR (30) NULL,
    [RequestedBy]      VARCHAR (20) NULL,
    [Inquiry_Name]     VARCHAR (20) NULL,
    [Approved]         VARCHAR (1)  NULL,
    [ApprovedBy]       VARCHAR (20) NULL,
    [ApprovedDate]     DATE         NULL,
    [PO_Num]           INT          NULL,
    CONSTRAINT [ForecastPOH_INDEX01] PRIMARY KEY CLUSTERED ([ForecastPOH_ID] ASC)
);

