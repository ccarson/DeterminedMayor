CREATE PROCEDURE [dbo].[sasp_CartonHeaderIDForManifestPackage] 
(
@idManifestPackage BIGINT
)
AS
  SELECT ISNULL(MAX(ID), 0) AS CurrentID
  FROM CartonHeader
  WHERE ManifestPackageID = @idManifestPackage
