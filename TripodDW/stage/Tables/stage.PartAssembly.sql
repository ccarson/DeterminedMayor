CREATE TABLE [stage].[PartAssembly] (
    [Recnum]           BIGINT       IDENTITY (1, 1) NOT NULL,
    [AssemblySPRNUM]   VARCHAR (20) NOT NULL,
    [AssemblyPartKey]  BIGINT       NOT NULL,
    [ComponentSPRNUM]  VARCHAR (20) NOT NULL,
    [ComponentPartKey] BIGINT       NOT NULL,
    CONSTRAINT [pk_PartAssembly] PRIMARY KEY CLUSTERED ([Recnum] ASC)
);

