# MKSPL reference audit — Profit and Loss Summary

## Scope and preservation rule

This is a read-only implementation specification of **MKSPL application 110, Page 705, `PROFIT-AND-LOSS-SUMMARY`**, audited in its runtime and Page Designer on 23 September 2026. No MKSPL component was edited, saved, imported, or deleted while collecting this record.

It is a financial-intelligence page, not a static report. Its purpose is to calculate the current profit and loss from posted general-ledger movement and prove it against Trial Balance on every request.

For a future HSPL implementation: use the current HSPL design system and native header/section treatment. Do **not** introduce a side panel, a dashboard-card portlet page, red destructive UI, or MKSPL-specific `Panel` selector. In MKSPL, `Panel` is an access-scope data item; it is not a layout panel. Preserve equivalent existing HSPL row-level access filtering only if HSPL has one.

## Page identity and baseline configuration

| Property | MKSPL reference |
| --- | --- |
| Application/page | 110 / 705 |
| Alias | `PROFIT-AND-LOSS-SUMMARY` |
| Group | Financial Intelligence |
| Mode/template | Normal / Standard |
| Authentication | Required; no page-specific authorization scheme |
| Access | Unrestricted deep link; standard authentication still applies |
| Browser/server cache | Application default / disabled |
| Reload on submit | Always |
| Page JavaScript/CSS | None on the page; visual system is shared application CSS |
| Dynamic actions | None on this page |
| Server processes | One explicit Excel process, described below |

The page help makes four accounting commitments:

1. It uses the same ledger population as Trial Balance Page 675; the application stores no P&L balance.
2. Each subtotal is a clean chart-of-accounts subtree or a defined remainder.
3. Voucher movement uses signed `VoucherDetail.Amount`: debit is negative and credit is positive; expenses/costs are negated to show as positive costs.
4. `OPENING` carry-forward vouchers are excluded from current-period movement.

## Header and journey

Runtime header content:

- Eyebrow: `Finance · General Ledger · Profitability`.
- Title: `Profit and Loss Summary`.
- Subtitle: `Revenue to PBT on the posted ledger, proved against the Trial Balance on every load`.
- Scope chips: selected period, financial year (or explicit outside-financial-year condition), Company, Location, and Panel A/B enforcement where available.

Header links are deliberate, filter-preserving navigation:

| CTA | Destination | Values carried |
| --- | --- | --- |
| `Trial Balance ←` | Page 675 | from/to, company, location, panel |
| `Monthly →` | Page 706 | financial year containing From Date, company, location, panel |
| `By Location →` | Page 707 | from/to, company, panel; location is intentionally omitted because the target breaks down by location |

## Filters and semantic contract

| Item | Type/default | Meaning |
| --- | --- | --- |
| `P705_FROMDATE` | Required date; start of financial year containing today | Inclusive movement start |
| `P705_TODATE` | Required date; today | Inclusive movement end |
| `P705_COMPANY` | Select list; `All companies` = null | Optional company scope |
| `P705_LOCATION` | Cascading select list on Company; `All locations` = null | Optional business location scope |
| `P705_PANEL` | A/B select list, default A+B/null, only shown when no user panel is enforced | MKSPL access-scope selector; omit in HSPL if no equivalent exists |
| `APPLY` | Hot Submit button, `fa-refresh`, static id `apply` | Recalculate all reports |

Company and Location LOVs are restricted to values that actually have scoped P&L ledger movement. MKSPL also applies `GetUserPanelAB_apex()` directly to every ledger query, even if the user-facing selector is hidden.

## Canonical accounting model

### Account hierarchy

The hierarchy starts at `Party.ParentCode Is Null` and walks children with `CONNECT BY`. Each account receives:

- root nature (`RootNat`),
- level-two node (`L2`), and
- level-three business bucket (`Bucket`).

Movement is `SUM(VoucherDetail.Amount)` from `From Date` through `< To Date + 1`, excluding voucher headers where `VoucherNo = 'OPENING'`, then limited by user scope, selected company and selected location.

### Classification logic

| P&L bucket | Exact MKSPL classification |
| --- | --- |
| Revenue | `L2 = 'INCOME'` **or** root nature is `INCOME` |
| Direct Cost | `Bucket = 'DIRECTCOST'` |
| Depreciation | `Bucket = 'DEPRECIATION'` |
| Finance Cost | `Bucket = '4892'` |
| Tax | `Bucket = '7481'` |
| Operating Expense | `L2 = 'EXPENDITURES'` **or** root nature `EXPENSES`, except the four specific buckets above |

The Operating Expense rule is intentionally a remainder, not just a named `Indirect Expenses` node. It includes other expense branches such as freight outward, GST penalty, price difference, shortage, and future expense groups without breaking the reconciliation identity.

### Statement rows

All values are displayed in INR crore: `ROUND(value / 10000000, 2)`. Percentage of revenue is `ROUND(value / revenue * 100, 1)` and is blank when revenue is materially zero.

| Seq | Row | Formula/sign | Drill bucket |
| ---:| --- | --- | --- |
| 1 | Revenue | `Rev` | REVENUE |
| 2 | less Direct Cost | `-Dir` | DIRECT |
| 3 | CONTRIBUTION | `Rev + Dir` | none |
| 4 | less Operating Expense | `-Opx` | OPEX |
| 5 | EBITDA | `Rev + Dir + Opx` | none |
| 6 | less Depreciation | `-Dep` | DEPN |
| 7 | EBIT | `Rev + Dir + Opx + Dep` | none |
| 8 | less Finance Cost | `-Fin` | FIN |
| 9 | PBT | `Rev + Dir + Opx + Dep + Fin` | none |
| 10 | less Tax | `-Tax` | TAX |
| 11 | PAT | `Rev + Dir + Opx + Dep + Fin + Tax` | none |

Rows 2, 6 and 10 receive a pending visual state when their absolute amount is below ₹0.005 crore. That is a warning that Direct Cost, Depreciation or Tax may not yet have been posted; it is not a zero that should be silently treated as a real margin.

### Trial Balance drill-through

Only account-bearing rows are clickable. Each opens Page 675 in a new tab with:

`P675_PNLBUCKET=<REVENUE|DIRECT|OPEX|DEPN|FIN|TAX>`, `P675_LEDGERONLY=Y`, blank account group, and the same from/to/company/location/scope values.

Passing the P&L bucket, rather than an arbitrary named group, is essential: it keeps OPEX equal to the statement's defined remainder and therefore reconciles exactly.

## Regions, order and visible behaviour

1. **Profit and Loss Summary** — header SQL report; receives all five page filters.
2. **Filters** — compact filter row and Apply.
3. **Closing Control** — conditional control narratives.
4. **Profit and Loss** — the 11-line statement, custom row classes, drillable account rows, `DOWNLOADPNL` region button.
5. **Reconciliation** — statement-to-Trial-Balance identity proof.
6. **Reading this statement** — static explanation of posted-ledger basis, open-date exclusion, P&L bucket drills, and that PAT equals PBT until tax is posted.

## Closing Control logic

The control region shares the same dates, scope and allocation-free movement base. It emits only applicable statements:

- **COGS/consumption:** compares `CONSUMPTIONRAWMATERIAL` debit consumption to gross GR/IR purchase debits. If purchases exceed ₹1 crore and consumption is below 5% of purchases, it warns that periodic closing has not posted consumption and the P&L omits COGS; correction expected is Consumption Dr / Inventory Cr.
- **Depreciation:** warns below ₹1 lakh and otherwise states that depreciation is charged.
- **Tax:** distinguishes a missing `7481` group, existing group with no ledgers, no booked tax, and booked tax. PAT is not claimed as final before this exists.
- **Control OK:** only when material consumption exists relative to purchases and at least one tax ledger exists.

## Reconciliation contract

The left side re-sums the statement classifications. The right side sums all P&L accounts whose root nature (with the level-two fallback) is INCOME or EXPENSES. Both use the exact same period and scope. If absolute difference is under `0.005`, it states the two values in ₹ crore and marks the page reconciled. Otherwise it states the difference and explicitly says not to use the figures. This is identity reconciliation, not a tolerance-based management check.

## Custom Excel download — not default APEX export

`DOWNLOADPNL` triggers one **After Submit** process, `Download Profit and Loss`.

- It runs only when request/button is `DOWNLOADPNL`.
- File name: `profit-and-loss-YYYYMMDD-HH24MI.xls`.
- MIME type: `application/vnd.ms-excel`.
- Payload: explicitly written Excel-compatible HTML, not APEX Interactive Report export.
- Worksheet title: `Profit and Loss`.
- First four rows are frozen: title, subtitle, blank row, headings.
- Columns: `Particulars`, `Amount (Rs Cr)`, `% of revenue`.
- It reruns the same canonical P&L query; labels are plain escaped text, so export contains no HTML row marker or drill link.
- Amounts are numeric two-decimal cells, rendering is Calibri-oriented, and the engine is stopped after output.

## HSPL build checklist (for a later explicit import only)

1. Allocate the final HSPL page and alias; do not reuse an unrelated legacy page.
2. Validate HSPL equivalents for `VoucherDetail`, `Voucher`, `Party`, `Company`, `Location`, financial year and row-level scope before creating regions.
3. Implement the hierarchy, six bucket rules, opening exclusion and signs exactly; do not replace OPEX with a hand-picked group.
4. Provide from/to/company/location inputs. Omit MKSPL Panel UI and all `P705_PANEL` transfer values when HSPL has no equivalent scope column/function.
5. Build the statement, Closing Control and Reconciliation from the same shared SQL CTE contract so no card can disagree with its drill or export.
6. Preserve only the six scoped Trial Balance drills after equivalent HSPL Page 675 filters exist.
7. Build the custom download process rather than using default export.
8. Keep layout in the current compact HSPL theme: no portlet card redesign, no black hover treatment, no red buttons, no extra right panel.

## Acceptance tests

- Changing Company/Location changes statement, controls, reconciliation and export consistently.
- Opening amounts do not alter current-period P&L.
- Direct, depreciation, finance and tax are excluded from OPEX and formulas foot through PAT.
- Every bucket drill has the same filters and the selected Trial Balance total equals the source P&L bucket.
- Reconciliation is exact to less than ₹0.005 crore; induce a known classification omission in a test copy only to confirm a visible failure state.
- Download filename, frozen header, headings, signed values and no HTML markup are verified in Excel.

---

## Visual, interaction and accessibility supplement — verified 23 September 2026

This is the missing presentation-level record, captured read-only from MKSPL Page 705 live runtime, DOM and shared `design-system.css`. It is a reference description; HSPL must map it to its existing design tokens rather than introduce a second MKSPL-style shell.

### Presentation model

- Page 705 has **no KPI cards and no graphs**. Its visual centre is a compact financial statement, controls and reconciliation—not a portlet dashboard.
- Shared finance canvas/surface/tinted/ink/muted/border tokens are `#EEF0F6`, `#FFFFFF`, `#F6F7FC`, `#141A2E`, `#6B7391`, `#DFE2ED`; source palette is primary `#3730A3`, secondary `#4F46E5`, accent `#0E7490`, gold `#A16207`, success `#0F766E`, warning `#B45309`, danger `#B4243C` and slate `#4B5471`.
- The header is the shared `.ds-fin-head`: 16px rounded, 24px/26px/22px padding; layered `#252B45 → #171C31 → #0D1120` gradient with indigo/teal radial illumination, faint 26px grid, soft dark shadow and 3px indigo-to-teal bottom rule.
- Eyebrow is 10.5px/800 uppercase; title 33px/800 white; subtitle 13.5px muted white. It carries Period, Financial Year, Company, Location and Panel scope chips. The chips wrap, are 11.5px with 9px radius and subtle translucent border/fill.
- Three compact header CTAs sit as one right-aligned flex group with 10px gap: `Trial Balance ←`, `Monthly →`, `By Location →`. Each has amber-gold translucent gradient/border, 11px radius and 13.5px 700 text; hover raises it 1px and adds a gold glow. At <=900px the group becomes in-flow; at <=760px the title is 25px and header padding is 18px.

### Filters, control band and statement table

`p705Filters` is the common white dashboard filter card: 14px radius, 1px border, shallow shadow, 12px/16px padding, 18px lower gap. Labels are 10.5px, 800, uppercase, 0.07em tracking; text/date/select inputs and Apply are 34px high, 13px. In MKSPL it displays From Date, To Date, Company, Location, Panel and Apply. Do not expose Panel in HSPL without an existing equivalent scope mechanism.

`Closing Control` is intentionally a readable yellow/green decision band, not an alert button:

- warning: 1px `#F59E0B` border, `#FFFBEB` background, dark amber heading and `#FEF3C7` status pills;
- reconciled: `#86EFAC` border, `#F0FDF4` background, `#166534` heading and `#DCFCE7` status pills;
- body copy: 12.5px / 1.5; control headings 12px / 800 uppercase.

The `PROFIT AND LOSS` region is a white, bordered 14px card. Its native report header is pale blue-grey (`#EBF1F3`), 10px/800 uppercase headers and 9px × 12px cells. Body rows use tabular numeric figures; number columns are right-aligned in a monospace numeric face. The only intentional emphasis states are:

| Row kind | Live appearance |
| --- | --- |
| `less …` | grey `#4A5568`; first label indented 26px |
| subtotal: Contribution / EBITDA / EBIT / PBT | 700 weight, `#F7F9FC` fill and upper separator |
| final PAT | 800 weight, `#FFFBEB` fill, `#78350F` text, 2px finance-primary top rule |
| pending tax | amber `#92400E` italic |

The report’s normal hover is the shared light `#E6EEEC`, never dark. Links use a light focus outline. The header `Download` is a separate native-style action, not part of a card nor a red/destructive control.

### Exact navigation and interaction details

| Surface | Target/behavior | Scope preserved |
| --- | --- | --- |
| `Trial Balance ←` | Page 675 / Trial Balance Intelligence | from, to, company, location, panel |
| `Monthly →` | Page 706 / Monthly Profit and Loss | containing financial year, company, location, panel |
| `By Location →` | Page 707 / Location Profitability | from, to, company, panel; intentionally excludes selected location |
| Revenue | Page 675 `PNLBUCKET=REVENUE`, ledger-only | full Page 705 scope |
| less Direct Cost | Page 675 `PNLBUCKET=DIRECT`, ledger-only | full Page 705 scope |
| less Operating Expense | Page 675 `PNLBUCKET=OPEX`, ledger-only | full Page 705 scope |
| less Depreciation | Page 675 `PNLBUCKET=DEPN`, ledger-only | full Page 705 scope |
| less Finance Cost | Page 675 `PNLBUCKET=FIN`, ledger-only | full Page 705 scope |
| less Tax | Page 675 `PNLBUCKET=TAX`, ledger-only | full Page 705 scope |
| Contribution/EBITDA/EBIT/PBT/PAT | plain total rows | no link—each is a derived subtotal |
| `Download` | `DOWNLOADPNL` after-submit custom Excel | same current filter values; remains separate from any default report export |

The shared animated reveal uses a 420ms ease-out curve; all reveal, lift and chip transitions are disabled when `prefers-reduced-motion: reduce` is active. When implementing in HSPL, retain the semantic hierarchy and keyboard focus behavior but use the current HSPL layout, action-button alignment and non-red button tokens.
