CREATE TABLE [dbo].[WebPriceCategory] (
    [PriceCategory] TINYINT     DEFAULT ((0)) NOT NULL,
    [WebYardCode]   VARCHAR (4) NULL,
    CONSTRAINT [WebPriceCategory_INDEX01] PRIMARY KEY CLUSTERED ([PriceCategory] ASC)
);

