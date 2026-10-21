# Verified reporting contract

Discovery: live IMART schema, ORA26PDB; application 105, workspace IMART; APEX 26.1.2. Read-only discovery scripts and logs accompany this document. Capture observed from 4 October 2026; absence before that date is not evidence of inactivity.

| Concept | Actual source | Meaning / relationship |
| --- | --- | --- |
| Event identity | IMART.IMART_AUDIT_EVENT_V.AUDIT_EVENT_ID NUMBER | One captured event. Canonical source; do not union IMART_AUDIT_LOGIN or IMART_AUDIT_ERROR, which overlap it. |
| Event time | EVENT_TIMESTAMP TIMESTAMP WITH TIME ZONE | Asia/Kolkata reporting, inclusive lower / exclusive next-day upper boundary. |
| Actor | USER_NAME, BOSSUSERCODE, EMPLOYEE_CODE | Recorded ERP identity; DATABASE_USER is not the actor. |
| Current employee / department | EMPLOYEE.EMPLOYEECODE/EMPLOYEENAME/DEPARTMENTCODE, DEPARTMENT.DEPARTMENTCODE/DEPARTMENTNAME | Existing shared LOV `lov_employee.sql` verifies the department join; recorded employee code resolves current directory attributes. Aggregate by employee code first; ambiguous department mappings stay NULL. This is current enrichment, not an event-time snapshot. |
| Organization | COMPANY_CODE, LOCATION_CODE VARCHAR2 | Recorded context; centralized IMART_AUDIT.can_read controls every row. Missing context remains unavailable unless existing technical access permits it. |
| Current organization labels | COMPANY.COMPANYCODE/COMPANYNAME; LOCATION.LOCATIONCODE/LOCATIONNAME | Aggregate by code before joining, preventing multiplicative joins. Labels are current, not historical snapshots. |
| Module / screen | RESOLVED_MODULE_CODE, MODULE_NAME, MODULE_MAPPING_SOURCE, PAGE_ID/PAGE_NAME, FORM_NAME | Existing secured view resolves current mappings and labels their provenance. No invented submodule hierarchy. |
| Operation | ACTION_TYPE, EVENT_TYPE | Preserve originals; normalize only known values; unmapped action is OTHER. SESSION_EXPIRED remains visible as original action. |
| Outcome | OUTCOME | SUCCESS, FAILURE, OBSERVED are separate. OBSERVED is not proof of success. |
| Record | TABLE_NAME + RECORD_KEY_HASH / RECORD_KEY | Distinct identity includes entity and key, not bare record number. Only keyed events count as affected records. |
| Business reference | TRANSACTION_REFERENCE | Recorded reference only; no reconstruction from present business rows. |
| Correlation | REQUEST_ID RAW, TRANSACTION_ID, AUDIT_SESSION_ID | Distinct captured events retain their identity even when correlated. A high-level BUSINESS event and a ROW_CHANGE event are not the same unit. |
| Changes | IMART_AUDIT_CHANGE_V.AUDIT_EVENT_ID, COLUMN_NAME, OLD_STATE/NEW_STATE, OLD_VALUE/NEW_VALUE, CAPTURE_MODE | Existing protected field viewer (1091/1093) retains masking and bounded payload handling. Do not duplicate raw CLOB values in exports. |
| Sessions | IMART_AUDIT_SESSION.AUDIT_SESSION_ID / APPLICATION_ID / APEX_SESSION_ID / USER_NAME | Observed authenticated session start, not inferred successful LOGIN. Session duration only when an actual later end belongs to this recorded session. |
| Administrative changes | Recorded BOSSUSER / BOSSUSERROLE events | Administrative entity activity; does not imply actor held an administrator role at event time. Historical actor-role snapshots were not verified. |
| Master classification | MODULE.MASTERTABLENAME, MODULETYPE | Current directory classification only; use verified module metadata, do not infer master from table spelling. |
| Retention | IMART_AUDIT_CONFIG.RETENTION_DAYS / LEGAL_HOLD | Existing configuration; no purge or capture-policy modification. |

## Counting rules

Total events = count of authorized canonical event IDs in the shared date/filter scope. Successful event count = OUTCOME='SUCCESS'; failure count = OUTCOME='FAILURE'; observed and unknown outcome counts are separate. Successful row operations = successful ROW_CHANGE events, excluding high-level BUSINESS duplicates. Failed attempts are captured failure events, not asserted unique business attempts. Insert/update/delete cards count normalized event categories; the UI describes their event unit. Active users = distinct non-null recorded ERP USER_NAME with SOURCE_TYPE='APEX_USER' in scope; background database identities are excluded. Distinct records = distinct entity plus captured key among keyed events. Field changes are not added to event totals. Matrix totals use the same event IDs and GROUPING SETS; totals must not be added again to detail rows.

## Security and gaps

New reporting sources read IMART_AUDIT_EVENT through the inspected module-resolution SQL from IMART_AUDIT_EVENT_V and the identical IMART_AUDIT.can_read function. The secured source SELECT body is compared before optimization; the original view and security package are unchanged. Function results are scalar-cached only within a statement for each company/location combination. Page authorization reuses Audit Inquiry Access. Filters narrow authorized rows and never grant access. Exports additionally require existing can_export for every organization represented. No new access grants. No IP, user agent, credentials, database host or unrestricted before/after payloads in new summary exports. Existing event and field dialogs retain their own authorization.

The existing application's global Session State Protection setting is Disabled. New pages and drill items have checksum settings, but these cannot enforce URL integrity while the global setting remains disabled. Organizational access continues to be enforced server-side. A forged company-2 drill returned no events for BOSS's company-1 grant. Enabling global SSP requires a separate application-wide compatibility review.

No verified historical role/department snapshots, complete scoped user directory membership, configured risk thresholds, working hours, or audit-report delivery service were found. Registered/inactive-user, role, department, risk score and scheduled delivery claims must remain unavailable until their actual dependencies are verified. Current BOSSUSERTYPE does not establish privilege. BOSSUSERROLE has COMPANYCODE but no verified actor relationship; do not join on coincidentally matching TNO. Native login events often lack organization context and remain outside company-only grants. Legacy missing-company events remain excluded by centralized reporting security. The existing form-specific history recovery is not a blanket reporting grant.

## Performance

Existing event indexes include time (SYS_EXTRACT_UTC(EVENT_TIMESTAMP)), company/time, user/time, entity/hash/time, session, request/time and transaction/time. Date predicates are range predicates on the timestamp. No new index is assumed necessary. Charts use server aggregation within a validated maximum 366-day window; reports retain accurate native pagination totals. Historical text payloads are fetched only by existing protected detail pages.

Runtime tuning removed repeated per-row permission and APEX session-state calls using statement-local scalar subqueries; current native query plans are left to the optimizer. No result cache, summary table, new index or grant was introduced. The final weekly view rendered in 0.79 seconds in APEX's server log, with chart requests of 0.09–0.29 seconds. These are single-session observations, not a load-test guarantee; the final month view rendered in 1.43 seconds for 36,979 events, with chart requests of 0.14–1.09 seconds. Long-window and concurrent performance should still be monitored against growing capture volume.

Visible reporting date format is DD-MM-YYYY; timestamps preserve time precision. P1100 date inputs normalize legacy ISO state before rendering, and strict conversion accepts either legacy ISO or numeric day-first input. The scoped view shares the same parser. Calendar selection, preset results, reporting headers, trend labels, period rows, report date columns and event/timeline timestamps use the numeric format. Native date columns are retained for sorting; hidden drill keys remain encoded consistently. Raw captured old/new text is not rewritten.
