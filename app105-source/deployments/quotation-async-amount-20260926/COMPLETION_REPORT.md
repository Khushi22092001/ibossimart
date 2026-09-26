# Purchase Quotation fast-Tab amount/FD fix — completion

Completed on 26 September 2026.

## Live verification

- Main quotation Amount event: `change`
- FD Footer Value event: `change`
- Main calculation suppresses returned-value change events: `Y`
- FD calculation suppresses returned-value change events: `Y`
- Redundant/racing refresh actions remaining: `0`
- Unchanged navigation guard: active
- Fresh post-deployment Page 710 export created at `live-after/f105_page_710.sql`

## Expected behavior

- Tab or Shift+Tab without editing a value does not calculate the row.
- Changing Quantity, Rate, Discount, or Rate Measuring Unit calculates once for that change.
- Fast navigation cannot trigger the removed FD column/detail-region refreshes that previously blanked GST/Other/Total.
- Manual Rate is preserved.
- Existing GST footer rows are not deleted when the row context is incomplete.
- FD Footer Value updates the main row Other and Total through the existing live model subscription.

## Browser QA status

The open Chrome computer-control surface was retried twice but timed out. Live APEX metadata and a fresh live export were verified successfully. The browser page must be reloaded before testing because its currently loaded JavaScript is the old version.
