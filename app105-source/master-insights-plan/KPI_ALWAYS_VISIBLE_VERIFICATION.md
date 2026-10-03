# Always-visible master KPI cards — 2026-10-01

- All 70 master KPI shells have no heading, subtitle, Close button or hidden attribute.
- Removed exactly 70 MASTER_KPI_CARDS toolbar buttons, backed up in IMART_MR_VISIBLE_BTN_BACKUP. Old shell sources retained in IMART_MR_VISIBLE_BACKUP.
- Cards load automatically once on DOM readiness. Existing displayed cards remain present during count refresh. Compact sizing is preserved.
- Actual registered IR/IG region is resolved from current DOM identity and exact report label. This handles theme runtime IDs (Account Master MYID) differing from catalog/static metadata (account-master-report). No ambiguous region is selected.
- Existing payload and filter processes, distinct counts, original query filters and access checks remain unchanged.
- Chrome Account verification: Preparing refresh returned 5 rows; Recent returned 4 rows; Created by me returned no records; Total restored 3,839 rows. Counts refreshed and selected-card state remained consistent. No refresh-error dialog after correction.
- Chrome City verification: auto-displayed four cards, Active and Total clicks refreshed the register, zero KPI headings, zero toggle/Close controls, zero error dialogs. Restored Total.
- Screenshots: kpi-always-visible-account.png and kpi-always-visible-city.png.
