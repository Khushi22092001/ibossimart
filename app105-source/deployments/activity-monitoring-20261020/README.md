# ERP Activity Monitoring & Audit MIS

Deployed to application 105 / IMART / APEX 26.1.2 on 21 October 2026, following the user's explicit approval for live deployment and testing. Entry point: fifth **Activity Monitoring** card on Dashboard Hub (826). Sixteen pages and two read-only reporting views are installed. Validation and remaining limits are recorded in TEST_RESULTS.md.

## Scope

| Page | Alias | Function |
| --- | --- | --- |
| 1100 | ACTIVITY-MONITORING | Shared filters, 12 KPI cards, six native JET charts, MIS navigation |
| 1101 | ACTIVITY-DAILY | Daily/hourly/monthly summaries |
| 1102 | ACTIVITY-USERS | Recorded user / current employee and department / organization summaries |
| 1103 | ACTIVITY-MODULES | Module / screen / form summaries and mapping provenance |
| 1104 | ACTIVITY-COMPANIES | Company summaries |
| 1105 | ACTIVITY-LOCATIONS | Location summaries |
| 1106 | ACTIVITY-USER-MODULE | Searchable matrix with row, column, grand total rows |
| 1107 | ACTIVITY-COMPANY-LOCATION | Authorized organization matrix and totals |
| 1108 | ACTIVITY-OPERATIONS | Normalized and original action summaries |
| 1109 | ACTIVITY-EXCEPTIONS | Captured failures, deletions, administrative entity changes |
| 1110 | ACTIVITY-SESSIONS | Authentication events and observed authenticated sessions |
| 1111 | ACTIVITY-MASTERS | Row changes to current ERP-mapped masters |
| 1112 | ACTIVITY-PRIVILEGED | Verified user / role-assignment entity changes |
| 1113 | ACTIVITY-DETAIL | Event-level detail and drill filters |
| 1114 | ACTIVITY-RECORD-HISTORY | Exact entity/key history within common period |
| 1115 | ACTIVITY-COVERAGE | Definitions, security, historical gaps and dependencies |

Existing protected pages 1091 (event detail) and 1093 (field values) are reused. The module does not duplicate raw old/new CLOB values or bypass their masking. The hub integration adds one new region; it preserves all existing page 826 components and its four cards.

## Existing components reused

Approved header shell 95002006100926, hero/identity region, existing directory card/icon/description classes, Universal Theme regions/buttons/form templates, native Interactive Reports, native JET charts, existing font and theme variables. New CSS is scoped to `am-*` classes. No global asset or design-system changes, external fonts, libraries or CDNs.

## Data and security

See [FIELD_MAPPING.md](FIELD_MAPPING.md) for the source-by-source contract. The new views use canonical IMART_AUDIT_EVENT data, the inspected IMART_AUDIT_EVENT_V module-resolution query, the identical central IMART_AUDIT.can_read permission function and verified current directory labels. Permission checks and session-state lookups use statement-local scalar subqueries to avoid repeated PL/SQL calls per event. Permissions are never cached across requests. The optimization script verifies that the existing secured view still matches the inspected source before updating only this module's two new views. IMART_ACTIVITY_SCOPE_V applies the canonical P1100 filters for every report and chart. No grants, role memberships, business data, existing views/packages/triggers or audit capture policies are changed.

All pages use existing **Audit Inquiry Access**. Existing can_read remains authoritative. Download authorization is evaluated without caching and requires existing can_export for every organization in the shared filtered population. This is intentionally conservative for narrower drill-downs. Email download is disabled. New reports omit IP/device data and unrestricted audit payloads. Exports offer native CSV/XLSX/HTML; Print invokes browser printing, not a claimed server PDF service. Potential spreadsheet formula strings are prefixed with an apostrophe before reaching report output.

Dates use Asia/Kolkata, inclusive start / exclusive midnight after end. Default is Today. Maximum range is 366 days; SQL applies the same guard even for direct report requests. Other filter values only narrow secured rows. Links use APEX_PAGE.GET_URL, and page/item checksum requirements are configured. However, existing application-wide Session State Protection is Disabled: those checksum settings do not currently enforce URL integrity. This application-wide setting was preserved. Server-side can_read remains the organization boundary; a forged company drill returned no rows. Unknown drill dimensions return no matches.

No complete scoped user-directory relationship, historical actor roles/departments, policy risk thresholds, working-hour rules or authorized audit-report delivery mechanism was verified. The Coverage page explains these limits. Registered/inactive users, fabricated risk scores and automatic sensitive report delivery are not implemented. Current employee names and departments use the verified ERP directory join and are explicitly labeled current. Session starts use actual recorded session observations; an absent end stays NULL. Historical context is not reconstructed from current business rows.

The existing per-page access logger requires IMART_AUDIT_PAGE_CONFIG registration. This bundle preserves audit configuration; the new pages are not automatically registered for read-event capture. Enabling it requires a separately reviewed registration of application 105 pages 1100–1115 with READ_ENABLED='Y' and SEARCH_ENABLED='N'; no new audit framework is needed.

## Build and validation

Run `node build.cjs`, then `node validate.cjs` from this folder. The builder writes native APEX SQL, view DDL and query manifests; it does not deploy. `validate.sql` uses DBMS_SQL.PARSE without executing component imports. It validates report/chart SQL via CTEs before new views exist. `static-validation.json` and `validation.log` record actual results; parse success is not browser/runtime verification.

Before deployment, review `preflight.sql`, `01_reporting_views.sql`, `02_apex_pages.sql` and `03_dashboard_hub_card.sql`. The live ERP constraint in the user's specification requires review before generated DDL/APEX imports. `deploy.sql` uses the established SQLcl saved IMART connection. Preflight aborts on object/page conflicts; it never overwrites them. A failed partial installation requires inspection rather than blind rerunning. Do not run against another application or schema.

The initial automatic approval rejection was resolved by the user's explicit approval, "Approve live deployment and testing." Installation exposed native APEX property issues which were corrected before successful import. Runtime testing also corrected filter item placement, chart resource registration, pagination reset, manual date-to-Custom behavior and matrix total drill scope. Final validation passed 77 Oracle parse checks, twelve static checks and 32 executed logic checks. See [TEST_RESULTS.md](TEST_RESULTS.md) for reconciled browser results and outstanding checks.

Native deployed page and reporting-view snapshots are saved as deployed-activity-pages.sql and deployed-reporting-views.sql. Timestamped before-module-page-update and before-reporting-optimization files preserve intermediate module versions. The original four hub cards remain intact. Do not rerun deploy.sql on the installed module: its conflict guards deliberately reject existing objects/pages. update-new-pages.sql updates only this module's sixteen pages after a native export backup; optimize-reporting.sql updates only its two views after source/security checks.

## Validation limits

All twelve MIS pages, KPI reconciliation, six rendered native charts, operation-chart drill, combined filters, date presets, range rejection/recovery, exact record history and existing field dialogs were exercised in the authenticated browser. Mobile (389px) and desktop (1214px) layouts were inspected. Positive export testing is unavailable because no current audit grant permits export; BOSS's Download action is hidden. A successful authorized native-download request, a second unauthorized role, tablet width, full keyboard interaction, private saved variants and actual printed/PDF output have not been validated. A maximum-volume/load test was not performed. These limits do not imply successful tests.

## Rollback / recovery

No automatic destructive rollback is included. Existing objects are preserved. To withdraw the module, first remove its new hub shortcut region (92002610209999000) in APEX Builder, then remove only newly allocated pages 1100–1115 and the new export authorization after confirming ownership. The two new views can remain unused, or be removed under a separately reviewed cleanup. Never restore the full hub backup over unrelated later edits. `before_dashboard_hub.sql` is evidence and emergency reference, not an automatic replacement script.

## Filter and trend presentation update — 21 October 2026

Common reporting filters are collapsible and initially closed. Activity trend now spans the available width, has a native Maximize/Restore control and uses three reference-style colored Insert/Update/Delete lines with round markers. A matching Period/Insert/Update/Delete table provides exact counts and links to event detail. Single-day views use hourly detail; larger periods retain daily/monthly grouping, with Hour ranges over seven days adapted to days. Gaps are zero-filled and empty CRUD populations remain empty. All values come from the same secured reporting scope. See the dated section in TEST_RESULTS.md and trend-validation.log for this change's checks.

## Repository bundle

The committed bundle contains current source, native deployed exports, validation generators, verification evidence and screenshots. Temporary discovery probes, generated test SQL and intermediate installation backups remain local. Run the `.cjs` generators to recreate their SQL outputs; no database checks run during a Git commit. The folder's `.gitattributes` preserves exact artifact bytes so the SHA-256 deployment manifest is stable across Windows and other checkouts.
