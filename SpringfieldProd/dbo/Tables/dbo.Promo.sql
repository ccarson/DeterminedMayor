CREATE TABLE [dbo].[Promo] (
    [ID]              BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]            VARCHAR (30)   CONSTRAINT [DF__Promo__Name__6E59B7DF] DEFAULT (' ') NOT NULL,
    [StartDate]       DATETIME       NULL,
    [EndDate]         DATETIME       NULL,
    [Notes]           VARCHAR (512)  NULL,
    [YardCode]        VARCHAR (4)    NULL,
    [ApprovedSubject] VARCHAR (100)  NULL,
    [ApprovedBody]    VARCHAR (1024) NULL,
    [DeclinedSubject] VARCHAR (100)  NULL,
    [DeclinedBody]    VARCHAR (1024) NULL,
    [FromEmail]       VARCHAR (100)  NULL,
    [Rep]             VARCHAR (4)    NULL,
    [CreatedBy]       VARCHAR (4)    NULL,
    [CreatedDate]     DATETIME       NULL,
    [ChangedBy]       VARCHAR (4)    NULL,
    [ChangedDate]     DATETIME       NULL,
    [LastDate]        DATETIME       NULL,
    [WebEmailSubject] VARCHAR (100)  NULL,
    [WebEmailBody]    VARCHAR (1024) NULL,
    [WebEmailEmp]     VARCHAR (10)   NULL,
    [Type]            VARCHAR (1)    NULL,
    CONSTRAINT [PK_Promo] PRIMARY KEY CLUSTERED ([ID] ASC) WITH (FILLFACTOR = 70)
);


GO
CREATE NONCLUSTERED INDEX [Promo_INDEX02]
    ON [dbo].[Promo]([Name] ASC) WITH (FILLFACTOR = 70);

