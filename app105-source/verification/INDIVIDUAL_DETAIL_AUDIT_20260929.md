# Individual Detail-tab audit — 29 September 2026

Status: **Incomplete. Do not describe all forms as verified.**

Latest continuation: browser access was restored. Empty registers were opened through Add New with user authorization; no records were saved. The initial findings below are historical. See [continued audit](INDIVIDUAL_DETAIL_AUDIT_CONTINUED_20260929.md) for subsequent successful checks and remaining exceptions. Standalone lower Detail regions, not only tabs, are included.

This is a read-only live-browser audit. No application import, deployment, business record creation, Save, Get Items, calculation or business-logic change was performed. Existing records were opened through register links. A Sales Order register Company/date filter was changed to find an existing record; this is a query filter, not an order edit.

## Rendered form checks

| Page | Form / tab | Actual horizontal movement | Compact summary cards | Result |
|---|---|---|---|---|
| 118 | Purchase Order / Detail | Native slim bar dragged; subsequent keyboard check reached 993.6px. Body, header and Total synchronized; rightmost Remark visible. | 3 cards, height 72.6px, no input clipping | Verified |
| 108 | Indent / Item Detail | Native bar dragged to 809.6px | No Detail summary fields | Verified |
| 710 | Purchase Quotation / Quotation Detail | Native bar dragged to 1025.6px | 3 cards, height 72.6px | Verified |
| 714 | Rate Contract / Detail | Native bar dragged to 184.8px; FD, Footer Amount, Total Amount and Remark accessible | 3 cards, height 72.6px; existing vertical arrangement retained | Verified; not the same underlying arrangement as PO |
| 148 | PO Amendment / Detail | Native bar dragged to 149.6px | No Detail summary fields | Verified |
| 146 | GRN / GrnDetail | Native bar dragged to 896px | No Detail summary fields | Verified |
| 152 | Purchase Bill Pass / Detail | Native bar dragged to 608px; FD and final fields accessible. Header/body synchronized; outer Total dock 606.4px because of its border/client geometry. | Other Details is on the General tab, not under Detail; no Detail cards applicable | Verified scroll; an additional legacy purple bottom track remains visible |
| 69 | Material In / Detail | Shared bar did NOT respond to drag. Existing custom bar dragged successfully to 758.4px. | No Detail summary fields | **Styling exception:** local CSS sets the shared `::-webkit-scrollbar` height to 0px; custom bar is still thicker |
| 708 | Purchase Enquiry / Item Detail | Rendered grid had 0 horizontal overflow at this view, so no bar shown | No Detail summary fields | Fit-content rendering observed; overflowing-content test not established |
| 155 | Loading Advice / Detail | Rendered grid had 0 horizontal overflow at this view | No Detail summary fields | Fit-content rendering observed; overflowing-content test not established |
| 143 | Purchase Bill / Detail | Bar and overflow observed; the early input test did not move it. Corrected drag test was not completed before disconnection. | 5 cards rendered at 72.6px; values/readonly state observed unchanged | **Pending actual scroll verification in this audit** |
| 140 | Payment Advice / Payment Detail | No visible IG/bar in the selected tab on the opened record | No cards observed | **Pending custom/conditional region inspection** |

All successfully scrolled pages had no whole-browser horizontal overflow. The raw log retains preliminary unsuccessful input attempts; the successful repeated tests above are the final per-form results, not those preliminary attempts.

## Remaining rendered tests

The following entry points were individually inspected but initially exposed no existing Edit link under their current register filters: Comparative Statement, Freight Advice, Sales Enquiry, Sales Quotation, PO Receipt, Sales Order, Dispatch Advice, CCInvoice, Freight Advice Outward, Bill Receipt, Service Order, Service Bill Receipt, Service Bill Receipt Pass, Gate Pass, Issue, Issue Return, Requisition, Stock Revaluation, Stock Taking, Stock Transfer and Kitting Unkitting.

These are **not verified Detail tabs** and should not be marked passed. Voucher Posting did expose an uppercase EDIT link through a different link pattern and still needs its form opened.

Sales Order's read-only Company filter was initially empty. Selecting IRONMART PRIVATE LIMITED and broadening From Date to 01-04-2026 produced 100 displayed record links (10,475 filtered rows). Thus “no Edit link initially” is a filter/navigation limitation, **not proof that the database has no records**. Browser connection disconnected while trying to open a populated Sales Order. Further browser actions, including rebinding that same tab, failed because the debugger was unattached. The remaining tests require restoring the browser connection.

## Inventory scope (metadata, not UI proof)

Live APEX metadata identified 47 pages with the common `tabcontainer` plus an Interactive Grid. Several are reports, related pages or inactive/duplicate routes rather than ordinary Detail forms. The broader inventory also includes non-common Detail structures such as Indent and Purchase Enquiry.

Common-page IDs: 69, 118, 130, 138, 140, 143, 146, 148, 152, 155, 159, 161, 166, 168, 171, 175, 179, 184, 191, 195, 199, 213, 221, 274, 305, 317, 348, 353, 354, 413, 415, 416, 418, 641, 672, 675, 677, 694, 702, 703, 705, 706, 710, 712, 714, 716, 718.

No rendered check was completed for the remaining Finance, Asset, HR, Setup, related/duplicate pages or inaccessible routes. Future forms cannot be individually UI-tested before they exist.

## Evidence

- `audit-118-purchase-order-left.png`
- `audit-indent-item-detail-right0.png`
- `audit-purchase-quotation-quotation-detail-right0.png`
- `audit-po-amendment-detail-right0.png`
- `audit-grn-grndetail-right0.png`
- `audit-152-purchase-bill-pass-right0.png`
- `audit-rate-contract-detail-right0.png`
- `audit-material-in-custom-right.png`
- `individual-detail-live-results-20260929.json` — raw DOM metrics, URLs and intermediate attempts
- `detail-form-inventory-20260929.txt` — read-only metadata inventory

The Computer Use skill limited inspection and input to the browser UI/read-only DOM. No injected styles or programmatic scrollLeft assignment was used to manufacture a passing result.
