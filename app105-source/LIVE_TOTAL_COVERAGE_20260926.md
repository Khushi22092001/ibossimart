# Live Total Coverage Audit — 26 September 2026

## Root cause fixed

The shared Total strip was cloning the hidden APEX aggregate row. Quantity cells
were blank wherever the current IG report did not define a SUM aggregate, and
some forms had no aggregate row at all. The strip now reads additive values from
the live Interactive Grid model and recalculates after row edits/additions.

Only visible fields ending in `QUANTITY`, `QTY`, or `AMOUNT` are additive.
Rates, percentages, serial numbers, TNOs and other non-additive fields are not
summed. Existing calculated Summary values remain authoritative.

## Forms covered

### Procure to Pay

- 108 — Indent
- 118 — Purchase Order
- 140 — Payment Advice
- 143 — Purchase Bill (existing page-specific financial total retained)
- 146 — GRN
- 152 — Purchase Bill Pass
- 155 — Loading Advice
- 199 — Freight Advice
- 708 — Purchase Enquiry
- 710 — Purchase Quotation
- 712 — Comparative Statement
- 714 — Rate Contract

### Materials and Inventory

- 69 — Material In
- 130 — Requisition Master
- 138 — Issue
- 150 — Issue Return Master
- 161 — Despatch Advice
- 168 — Material Out
- 187 — Stock Transfer
- 189 — GRN
- 195 — Gate Pass
- 197 — Production
- 274 — PO Receipt

### Sales and Commercial

- 159 — Debit Note
- 166 — Credit Note
- 171 — Sales Order
- 175 — CCInvoice
- 179 — Service Order
- 184 — Sales GRN
- 191 — Bill Receipt
- 213 — Service Bill
- 221 — Service Bill Pass
- 305 — Service Bill
- 312 — Challan
- 348 — Advance Receipt
- 383 — Proforma Invoice
- 702 — Sales Enquiry
- 705 — Sales Quotation
- 706 — Sales Enquiry

### Finance, Payroll and Assets

- 156 — Voucher
- 334 — PF Challan
- 346 — Employee Loan Relaxation
- 418 — TDS Challan
- 630 — Loan Request
- 636 — Loan Request
- 639 — Loan Sanction
- 641 — Salary
- 670 — Asset Sale
- 672 — Asset Discard
- 675 — Asset
- 677 — Depreciation
- 684 — Salary Payment Advice
- 692 — Asset Transfer
- 694 — Opening Loan
- 696 — Full and Final

Master/configuration grids without transactional additive detail were excluded.
