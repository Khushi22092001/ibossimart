# Detail scrollbar responsiveness — staged, not deployed

The shared scrollbar script now caches header/total synchronization targets outside the gesture path, coalesces incoming scroll intent once per animation frame, and suppresses asynchronous programmatic scroll echoes. Native drag/wheel behavior is retained. No column widths, CSS, totals calculations, row-height logic, or data-entry handlers were changed for this patch.

Checks passed:

- `node --check apexlang/shared-components/static-files/hspl-detail-scroll.js`
- `node verification/test-detail-scroll-sync.cjs`
- `node verification/test-ig-row-height.cjs`

These are deterministic code checks, not rendered UI/smoothness verification. Browser access failed with `Browser is not available: 2`; surface discovery returned no browsers and a request-header-policy loading error. No browser-policy workaround was attempted.

The performance patch has NOT been imported/deployed. Before deployment, reconnect the browser, verify native drag/swipe and body/header/total synchronization on multiple real Detail forms, then deploy only the shared JavaScript asset after checking the live source baseline. Repeat rendered verification after deployment. The live asset remains the previously deployed `hspl-detail-scroll.js?cb=20260929rows4`.
