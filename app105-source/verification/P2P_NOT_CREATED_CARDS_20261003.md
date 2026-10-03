# Procure-to-Pay process cards — 03 Oct 2026

## Implemented scope

The next-document exception cards are now integrated into the same KPI panel as the native document-status cards. Document status is displayed first; the process exception follows it.

| Page | Register | Card | Link used |
|---:|---|---|---|
| 107 | Indent Register | `PO NOT CREATED` | Indent/Purchase Order linkage at document grain |
| 707 | Enquiry Register | `QUOTATION NOT CREATED` | Enquiry report's verified quotation state/link |
| 709 | Quotation Register | `CS NOT CREATED` | `ComparativeStatementDetail.QuotationTNo` |
| 711 | Comparative Statement Register | `PO NOT CREATED` | `PurchaseOrder.ComparativeStatementTNo` |
| 713 | Rate Contract List | `PO NOT CREATED` | `PurchaseOrder.RateContractTNo` |

Each card counts the same row grain as its visible native report and applies the report's current filters. A zero count remains visible so the absence of pending work is explicit.

## Extended verified flow

The verified transaction KPI flow also includes `GRN NOT CREATED`, `INSPECTION NOT CREATED`, `BILL NOT CREATED` and `BILL PASS NOT CREATED` on their corresponding registers. Each exception is gated to active documents and uses the existing transaction linkage; no unverified process relationship was invented.

## Deployment verification

- All five target APEX regions have a KPI shell.
- All five status-catalog entries match their configured status expression.
- Both generated report SQL and count SQL parsed successfully for all five pages.
- `IMART_REPORT_KPIS` package errors: `0`.
- The earlier `PO CREATED` catalog state on Comparative Statement was removed.
- Indent's duplicate coverage section was removed; page 107 has one KPI shell.
- No transaction, save, validation, approval or drill-down logic was changed.

## Recovery points

- `IMART_P2P_NOTCREATED_CFG_BAK`
- `IMART_P2P_NOTCREATED_REG_BAK`
- `IMART_P2P_NOTCREATED_STATUS_BAK`
- Existing region backup table `IMART_RKPI_BAK_20261003`

## Browser verification

Live authenticated Chrome verification completed for Indent, Enquiry and GRN registers. Status cards appear before process cards, the panel stays within one or two rows, and `Add New` is adjacent to `Filters`.
