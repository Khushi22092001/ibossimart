# Cross-Form Transaction Integrity Findings

Date: 27 September 2026  
Evidence: live APEX 105 metadata export, read-only IMART queries, and live browser verification.

## Purchase Quotation reference status — explicit-authorisation exception

The original scope designated Purchase Quotation (Page 710) as read-only. The user subsequently gave explicit authorization for two specific defects, so the audit record must not claim it remained untouched:

- The false quotation calculation verifier failure for valid primary-UOM rows was corrected; the verifier now runs only for `SAVE`/`CREATE` and handles the secondary-UOM check only where that UOM is applicable.
- The FD dialog Back behavior was corrected in the shared dialog guard so Back closes the modal instead of navigating from the quotation to the register.

No business document was created or altered during verification. No tax formula, workflow, layout, or numbering behavior was changed.

Live document `57011677` (`IMPL/QT/26-27/0005`) is internally consistent:

| Detail SNO | Amount | FD amount | Total | FD rows |
| ---: | ---: | ---: | ---: | --- |
| 57011678 | 34,500 | 6,210 | 40,710 | SGST 9% = 3,105; CGST 9% = 3,105 |
| 57011679 | 56,000 | 10,080 | 66,080 | SGST 9% = 5,040; CGST 9% = 5,040 |

Header values equal the stored line aggregates: `90,500 + 16,290 = 106,790`.

The remaining live reference risk is `P710_PREPARE_FD`, which deletes/rebuilds quotation-footer rows and explicitly commits during the AJAX request. A footer action can therefore persist derived data outside the final document Save boundary. It requires a tested non-persisting-preview redesign; it was not removed blindly.

## Confirmed O2C calculation family

The following active live pages share the same confirmed defect pattern:

| Page | Form | Detail/footer tables | Confirmed active pattern | Server calculation guard |
| ---: | --- | --- | --- | --- |
| 148 | PO Amendment | `POAMENDMENTDETAIL`, `POAMENDMENTDETAILFOOTER` | `set amounts` on `focusout`; delete/reinsert footer; explicit commit; dependent-grid refresh; delayed summary | None |
| 171 | Sales Order | `SALESORDERDETAIL`, `SALESORDERDETAILFOOTER` | Same | None |
| 702 | Sales Enquiry | `SALESENQUIRYDETAIL`, `SALESENQUIRYDETAILFOOTER` | Same | None |
| 705 | Sales Quotation | `SALESQUOTATIONDETAIL`, `SALESQUOTATIONDETAILFOOTER` | Same | None |
| 706 | Sales Enquiry | `SALESENQUIRYDETAIL`, `SALESENQUIRYDETAILFOOTER` | Same | None |

For these pages, the current calculation action takes quantity/rate/item/UOM/tax context from the Interactive Grid, calculates amount and footer values, writes footer rows directly, executes `COMMIT`, returns values to the browser, then refreshes the footer region. Separate JavaScript `setTimeout` summary handlers aggregate the grid later.

This creates three independently confirmed risks:

1. Blur/focus navigation can persist tax rows before a final Save request.
2. The refresh can replace unsaved Interactive Grid model state.
3. A delayed summary can use an earlier model state; no final server process rejects a mismatched line/footer/header.

The pages must be remediated individually or as a proven same-formula family, preserving their existing UOM, tax-rule, rounding and source-document rules. No bulk replacement has been made.

## Live risk coverage snapshot

| Page | Form | Focus-calculation events | Timers | DA commits | Named calculation guard |
| ---: | --- | ---: | ---: | ---: | --- |
| 118 | Purchase Order | 2 | 0 | 3 | Enabled |
| 140 | Payment Advice | 0 | 0 | 1 | None |
| 143 | Purchase Bill | 0 | 0 | 4 | Enabled |
| 146 | GRN | 0 | 0 | 3 | None |
| 148 | PO Amendment | 4 | 1 | 2 | None |
| 152 | Purchase Bill Pass | 1 | 0 | 1 | Enabled |
| 171 | Sales Order | 11 | 4 | 5 | None |
| 175 | CC Invoice | 13 | 5 | 8 | None |
| 191 | Bill Receipt | 2 | 0 | 1 | None |
| 274 | PO Receipt | 6 | 1 | 2 | None |
| 702 | Sales Enquiry | 6 | 2 | 2 | None |
| 705 | Sales Quotation | 6 | 1 | 2 | None |
| 706 | Sales Enquiry | 6 | 2 | 2 | None |
| 710 | Purchase Quotation | 0 | 0 | 2 | Enabled for Save/Create; explicit-authorisation exception |
| 712 | Comparative Statement | 0 | 0 | 2 | None |

This is an inventory signal, not a claim that every count is a defect. Each remaining form requires formula, trigger, process-order and runtime verification before changes are made.

## Added read-only evidence tools

- `app105-source/verify_quotation_57011677_readonly_20260927.sql`
- `app105-source/audit_live_target_risk_summary_20260927.sql`
- `app105-source/audit_live_transaction_form_integrity_20260927.sql`
- `app105-source/export_live_transaction_pages_20260927.sql`
