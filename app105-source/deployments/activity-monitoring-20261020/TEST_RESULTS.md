# Validation results — deployed 21 October 2026

## Installation and source checks

The user approved live deployment and testing after reviewing the bundle. Both reporting views are VALID; sixteen native pages (1100–1115), the export authorization scheme and the additional Dashboard Hub region are installed. The original four hub cards, business records, original audit/security objects and application-wide settings were preserved. Native deployed exports are included.

- Twelve static checks passed, including secured shared scope, explicit projections, restricted exports and statement-local permission caching.
- All 77 Oracle DBMS_SQL.PARSE checks passed against generated native component, PL/SQL, report, chart and LOV sources.
- All 32 executed logic checks passed for actual date-process code, formula-safe output and drill predicates. Invalid dates, inverted/oversized periods, unknown grain/preset and forged company filters fail closed.
- Read-only reconciliation for company 1 / 20 October 2026 passed: **1,682 events; 1,124 SUCCESS; 54 FAILURE; 504 OBSERVED; 1,121 successful row operations; 407 distinct entity/key records; two active ERP actors; 324 inserts; 712 updates; 85 deletes; 561 other operations**.
- Eight summary totals, both matrix detail populations and chart denominators reconcile without directory join multiplication. Four midnight boundary cases pass. Existing and new secured views return zero rows outside a web authorization context. No synthetic business records or impersonated APEX sessions were created.

## Authenticated browser evidence

BOSS, application 105, existing ERP theme; 389px mobile and 1214px desktop viewports inspected. No horizontal body overflow at either width.

- Hub retains four original cards and adds Activity Monitoring. Dashboard renders twelve KPI cards and six native JET charts using live audit data; browser console checks found no JavaScript errors.
- Displayed Yesterday KPIs match the fixed 1,682-event reference. All twelve MIS pages load without region errors. Exception MIS has 139 events; authentication MIS 13 events and ten observed sessions; master-change MIS 142 events; administrative-entity MIS correctly has no rows. Matrix row-total drill was also verified: 35 scoped events open as 1–35 of 35. A private PUSHPAK filter on the user/module matrix produced an honest empty result for Yesterday; SQL matrix totals were reconciled separately.
- Today, Yesterday, This Week, This Month, Previous Month, Custom and Clear were exercised. Previous Month has no captured events. Hour and Month time grouping render; manually edited dates now select Custom. A period over 366 days displays an APEX validation error and can be corrected without leaving the form.
- Company, location, ERP user, employee, module, screen, operation, outcome, source, entity and exact record-key filters were exercised together. A mismatching location produces empty KPIs/charts; removing it exposes the two matching Measuring Unit updates. Current-department code 11 (ADMIN) narrows the day to 186 events and one active ERP actor.
- Insert KPI opens 324 events; native pagination retains the total. Operation-chart VIEW segment opens 425 matching events and retains the period. After paging a broader detail report and narrowing to Measuring Unit, successful-row drill shows 1–2 of 2 without the previous stale-pagination error.
- Measuring Unit events 85874 and 85363 open existing protected audit dialogs. Field comparison displays captured REMARK history and NULL state; full-value dialog works. Exact record history links only the same MEASURINGUNIT entity/key and displays those two permitted updates. Original missing-company historical events remain restricted by existing reporting policy.
- Forged company-2 drill returns no events under BOSS's company-1 grant. BOSS's native Actions menu has no Download action. A manually formed CSV request encountered a Security violation page; the exact rejection cause was not isolated, so this is not claimed as a successful positive export or exhaustive native-download authorization test.

## Security limitation and unavailable tests

Existing application-wide Session State Protection is **Disabled**. Native page/item checksum requirements are configured but do not enforce URL integrity while that global setting remains disabled. This was not changed because enabling it affects existing ERP URLs. Server-side central can_read remains enforced. Checksum-tampering rejection is not claimed.

No current audit grant has CAN_EXPORT='Y' (one existing N grant). Positive CSV/XLSX/HTML output and filtered-file contents therefore remain untested; no new access grant was created for QA. A second unauthorized role/account was unavailable. Tablet width, complete keyboard navigation, private saved variants, actual print/PDF output and maximum-volume/concurrent load testing remain untested. Native CSV/XLSX/HTML and browser Print are configured; server PDF and scheduled delivery are not implemented.

## Performance

Initial month rendering was roughly 60.75 seconds; repeated per-row permission/session-state calls were identified. Only the two new reporting views were optimized, retaining the identical central can_read policy and inspected module mapping. All native pages were updated to use cached state expressions and native grouping binds. No index, summary table, result cache or security change was added.

Final measured weekly view (19–21 October) rendered in **0.79 seconds**, with six chart requests of approximately **0.09–0.29 seconds** in APEX's activity log. The fixed-day dashboard rendered around 0.79–1.22 seconds and the twelve MIS pages around 1.07–1.81 seconds. These are single-session server timings, not end-to-end browser latency or a load-test guarantee. A final This Month run covering 36,979 events rendered in 1.43 seconds, with six chart requests of 0.14–1.09 seconds (runtime-timings.log). Growing audit volume and concurrent load still require operational observation.

Evidence: validation.log, static-validation.json, logic-tests.log, reconciliation.log, final-verification.log, browser-validation.json and desktop screenshots. APEX activity logs include an expected ERROR for the deliberately rejected oversized date range. Historical intermediate timings and exports are retained for review.

## 21 October 2026 — filters and activity trend redesign

Page 1100 now uses the existing Universal Theme Collapsible region template for Common reporting filters, initially collapsed. Expand/collapse works; submitting filters or reloading returns to the collapsed default.

Activity trend is full width and provides the native Maximize/Restore action. Its Insert, Update and Delete series use blue, green and purple lines with circular markers. A companion read-only Period / Insert / Update / Delete table uses the same authorized aggregation. Chart points and table counts preserve the period and operation in event drill-down links.

Only the selected period and existing permitted scope are used. A single-day Day selection is shown as 24 hourly buckets, allowing a line rather than isolated one-day points. Day and Month grouping are supported; Hour grouping is bounded to seven days, with wider selections grouped daily for readability. Periods without captured operations are zero-filled; a wholly empty CRUD population displays an empty state. Zero means no captured event, not proof of historical inactivity. Counts are captured INSERT/UPDATE/DELETE events, so they intentionally exclude VIEW and OTHER events.

Six executable reconciliation cases passed: single-day (24 buckets / 72 points / 1,121 events for 20 October), seven daily buckets, seven hourly days, longer Hour selection adapting to days, monthly grouping and empty pre-capture history. The three trend series sum to the filtered CRUD event count in every case. All 79 Oracle parse checks passed for the final source; native import and runtime checks also validate the chart settings and short display labels.

Browser checks: collapsed default, expand/collapse, collapse after Apply, seven Monday–Sunday data rows for 12–18 October, 24 hourly Today rows, native Maximize/Restore and a matching Friday Insert drill (2,311 events). Desktop width and mobile width were inspected. Screenshots: filters-collapsed-desktop.png, trend-redesign-desktop.png, trend-table-desktop.png. No business data, security grants or reporting views changed for this UI update. Timestamped page-1100 native backups precede each import.

## 21 October 2026 — DD-MM-YYYY date presentation

Application 105 Activity Monitoring pages 1100–1115 now display and accept DD-MM-YYYY. Timestamps retain their existing time precision as DD-MM-YYYY HH24:MI:SS; period-start columns use DD-MM-YYYY HH24:MI. Current ISO session selections are normalized before rendering. Both legacy ISO state and DD-MM input parse through strict validated conversions, while visible controls and preset results use DD-MM-YYYY.

The Daily summary period is a native DATE value, preserving chronological sorting. Its period drill keys remain ISO internally for compatibility. Trend labels/table rows use DD-MM-YYYY, with time added for hourly rows. Month buckets show their starting date. The selected numeric date range is visible in the trend introduction.

Existing event-detail page 1091 was exported, backed up and updated only for timestamp presentation: the Event Details timestamp and related transaction timeline now display DD-MM-YYYY with time and timezone. Original authorization, masking, region identities and raw historical field payloads were preserved. Page 1093 contains raw stored values and no separate formatted date control, so it was left unchanged. date-drill-pages.sql is the native page-1091 change; deployed-date-drill-pages.sql records the post-change 1091/1093 export.

Validation: 79 Oracle parse checks, 37 executable date/formula/drill checks and all six trend reconciliation cases passed. New date cases include DD-MM input, leap day, invalid calendar day, ambiguous 04-05 day/month order and a month boundary. All eight summaries still reconcile to 1,682 events for 20-10-2026. Browser verified typed 20-10-2026 selection, calendar selection returning 20-10-2026, report periods, local timestamps, native Daily summary drill, event dialog timestamp with +05:30, related timeline, exact record history, session report timestamps and administrative empty-state context. The twelve MIS pages share the generated native DATE masks; representative page checks and post-deploy native mask inspection accompany the evidence.

Proof: date-format-filters.png, date-format-report.png, date-format-event.png and date-format-browser-validation.json. Browser automation was interrupted during a multi-page check and reconnected; no successful check is inferred from that interruption. The original Today filter is restored after testing. SQL date boundaries, existing security and business data remain unchanged.

Post-deployment native export inspection confirmed all 26 DATE columns use DD-MM-YYYY masks, and both date pickers use DD-MM-YYYY. The final browser check confirms Today restored, filters collapsed and no console warnings/errors. This update does not change application-wide NLS settings.
