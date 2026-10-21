# Activity Monitoring report action columns

Updated live application 105 report pages 1101-1114 on 21-10-2026. The earlier correction targeted only page 1113; User Activity Summary page 1102 and other summary reports still had a collapsed action column.

All fourteen report pages now reserve 8ch of text width plus cell padding for their native first action column. View details displays View / details in two lines. Record History displays Record / History in two lines. Existing captions and drill URLs are preserved. Only the CSS on these report pages changes; no global theme styles, queries, data, authorization or report filters change. The previously deployed page 1113 Back/Close header is retained.

Browser verification: all eight visible User Activity Summary links measured about 72px wide and 35px high (two lines). User Activity Detail Record History measured the same two-line height. Back and Close remain visible; no console errors. Screenshot: user-summary-verified.png. Native export inspection confirms fourteen report page definitions contain the same correction.

Fresh backup: before-pages.sql (pages 1100-1115). Source: report-actions.css and build.cjs. Scoped generated import: report-pages.sql (only 1101-1114). Final live export: deployed-report-pages.sql. Deploy after the base module and prior page-specific fixes; regenerate from a fresh live backup before applying over subsequent unrelated edits. No test business data was generated.
