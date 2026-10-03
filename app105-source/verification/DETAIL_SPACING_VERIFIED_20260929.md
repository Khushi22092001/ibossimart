# Detail spacing and horizontal summaries — live verification

Deployed application 105 shared UI assets through the saved IMART connection.
Cache reference: `20260929spacing2`. No full application/page/theme import.

## Scope and preservation

- Updated only `hspl-detail-scroll.js` and `hspl-detail-compact.css`, plus their cache references.
- Captured the live pre-change assets in `detail-spacing-live-before-20260929.txt`.
- Kept original page items, values, labels, validation placeholders, event handlers, grid column widths, and business logic.
- Removed unused fixed row-viewport space using measured row content. Existing viewport capacity is retained for longer grids; no data rows are removed.
- Amount-only Summary regions now use full-width, three-column desktop layout (two columns at 1000px, one at 640px). Only empty APEX offset columns are hidden.
- Retained the prior thin horizontal scrollbar, neutral Total borders, and duplicate-scrollbar cleanup.

## Individually rendered forms

| Form | Detail body height | Rendered row content | Summary cards | Result |
| --- | ---: | ---: | ---: | --- |
| Debit Note | 43px | 40.4px | 5 | Full-width horizontal Summary; 10px status-to-Summary gap |
| Credit Note | 47px | 44.4px | 5 | Full-width horizontal Summary; 10px gap |
| Freight Advice | 43px | 40.4px | 10 | Three cards per desktop row; 10px gap |
| Purchase Order | 83px | 80.8px | 3 | Existing cards preserved; 10px gap |
| Purchase Bill | 83px | 80.8px | 5 | Full-width Summary; no overlap |
| Purchase Bill Pass | 83px | 80.8px | 0 in Detail | Original two rows retained; right-side FD accessible |
| Material In | 108px | No-data message | 0 | No-data message retained; one horizontal track |
| Item Master | 42px | 40px | 0 | Standalone Detail region retained |
| Rate Contract | 83px | 80.8px | 3 | Full-width horizontal Summary; 10px gap |

All nine rendered forms had one visible replacement horizontal track when overflow existed and no positive browser/page horizontal overflow. Real pointer drags on Purchase Order and Purchase Bill Pass moved the actual grid owner to the right and synchronized headers. Existing FD controls remained visible. No business Save/Create/approval action was used during verification.

Debit Note baseline viewport was 205.2px for a 40.4px row; after deployment it was 43px. Values 4000.00, 720.00, and 4720.00 remained unchanged.

Evidence: `detail-spacing-results-20260929.json` and `spacing-*.png`.
These are nine individually checked forms, not a claim that every application form or a long/virtualized multi-page grid was individually tested in this pass.
