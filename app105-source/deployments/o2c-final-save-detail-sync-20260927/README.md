# O2C final-save detail synchronization — 2026-09-27

## Purpose

At the existing footer-summary save point, each form now synchronizes every valid detail row's persisted values from its own persisted footer rows:

`FOOTERAMOUNT = SUM(detail-footer.FOOTERVALUE)`

`TOTALAMOUNT = AMOUNT + FOOTERAMOUNT`

The calculation is in the same after-submit transaction as the grid and header-footer saves. It has no `COMMIT`, preserves manual footer edits, and prevents a client-side timing issue from making a stored detail total stale.

## Forms

| Page | Form | Detail table |
| --- | --- | --- |
| 148 | PO Amendment | `POAMENDMENTDETAIL` |
| 171 | Sales Order | `SALESORDERDETAIL` |
| 702 | Sales Enquiry | `SALESENQUIRYDETAIL` |
| 705 | Sales Quotation | `SALESQUOTATIONDETAIL` |
| 706 | Sales Enquiry | `SALESENQUIRYDETAIL` |

The Sales Order update deliberately excludes an identity `(TNO,SNO)` that already occurs more than once. That legacy condition is ambiguous because the footer table is keyed by `(TNO,SNO)`; it is separately reported for data remediation rather than silently assigning the same footer to multiple lines.

## Verification

- The exact PL/SQL compiled successfully against the live schema in a rollback-only test: `validate_o2c_final_save_detail_sync_20260927.sql`.
- Rollback export: `live-before/f105.sql`.
- Live-after export SHA-256 matches the staged file: `DB0C45E21BF9C49E8A4F0E83B8A6215914FF9D3427512D00FF35A65BA9661695`.
- Deployment script: `app105-source/deploy_o2c_final_save_detail_sync_20260927.sql`.
