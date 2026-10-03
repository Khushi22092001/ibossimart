# Creation KPI enhancement — App 105, 2026-10-01

- Added New records (rolling last 7 days, server clock, future timestamps excluded) and Created by me (case-insensitive original CREATOR against authenticated APP_USER, all dates).
- Extended existing mutually exclusive KPI filter: ALL, STATUS, RECENT, MINE. Total clears only KPI state; page filters and report filters remain in place.
- Reuses the original catalogued register queries, distinct master identity and access checks. Creation metadata comes from native master tables, not formatted report date strings or modification dates.
- Same existing AJAX endpoints; no additional page-load requests, navigation changes, business record writes or triggers.
- Backups: IMART_MR_CREATION_BACKUP (register/shell source), IMART_MR_CREATION_PKG_BACKUP (package source). Rollback: rollback_creation_kpis.sql.
- All 70 generated register SQL wrappers parsed before publishing. Package has zero compilation errors.
- 67/70 masters store both required fields. Freight Type (78), Party Type (70), Zone (286) do not store creator/creation timestamps; the new cards are omitted there rather than presenting fabricated zero counts.

## Live Chrome checks, authenticated BOSS

- Account Master: Total 3,839; New records 4; Created by me 0. DB direct counts independently matched all three. Recent click showed 4 report rows; creator click showed No records to display; Total restored the full register and selected state.
- Item Master: distinct master Total 39 despite joined specifications giving 1,380 report rows. New records 0; Created by me 0. Recent click returned no rows; Total restored the original report.
- Location Master: register scope Total 2; Active 2; New records 0; Created by me 0. Cards loaded successfully with existing scope intact.
- Account screenshot: creation-kpi-account-chrome.png.

Historical data limitation: many older rows have CREATOR=APEX_PUBLIC_USER or other usernames, not BOSS. The feature does not relabel those rows or claim they were created by the current user.
