# Purchase Quotation Detail CRUD Audit

Date: 26-09-2026  
Module: Purchase Quotation (Page 710)  
Scope: Detail line Create, Read, Update, Delete, calculation, FD/GST, fast Tab/Shift+Tab, network failure and save safety.

## Main problems found

1. One detail change was starting several old Dynamic Actions. Some were based on focus-in/focus-out, so calculation ran even when the value had not changed.
2. The server response was returning editable fields such as Rate and Quantity. A slow old response could therefore replace a newer manually entered value with blank, zero or an older value.
3. Amount, GST/FD, Other Amount and Total were not one reliable calculation chain. Some values were calculated in the row, while footer values were calculated separately and often only became visible after opening the FD tab.
4. Rate After Discount had been made Display Only. In an Interactive Grid, the old server action could no longer return its value reliably, so Rate and Amount could remain zero.
5. Automatic previous-purchase Rate and manually entered Rate were interfering. There was no clear rule about which value wins.
6. Footer rows were written before the main document save. Existing Delete logic removed the detail row but did not remove its Footer and Quality child rows. This caused orphan footer data.
7. There was no guard to stop Save while tax/footer calculation was pending or had failed because of a network/server error.
8. The FD modal did not always refresh when it was opened, so it could show stale tax values.

## Fix implemented

1. Row amount is now calculated immediately in the browser when Item, Specification, Quantity, Rate, Without Discount Rate, Discount % or Rate Measuring Unit actually changes.
2. Merely moving with Tab/Shift+Tab does not calculate anything when the value is unchanged. Old focus-based calculation actions are disabled.
3. Every detail row now has its own 180 ms calculation queue and revision number. Rapid changes replace the older queued request. A late response is ignored unless it belongs to the latest row revision.
4. Editable Quantity/Rate values are never replaced by a server calculation response.
5. Rate rule is now clear:
   - When Without Discount Rate or Discount % changes, Rate After Discount is calculated and becomes the effective Rate.
   - When the user directly changes Rate, that manual Rate is retained.
6. Rate After Discount is a Number Field that can receive calculated values, but it is read-only and has `tabindex=-1`, so the cursor does not stop there.
7. Rate Measuring Unit comes from Item Master. If it is blank, Primary Unit is used. An explicit Secondary Unit continues to use Secondary Quantity.
8. The server recalculates Quantity 2, HSN, tax/FD, Other Amount and Total from the latest row values. The FD region refreshes automatically after a successful calculation.
9. A hidden calculation status is maintained. Save is blocked when any row calculation is pending or failed; typed values remain on screen so the user can retry instead of saving partial/wrong data.
10. Deleting a detail line now also deletes its matching Footer and Quality child rows. Deleting the whole quotation cleans child rows before detail rows.
11. If a row is deleted while its calculation is pending, its timer/status is removed so the form does not remain stuck in Pending state.
12. Existing Enquiry-sourced rows retain the earlier source lock: their Item and Specification cannot be replaced, while an extra manually added row remains editable.

## Verification completed

- Fresh live Page 710 backup taken before this audit/fix.
- Page imported successfully into live APEX application 105.
- Live page re-exported after deployment.
- Both deployment and live-export JavaScript passed syntax validation (14,202 characters checked).
- Live metadata confirms one AJAX calculation process, one Save guard, calculation-status item, and Item Master unit fields.
- Focus-in/focus-out amount/footer/HSN/UOM actions are disabled. Only the actual Footer field `change` calculation remains active.
- Rate After Discount is confirmed as read-only Number Field and skipped by Tab.
- Current database check: 29 detail rows, 0 Total Amount mismatches, and 0 rows with Rate present but Amount blank.
- The deployed tax query executed successfully and matched 4 current tax lines.

## Existing old data found (not changed)

- 11 historical orphan footer rows exist.
- 2 historical detail rows have Footer Amount different from their footer-line sum.

These old business records were deliberately not deleted or rewritten during the code fix. They should be reviewed with the document numbers before a separate data-cleanup script is approved.

## Browser QA status

The authenticated session supplied earlier had expired and redirected to Login. The Chrome-control extension also timed out, so a final authenticated click-through test could not be completed from this task. Deployment, live re-export, JavaScript syntax, metadata, tax-query and database-integrity checks were completed. A fresh authenticated browser session should still be used for the final user-flow test: manual Rate, Discount %, fast Tab/Shift+Tab, FD auto-refresh, network interruption, Save guard, add row and delete row.

## Backup and rollback

- Backup: `app105-source/backups/quotation-full-audit-before-20260926-191250/live-before/f105_page_710.sql`
- Rollback script: `app105-source/rollback_quotation_detail_crud_integrity_20260926.sql`
- Deployment script: `app105-source/deploy_quotation_detail_crud_integrity_20260926.sql`
- Verification script: `app105-source/verify_quotation_detail_crud_integrity_20260926.sql`

## FD fast-Tab follow-up

Reported symptom: while tabbing quickly inside the FD grid, Footer Value or the FD display could become blank when the cursor moved to the next row.

Root causes confirmed:

1. Completion of the main detail-row calculation was force-refreshing the FD grid even when its editor had focus or had unsaved model changes.
2. The FD server action returned `FOOTERVALUE` but did not submit its existing value. If a formula branch did not assign a new value, null was returned and the cell became blank.
3. The FD change action needed an explicit actual-edit guard because Interactive Grid editor activation/deactivation can produce field events during fast navigation.

Fix deployed:

- FD grid is refreshed only when focus is outside it and its model has no unsaved changes.
- Existing `FOOTERVALUE` is submitted to the calculation and preserved as a non-null fallback.
- FD calculation runs only when the focused Footer Percent or Legend value was actually edited.
- Footer Value is now derived, read-only and skipped by Tab.
- Fresh pre-fix backup: `app105-source/backups/quotation-fd-fast-tab-before-20260926-195237/live-before/f105_page_710.sql`.
- Live re-export and JavaScript syntax verification completed successfully (14,388 characters checked).

## FD popup blank tax follow-up

Reported symptom: the main quotation row showed Amount `32000.00`, Other/Tax `5760.00` and Total `37760.00`, but clicking FD opened a blank DetailFooter row.

Database evidence confirmed that calculation and storage were already correct for the clicked detail line:

- Detail SNO: `56984474`
- Footer Head Code: `.IGST.`
- Legend Code: `PAA`
- Footer Percent: `18`
- Footer Value: `5760`

Root cause: the FD button only opened and refreshed the modal. It did not pass the clicked detail row's SNO. `P710_SNO` depended on an Interactive Grid selection-change action, so a fast click or stale selection refreshed the modal with the wrong row context and displayed a blank tax row even though the correct tax existed in the database.

Fix deployed:

- Every FD button now passes its own detail `SNO` and current `Amount` before opening the popup.
- The modal refresh starts only after those page items are set.
- The fix applies per clicked row and no longer depends on the last selected Interactive Grid row.
- Fresh pre-fix backup: `app105-source/backups/quotation-fd-context-before-20260926-201832/live-before/f105_page_710.sql`.
- Live page was re-exported after deployment. The row-specific handler/link are present and JavaScript syntax verification passed (14,694 characters checked).

Expected result for the reported row after a hard refresh: FD must show `.IGST.`, `PAA`, `18` and `5760`, matching Other Amount and Total Amount on the main detail row.

## Multi-row FD key mismatch follow-up

Reported symptom: the first detail line opened the correct FD tax, but the second line displayed Other Amount `27000` and still opened a blank FD popup.

Confirmed evidence for quotation TNO `57011212`:

- First detail SNO `57011213` had two correct footer rows: SGST `2700` and CGST `2700`.
- Second detail SNO `57011214` had no footer rows, although its visible Other Amount was `27000`.
- The second line's tax had been written under non-detail SNO `57011220`: SGST `13500` and CGST `13500`.
- There is no trigger or column default on `QUOTATIONDETAILFOOTER` changing the SNO. The wrong key came from the client/server row-context chain.

Fix deployed:

- The FD link now passes only the clicked row SNO. The handler locates that exact record in the live Interactive Grid model and reads its current Amount and Specification; it no longer uses stale link-time Amount substitution.
- A new `P710_PREPARE_FD` process validates that the clicked `(TNO,SNO)` exists before opening the popup.
- If footer rows for the exact clicked SNO already match the expected tax count and amount, no database write or recalculation is performed.
- If the exact SNO is missing or mismatched, only that row's footer is rebuilt, then the modal is opened and refreshed.
- Normal quantity/rate calculation now submits the stable source `SERIALNO`. If its supplied SNO is not a real detail row, the server resolves the correct detail SNO from `(TNO,SERIALNO)` before writing tax. This prevents new orphan tax rows.
- Rapid consecutive FD clicks use a latest-click sequence and replace queue, so a late response from the previous row cannot open or overwrite the current row's popup.
- Fresh pre-fix backup: `app105-source/backups/quotation-fd-rowkey-before-20260926-203100/live-before/f105_page_710.sql`.
- Rollback script: `app105-source/rollback_quotation_fd_rowkey_20260926.sql`.
- Live deployment and live re-export succeeded. JavaScript syntax verification passed (16,044 characters checked).
- Post-deploy saved-data check: 35 detail rows, 0 total mismatches and 0 rows with Rate present but Amount blank.

The previously created orphan rows were not silently deleted. They are excluded from the clicked-row FD display because they do not match a real detail SNO and should be handled in a separately approved data-cleanup step.
