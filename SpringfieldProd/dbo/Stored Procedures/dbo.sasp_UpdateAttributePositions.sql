
CREATE PROCEDURE [dbo].[sasp_UpdateAttributePositions]
   WITH
   EXEC AS CALLER
AS
   UPDATE T                               -- make TMPATTR match MasterAttr POS
      SET POS = M.POS, DPOS = M.DPOS
     FROM TMPATTR T
          RIGHT OUTER JOIN MasterAttr M ON T.ATTRIBUTE = M.ATTRIBUTE
    WHERE     (M.STATUS = 'A')
          AND (T.STATUS = 'A')
          AND ( (T.POS <> M.POS) OR (T.DPOS <> M.DPOS))

   UPDATE P    --make STRATTR.POS=MasterAttr.POS Should return same # as Msg 2
      SET POS = M.POS
     FROM MasterAttr M
          LEFT OUTER JOIN STRATTR P ON M.ATTRIBUTE = P.ATTRIBUTE
          LEFT OUTER JOIN TMPATTR T ON M.ATTRIBUTE = T.ATTRIBUTE
    WHERE     M.STATUS = 'A'
          AND T.STATUS = 'A'
          AND P.ATTRIBUTE = M.ATTRIBUTE
          AND P.POS <> M.POS