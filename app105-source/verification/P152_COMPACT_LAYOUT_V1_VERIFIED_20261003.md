# Purchase Bill Pass Page 152 Compact Layout V1 — Verified

Date: 2026-10-03  
Application: Oracle APEX App 105  
Page: 152 — Purchase Bill Pass

## Scope

- Page 152 only; presentation/layout only.
- Existing items, widgets, LOVs, validations, values, tab order and business actions retained.
- TDS Detail and Other Details were deliberately not rearranged because they contain standalone action buttons.
- No application-wide CSS or JavaScript asset was changed.

## Implemented

- General: Location / Doc Type / PB Pass Date / PB Pass No on row 1; Party on row 2.
- Select Purchase Bill: Purchase Bill / Pass On, two checkboxes, and two round-figure options in three paired rows.
- Currency: Currency Unit / Currency Value on one row.
- Nature and Transaction: TDS Nature / Transaction Type on row 1; Nature of Supply on row 2.

## Live verification

- Static assets linked with cache key `20261003v1`; both markers present.
- Four scoped compact grids rendered on Page 152.
- Page form rows reduced from 22 to 18; outer form height reduced from 1241px to 1081px.
- General 261px → 187px; Select Purchase Bill 371px → 231px; Currency 195px → 122px; Nature 261px → 187px.
- Detail → Purchase Bill Pass tab return retained all four grids.
- `apex.page.isChanged()` remained `false` and no scoped browser warnings/errors were reported.

## Recovery

- Pre-change export: `app105-source/backups/p152-compact-v1-before-20261003-1245/f105_page_152.sql`
- Scoped rollback: `app105-source/p152-compact-v1/rollback_p152_compact_v1.sql`
