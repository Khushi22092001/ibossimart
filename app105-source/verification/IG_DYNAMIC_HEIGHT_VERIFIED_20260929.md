# Interactive Grid dynamic viewport fix — 29 September 2026

## Deployed scope

App 105 shared `hspl-detail-scroll.js`, cache key `20260929rows4`.
The live static file is byte-for-byte equal to the final local source.
All CSS and other JavaScript references exactly match the pre-change backup.
No page/application import, SQL query, region metadata, Dynamic Action, process,
model value, validation, save, LOV, keyboard handler, row CSS or column setting was changed.

## Cause and correction

The old `compactRows` preserved the initial `.a-GV-bdy` capacity as the maximum.
A grid starting with a one-row viewport was therefore limited to that capacity
even after records were added. Its CSS height variable overrode the natural body height.

The existing height-variable mechanism now measures actual rendered data rows,
uses read-only model row counts when virtual rendering has not rendered all rows,
and caps the body at six measured rows. It includes the taller active editor in
the cap without modifying row styling. Hidden legacy aggregate rows behind an
external totals dock do not consume another visible row slot.

Sizing scans all `.a-IG` elements, not only Detail tabs. Hidden grids are measured
when visible. Existing horizontal-scroll and summary eligibility is unchanged.
Read-only model notifications, DOM insertion/removal, focus, mode changes, refresh,
table resize and window resize schedule one animation-frame recalculation.
`grid('resize')` is called only if the target height actually changes. No
`resizeColumns`, refresh, stretch setting or keyboard event interception is used.
Vertical scroll correction keeps APEX's active row visible without changing focus.

API basis: [Oracle grid resize](https://docs.oracle.com/en/database/oracle/apex/26.1/aexjs/grid.html#resize)
and [Oracle model notifications](https://docs.oracle.com/en/database/oracle/apex/26.1/aexjs/model.html#subscribe).
The local Account Master export uses scroll pagination, fixed native row height
and Stretch Columns; none of those options was changed.

## Actual rendered acceptance test

Separate audit tab, Account Master → Company. User's existing tab was not refreshed.
Only temporary unsaved audit rows were inserted; no Save/Apply Changes/Pass/Delete
business action was submitted. Only our unsaved rows were removed during deletion tests.
Reload discarded remaining audit edits; persisted Company count remained one.

Final deployed build measurements at native 1536×791 / DPR 1.25:

| State | Body height | Internal scrolling |
|---|---:|---|
| One existing row | 42px | Not required |
| Add Row → two | 82px | Not required |
| Native Tab from last editable date → three | 106px | All three visible |
| Six rows, active editor | 202px | Not required |
| Seven rows, active editor | 202px | 233px content, scrollTop ≈30.4px; new row visible |

Existing styling naturally uses 32px inactive rows and a 40px active editor in
edit mode; the 106px three-row height is their actual sum plus border allowance.
All four header widths at a stable native viewport remained `[34,42,664,691]`
through the insertion sequence. Toolbar, header and status/Total counts stayed intact.

Responsive checks at 1366×768, 1600×900 and 1920×1080 verified the same three-row
content height and all three visible rows. Seven-row tests retained the six-row cap.
These responsive runs used the immediately preceding build with identical Company
sizing; final build additionally excludes hidden rows in legacy totals grids.
Temporary viewport override was reset. No browser zoom was altered.

Deletion of two unsaved audit rows reduced Total 7 → 6 → 5 and measured exactly
202px for five 40px rows. Reload reduced Total to 1 again. This was tested before
the final hidden-aggregate exclusion, which has no effect on Company rows.

## Regression checks

- Purchase Order Detail, final build: two visible 40.4px rows → 83px body, hidden
  native aggregate remains hidden and external totals remain visible.
- Real horizontal track drag moved body, header and track together to 556.8px;
  horizontal range remained 1002px. Summary cards did not overlap.
- Account Master Bank empty state was inspected; no data was changed.
- Syntax check and pure sizing tests passed: 1/2/3 rows, mixed-height six/seven cap,
  virtualized model rows, hidden aggregate, no repeated resize when unchanged.

This is a global shared implementation, not a claim that every application grid
has been individually exercised. Business save/validation transactions were not tested.
Existing Oracle JET translation/DOMPurify console errors were observed and left outside scope.

## Evidence

- `ig-height-three-company.png`: final deployed build, all three Company rows visible.
- `ig-height-seven-company.png`: final cap with internal vertical scrolling.
- `ig-height-regression-purchase-order.png`: preserved Detail totals/summary and thin bar.
- `ig-height-measurements-20260929.json`: measurements including intermediate iterations.
- `test-ig-row-height.cjs`: isolated source-level sizing tests.
- `ig-height-live-before-20260929.txt`: exact original asset and refs for recovery.
- `ig-height-live-after-20260929.txt`: final deployed asset and preserved refs.
