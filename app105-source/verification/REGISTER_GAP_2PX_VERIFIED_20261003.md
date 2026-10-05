# Register vertical gap — live verification — 03 Oct 2026

## Scope

The register header, KPI panel and report spacing was reduced with page-level APEX inline CSS only. No application static CSS or JavaScript asset was modified.

## Deployment

- Scoped pages updated: `157`
- Static application assets changed: `0`
- Marker: `IMART_REGISTER_GAP_3PX_V1`
- Specificity correction marker: `IMART_REGISTER_GAP_3PX_V2`
- Recovery table: `IMART_REG_GAP_STEP_BAK_20261003`

## Live Chrome measurements

### Comparative Statement Register — page 711

| Boundary | Before | After |
|---|---:|---:|
| Application header → register header | 12px | 2px |
| Register header → KPI panel | 16px | 2px |
| KPI panel → report | 30px | 2px |

### Indent Register — page 107

| Boundary | After |
|---|---:|
| Register header → KPI panel | 2px |
| KPI panel → report | 2px |

Both generic report KPIs and transaction KPIs were therefore verified after deployment.

## Safety boundary

- Page-level `WWV_FLOW_STEPS.INLINE_CSS` only.
- No universal/shared static CSS file changed.
- No JavaScript changed.
- No report query, KPI calculation, filter, button action, validation, save or approval logic changed.
