﻿CREATE TABLE [dbo].[GUNTYPES] (
    [Recnum]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [CODE]            VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [DESC]            VARCHAR (20) DEFAULT (' ') NOT NULL,
    [FLAG1]           VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [FLAG2]           VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [FLAG3]           VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [FLAG4]           VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [FLAG5]           VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [MANUFACT]        VARCHAR (10) DEFAULT (' ') NOT NULL,
    [MODEL]           VARCHAR (10) DEFAULT (' ') NOT NULL,
    [SEMIFULL]        VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [NAME]            VARCHAR (25) DEFAULT (' ') NOT NULL,
    [STREET]          VARCHAR (20) DEFAULT (' ') NOT NULL,
    [CITY]            VARCHAR (15) DEFAULT (' ') NOT NULL,
    [STATE]           VARCHAR (2)  DEFAULT (' ') NOT NULL,
    [NUM_SER_TO_ENT]  DECIMAL (6)  DEFAULT ((0)) NOT NULL,
    [NUM_SER_NOT_ENT] DECIMAL (6)  DEFAULT ((0)) NOT NULL,
    [PREFIX]          VARCHAR (2)  DEFAULT (' ') NOT NULL,
    [SUFFIX]          VARCHAR (1)  DEFAULT (' ') NOT NULL,
    [PRINTED]         VARCHAR (1)  DEFAULT (' ') NOT NULL,
    CONSTRAINT [GUNTYPES_INDEX01] PRIMARY KEY CLUSTERED ([CODE] ASC) 
);






GO
CREATE UNIQUE NONCLUSTERED INDEX [GUNTYPES_INDEX00]
    ON [dbo].[GUNTYPES]([Recnum] ASC) ;

