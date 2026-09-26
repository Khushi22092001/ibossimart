# Rate After Discount read-only — completion

Completed on 26 September 2026.

## Result

- Page 710 / Quotation Detail / `RATEAFTERDISCOUNT` is `NATIVE_DISPLAY_ONLY` in live APEX metadata.
- The calculated value remains visible and is still part of the grid model/save process.
- Browser verification in the supplied fresh ERP session confirmed there is no editable textbox for the column in Interactive Grid edit mode.
- The only generated control for the calculated value is a hidden model input, so keyboard Tab navigation skips it.
- No test record was entered or saved during browser verification.

## Safety

Fresh live pre-change backup:

`app105-source/backups/quotation-rate-after-discount-before-20260926-184029/live-before/f105_page_710.sql`

Rollback:

`app105-source/rollback_quotation_rate_after_discount_20260926.sql`
