# Detail summary cards — 2026-09-29

Deployed shared `hspl-detail-scroll.css` and `hspl-detail-scroll.js` to application 105 through the stored IMART connection. Asset references use cache key `20260929v4`. The deployment completed with `ACTIVE_APEX_IMPORTS=0`, both static-file deployment confirmations, and `SHARED_DETAIL_SCROLL_ACTIVATED`.

Only presentation classes and styling were added to the original numeric summary items below Detail grids. No items were cloned, moved, renamed, reformatted, or assigned new values. Existing field spans, read-only/editable state, validation placeholders, grid columns, and APEX handlers were retained. No full application or page import was performed; unrelated existing page changes were preserved.

## Rendered verification

- Purchase Order, page 118: three purple/amber/green icon cards with subtle wave backgrounds. Original values remained `61200.00`, `11016.00`, and `72216.00`; each original input retained its ID, name, read-only state, and format. Computed card padding was `12px 16px 12px 88px`; amount font was 24px and read-only input background transparent.
- Purchase Bill, page 143: five cards retained their existing three-column/two-row arrangement. All amounts fit without input overflow. Round Off remained editable with a visible input border; the other four original amount fields remained read-only.
- Purchase Order native scrollbar drag moved the actual grid owner and totals viewport to `scrollLeft=993.5999755859376`, revealing the FD buttons and trailing columns. Focused scrollbar outline and shadow both computed to `none`.
- Purchase Bill keyboard horizontal scrolling moved the scrollbar, actual grid owner, and totals viewport together to `scrollLeft=61.599998474121094`.
- Both forms had zero whole-page horizontal overflow. Total docks had no accent top border or blue shadow. The native light-grey Detail scrollbar remained visible and usable.

## Screenshots

- `summary-cards-po-20260929.png`: full Purchase Order Detail with final summary design and neutral scrollbar.
- `summary-cards-po-scroll-right-20260929.png`: right-side columns and FD buttons reached by scrollbar drag.
- `summary-cards-pb-20260929.png`: Purchase Bill's five summary fields, including editable Round Off.

Local JavaScript syntax check and `git diff --check` passed. Business-data save/submit operations were not exercised or changed.
