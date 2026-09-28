# CC Invoice final-save detail synchronization — 2026-09-27

The existing `Calculate Footer` after-submit process on page 175 now first makes each `CCINVOICEDETAIL` row internally consistent with its saved `CCINVOICEDETAILFOOTER` rows:

- `FOOTERAMOUNT = SUM(FOOTERVALUE)`
- `TOTALAMOUNT = AMOUNT + FOOTERAMOUNT`

It runs within the document's existing save request, uses no commit, and leaves the existing tax, footer preview, manual footer, and header-footer logic untouched.

Evidence:

- Live data audit before the change: 294 material footer mismatches and 77 material total mismatches across 9,134 CC Invoice detail rows.
- Exact SQL compiled in a rollback-only schema check.
- `live-before/f105_page_175.sql` is the rollback export.
- Staged and live-after page exports match SHA-256 `A2EAEA842E49DAA898D3AEAC3E6D814A7DA8DF8C6F53D00D4332226A723BA14B`.

The page still has an earlier AJAX footer-tax preview action with an explicit commit. It was not removed because its footer dialog refresh currently depends on the persisted preview rows; removing it without replacing that contract would risk breaking intended UI behavior. The final-save synchronization protects the persisted document total, while the preview path requires a separate, tested redesign for full request atomicity.
