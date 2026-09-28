# O2C rate recalculation — 2026-09-27

## Scope

Two live Sales Enquiry entry pages now run their existing amount/tax recalculation dynamic action when `RATE` loses focus, in addition to the existing quantity fields.

| Page | Form | change |
| --- | --- | --- |
| 702 | Sales Enquiry | `QUANTITY1,QUANTITY2` → `QUANTITY1,QUANTITY2,RATE` |
| 706 | Sales Enquiry | `QUANTITY1,QUANTITY2` → `QUANTITY1,QUANTITY2,RATE` |

No transaction data was changed, and no calculation formula, database table, trigger, or stored program was changed.

## Evidence

- `live-before/f105.sql` is the live rollback export captured before deployment.
- `staged/f105.sql` has exactly the two changes above.
- `live-after/f105.sql` has SHA-256 `4AF81AE9381429C215153D38793834A8A0E42D95BCA1AE8D1BE24DDFB521BD27`, identical to the staged file.
- Deployment script: `app105-source/deploy_o2c_rate_recalculation_20260927.sql`.
