# Remaining Detail UI cleanup — deployed and rendered verification

Deployed through saved IMART connection, 2026-09-29. Only shared `hspl-detail-scroll.js` and `hspl-detail-compact.css` changed, with targeted reference cache keys `20260929cleanup2`. No page, item, process, DA, query, calculation or record imports/saves were performed.

Live pre-deployment references and asset content: `detail-cleanup-live-before-20260929.txt`. Both assets matched the repository HEAD before patching; unrelated live references were retained.

## Findings and fixes

- APEX native horizontal tracks remained visible alongside the shared replacement, including a purple native track on Bill Pass. Native horizontal track height is now zero only on managed overflowing grids; the real scroll owner, overflow, authored widths, handlers and vertical scrolling remain intact.
- Material In's legacy `#tabcontainer *::-webkit-scrollbar` rule suppressed the shared bar. A scoped rule restores its 8px track; its redundant `mi-detail-hscroll` is hidden only while a real overflowing replacement owner is available.
- Auto-ID standalone regions such as Item Master's `DETAIL` were missed. Eligibility now recognizes a form's actual region heading, not only IDs/tab labels.
- Legacy totals docks reclaim an unused APEX footer slot using negative margins. The residual grid border painted behind Credit/Freight summaries. Only the unused frame slot is clipped; the clip boundary cannot be above the original scroll viewport bottom. No data row/column is resized, hidden or rearranged.
- Removed the earlier opaque status-row masking/padding workaround. Total dock accent borders are neutralized through the same shared class.

## Rendered tests

Native thumb dragged with browser pointer input, never programmatic scrolling. Header and actual grid owner positions were read after the drag. Each tested overflowing grid displayed one slim common control, with original tracks computed at 0px. No whole-page horizontal overflow was observed.

| Form | Verified horizontal travel | Evidence |
| --- | ---: | --- |
| Item Master | 260.8px | `cleanup-item-master.png`, `cleanup-item-master-final.png` |
| Material In | 758.4px | `cleanup-material-in-final.png` |
| Purchase Bill Pass, populated | 608px; FD accessible | `cleanup-bill-pass-final.png` |
| Credit Note | 225.6px; Summary below status/control | `cleanup-credit-note-final.png` |
| Debit Note, populated | 341.6px; Summary below status/control | `cleanup-debit-note.png` |
| Freight Advice | 1380.8px; Summary below status/control | `cleanup-freight-advice.png` |
| Purchase Order, populated | 993.6px; 3 existing compact cards preserved | `cleanup-purchase-order.png` |
| Purchase Bill, populated | 210.4px; 5 existing compact cards preserved | `cleanup-purchase-bill-final.png` |

Structured before/after measurements: `detail-cleanup-results-20260929.json`. Native range can exceed header travel by the reserved vertical scrollbar gutter; final rightmost columns remain accessible.

This validates the known affected cases and two purchasing regression cases. It is not a claim that every application page/state has been individually re-tested in this deployment. No Save/Create/approval/business-action button was pressed.

Unrelated APEX DOMPurify/Oracle JET locale load errors were observed on some loads; these were not altered by this CSS/UI-only patch. Item Master's live Total dock was present and neutral in the first rendered test, absent on a later empty-form load; both loads had one functional horizontal control.
