# App 105 inline master KPI cards

Deployed and verified on 2026-10-01.

## User flow

70 existing SQL interactive-report master registers now have a KPI Cards button beside the existing Add New controls. The panel opens below the page header and above the report. Close hides the panel entirely, restores focus to the button, and leaves no blank height. No KPI data request runs on initial page load. Each explicit opening requests fresh data once; closing aborts an outstanding request.

Business rows, existing reports, filter drawers and Add New functionality are unchanged. Styles are scoped to the new panel. An application export taken before these changes is in `../backups/master-reports-before-20261001/f105.sql`.

## Scope and accuracy

Cards show distinct master records, missing available identity fields, repeated normalized names, and the latest available native date where the register exposes one. Repeated names are review signals, not definitive duplicate records. A displayed record date is not an audit trail. Item/specification joins are deduplicated at master identity before calculating the cards.

The source is the existing register SQL with its current server-side page/session filters and module authorization. Interactive-report text search and saved-report filters are not included; the panel explicitly states this. Non-SQL/non-interactive master registers are not onboarded. Transaction-specific financial KPIs are not implemented by this generic master-card feature.

## Verification

- All 70 backend payloads passed after the final distinct-master correction: see `inline_kpi_verification_20261001.txt`.
- Chrome: Account/Party, Item Master, Item Category, Item Type, City, Department, Employee, Measuring Unit, Location, Bank, HSN, Storage Location and Vendor registers were checked for initial hidden state, populated opening and Close returning panel height to zero.
- Item Master was retested after the joined-row correction: 39 distinct masters, not 1,380 specification rows. Close/reopen passed.
- At a 900 x 800 viewport, the KPI panel had no internal horizontal overflow; Close still returned height to zero. Temporary viewport override was reset.
- Live Chrome screenshot: `inline-kpi-chrome-proof.jpg`.
- New report-hub Overview and Data Completeness pages were checked in Chrome; Master selector and Apply submit work. Department completeness had no matching exception rows.

## Canonical implementation

`register_kpis_package.sql`, `register_kpis.js`, `build_register_kpis.ps1` and generated `register_kpis_components.sql` contain the final implementation. `deploy_register_kpis.sql` is the fresh-install entry point, not an idempotent redeployment script. Earlier fix scripts document migration steps on the live app and must not all be replayed blindly.
