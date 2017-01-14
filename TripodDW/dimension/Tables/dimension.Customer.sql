CREATE TABLE [dimension].[Customer] (
    [CustomerKey]  BIGINT       IDENTITY (1, 1) NOT NULL,
    [SourceRecnum] BIGINT       NOT NULL,
    [CustomerID]   VARCHAR (10) NOT NULL,
    [CustomerName] VARCHAR (36) NOT NULL,
    [PriceType]    VARCHAR (20) NOT NULL,
    [DWChecksum]   BINARY (32)  NOT NULL,
    [DWVersion]    INT          DEFAULT ((1)) NOT NULL,
    [DWTimestamp]  DATETIME     DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [pk_Customer] PRIMARY KEY CLUSTERED ([CustomerKey] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Customer_00]
    ON [dimension].[Customer]([CustomerID] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Customer_01]
    ON [dimension].[Customer]([SourceRecnum] ASC);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX_Customer_02]
    ON [dimension].[Customer]([DWChecksum] ASC);


GO

CREATE TRIGGER dimension.trg_Customer_archive
    ON dimension.Customer AFTER UPDATE
AS
/*
************************************************************************************************************************************

    Trigger:    dimension.trg_Customer_archive
     Author:    ccarson
    Purpose:    archives existing dimension.Customer records

    revisor         date            description
    ---------       ----------      ----------------------------
    ccarson         2016-10-01      created

    Notes:

************************************************************************************************************************************
*/
BEGIN

IF  @@ROWCOUNT = 0 RETURN ;

SET NOCOUNT, XACT_ABORT ON ;

INSERT INTO
    archive.Customer(
        CustomerKey
      , SourceRecnum
      , CustomerID
      , CustomerName
      , PriceType
      , DWChecksum
      , DWVersion
      , DWTimestamp )
SELECT
        CustomerKey     =   tripod.CustomerKey
      , SourceRecnum    =   tripod.SourceRecnum
      , CustomerID      =   tripod.CustomerID
      , CustomerName    =   tripod.CustomerName
      , PriceType       =   tripod.PriceType
      , DWChecksum      =   tripod.DWChecksum
      , DWVersion       =   tripod.DWVersion
      , DWTimestamp     =   tripod.DWTimestamp
FROM
    deleted AS tripod ;

END