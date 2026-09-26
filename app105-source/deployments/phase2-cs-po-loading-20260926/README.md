# Phase 2: Comparative Statement, Purchase Order, Loading Advice

Live baseline backup: `../../backups/phase2-cs-po-loading-before-20260926-172728/live-before/`

## Scope

- Comparative Statement (Page 712): enquiry-driven collection/detail/item work runs only when the selected enquiry actually changes, not on unchanged Tab/Shift+Tab.
- Purchase Order (Page 118): unchanged-cell guard, calculation outputs suppress recursive change events, immediate model-based totals (no fixed 400 ms delay), discount reset when percentage becomes zero, and no explicit commit inside the detail-cell calculation.
- Purchase Order amount rule: explicit Secondary Rate Unit uses Quantity 2; blank, Primary, or unknown Rate Unit safely uses Quantity 1.
- Loading Advice (Page 155): pending-quantity and quantity-conversion actions run only when quantity is actually edited; calculated outputs do not recursively fire change chains.

No save workflow, approval workflow, reference balance formula, tax formula, or database schema was changed.

## Scripts

- Deploy: `../../deploy_phase2_cs_po_loading_20260926.sql`
- Rollback: `../../rollback_phase2_cs_po_loading_20260926.sql`
