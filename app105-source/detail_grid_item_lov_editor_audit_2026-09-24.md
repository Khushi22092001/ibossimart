# Detail Grid Item Popup LOV Audit — 2026-09-24

Scope: Procure-to-Pay (Material Management), Order-to-Cash, and master forms.
Method: live visual comparison of Sales Order and Purchase Enquiry, followed by
read-only APEX metadata inventory. No form configuration was changed by this
audit.

## Confirmed reason on Purchase Enquiry

`Purchase Enquiry` page 708, `Item Detail` / `ITEMCODE`, is a native APEX
Popup LOV. The visible selected value (for example, **HR COIL**) is an APEX
read-only display/search control, not a free-text field:

- its input has `readonly` and `role="combobox"`;
- the chevron opens the LOV picker;
- the black `×` belongs to APEX's **floating overflow cell editor** wrapper.

Sales Order page 171 uses the same native Popup LOV, but it is rendered inline
inside the grid cell. Its `ITEMCODE` column has explicit `HTML DOM ID` and
static ID `ITEMCODE`; Purchase Enquiry's equivalent values are blank. Both grids
have fixed row height enabled. This is the configuration difference that
correlates with P708's floating wrapper; a blank DOM ID is a review signal, not
stand-alone proof that every listed page is broken.

## Visual result

| Form | Detail region | Result |
|---|---|---|
| Sales Order (P171) | Detail | Baseline: native Popup LOV renders inline in the cell. |
| Purchase Enquiry (P708) | Item Detail | Confirmed: native Popup LOV renders in a floating overflow wrapper; black `×` is visible. |

## P2P / O2C review queue

These are the seven entry forms in the requested module catalogue that have an
editable fixed-height `ITEMCODE` Popup LOV with blank `HTML DOM ID`, matching
the P708 configuration signature. They need a real row opened in edit mode for
final visual pass before any bulk change.

| Module | Page | Form | Detail region |
|---|---:|---|---|
| Material In | 69 | Material In | Detail |
| PO Amendment | 148 | PO Amendment | Detail |
| Loading Advice | 155 | Loading Advice | Detail |
| Despatch Advice | 161 | Despatch Advice | Item Detail |
| Purchase Enquiry | 708 | Purchase Enquiry | Item Detail — **confirmed issue** |
| Purchase Quotation | 710 | Purchase Quotation | Quotation Detail |
| PO Receipt | 274 | PO Receipt | Detail |

## Baseline forms in requested scope

These matching Item Popup LOV editors already have an explicit DOM/static ID,
like Sales Order: Indent (108), Purchase Order (118), Purchase Bill (143), GRN
(146), Purchase Bill Pass (152), Sales Order (171), Sales Enquiry (702/706),
Sales Quotation (705), and Rate Contract (714).

## Master-form result

No master form has an editable Detail Grid `ITEMCODE` Popup LOV with this blank
DOM-ID signature. Item Master (P59) does contain several Popup LOVs for item
characteristics (Length, Width, Thickness, Grade, Make), but they are not the
Item-code editor pattern reported here.

## Full-app guardrail list

Outside the requested P2P/O2C forms, the same metadata signature appears on
Issue (138), Issue Return Master (150), Debit Note (159), Material Out (168),
Service Order (179), Kitting/Unkitting (181), Sales GRN (184, two regions),
GRN (189), Gate Pass (195), BOM (202), Reverse Charge (208), Service Bill
(213), Service Bill Pass (221), MRN (223), Agent Commission Rate (215), Sale
Incentive Rate (217), HAR Sale Incentive Rate (218), User Privilege Item (238),
and Stock Taking (246). They are retained as a separate future visual-review
queue; no conclusion about their rendering is made from metadata alone.

## Audit evidence

- Read-only inventory: `audit_item_lov_grid_editors.sql`
- Requested-module candidate query: `audit_item_lov_editor_candidates.sql`
- P708's obsolete forced-scroll CSS block was removed earlier as a page-only
  cleanup; live retest showed that it was not the complete cause of the
  floating editor. It is not presented as the fix for this issue.
