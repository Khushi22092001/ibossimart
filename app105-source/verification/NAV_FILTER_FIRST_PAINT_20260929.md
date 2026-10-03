# Navigation/filter first-paint follow-up

## Live changes

- Restored all 626 original page HTML headers exactly from the pre-deployment full export. Verified 612 original sidebar bootstraps remain, versus 626 after the earlier deployment. The added state-precedence functionality is removed. Original shared sidebar controller and storage preference behavior were not edited.
- First-paint CSS v3 clamps only startup sidebar/canvas geometry until the existing `hspl-sidebar-state-ready` signal. No state writes, new click handlers, synthetic toggles, or timers were added.
- Added `hspl-drawer` as a server-rendered CSS class to 116 existing exact-title Filter/Filters static regions. This is the same class the existing shared drawer initialization already adds. Two faceted-search regions were excluded. Other CSS classes were retained. Before values are in `filter-classes-before-20260929.txt`; a scoped rollback script is provided.
- Existing register-first-paint JavaScript v2 is unchanged.

## Evidence

Before: Indent page 107 Filter region `R467180941447240948` initially rendered in-flow at x=112, y=74, width=369.6, height=50.2, with region shadow and no drawer class. After DOM initialization it became a fixed off-screen drawer. This is a concrete late relocation/reflow cause matching the reported filter movement/shading.

After: the same region already had the drawer class while `document.readyState` was loading, before `js-ready`/drawer initialization. Position was fixed, x=1370.21 at desktop viewport, and remained x=1370.21 when ready. No in-flow filter region was exposed in these samples.

Closed-state desktop sample: Indent nav was 48px during loading and after ready.
Open-state desktop samples: Indent final saved-open reload nav was 320px. Navigation to Purchase Order List preserved open state: 320px before js-ready and after complete. Native toggle remained functional; original closed state was restored afterward.
Indent filter open showed the original drawer and overlay; Close filters via the existing keyboard control removed the open class. No Apply/Reset/save or business data changes were performed.

Sampling does not constitute a frame-by-frame video or testing every register/form. The broad fix covers the audited 116 declarative filter regions; unnamed auto-promoted regions were not modified.

## Loading audit

APEX activity logs for preserved session 15530881568237:

- Recent PO page 117 render: 0.513 seconds, 6 rows.
- Recent Indent page 107 renders: 0.561, 0.580, 0.814 seconds, 23 rows.

Browser observations still show long loads: one cold-cache reload had no body at the 23-second sample and was still loading at 47 seconds; it was complete at a later 96-second sample. These are observation bounds, NOT precise load-time measurements; intervening tool work is included in elapsed wall time. A warm PO navigation was loading at 16.6 seconds and complete at the later 70.8-second sample.

Current-page console confirms repeated Oracle JET `ojtranslations/nls/en/localeElements` script errors and RequireJS translation-load timeouts, plus `DOMPurify is required by a-unsafe-content`. These pre-existing dependency failures are separate from sidebar/filter geometry. Their exact contribution to overall latency is not measured. Read-only browser instrumentation does not expose Performance entries here.

No server/static-resource repair or database-query optimization was deployed, and no quantified speed improvement is claimed. Fixing /i static-resource serving requires a verified server deployment route and correct version-matched assets; bypassing sanitizer errors or removing chart dependencies would risk functionality/security and was not done.

## Remaining verification blocker

An existing Purchase Order form was opened read-only from the observed report row link. At the 34-second sample its title was Purchase Order but the body was not available yet. Subsequent browser frame/screenshot/focus requests repeatedly timed out, including normal-size recovery and a Back attempt. Therefore final form rendering is NOT verified, and no claim is made that the rendering patch caused or resolved this timeout. No fields were changed and no save was attempted. The original tab was retained with handoff; authentication/session was not replaced or logged out. A final screenshot artifact could not be captured because the browser stopped responding to inspection.
