# Total-only register KPI cleanup — superseded on 3 October 2026

This hidden-panel approach was reverted after user review. KPI panels remain visible.
The current implementation uses report-row counts, submits live filter values and adds
status/process cards where reliable source data exists. See
`REPORT_KPI_ROW_STATUS_FIX_20261003.md`.

## Scope

Only the generated `.coverage-register-kpis` panels in application 105 were changed.
Existing transaction KPI panels, master KPI panels, report SQL, filters, DML, buttons,
navigation, page CSS and business logic were not changed.

## Audit result

- 159 generated coverage KPI shells exist.
- 86 configurations have no status/recent/current-user capability in metadata.
- Some additional configurations can also return only `Total records` for the current
  filter/data scope even when a status expression exists (PO Amendment is one example).

## Implemented behavior

- A coverage KPI panel starts hidden while its payload loads, preventing an empty shell flash.
- If the usable payload contains only the `Total records` card, the whole panel stays hidden.
- If the payload contains two or more usable cards, the panel is revealed unchanged.
- If the payload request fails, the existing retry UI is revealed.
- The rule re-evaluates after report refresh, so a panel can reappear when another page/filter
  scope produces useful status/recent/current-user cards.

## Deployment verification

- `TOTAL_SHELLS=159`
- `PATCHED_SHELLS=159`
- `INITIALLY_HIDDEN_SHELLS=159`
- `REVEAL_CAPABLE_SHELLS=159`

## Chrome verification

- Page 147, PO Amendment Register: total-only panel hidden; its wrapper height is `0px`;
  report is visible and begins directly below the title area.
- Page 115, Item Quality List: total-only panel hidden; its wrapper height is `0px`;
  report remains visible.
- Page 139, Payment Advice Register: four useful cards remain visible (`Total records`,
  `Created by me`, `New records`, `ACTIVE`). `ACTIVE` filtering and `Total records` restore
  were both exercised successfully.

## Recovery

The pre-change shell sources are preserved in `IMART_RKPI_SHELL_BAK_TOTALONLY`.
