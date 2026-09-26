# Phase 2 Completion Report

Date: 26 September 2026

## Modules deployed

1. Comparative Statement — Page 712
2. Purchase Order — Page 118
3. Loading Advice — Page 155

## Improvements

### Comparative Statement

- Enquiry-related collection, detail insert, and item insert now start on an actual Enquiry change.
- Unchanged Tab/Shift+Tab no longer repeats these three server operations.

### Purchase Order

- Quantity/rate/discount/amount calculation runs only after an actual edited value.
- Server-returned calculated columns suppress recursive change chains.
- The fixed 400 ms footer/amount timer was removed; totals now update from the current grid model.
- Discount amount resets correctly when Discount % becomes zero.
- The detail-cell calculation no longer contains an explicit commit.
- Rate UOM is populated from Item Master when Item changes.
- Rate Contract detail insertion now also stores Item Master Primary Rate UOM.
- Explicit Secondary Rate UOM uses Quantity 2. Blank, Primary, or unknown Rate UOM uses Quantity 1.

### Loading Advice

- Pending quantity checks and primary/secondary conversion run only after an actual quantity edit.
- Calculated quantity returns suppress recursive change chains.
- Unchanged fast Tab/Shift+Tab does not rerun these quantity calls.

## Verification

- SQLcl import succeeded for all three pages.
- Fresh live exports were taken after deployment.
- Page 712 and Page 155 deployed/live export hashes match exactly.
- Page 118 semantic content matches; APEX only normalized one harmless `begin/end` block boundary on re-export.
- JavaScript syntax check passed for all three live page exports.
- Live APEX metadata check passed: 3/3 Comparative Statement enquiry triggers are `change`; all 7 selected Purchase Order calculation actions and all 7 Loading Advice quantity actions have the unchanged-cell guard.
- Item Master query confirmed Primary Rate UOM data is available; the deployed Rate Contract insert now calls `GetMeasuringUnitCodeFromItem` for every inserted item.
- Read-only live APEX metadata verification script: `../../verify_phase2_metadata.sql`.
- No business document was saved during verification.

## Backup and rollback

- Backup: `../../backups/phase2-cs-po-loading-before-20260926-172728/live-before/`
- Rollback script: `../../rollback_phase2_cs_po_loading_20260926.sql`

## UI verification note

The Chrome control service timed out repeatedly during the final interactive pass. Live metadata, source re-export, import result, and JavaScript syntax were verified. A final user-side hard-refresh smoke test with an unsaved row is recommended before normal entry resumes.
