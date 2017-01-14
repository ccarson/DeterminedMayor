CREATE TABLE [dbo].[YardCodeCoupon] (
    [YardCode]   VARCHAR (4)  NOT NULL,
    [CouponName] VARCHAR (50) NOT NULL,
    CONSTRAINT [YardCodeCoupon_INDEX01] PRIMARY KEY CLUSTERED ([CouponName] ASC),
    CONSTRAINT [FK_YardCodeCoupon_YardCode] FOREIGN KEY ([YardCode]) REFERENCES [dbo].[YardCode] ([YARD])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [YardCodeCoupon_INDEX02]
    ON [dbo].[YardCodeCoupon]([YardCode] ASC, [CouponName] ASC);

