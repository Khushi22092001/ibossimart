# Downstream Detail Calculation Audit — 2026-09-27

## Scope

- Material In — Page 69
- Purchase Order — Page 118
- Payment Advice — Page 140
- Purchase Bill — Page 143
- GRN — Page 146
- Purchase Bill Pass — Page 152
- Loading Advice — Page 155
- Sales Order — Page 171
- CC Invoice — Page 175
- Bill Receipt — Pages 190 and 191
- PO Receipt — Page 274
- Purchase Quotation — Page 710, verification reference only

## Changes deployed

- Replaced active focus-in/focus-out calculation and data-population events with actual value-change events.
- Disabled custom focus-navigation Dynamic Actions that moved the cursor/page on Tab; native tab order now remains authoritative.
- Removed detail-calculation AJAX commits and fixed-delay calculation wrappers from the affected calculation chains.
- Disabled duplicate region-focus and selection-change recalculation handlers.
- Added held-Tab protection to forms that did not already have it.
- Added exact clicked-row FD opening for Purchase Order, Sales Order, CC Invoice, and PO Receipt.
- FD regions are refreshed with the clicked row's `TNO + SNO`; stale FD grid content is hidden until refresh completes.
- Existing Purchase Bill and Purchase Bill Pass clicked-row FD routing was retained and audited.
- Existing Get Record/Get Item database sources retain all stored detail, rate, amount, HSN/UOM, and footer values; dependent recalculation now occurs on actual edits instead of cursor movement.

## Audit results

- All listed live-after pages: `0` active `focusin`/`focusout` Dynamic Actions.
- FD source filters verified:
  - Page 118: `P118_TNO + P118_SNO`
  - Page 171: `P171_TNO + P171_SNO`
  - Page 175: `P175_TNO + P175_SNO`
  - Page 274: `P274_TNO + P274_SNO`
- Page 190 contains no applicable detail calculation chain and was left unchanged.
- All page imports completed with SQLcl exit code `0`.
- A fresh live-after export completed for every audited page.
- Purchase Quotation Page 710 was not imported or edited; its live-before and live-after SHA-256 hashes are identical.

## Artifacts

- Pre-change backups: `app105-source/backups/downstream-calc-before-20260927-200500/live-before`
- Deployment sources: `app105-source/deployments/downstream-calc-20260927-200500/staged`
- Post-deployment live exports: `app105-source/deployments/downstream-calc-20260927-200500/live-after`
- Reproducible builder: `app105-source/deployments/downstream-calc-20260927-200500/build-downstream-fixes.js`

## Remaining manual check

Automated browser smoke testing could not run because the Windows computer-use helper timed out on state capture three times. No interactive UI pass is claimed. The deployed metadata/import/re-export checks above completed successfully.
