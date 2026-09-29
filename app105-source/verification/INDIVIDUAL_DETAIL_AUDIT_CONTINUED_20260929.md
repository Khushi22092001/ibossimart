# Continued individual Detail-region audit — 29 September 2026

Status: **Partial verification; not an all-forms pass.**

Scope includes Detail tabs AND standalone lower Detail grids/regions, including modal forms. Empty registers were opened through Add New after explicit user authorization. No record Save/Create, Get Items, calculation, approval, import or deployment was performed during this audit. Temporary 960×900 viewport tests were reset afterward. Scroll tests used actual pointer drags, not injected CSS or programmatic scrollLeft assignments.

## Subsequent actual horizontal-drag checks

| Form | Observed movement / evidence | Qualification |
|---|---|---|
| Purchase Bill (143) | 210.4px | Corrected actual drag completed; prior pending result superseded |
| Sales Order (171) | 246.4px | 3 compact cards |
| Debit Note (159) | 341.6px | 5 compact cards; scroll success alone is not a summary-layout pass |
| CCInvoice (175) | 408px bar; header 397.6px | Header geometry has 10px smaller range |
| Requisition (130) | 294.4px | Blank Add New form |
| Issue (138) | 128px | Blank Add New form |
| Gate Pass (195) | 141.6px | 3 compact cards |
| Sales Quotation (705) | 602.4px | 4 compact cards |
| PO Receipt (274) | 758.4px; header at right edge | Corrected rightmost drag completed |
| Dispatch Advice (161) | 208.8px bar; header 198.4px | Native body/header geometry differs by 10px |
| Service Order (179) | 900px | 3 compact cards |
| Service Bill (213) | 214.4px | 5 compact cards |
| Service Bill Pass (221) | 257.6px | No Detail summary cards |
| Credit Note (166) | 225.6px | **Summary overlaps a second legacy lower scrollbar** |
| TDS Challan / Deductee Detail (418) | 455.2px | Main Detail separately observed fitting |
| Comparative Statement (712) | 2166.4px | Rightmost fields reached |
| Freight Advice (199) | 1380.8px | 10 compact cards; summary remains a right-side stack |
| Purchase Enquiry (708) | 328.8px at 960px width | Default desktop content fit; narrower actual drag tested |
| Loading Advice (155) | 265.6px bar; header 255.2px at 960px width | Default desktop content fit |
| Sales GRN (184) | 2220.8px | 3 compact cards |
| Advance Receipt (348) | 208px | Blank Add New form |
| Depreciation (677) | 786.4px | Blank Add New form |
| Stock Revaluation (244), standalone Detail | 396.8px at 960px width | No Detail tab required; actual lower-region drag verified |
| Item Master (59), standalone DETAIL | 260.8px | Existing native scrollbar works; **purple Total line remains** |
| Reverse Charge (208) | 270.4px | Header at right edge |
| Reimbursement Claim (660) | 654.4px | Header at right edge; no business submission |
| Asset (675), Aquisition embedded grid | 21.6px | Non-Detail-named tab containing Detail grids; other two visible grids fit |

Shared bars measured 10px container / 8px visible native thumb. Compact summary cards generally measured approximately 72.6px high. No whole-page horizontal overflow was observed in these checks. Different native header/body ranges are recorded as geometry differences, not automatically labelled synchronization failures.

## Rendered fit-content checks (not overflowing-content proof)

The actual following forms/regions were opened and their visible grid overflow range was zero: Issue Return (150; also tested at 960px), Stock Transfer (187; also 960px), Bill Receipt (191), Sales Enquiry (702), Import (317), Process Routing (716), Process TAT (718), Salary (641), Material Out (168), Opening Loan (694), Service Bill (305, distinct from 213), Asset Discard (672), Schedule (415), Stock Taking (246; also 960px), Item Specification (13), Item Characteristics modal (53), Module Location modal (77), Cheque Receipt (301), Cheque Book Issue (303), RTGS Letter (242), and Tax Rule (177: Tax Rule Detail, HSN Detail, SAC Detail on an existing record).

Do not describe these as successful overflow-drag tests: fit-content rendering was observed, not artificially widened. Blank grids may differ when records or conditional columns are populated.

Additional standalone/modal and differently named Detail regions individually opened: Group Of Party modal (97), TDS Tax Category (32), Module Doctype modal (75), BOSS User (81), Kitting Unkitting (181: Raw Stock and Stock Finished), Employee Salary (622), Attendance (632), Salary Payment Advice (684), Salary Voucher (682), Loan Request (636), Loan Sanction (639), Loan Relaxation (346), Reimbursement Policy (649), On Duty Request (652), OD Special Approval (658), Full and Final (696: Item Details and Loan Detail), Asset Transfer (692), Asset Sale (670), Asset Category Depreciation Rate (679), Voucher (156: two visible lower grids), and Challan (312: Detail and Challan Account Detail). These rendered grids had zero horizontal overflow at the tested default viewport.

Leave Request's Add New opened **Leave Master**, with no IG in the observed modal. ESI Challan (420) similarly had no visible IG. These observations are not proof of their conditional/related grids rendering later. The HR navigation link labelled Employee Master led to **Designation List**, so it was not counted as Employee Master verification.

## Outstanding exceptions / unfinished coverage

1. **Material In (69):** local CSS hides the shared native thumb (`height:0`); its existing thicker custom bar works. Still not a consistent thin-bar pass.
2. **Purchase Bill Pass (152):** required native bar works and FD/final columns were reached, but a second legacy purple lower track remains.
3. **Credit Note (166):** screenshot shows Account Summary overlapping the original lower grid-scroll area; the slim working bar exists above it, leaving duplicate scroll chrome. No layout fix was made in this audit.
4. **Item Master (59):** actual native scrolling works, but shared-bar styling did not attach and the purple line next to Total remains.
5. **Payment Advice (140):** Payment Detail is ordinary form fields, not an IG. Payment Advice Reference on Add New exposes the IG shell and five summary cards, but no rendered grid scroll owner. Terms & Condition (173), standalone Detail, similarly exposed an uninitialized IG shell. Conditional/populated rendering still needs verification; do not mark passed.
6. **Debit Note (159):** saved actual screenshot shows both original grid bar and an additional lower bar. Scrolling works, but the duplicate-bar presentation is not a styling pass.
7. Further secondary regions/popups and populated-grid cases, remaining Setup/HR/master forms, report drilldowns and duplicate/related routes remain incomplete. The original 47-page common-tab metadata inventory does **not** cover every standalone Detail region in the application. Kitting Unkitting and Voucher lower grids were subsequently inspected (fit-content results above), superseding their earlier pending-open status.

Asset (675) has Asset/General/Description/Aquisition tabs, not a tab named Detail; the Aquisition subordinate grids were subsequently inspected and one actual bar drag passed. Profit And Loss (416) and Account Position in Trial Balance (413) are report/configuration surfaces; they are not automatically counted as verified business Detail forms.

## Evidence

- `continuation-detail-results-20260929.json`: before/after DOM measurements, including intermediate attempts and corrected final drags.
- `continuation-form-coverage-20260929.json`: inspected entry points and modal observations; an entry-point title is not proof of the form opening.
- `continuation-*.png`: per-check actual viewport captures.
- `audit-purchase-bill-confirmed-left.png` and `audit-purchase-bill-confirmed-right0.png`.
- `audit-sales-order-confirmed-right0.png`, `audit-debit-note-confirmed-right0.png`.
- `continuation-credit-note-new.png`: summary/native-bar overlap exception.
- `continuation-item-master-native-right.png`: actual native scroll with remaining Total styling exception.

No CSS/JS changes were imported or deployed during these verification checks. Existing functionality was not exercised by record mutations.
