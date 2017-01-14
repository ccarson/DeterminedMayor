CREATE TABLE [dbo].[StateTax] (
    [Recnum]         BIGINT         IDENTITY (1, 1) NOT NULL,
    [STATEID]        VARCHAR (4)    DEFAULT (' ') NOT NULL,
    [TAXRATE]        DECIMAL (4, 2) DEFAULT ((0)) NOT NULL,
    [TAX_FLAG]       VARCHAR (1)    DEFAULT (' ') NOT NULL,
    [NAME]           VARCHAR (15)   DEFAULT (' ') NOT NULL,
    [TaxShipping]    VARCHAR (1)    NULL,
    [TaxLabor]       VARCHAR (1)    NULL,
    [TaxLaborRepair] VARCHAR (1)    NULL,
    [TaxApparel]     VARCHAR (1)    NULL,
    CONSTRAINT [StateTax_INDEX01] PRIMARY KEY CLUSTERED ([STATEID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [StateTax_INDEX00]
    ON [dbo].[StateTax]([Recnum] ASC) WITH (FILLFACTOR = 70);

