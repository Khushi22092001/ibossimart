# Shared Detail scrollbar verification — 2026-09-29

## Scope and deployment

App 105, IMART. Deployed only the new shared `hspl-detail-scroll.css` and
`hspl-detail-scroll.js` static files and appended their URLs to the live app's
existing CSS/JavaScript URL lists. No full application or page reimport.
Existing theme assets and page-specific fixes were preserved. No APEX item,
query, column width, Dynamic Action, validation, model, or business logic changed.

The compact totals code can move the totals/footer above the bottom of the native
grid viewport while clipping that viewport. The shared bar is therefore a real
native scrollable element outside the clipped IG, inside the owning Detail region.
It controls the actual rendered APEX scroll owner and synchronizes the header and
existing totals viewport. Both `hspl` and older page-prefixed totals docks are
recognized. It is not the purple Total row.

Styling after user feedback: 16px outer height, 12px native scrollbar, light grey
thumb (#9aa9bd), pale track, subtle 1px keyboard-focus outline. It remains visible
when content overflows; no column compression or layout rearrangement is used.

Shared discovery covers Interactive Grids in the common form tab containers,
Detail-labelled panels, and explicit `.hspl-detail-grid` regions. Newly rendered
grids, tab activation, APEX refresh and resize are handled. This is shared coverage,
not a claim that every individual application page was manually opened.

## Actual live UI tests

Chrome, normal user viewport, read-only copies of existing records. Every test
used mouse dragging of the rendered grey track, not programmatic scroll writes.

| Form | Page | Verified outcome | Settled horizontal offset |
| --- | --- | --- | --- |
| Purchase Order | 118 | FD, tolerance/freight and final Remark columns reachable; body, header and totals aligned | 993.6px |
| Purchase Bill Pass | 152 | FD, Footer Amount, Total Amount and final Remark reachable; actual owner is `.a-GV-bdy` | 608px |
| Purchase Bill | 143 | FD, Footer Amount and final Total Amount reachable; bar below page-prefixed totals dock, clear of Summary | 210.4px |
| GRN | 146 | SD/UD, discrepancy/rejection and inspection columns reachable; body, header and totals aligned | 896px at right edge |

The document's horizontal scroll offset remained zero on all four forms.
Purchase Order and Purchase Bill Pass were reloaded and tested again after the
final shared deployment; native tab activation still worked. No records were
edited or saved during testing. `node --check` and `git diff --check` passed.

Screenshots in this directory show the slimmer Purchase Order bar and the
Purchase Order / Purchase Bill Pass grids scrolled to the right.
