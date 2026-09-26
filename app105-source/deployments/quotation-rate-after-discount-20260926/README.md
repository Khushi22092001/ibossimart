# Purchase Quotation — Rate After Discount read-only

`RATEAFTERDISCOUNT` is a calculated value, so its Interactive Grid column type is changed from `NATIVE_NUMBER_FIELD` to `NATIVE_DISPLAY_ONLY`.

Result:

- users cannot type into or change the value;
- editable-grid Tab navigation skips the calculated field;
- the column remains visible;
- the existing calculation can still set and save the model value.

Fresh backup:

`app105-source/backups/quotation-rate-after-discount-before-20260926-184029/live-before/f105_page_710.sql`

Rollback:

`app105-source/rollback_quotation_rate_after_discount_20260926.sql`
