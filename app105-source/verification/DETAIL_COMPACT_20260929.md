# Compact Detail presentation — 2026-09-29

Imported and activated the shared CSS-only overlay `hspl-detail-compact.css`, cache key `20260929compact4`, in app 105 using IMART. The final deployment exited successfully with `ACTIVE_APEX_IMPORTS=0`, `STATIC_FILE_hspl-detail-compact_css_DEPLOYED`, and `DETAIL_COMPACT_ACTIVATED`.

The existing live base stylesheet had been renamed to `hspl-scroll-layout.css` and the main theme script had newer `20260929relatedtotals1` changes. Both were preserved. No existing shared script, page export, field span, item attribute/value/format, data model, validation, or business process was reimported or modified. Only a new compact CSS reference was appended to the current live CSS URL list.

## Changes and rendered results

- Summary cards: rendered height reduced from 86px to 72.6px, icons from 56px to 42px, read-only amount font from 24px to 20px.
- Purchase Order cards moved from y=627.6px to y=609.6px: 18px upward through reduced positive spacing, without negative margins or absolute offsets.
- Region scrollbar: outer height reduced from 16px to 10px; native scrollbar height from 12px to 8px, with a light thumb. Full field/column widths were retained.
- The relocated grid footer now paints above the legacy grid track, preventing that track from bleeding through beneath the status text. Native scroll owner and vertical scrolling were not changed.
- Purchase Order: native scrollbar drag reached `scrollLeft=993.5999755859376` in the scrollbar, grid owner, and Total viewport; FD and trailing columns were visible. Whole-page horizontal overflow was zero.
- Purchase Bill: all five original summary items rendered at 72.6px without input overflow. Round Off remained editable, all other amount items remained read-only. Whole-page horizontal overflow was zero.
- Purchase Bill Pass: no below-Detail numeric summary fields exist, so its General/Other Details layout was left unchanged. Its 10px Detail scrollbar was dragged to `scrollLeft=608`; the body and header reached 608 and the outer Total dock reached its available edge, 606.4. FD and trailing fields were visible. Whole-page horizontal overflow was zero.

## Scope

The stylesheet is application-level, not a per-page patch. It applies to the existing shared `.hspl-detail-scrollbar` and `.hspl-summary-card` classes. The shared script discovers APEX grids in `#tabcontainer`/`.hspl-form-tabs`, Detail-labelled panels, or the supported Detail region/class conventions. Cards apply to original numeric page items following the grid within that Detail panel; it does not add new summaries to forms without such fields.

Read-only live metadata found 47 pages using `tabcontainer` plus Interactive Grid. This is a structure audit, not proof of rendered behavior for every page. The three forms above were verified live; every custom form was not individually opened.

## Evidence

- `summary-cards-compact-po-20260929.png`
- `summary-cards-compact-po-right-20260929.png`
- `summary-cards-compact-pb-20260929.png`
- `summary-compact-pbp-scroll-20260929.png`
