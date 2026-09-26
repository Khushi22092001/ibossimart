# Persistent navigation shell: app 105 feasibility gate

Status: investigation only. Do not deploy a page-swapper to app 105 on the strength of this document.

## Baseline (21 September 2026)

- App 105 renders the Side Navigation Menu in `#SIDE_GLOBAL_NAVIGATION_LIST#` inside the page template. Its link targets use regular APEX page navigation.
- The list is enhanced into an APEX TreeView during page initialization. The application JavaScript is loaded through `#APPLICATION_JAVASCRIPT#`; CSS/JavaScript first-paint guards can control width but cannot keep the old document's DOM alive after a full navigation.
- Both app 105 and the existing app 106 backup set `p_browser_frame=>'D'`. Do not weaken this security setting or introduce an iframe shell.
- App 106 is an existing named backup (`Imart (baccckkkuppp SPA TRY)`), not a disposable test application. Do not overwrite it without a separate backup and validation.
- The app 106 baseline inventory has 573 pages: 461 nonmodal/unspecified and 112 modal; 425 contain an Interactive Report or Interactive Grid, 298 contain page processes, and 249 contain JavaScript. A generic `fetch` plus `innerHTML` page replacement is therefore not a safe equivalent of APEX's page lifecycle.
- The current production `hspl-theme.js` and `hspl-nav-paint.js` parse successfully. On 21 September an authenticated Chrome tab became available: Process TAT List → Process Routing List painted the report while the sidebar showed HOME only; the full native menu appeared in the next observation. A one-shot observer on the native tree did not eliminate that frame and was rolled back. The live JavaScript asset reference is now `20260921navstable5`, containing the same shared JavaScript behavior as `navstable3`.

## Architecture boundary

APEX native Partial Page Refresh updates regions **on the current page**. It does not preserve a navigation tree when moving between independent pages. A persistent shell requires a separate, tested route/content architecture, with explicit handling for authentication, authorization, checksums, page item state, submits, validations, Interactive Reports/Grids, modals, and browser history. Do not intercept every sidebar link or replace whole APEX HTML in production as a shortcut.

## Staged implementation gate

1. Take a fresh export of the live application and select a **separate disposable staging application**, without modifying app 106 backup.
2. Prove an APEX-supported content-region pattern on one read-only register and one form. Keep the original APEX URLs and normal navigation as the fallback. Demonstrate the same sidebar DOM node survives navigation in the pilot; test content initialization and cleanup.
3. Validate a form submit with server validation, modal open/close, IR and IG refresh, Back/Forward, unsaved-change warning, authorization change, session expiry, and slow requests. On unsupported navigation, fail closed to the original APEX link.
4. Only after pilot acceptance, migrate page families by compatibility class, verifying the counts above and observing no sidebar blank frame in fast/slow page transitions. Do not enable globally until all required paths pass.

Production app 105 remains on normal APEX navigation until these gates pass. A width/paint CSS patch is not a substitute for a truly persistent shell.
