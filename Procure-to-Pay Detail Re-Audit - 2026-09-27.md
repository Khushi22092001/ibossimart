# Procure-to-Pay Detail Re-Audit

Date: 27 September 2026  
Mode: Read-only audit; no APEX page, process, database record or Purchase Quotation component changed.

## Overall conclusion

Current client-side detail calculation flow is materially safer: audited calculation actions wait for their result, stop on error, contain no cell-level COMMIT and use no fixed calculation timer. Detail calculation events are value-change based rather than cursor/focus based.

However, zero-risk status cannot yet be claimed because final server calculation guards exist only on Purchase Order, Purchase Bill and Purchase Bill Pass. Indent, GRN and Payment Advice still depend mainly on client-side calculation during entry. Stored current-financial-year mismatches also exist in Indent and GRN and require business review before any correction.

## Cross-form checks

| Check | Result |
| --- | --- |
| Async calculation without wait | 0 |
| Calculation action not stopping on error | 0 |
| Cell-level COMMIT in audited calculation actions | 0 |
| Fixed setTimeout calculation timer | 0 |
| Visible TNO/SNO technical columns | 0 |
| Duplicate or null TNO/SNO keys in audited main detail tables | 0 |
| FD clicked-row handler and TNO/SNO filter | Correct on PO, PB and PB Pass |
| Purchase Quotation changed | No |

Three focusout events remain, but they are not normal detail amount recalculations:

- Purchase Order: PO advance amount validation.
- Purchase Order: discount-rate read-only UI handling.
- Purchase Bill Pass: purchase-bill reference/currency lookup.

## Form-wise result

### Indent

- Detail calculations run on actual value change; no async/timer/commit race found.
- TNO/SNO are not visible and stored row keys are complete/unique.
- No final server-side calculation guard exists.
- 149 of 1,970 stored current-FY rows do not match either `Indent Quantity × Rate` or `Sanction Quantity × Rate`. Mismatch dates range from 22-Apr-2026 to 01-Sep-2026.
- Status: client flow clean; stored data review and save guard still recommended.

### Purchase Enquiry

- No rate/amount/footer calculation chain found in the main detail flow.
- Enquiry Item Detail has 6 rows; no null or duplicate TNO/SNO keys.
- Status: no matching calculation-race defect found.

### Comparative Statement

- No active detail amount/footer calculation event chain found.
- Comparative Statement Detail currently has no stored rows.
- Status: no matching calculation-race defect found; limited stored-data coverage.

### Purchase Order

- Calculation events wait and stop on error; no timer or cell COMMIT found.
- FD uses the clicked row and Footer Detail is filtered by TNO/SNO.
- Save guard runs after detail/footer processing at sequence 165.
- Historical audit still contains 2 rate-after-discount, 1 rate, 1 amount and 146 footer mismatches; these were not modified.
- Status: new/edit save path protected; historical records need separate review.

### Loading Advice

- Quantity calculations are change-based; no calculation race flags found.
- 2,673 stored detail rows have complete and unique TNO/SNO keys.
- No financial amount chain; no calculation save guard.
- Status: no current client calculation-race defect found.

### Material In

- Quantity/unit calculations are change-based; no calculation race flags found.
- 109 stored detail rows have complete and unique TNO/SNO keys.
- No financial amount chain; no calculation save guard.
- Status: no current client calculation-race defect found.

### GRN

- Quantity and amount calculations are change-based; no async/timer/commit race found.
- 2,322 stored rows have complete and unique TNO/SNO keys.
- No final server calculation guard exists.
- 5 current-FY stored rows do not match either `Received Quantity × Rate` or `Accepted Quantity × Rate`. Mismatch dates range from 29-Apr-2026 to 01-Jul-2026.
- Status: client flow clean; five stored rows and a save guard need review.

### Purchase Bill

- Calculation flow has wait/error protection, no cell COMMIT or fixed timer.
- FD clicked-row handler and TNO/SNO filter are present.
- Server reconciliation and final calculation guard are present.
- Historical audit contains 1 amount, 2 footer and 8 total mismatches; these were not modified.
- Status: new/edit save path protected; historical records need separate review.

### Purchase Bill Pass

- Calculation flow has wait/error protection, no cell COMMIT or fixed timer.
- FD clicked-row handler and TNO/SNO filter are present.
- Final server calculation guard is present.
- Historical audit contains 31 footer and 14 total mismatches; these were not modified.
- Status: new/edit save path protected for line/footer totals; historical records need review.

### Payment Advice

- Detail amount calculations are change-based; no async/timer/commit race found.
- All 771 stored reference rows have `Amount = Amount Entered` and unique/non-null keys.
- No final server calculation guard exists for header/detail/net/TDS reconciliation.
- Status: current stored base amount is consistent; server save validation remains a gap.

## Recommended next phase — not applied

1. Review the 149 Indent and 5 GRN mismatches against the intended business formula; do not auto-correct historical data.
2. Add server-side save reconciliation to Indent, GRN and Payment Advice after formula confirmation.
3. Consider quantity-integrity validations for Loading Advice and Material In if over-receipt/over-loading must be blocked at database save time.
4. Perform browser acceptance tests with representative new and edit transactions. The Windows browser automation helper timed out after recovery attempts, so no live record was edited or saved during this audit.

