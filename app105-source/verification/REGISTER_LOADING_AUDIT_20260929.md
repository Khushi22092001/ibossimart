# Register loading / delayed colour audit — 29 September 2026

Read-only extension of the Detail-region audit. The user reports an initially expanded register with unfilled colours, becoming normal a few seconds later. No application CSS/JS, templates, Dynamic Actions, data or settings were changed, imported or deployed during this check.

## Confirmed live differences

| Register | First-paint guards in actual DOM | Current cell transition | Observation |
|---|---|---|---|
| Quotation Register (709) | `hspl-register-first-paint` and `hspl-register-cell-paint-lock`, both in head | `none` | Populated report has final alternating colours |
| Enquiry Register (707) | Neither guard present | background and colour transition, 0.18s | Populated report has final colours after loading; inconsistent guard coverage |
| Comparative Statement Register (711) | Neither guard present | No data cells to measure | Current query returned no records; cannot verify data-row colour timing |

The missing guard plus active transitions is a concrete styling inconsistency. It is a possible contributor to colour fill/fade, **not proof that it explains the full reported several-second delay**.

## Loading sequence findings

- Actual custom `hspl-theme.js` loads as a synchronous script outside the document head, near the end of the page. The observed live cache key is `20260929tbpaint1`.
- Shared styling is linked in the head. The actual deployed `hspl-theme.css` and `design-system.css` were obtained through the browser's observed-asset inventory, rather than assuming local files matched deployment.
- Local shared JavaScript includes DOM-ready filter-region promotion and layout enhancement, ready/refresh hooks, MutationObserver work, and fixed-header synchronization. APEX fixed-header wrappers change the table structure during initialization. These are relevant late-layout dependencies, not independently proven causes of the specific jump.
- Enquiry's local exported Dynamic Action list contains a ready-time IR pagination plugin. The exported source is reference evidence, not proof that every local line matches the current live application.
- Live Quotation console contains a DOMPurify requirement error and Oracle JET translation-load errors/timeouts. They are recorded as separate loading-health issues; no causal connection to this visual flash has been established.

## Reproduction limits

Normal module-card navigation was used, with screenshot capture immediately after navigation commit. The earliest available populated Enquiry screenshot already showed final colours and the collapsed 48px sidebar. Therefore this run **did not capture the true browser first paint or reproduce the several-second expanded-to-normal jump**. Cached/sampled navigation must not be described as a cold-load pass or as proof that the user-reported issue is fixed.

No artificial loader, hidden page, injected stylesheet, network-throttle workaround or first-paint masking was introduced. The slow asset-export operation is not treated as the application's page-load duration.

## Evidence

- `register-enquiry-immediate.png`: earliest available Enquiry navigation capture, already settled.
- `register-comparative-immediate.png`: current no-record report view.
- `register-quotation-settled.png`: populated Quotation final state.
- Live DOM inspection: guard IDs, head placement, computed transitions, collapsed sidebar width and loaded custom asset URLs.

Next diagnostic target is the cold/load initial-state sequence and guard coverage across populated registers. The expanded-layout timing remains unverified; no fix is claimed.
