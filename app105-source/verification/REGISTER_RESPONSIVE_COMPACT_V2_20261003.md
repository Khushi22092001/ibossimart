# Register responsive compact sizing V2 — verification

Verified on 2026-10-03 in Chrome against the live Oracle APEX application.

## Scope

- Page-level inline CSS only.
- Applied only to the 157 register/list pages already carrying `IMART_REGISTER_COMPACT_V1`.
- No shared theme CSS, global JavaScript, report query, KPI calculation, filter, tab order, button action, or form process was changed.
- Exact pre-change `INLINE_CSS` for all 157 pages is preserved in `IMART_REG_RESP_BAK_20261003`.

## Root cause

The earlier compact rules lost to more-specific shared form selectors. The live hero therefore remained 96px high with a 26px title. KPI columns also used `1fr`, allowing a card to grow from about 308px at a 1366px viewport to about 439px at a 1920px viewport.

## Live result

### Material Out Register (page 167, four cards)

| Viewport | Header height | Heading | Card width | Card height |
|---|---:|---:|---:|---:|
| 1366×768 | 70px | 20px | 245.95px | 72.8px |
| 1920×1080 | 70px | 20px | 252px | 72.8px |

### Comparative Statement Register (page 711, five cards)

| Viewport | Header height | Heading | Card width | Card height |
|---|---:|---:|---:|---:|
| 1366×768 | 70px | 20px | 245.95px | 72.8px |
| 1920×1080 | 70px | 20px | 252px | 72.8px |

The KPI grid now caps card growth with a responsive 190–252px range. Supporting text is kept to one ellipsized line so a narrow-width wrap cannot make the complete KPI row taller.

## Rollout validation

- `COMPACT_V1_PAGES = 157`
- `RESPONSIVE_COMPACT_V2_PAGES = 157`
- `MISSING_V2_PAGES = 0`
- Rollout updated 156 pages after the page 167 pilot.

## Files

- CSS source of truth: `app105-source/register_responsive_compact_v2.css`
- Pilot: `app105-source/deploy_register_responsive_compact_pilot_p167_20261003.sql`
- Rollout: `app105-source/deploy_register_responsive_compact_rollout_20261003.sql`
- Recovery script: `app105-source/rollback_register_responsive_compact_v2_20261003.sql`
