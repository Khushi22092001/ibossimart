# Purchase Quotation FD Back and calculation guard repair

Page 710 only.

- The `DetailFooter` **Back** control repair is delivered by the paired shared-theme deployment, which prevents an inline-dialog Back control from being treated as the form-level return action.
- The existing save verifier is enabled only for `SAVE` and `CREATE` requests.
- Its `Quantity2` comparison now runs only when the line is priced in the item's secondary UOM. Primary-UOM lines may legitimately store `Quantity2` as zero or blank and are still fully checked for rate, amount, FD rows, footer, total and header totals.

Fresh rollback export: `live-before/f105_page_710.sql`.

Deploy with `app105-source/deploy_quotation_save_guard_fd_back_20260927.sql`.
Rollback with `app105-source/rollback_quotation_save_guard_fd_back_20260927.sql`.
