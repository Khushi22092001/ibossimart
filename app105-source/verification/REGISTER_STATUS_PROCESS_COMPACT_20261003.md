# Register status/process KPI and compact layout verification — 03 Oct 2026

## Requested result

- Document-status cards appear before process-progression cards.
- Process cards identify active documents that have not moved to the next business document.
- A register has one KPI panel only, laid out in a compact one- or two-row grid.
- The existing `Add New` button is placed beside `Filters` without cloning or changing its target/action.
- Register header and the gaps between header, KPI panel and report are reduced.
- No universal static CSS or JavaScript asset is changed by this deployment.

## Deployed scope

### Reusable report KPI engine

`IMART_REPORT_KPIS` now treats process progression as a separate `PROCESS` dimension. Its display order is:

1. Total
2. Native document statuses
3. Next-document process exception
4. Other contextual cards already supported by the report

The process exception is independent of the visible document-status label, so an `ACTIVE` card and a `... NOT CREATED` card can coexist in the same KPI panel.

### Procure-to-Pay next-document cards

| Page | Register | Process card |
|---:|---|---|
| 107 | Indent Register | `PO NOT CREATED` |
| 707 | Enquiry Register | `QUOTATION NOT CREATED` |
| 709 | Quotation Register | `CS NOT CREATED` |
| 711 | Comparative Statement Register | `PO NOT CREATED` |
| 713 | Rate Contract List | `PO NOT CREATED` |
| 68 | Material In Register | `GRN NOT CREATED` |
| 145 | GRN Register | `INSPECTION NOT CREATED`, `BILL NOT CREATED` |
| 142 | Purchase Bill Register | `BILL PASS NOT CREATED` |
| 151 | Purchase Bill Pass Register | settlement-progress cards |

Transaction process cards are restricted to active documents. Zero-count exception cards stay visible so “nothing pending” is explicit.

### Transaction status cards

Pages 68, 107, 117, 142, 145 and 151 show `Total`, `Active` and `Non Active` before their process cards. Existing process-completion cards remain in the same panel; no second KPI section is created.

## Page-scoped layout implementation

- `IMART_REGISTER_COMPACT_V1` was added to the page-level `WWV_FLOW_STEPS.INLINE_CSS` of 158 register/list pages.
- `IMART_REGISTER_ACTIONS_V1` was added to the page-level `WWV_FLOW_STEPS.JAVASCRIPT_CODE` of 115 pages that have an `Add New` button.
- The script moves the already-rendered button beside `Filters`; it does not clone the button or modify its URL/action.
- The KPI grid uses compact 165px cells, producing one or two rows at the normal desktop viewport.
- No shared static file, application-level CSS, application-level JavaScript, save process, validation, approval or transaction logic is changed by this deployment.

## Metadata verification

- Indent KPI shells after consolidation: `1`
- Pages carrying scoped compact CSS: `158`
- Pages carrying scoped button-placement JS: `115`
- Package compilation errors: `0`
- Page 707 generated count SQL parse after the zero-card ordering fix: `OK`
- Generated report/count SQL parsed successfully for the configured P2P registers.
- Transaction report wrappers parsed successfully for all six transaction KPI pages.

## Live Chrome verification

Authenticated application session was used after deployment.

### Indent Register — page 107

- One KPI panel only.
- First row: `Total`, `Active`, `Non Active`, `PO Not Created`, `Partially Ordered`, `Fully Ordered`.
- Second row: `Ordering Overdue`, `Deadline Missing`.
- `Active 7 + Non Active 4 = Total 11` at document grain.
- `Filters` and `Add New` are adjacent in the compact register header.
- Report begins directly below the KPI panel with the excess vertical gap removed.

### Enquiry Register — page 707

- One KPI panel.
- Final live order: `Total`, `ACTIVE`, `QUOTATION NOT CREATED`, `Last 7 days`, `Created by me`.
- Live values: `Total 7`, `ACTIVE 7`, `QUOTATION NOT CREATED 0`.
- `Filters` and `Add New` are adjacent.
- Compact header and reduced panel/report spacing are visible.

### GRN Register — page 145

- One KPI panel in two compact rows.
- Order verified: `Total`, `Active`, `Non Active`, `Inspection Not Created`, `Bill Not Created`, `Partially Billed`, `Bill Created`.
- Live values: `Total 1`, `Active 1`, `Non Active 0`, `Inspection Not Created 0`, `Bill Not Created 0`, `Bill Created 1`.
- `Filters` and `Add New` are adjacent.
- Report is loaded normally below the KPI panel.

## Count semantics

Transaction KPI totals count distinct business documents, while the interactive report can contain multiple detail rows for one document. This is intentional and is stated on the cards as “documents in this scope”; status totals reconcile at the same document grain.

## Recovery points

- `IMART_REG_STATUS_CFG_BAK_20261003`
- `IMART_REG_STATUS_CAT_BAK_20261003`
- `IMART_REG_TX_CFG_BAK_20261003`
- `IMART_REG_TX_CARD_BAK_20261003`
- `IMART_REG_PKG_BAK_20261003`
- `IMART_REG_UX_STEP_BAK_20261003`
