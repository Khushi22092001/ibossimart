# Purchase Order Page 118 Compact Layout V2 — Verified

Date: 2026-10-03  
Application: Oracle APEX App 105  
Page: 118 — Purchase Order

## Scope

- Page 118 only.
- Presentation/layout only.
- Existing ERP typography, colours, widgets, values, validation, save logic, tabs, Detail grid and Document Assistant retained.
- No application-wide CSS/JavaScript asset was changed.

## Implemented layout

- General row 1: Location, Doc Type, Purchase Order Date, Delivery Date.
- General row 2: Purchase Order No, Party, Quantity.
- Is Open Spec remains below the two compact rows.
- Paired cards: Ship To / Currency, Texts / Select Indent, Other Informations / GST.
- Currency internals: Currency Unit / Value on one row.
- Texts internals: Subject / Reference on row 1 and Letter / Title on row 2.
- Select Indent internals: Rate Contract / CS on row 1 and Quotation / Indent on row 2.
- GST internals: Transaction Type / Nature Of Supply on one row.
- Other Informations internals: Under Signed / Agent, Credit Days / Commission Rate, and Freight Type / Remark in three paired rows.
- PO Amendment Detail internals: PO Amendment No / Amount on one row.
- PO Amendment Detail spans the full width below paired cards.
- Duplicate Purchase Order subtitle removed from the active reference header.
- Responsive fallback: two columns at medium content width and one column at narrow/mobile width.

## Verification

- Live static files present and linked with cache key `20261003v27`.
- JavaScript marker and CSS marker both present.
- Chrome visual verification passed at a 1536px browser viewport.
- General row 1 rendered as four equal columns.
- General row 2 rendered as 3/4/5 column spans for PO No / Party / Quantity.
- All seven lower cards rendered with opacity 1.
- Detail tab opened successfully; returning to General retained the four-column layout immediately.
- Detail → General return retained all four internal two-column grids.
- Chrome geometry verification showed equal 194px columns for every internal pair, with matching Y coordinates per row and distinct X coordinates.
- Location remained `RAIPUR` across the tab switch.
- `apex.page.isChanged()` remained `false`; no item value was edited or submitted during verification.
- PO Amendment Detail height reduced from 209px to 125px.
- Other Informations height reduced from 332px to 263px while retaining all six fields.
- No warning or error originated from `hspl-p118-compact-v2.js` or `hspl-p118-compact-v2.css`.

## User-tab recheck

- The user's pre-existing Purchase Order tab had been opened before deployment and contained no compact asset URLs (`compactAssets: []`).
- APEX confirmed there were no unsaved page changes before reload.
- That exact tab was reloaded and moved back to the top.
- Post-reload checks confirmed `hspl-p118-compact-v2-ready`, the compact header grid, seven-card grid, four equal first-row columns and a 1136px full-width PO Amendment region.

## Recovery

- Pre-change live export: `app105-source/backups/p118-compact-v2-before-20261003-1136/f105_page_118.sql`
- Scoped rollback: `app105-source/p118-compact-v2/rollback_p118_compact_v2.sql`
