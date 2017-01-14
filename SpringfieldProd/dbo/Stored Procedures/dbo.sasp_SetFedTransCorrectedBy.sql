
CREATE PROCEDURE [dbo].[sasp_SetFedTransCorrectedBy] 
(
  @idCorrectionFor integer
  , @idCorrectedBy integer
  , @BookName varchar(9)
)
AS

IF @BookName = 'MAIN'
BEGIN
  UPDATE FedTransMain
  SET CorrectedBy = @idCorrectedBy
  WHERE ID = @idCorrectionFor;
END
IF @BookName = 'XD3'
BEGIN
  UPDATE FedTransXD3
  SET CorrectedBy = @idCorrectedBy
  WHERE ID = @idCorrectionFor;
END
IF @BookName = 'FARM'
BEGIN
  UPDATE FedTransFarm
  SET CorrectedBy = @idCorrectedBy
  WHERE ID = @idCorrectionFor;
END
IF @BookName = 'IMPORT'
BEGIN
  UPDATE FedTransImport
  SET CorrectedBy = @idCorrectedBy
  WHERE ID = @idCorrectionFor;
END
IF @BookName = 'CAMPPERRY'
BEGIN
  UPDATE FedTransCampPerry
  SET CorrectedBy = @idCorrectedBy
  WHERE ID = @idCorrectionFor;
END