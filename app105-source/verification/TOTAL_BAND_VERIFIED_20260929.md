# Shared Total-row presentation — 29 September 2026

## Deployed change

New shared `hspl-total-band.css?cb=20260929total3` imported as an app 105 static
asset and appended to the existing application CSS references. No full
application/page import, SQL/process/DA change, JavaScript edit, calculation
change, model write or business-record save was made for this task.

The stylesheet targets the shared live-total dock and the common
`hspl-detail-total-plain` marker, including legacy page-specific docks. It
styles the existing label children in both supported DOM variants (wrapped
label and direct table-cell children). Native grand-total cells have a
presentation fallback without revealing hidden native source rows.

Design: compact 58px lavender gradient band, rounded corners, left purple
accent, purple chart icon, existing Total/LIVE label, subtle wave decoration
and navy totals. Existing values, cell widths, text alignment, scrollbar
ownership and horizontal-sync code are retained. No fabricated item count;
the existing APEX footer continues displaying the real row count.

## Actual rendered checks

| Form | Live dock variant | Rendered result |
| --- | --- | --- |
| Rate Contract (714) | shared | One styled band, 58px; values and total-cell widths identical before/after |
| Purchase Order (118) | shared | One styled band, 58px; values and total-cell widths identical before/after |
| Purchase Bill (143) | page-specific p143 | One styled band, 58px; direct-cell legacy icon verified as purple chart tile |
| Purchase Bill Pass (152) | shared | One styled band, 58px; Total/LIVE retained |
| Debit Note (159) | shared | One styled band, 58px; Total/LIVE retained |

No document-wide horizontal overflow in these rendered checks. Purchase Order
was scrolled through its actual horizontal UI control: header, body, total
scroller and scrollbar all reached scrollLeft 993.5999755859376 together. The
far-right FD and amount columns remained accessible. No record edits were
used to verify this CSS-only change.

Coverage is application-wide through shared selectors; this is **not a claim
that every individual form/page was opened**. These five rendered forms cover
the shared and legacy dock markup observed in the application.

## Deployment integrity

- SQLcl completed both static-file import and app CSS-reference update.
- Read-back deployed CSS is byte-identical to the local source.
- All pre-existing CSS and JavaScript references are identical to the backup;
  the only appended reference is the new Total stylesheet.
- Previous row-height, thin scrollbar, summary-card and responsive styles were
  left in place.
- Temporary viewport override reset; user's original tabs were not refreshed.

Evidence: `total-band-measurements-20260929.json`, five form screenshots,
`total-band-purchase-order-scroll-right.png`, and before/after live-reference
snapshots in this directory.
