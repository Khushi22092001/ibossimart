# Purchase Quotation fast-Tab amount/FD fix

## Root cause

The main quotation calculation and FD calculation were bound to `focusout`. Fast Tab/Shift+Tab could start overlapping AJAX calls. Both calculations also fired change events from their returned values, while separate refresh actions immediately refreshed the calculated FD column/region. A late refresh or stale response could therefore replace Amount, GST/FD, Other, or Total with blank/zero values.

The previous unchanged-focus guard also treated a missing focus snapshot as “edited”, so a simple navigation event could run calculation unnecessarily.

## Changes

- Main Amount calculation now runs on an actual column `change`, not every focus exit.
- FD Footer Value calculation now runs on an actual change.
- Returned calculated values suppress secondary change events.
- Redundant FD column refresh and Detail Footer region refresh were removed.
- Missing focus snapshots are treated as unchanged.
- Manual Rate remains untouched when it already has a value.
- Blank Rate Measuring Unit falls back to Primary Quantity; explicit Secondary Unit still uses Secondary Quantity.
- Incomplete row context cannot delete/rebuild GST footer rows.
- Lookup and formula rules are unchanged.

## Backup

`app105-source/backups/quotation-async-amount-before-20260926-182908/live-before/f105_page_710.sql`

Rollback: `app105-source/rollback_quotation_async_amount_20260926.sql`
