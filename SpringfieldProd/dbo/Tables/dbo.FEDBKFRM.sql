﻿CREATE TABLE [dbo].[FEDBKFRM] (
    [Recnum]      BIGINT          IDENTITY (1, 1) NOT NULL,
    [GUNTYPE]     VARCHAR (1)     CONSTRAINT [DF__FEDBKFRM__GUNTYP__08771A90] DEFAULT (' ') NOT NULL,
    [SERIAL]      VARCHAR (14)    CONSTRAINT [DF__FEDBKFRM__SERIAL__096B3EC9] DEFAULT (' ') NOT NULL,
    [RECEIVED]    DATETIME        CONSTRAINT [DF__FEDBKFRM__RECEIV__0A5F6302] DEFAULT ('01/01/1753') NOT NULL,
    [MANUFACT]    VARCHAR (10)    CONSTRAINT [DF__FEDBKFRM__MANUFA__0B53873B] DEFAULT (' ') NOT NULL,
    [MODEL]       VARCHAR (10)    CONSTRAINT [DF__FEDBKFRM__MODEL__0C47AB74] DEFAULT (' ') NOT NULL,
    [SEMIFULL]    VARCHAR (1)     CONSTRAINT [DF__FEDBKFRM__SEMIFU__0D3BCFAD] DEFAULT (' ') NOT NULL,
    [NAME]        VARCHAR (25)    CONSTRAINT [DF__FEDBKFRM__NAME__0E2FF3E6] DEFAULT (' ') NOT NULL,
    [STREET]      VARCHAR (20)    CONSTRAINT [DF__FEDBKFRM__STREET__0F24181F] DEFAULT (' ') NOT NULL,
    [CITY]        VARCHAR (15)    CONSTRAINT [DF__FEDBKFRM__CITY__10183C58] DEFAULT (' ') NOT NULL,
    [STATE]       VARCHAR (2)     CONSTRAINT [DF__FEDBKFRM__STATE__110C6091] DEFAULT (' ') NOT NULL,
    [SPRNUM]      VARCHAR (20)    CONSTRAINT [DF__FEDBKFRM__SPRNUM__120084CA] DEFAULT (' ') NOT NULL,
    [GUNMODEL]    VARCHAR (20)    CONSTRAINT [DF__FEDBKFRM__GUNMOD__12F4A903] DEFAULT (' ') NOT NULL,
    [SOLD]        DATETIME        CONSTRAINT [DF__FEDBKFRM__SOLD__13E8CD3C] DEFAULT ('01/01/1753') NOT NULL,
    [SONAME]      VARCHAR (25)    CONSTRAINT [DF__FEDBKFRM__SONAME__14DCF175] DEFAULT (' ') NOT NULL,
    [SOSTREET]    VARCHAR (35)    CONSTRAINT [DF__FEDBKFRM__SOSTRE__15D115AE] DEFAULT (' ') NOT NULL,
    [SOCITY]      VARCHAR (15)    CONSTRAINT [DF__FEDBKFRM__SOCITY__16C539E7] DEFAULT (' ') NOT NULL,
    [SOSTATE]     VARCHAR (2)     CONSTRAINT [DF__FEDBKFRM__SOSTAT__17B95E20] DEFAULT (' ') NOT NULL,
    [SOLDFFL]     VARCHAR (10)    CONSTRAINT [DF__FEDBKFRM__SOLDFF__18AD8259] DEFAULT (' ') NOT NULL,
    [ORDNUM]      DECIMAL (10, 2) CONSTRAINT [DF__FEDBKFRM__ORDNUM__19A1A692] DEFAULT ((0)) NOT NULL,
    [TAG]         VARCHAR (6)     CONSTRAINT [DF__FEDBKFRM__TAG__1A95CACB] DEFAULT (' ') NOT NULL,
    [SAFETY]      VARCHAR (1)     CONSTRAINT [DF__FEDBKFRM__SAFETY__1B89EF04] DEFAULT (' ') NOT NULL,
    [GUNSMITH]    VARCHAR (10)    CONSTRAINT [DF__FEDBKFRM__GUNSMI__1C7E133D] DEFAULT (' ') NOT NULL,
    [TAGNUM]      DECIMAL (6)     CONSTRAINT [DF__FEDBKFRM__TAGNUM__1D723776] DEFAULT ((0)) NOT NULL,
    [FEDCODE]     VARCHAR (1)     CONSTRAINT [DF__FEDBKFRM__FEDCOD__1E665BAF] DEFAULT (' ') NOT NULL,
    [CALIBER]     VARCHAR (10)    CONSTRAINT [DF__FEDBKFRM__CALIBE__1F5A7FE8] DEFAULT (' ') NOT NULL,
    [WO_NUMBER]   DECIMAL (6)     CONSTRAINT [DF__FEDBKFRM__WO_NUM__204EA421] DEFAULT ((0)) NOT NULL,
    [COMMENT]     VARCHAR (20)    CONSTRAINT [DF__FEDBKFRM__COMMEN__2142C85A] DEFAULT (' ') NOT NULL,
    [RCTICKET]    DECIMAL (6)     CONSTRAINT [DF__FEDBKFRM__RCTICK__2236EC93] DEFAULT ((0)) NOT NULL,
    [BAN_STATUS]  VARCHAR (1)     CONSTRAINT [DF__FEDBKFRM__BAN_ST__232B10CC] DEFAULT (' ') NOT NULL,
    [LOCATION]    VARCHAR (20)    CONSTRAINT [DF__FEDBKFRM__LOCATI__241F3505] DEFAULT (' ') NOT NULL,
    [CHANGE_FLAG] VARCHAR (1)     CONSTRAINT [DF__FEDBKFRM__CHANGE__2513593E] DEFAULT (' ') NOT NULL,
    [INITIALS]    VARCHAR (10)    CONSTRAINT [DF__FEDBKFRM__INITIA__26077D77] DEFAULT (' ') NOT NULL,
    [CreatedBy]   VARCHAR (4)     CONSTRAINT [DF__FEDBKFRM__Create__26FBA1B0] DEFAULT (' ') NOT NULL,
    [CreatedDate] DATETIME        CONSTRAINT [DF__FEDBKFRM__Create__27EFC5E9] DEFAULT ('01/01/1753') NOT NULL,
    [ChangedBy]   VARCHAR (4)     CONSTRAINT [DF__FEDBKFRM__Change__28E3EA22] DEFAULT (' ') NOT NULL,
    [ChangedDate] DATETIME        CONSTRAINT [DF__FEDBKFRM__Change__29D80E5B] DEFAULT ('01/01/1753') NOT NULL,
    [Version]     VARCHAR (15)    CONSTRAINT [DF__FEDBKFRM__Versio__2ACC3294] DEFAULT (' ') NOT NULL,
    CONSTRAINT [FEDBKFRM_INDEX01] PRIMARY KEY CLUSTERED ([GUNTYPE] ASC, [SERIAL] ASC, [RECEIVED] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70),
    CONSTRAINT [FK_FEDBKFRM_FEDCODE] FOREIGN KEY ([FEDCODE]) REFERENCES [dbo].[FEDCODE] ([GROUP_CODE]),
    CONSTRAINT [FK_FEDBKFRM_SPRNUM] FOREIGN KEY ([SPRNUM]) REFERENCES [dbo].[parts] ([SPRNUM])
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FEDBKFRM_INDEX00]
    ON [dbo].[FEDBKFRM]([Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FEDBKFRM_INDEX02]
    ON [dbo].[FEDBKFRM]([ORDNUM] ASC, [GUNTYPE] ASC, [SPRNUM] ASC, [SERIAL] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FEDBKFRM_INDEX03]
    ON [dbo].[FEDBKFRM]([TAGNUM] ASC, [GUNTYPE] ASC, [SERIAL] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FEDBKFRM_INDEX04]
    ON [dbo].[FEDBKFRM]([RCTICKET] ASC, [SPRNUM] ASC, [SERIAL] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FEDBKFRM_INDEX05]
    ON [dbo].[FEDBKFRM]([SONAME] ASC, [GUNTYPE] ASC, [SERIAL] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FEDBKFRM_INDEX06]
    ON [dbo].[FEDBKFRM]([SPRNUM] ASC, [SERIAL] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FEDBKFRM_INDEX07]
    ON [dbo].[FEDBKFRM]([GUNTYPE] ASC, [RECEIVED] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);


GO
CREATE UNIQUE NONCLUSTERED INDEX [FEDBKFRM_INDEX08]
    ON [dbo].[FEDBKFRM]([SERIAL] ASC, [Recnum] ASC) WITH (FILLFACTOR = 70);
