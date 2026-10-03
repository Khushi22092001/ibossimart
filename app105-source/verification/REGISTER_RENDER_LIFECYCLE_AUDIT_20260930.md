# Register render lifecycle audit — 2026-09-30

## Scope and safety

This change is presentation-only.  It does not alter APEX page SQL, PL/SQL,
data, filters, sorting, pagination, permissions, buttons, workflow, or the
final register design.  A recoverable source snapshot was taken before the
change in `backups/register-flicker-before-20260930-061500/`.

## Root-cause audit

Two application-wide JavaScript pipelines rewrote the same server-rendered IR
cells into status/overdue pills:

1. `hspl-register-first-paint.js` owns the initial IR decoration.
2. `hspl-theme.js` also independently decorated the same cells at
   `DOMContentLoaded`, installed a document-wide `MutationObserver`, and also
   decorated on `apexafterrefresh`.

The two writers could expose plain status text (for example `ACTIVE`) and then
replace it with a green pill.  This is the observed blank/grey-to-colour
repaint.  The live console additionally records failed Oracle JET locale and
DOMPurify dependencies; those unrelated dependencies are not changed here.

## Repair

- Retired the duplicate global status-pill runtime in `hspl-theme.js`; the
  unrelated filter-drawer runtime remains active.
- Made `hspl-register-first-paint.js` the single owner.
- The initial server-rendered IR is decorated at `DOMContentLoaded`.
- Search/filter/sort/paging replacements are decorated only on their actual
  `apexafterrefresh` event.
- No timer, animation, loading mask, full-page hide, pointer-event lock,
  extra observer, region refresh, or data/query change was introduced.

## Follow-up root cause and repair

The first live re-audit found a second post-paint mutation:
`hspl-theme.js` appended `#hspl-drawer-lov-indicator-style` at
`DOMContentLoaded`.  Its rules changed fixed-header/body geometry after the
report had already painted.  The same presentation rules already exist in
`hspl-theme.css`, so the injected style was removed rather than replaced with
another lifecycle hook.  A fresh Chrome load on cache key
`hspl-theme.js?...cb=20260930registerlifecycle2` confirms that the injected
style is absent while the fixed header, 32 final pills, and report-ready class
remain present.

## Deployment and live Chrome evidence

Both changed assets were deployed to application 105.  The active JavaScript
cache key is `hspl-theme.js?...cb=20260930registerlifecycle3`; Chrome confirmed
that exact version after deployment.

Fresh Chrome loads verified:

| Register | Region type | Result |
|---|---|---|
| Indent Register (107) | Interactive Report | ready class present; 32 final status/number pills |
| Purchase Order List (117) | Interactive Report | ready class present; 12 final pills |
| Purchase Bill Pass Register (151), before final reload | Interactive Report | 14 final pills, zero raw status cells, and final alternating colours present |

The Indent register search refresh retained final pill markup.  A hard reload
of Purchase Order List ended with `document.readyState=complete`, 12 pills,
the ready class, and zero `aria-busy=true` elements.

## Remaining verification limits

The connected Chrome automation does not expose DevTools cache/CPU/network
throttling controls or frame-level performance capture.  During the final
hard-reload check, the ERP invalidated the open register sessions and returned
Chrome to its login page, so the post-deploy visual replay could not be
captured in that session.  Edge was not connected.  Those checks must be run
in a connected authenticated session before asserting the full cross-browser
and throttled-cache acceptance matrix.
