# Keyboard help global removal — verified — 03 Oct 2026

## Result

The injected `details#hspl-keyboard-help` helper is hidden across application 105.

## Deployment scope

- Application pages: `639`
- Pages carrying the exact-ID hide rule: `639`
- Rule: `details#hspl-keyboard-help { display: none !important; }`
- Backup: `IMART_KEYHELP_ALL_BAK_20261003`

## Live Chrome verification

| Page | Type | DOM state | Visible |
|---|---|---|---|
| Comparative Statement Register | Register | `display: none` | No |
| Purchase Order | Form | `display: none` | No |

The helper remains non-visible even when its injector creates the DOM node. The targeted rule does not alter Filters, Add New, Save, navigation or any keyboard shortcut behavior.

## Safety boundary

- No report query or transaction logic changed.
- No button action changed.
- No shared JavaScript changed.
- Only the exact `#hspl-keyboard-help` element is hidden.
