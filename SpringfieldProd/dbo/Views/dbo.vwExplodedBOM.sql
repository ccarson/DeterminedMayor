
CREATE VIEW [dbo].[vwExplodedBOM]
AS
WITH PartCTE AS (SELECT        MASTPART AS RootPart, MASTPART, CAST((CASE WHEN subref.REPLACE_FLAG = 'Y' THEN (AMOUNT * - 1) ELSE (AMOUNT) END) AS DECIMAL) AS Amount, 
                                                                 CAST((CASE WHEN subref.REPLACE_FLAG = 'Y' THEN (TaxQty * - 1) ELSE (TaxQty) END) AS DECIMAL) AS TaxQty, SUBPART, 0 AS SubLevel, (CASE WHEN subpart IN
                                                                     (SELECT        Mastpart
                                                                       FROM            subref INNER JOIN
                                                                                                 parts p ON p.SPRNUM = subref.MASTPART AND p.PURCH_FLAG <> 'P') THEN 'Yes' ELSE '' END) AS IsAssembly, REPLACE_FLAG
                                        FROM            dbo.subref
                                        WHERE        (MASTPART <> '')
                                        UNION ALL
                                        SELECT        pcte.RootPart, sub.MASTPART, CAST(CASE WHEN pcte.Amount < 0 THEN (sub.AMOUNT * pcte.Amount) WHEN sub.REPLACE_FLAG = 'Y' THEN ((sub.AMOUNT * - 1) * pcte.Amount) 
                                                                 ELSE (sub.AMOUNT * pcte.Amount) END AS DECIMAL) AS Expr1, CAST((CASE WHEN pcte.Amount < 0 THEN (sub.AMOUNT * pcte.Amount) WHEN sub.REPLACE_FLAG = 'Y' THEN ((sub.TaxQty * - 1) 
                                                                 * pcte.Amount) ELSE (sub.TaxQty * pcte.Amount) END) AS DECIMAL) AS TaxQty, sub.SUBPART, pcte.SubLevel + 1 AS SubLevel, (CASE WHEN sub.subpart IN
                                                                     (SELECT        subref.Mastpart
                                                                       FROM            subref INNER JOIN
                                                                                                 parts p ON p.SPRNUM = subref.MASTPART AND p.PURCH_FLAG <> 'P') THEN 'Yes' ELSE '' END) AS IsAssembly, sub.REPLACE_FLAG
                                        FROM            PartCTE AS pcte INNER JOIN
                                                                 dbo.subref AS sub ON sub.MASTPART = pcte.SUBPART AND pcte.MASTPART <> pcte.SUBPART INNER JOIN
                                                                 dbo.parts AS p ON p.SPRNUM = pcte.SUBPART AND p.PURCH_FLAG <> 'P')
    SELECT        TOP (100) PERCENT pcte.RootPart, pcte.MASTPART, pcte.SUBPART, pcte.Amount AS Qty, pcte.TaxQty, dbo.parts.[DESC], pcte.SubLevel, dbo.parts.COSTFIN, pcte.IsAssembly, pcte.REPLACE_FLAG, dbo.parts.LEAD_TIME
     FROM            PartCTE AS pcte INNER JOIN
                              dbo.parts ON dbo.parts.SPRNUM = pcte.SUBPART
     ORDER BY pcte.RootPart, pcte.MASTPART, pcte.SUBPART, pcte.REPLACE_FLAG



GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPane1', @value = N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "pcte"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "parts"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 474
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwExplodedBOM';


GO
EXECUTE sp_addextendedproperty @name = N'MS_DiagramPaneCount', @value = 1, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'VIEW', @level1name = N'vwExplodedBOM';

