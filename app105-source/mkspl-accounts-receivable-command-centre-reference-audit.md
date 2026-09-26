# MKSPL reference audit — Accounts Receivable Command Centre

## Reference scope

Read-only audit of **MKSPL application 110, Page 690, `AR-COMMAND-CENTRE`**, in Page Designer and runtime on 23 September 2026. MKSPL is reference-only: no save, change, import or data mutation was made.

Future HSPL work must retain the current HSPL theme/layout. MKSPL's `Panel` item is a data-access scope only; it must not become an HSPL UI panel. Where HSPL lacks an equivalent security mechanism, omit it consistently from filters, SQL, links and exports.

## Page purpose and accounting truth

AR is **the `SUNDRYDEBTORS` control-account subtree**, not `Party.PartyTypeCode`. The page help records why: the legacy alternative omits real debtor accounts and admits non-debtors, so it cannot tie to general ledger.

An open item is one `VoucherDetail` row. AR sign is:

```sql
receivable = -(VoucherDetail.Amount - effective_allocation)
```

Debit/open receivable is positive; credit/unapplied money is negative. An allocation is included only when **both** linked voucher headers exist and both dates are on or before the selected as-of date. That means a bill paid later remains open at an earlier as-of date. Orphan allocations are excluded from the effective allocation calculation; the audit records that one orphan would otherwise overstate AR by ₹34,119.

`To Date` is the as-of date for all balances, ageing and advances. `From Date` bounds only flow measures: billing, receipts, credit notes and allocations made.

## Base configuration

| Property | MKSPL reference |
| --- | --- |
| Page/alias/group | 690 / `AR-COMMAND-CENTRE` / Receivables Intelligence |
| Mode/template | Normal / Standard |
| Authentication/cache/reload | Required / application default browser cache, server cache disabled / reload always |
| Page JavaScript/CSS | No page-specific code |
| Dynamic actions/processes | None; Processing tree has no executable process |

## Filters, defaults and user contract

| Item | Default/behaviour | Contract |
| --- | --- | --- |
| `P690_FROMDATE` | current financial-year beginning | Flow-window start only |
| `P690_TODATE` | current day | flow end and balance/ageing as-of date |
| `P690_COMPANY` | all companies/null | LOV has actual `SUNDRYDEBTORS` ledger movement |
| `P690_LOCATION` | all locations/null; cascades on Company | LOV likewise has scoped AR activity |
| `P690_PANEL` | A/B, only visible if no user scope exists | MKSPL-only scope mechanism |
| `P690_AGEBASIS` | DUE | Drawer radio: Due Date or Document Date |
| `APPLY` | hot submit / refresh icon | recomputes every region |
| `OPENFILTERS` | `apex.theme.openRegion('p690Drawer')` | opens Ageing Basis drawer |
| `RESETFILTERS` | redirect reset | resets drawer filters |

The age-basis help is an explicit governance rule: Due Date measures **lateness**, but source due dates cover only part of the book, so uncovered open value becomes `Cannot Age`; it is never hidden or randomly spread. Document Date measures **age**, covers every item, and matches existing legacy ageing reports—but is not falsely called lateness.

## Shared open-item CTE contract

Every AR region uses the same conceptual CTE chain:

1. `Sd`: all accounts descended from `SUNDRYDEBTORS`.
2. `Asof`: `TO_DATE(:P690_TODATE,'DD-MM-RRRR')`.
3. `Alc`: allocate `-Amount` to debit line and `+Amount` to credit line; join both voucher headers and enforce date `<= Asof` on both.
4. `Al`: aggregate allocation per voucher line.
5. `Oi`/`Aged`: AR line is `-(d.Amount - NVL(al.Amt,0))`; include only control-account descendants posted at or before as-of and current user/company/location scope.
6. `Gl`: direct signed control-account sum from ledger, calculated inside the same query snapshot.

Due-date source precedence is `Invoice.DueDate`, `ServiceBill.DueDate`, then `AccountOpening.BillDueDate`. Document-date ageing uses `Invoice.InvoiceDate`, `AccountOpening.BillDate`, then voucher date.

### Standard ageing buckets

| Bucket | Rule |
| ---:| --- |
| 0 | Due basis only: due date on/after as-of (`Not Due`) |
| 1–3 | 1–30, 31–60, 61–90 days |
| 4–6 | 91–180, 181–365, over 365 days |
| 7 | Due basis with no source due date (`Cannot Age`) |

When document basis is selected, every line is bucketed from document age. Weighted days overdue uses only items with a valid due date in both numerator and denominator.

## Region inventory and exact behaviour

1. **Accounts Receivable Command Centre** — scoped header band.
2. **Filters** and **Advanced Filters** drawer.
3. **Receivable Position** — Gross Outstanding, Customer Credits Held, Net Customer Exposure.
4. **Measurement Basis** — conditional, data-driven caveats.
5. **Receivables Pulse** static heading.
6. **Receivables KPIs** — ten drillable cards.
7. **Secondary KPIs** — eleven cards/disclosures.
8. **Ageing** static heading and **Ageing Distribution** visual scale.
9. Seven analytical charts.
10. **Control and Traceability**, **Exceptions and Controls**, measurement disclosure and privilege-aware quick links.

### Position band

Gross is positive open debit value, credit held is absolute negative open value, and net is their signed sum. It displays debtor counts separately. It executes a GL tie-out inside the same statement; a difference under ₹0.005 is success, otherwise the exact difference is rendered as a visible failure.

### Conditional basis disclosures

- Before 01-04-2026: blocks reliance on historical AR because ledger data starts at cutover and old positions arrive as opening journals.
- Due basis: quantifies values without due date, says `Party.CreditDays`/`CreditAmount` are insufficient, and directs the user to `Cannot Age` or Document Date.
- Document basis: says clearly that it measures age, not lateness.
- Post-cutover: explains that only migrated original bill dates can show pre-cutover ageing; other opening lines have age understated and control `AR-O01`.

## Primary KPI strip and drill targets

All cards build `apex_page.get_url` and carry from/to/company/location/panel/age basis. In HSPL, carry only the supported input set.

| KPI | Definition | Target |
| --- | --- | --- |
| Gross Outstanding | positive open AR | 691 Party-wise Outstanding, focus ALL |
| Not Yet Due | bucket 0; unavailable under Document basis | 692 Bill-wise Outstanding, bucket 0 |
| Total Overdue | buckets 1–6; excludes Cannot Age | 692, bucket OD |
| Cannot Age — No Due Date | bucket 7, forced Due basis | 692, bucket 7 |
| 90+ Days | buckets 4–6, shows 180+ and weighted days | 692, bucket 90 |
| Receipts in Period | actual `RECEIPT` debtor voucher lines, not balance fall | 694 Receipts and Collections |
| Unapplied Cash | open negative Receipt/On-account lines | 695 Advances and Unapplied Cash |
| AR + Advance Together | parties with both debit and credit open | 695, `P695_BOTH=Y` |
| Internal Debtors | live parties flagged `IsCompanyAccount=YES` | 691, focus INTERNAL |
| Internal Outstanding | gross AR for the same internal population | 691, focus INTERNAL |

## Secondary KPIs

| Card | Definition/drill |
| --- | --- |
| 180+ / 365+ | due-date overdue exposures; Page 692 buckets 5/6 |
| Active / Overdue Debtors | live party count / parties with a past-due item; Page 691 |
| Due Next 7 / 30 Days | due after as-of through +7/+30, Page 692 |
| Weighted Days Overdue | amount-weighted days across due-dated open AR only, Page 692 WTD |
| Top 10 Concentration | largest ten parties / gross AR, Page 691 |
| Old Unapplied Cash | receipt credits older than 90 days, control `AR-R03`, Page 696 |
| Critical Exceptions | exact same critical predicate as Page 696 category CRITICAL |
| Customers Above Credit Limit | uses latest valid `CreditLimitApproval` by party/company/location/as-of date; values above ₹1,000 crore are treated as no effective ceiling, not safe credit headroom |

## Charts

| Chart | Metric and rules |
| --- | --- |
| What the Open Balance Is Made Of | Classifies open positions as opening, invoice/service bill, credit/debit note, contra purchase, receipt/on-account, payment-to-customer or journal; displays positive receivable and held credit in ₹ lakh |
| Top Debtors by Net Exposure | top 12 parties by positive AR; paired receivable/credit, explicit outer order to preserve bar sequence |
| Top Overdue Debtors | top 12 positive due-date overdue parties and component over-90 value |
| Customer Concentration | exhaustive gross AR donut bands: Top 5, rank 6–10, 11–25, all others |
| Overdue Movement | monthly as-of spine from From through To; recomputes effective allocations at each month end, then overdue, 90+ and Cannot Age in ₹ crore |
| Exception Trend | monthly count of Cannot Age, old unapplied cash, and opening lines without bill date |
| Billing vs Collection | flow-only monthly series: sale/service-bill debit billing, receipt credit collection, credit note separately; ₹ lakh |

## Controls, disclosures and navigation

**Exceptions and Controls** cards:

- `AR-A05` orphan allocations (drill Page 696),
- `AR-B05` duplicate invoice-number groups within Company,
- `AR-O01` opening AR with age understated,
- full AR-vs-GL reconciliation Page 697.

The page also explains what cannot be faithfully calculated: incomplete credit limits/terms, payment mode coverage, and absence of cancellation/reversal state. It must never show missing measures as zero.

The privilege-aware `Go to` strip only renders permitted links: Pages 691–697, 699–702 (Party-wise, Bill-wise, Debtor 360, Receipts, Advances, Exceptions, Reconciliation, Trend, Daily/Weekly/Monthly MIS). Page 698 is deliberately absent because a bill line key is required.

## HSPL implementation and verification requirements

1. Confirm HSPL schema and sign conventions before porting any SQL; do not assume an AR report's legacy party type equals the control account.
2. Create a single shared canonical open-item CTE/query package pattern; every KPI, chart and drill must use it.
3. Recreate due-date coverage honesty and `Cannot Age`; never fill blanks with made-up credit days.
4. Build every KPI target before making its card clickable. Unavailable targets must remain non-clickable.
5. Preserve the full-paise reconciliation threshold and compute both sides in one query snapshot.
6. Use current HSPL compact design only: no MKSPL panel UI, no separate portal/portlet shell, no dark hover, no red action buttons.
7. Test cut-off allocation using a bill settled after as-of; it must remain open at historical as-of.
8. Test all seven bucket boundaries, Document versus Due basis, Company/Location cascade, drill filter carry-through, and each control count against its target predicate.

---

## Visual, chart and interaction supplement — verified 23 September 2026

This supplement records the live Page 690 presentation and generated JET configuration. It closes the former gap between the accounting audit and a reproducible UI build. MKSPL remains source-only; reproduce the information hierarchy in HSPL’s existing compact theme, not a second MKSPL shell.

### Theme, header and responsive layout

- Source canvas/surface/tinted/ink/muted/border: `#EBF1F2`, `#FFFFFF`, `#F4F8F8`, `#0E2226`, `#6A7F84`, `#D9E4E5`.
- Source AR semantic colors: primary `#0B6470`, secondary `#0E7490`, indigo accent `#3730A3`, violet `#6D28D9`, gold `#A16207`, success `#0F766E`, warning `#B45309`, danger `#B4243C`, slate `#476066`; receivable `#1B4C55`; customer credit `#5A4632`. Use only equivalent HSPL semantic tokens on import.
- `.ds-ar-head` is a 16px rounded teal gradient (`#0B6470 → #0E7490 → #12889B`) header with a top-right soft white radial glow, 22px/26px/18px padding, 25px/700 white title and 13px subtitle. It states `FINANCE · ACCOUNTS RECEIVABLE`, then title/subtitle and scope chips for as-of, flow period, ageing basis, company, location, Panel, base currency and last posting.
- Scope chips are compact rounded capsules (11.5px, 4px × 10px padding). The live chip is a stronger translucent white. The header itself is display information—not a clickable panel.
- The common filter surface is white, 14px rounded, 1px border/shallow shadow. Inputs and Apply are 34px tall; uppercase labels are 10.5px/800. Desktop order is From Date, To Date/As-of, Company, Location, Panel, Apply and Ageing Basis. `Ageing Basis` opens the filter drawer; no hidden black overlay is part of the dashboard content.
- Three **Receivable Position** cells render in a single equal-width grid with 12px gap: Gross Outstanding has a receivable left rule, Customer Credits Held a credit left rule, and Net Customer Exposure a teal left rule plus tinted background. Each cell is 14px/16px padded, 14px radius, 23px tabular value and 10.5px uppercase label. At <=1024px it becomes one column.

### KPI cards and non-card disclosures

The `Receivables Pulse` and `Control and Traceability` headings are small uppercase section bands with a rule to the right. KPI wrappers are grid reports, not portlets: 5 equal cards per row; then 4 <=1400px, 3 <=1100px, 2 <=820px, 1 <=600px. A standard card has a 3px semantic left edge, white 14px-radius surface, shallow shadow, 15px/16px/14px padding, 38px icon tile, 10px uppercase title, 26px tabular figure and 11px explanatory line. Hover lifts only 3px with a light shadow; focus-visible gets a 2px outline. No card or chart has a dark/black hover.

The live primary-card color/order contract is:

1. Gross Outstanding — gold/inbox;
2. Not Yet Due — success/calendar-check;
3. Total Overdue — amber/exclamation;
4. Cannot Age — indigo/question;
5. 90+ Days — danger/fire;
6. Receipts in Period — teal/download;
7. Unapplied Cash — violet/hand;
8. AR + Advance Together — amber/random;
9. Internal Debtors — slate/building;
10. Internal Outstanding — gold/inbox.

Secondary cards retain the same size and sequence: 180+ (amber), 365+ (danger), Active Debtors (teal), Overdue Debtors (amber), Due Next 7/30 (success), Weighted Days (indigo), Top 10 Concentration (gold), Old Unapplied Cash (violet), Critical Exceptions (danger). `Customers Above Credit Limit` is a non-clickable disclosure when the metric is not measurable—do not manufacture a zero card or a dead link.

Ageing is a 30px horizontal segmented bar with 8 exact colors: Not Due `#0F766E`, 1–30 `#0E7490`, 31–60 `#0369A1`, 61–90 `#A16207`, 91–180 `#B45309`, 181–365 `#9A3412`, >365 `#B4243C`, Cannot Age `#6D28D9`. It has a 9px square keyed legend with values below; segment hover only brightens 12%.

### Chart inventory — exact live JET settings

All source charts are inside white 14px dashboard panels, with 12px/16px pale-tinted headers and a small coloured dot. JET series legend is **on at bottom**; hover behavior is `dim`; legend hide/show rescales; display/data animations are `auto`; zoom/scroll is **off**; value/axis converter uses decimal with zero fraction digits and no scaling. X labels auto-rotate. First-series paint is `rgb(48,159,219)`, second `rgb(60,175,133)`, third `rgb(251,206,74)`, fourth `rgb(233,91,84)` where used; this is the observed source series sequence.

| Region | Exact type / height / interaction | Series & axis | No-data message |
| --- | --- | --- | --- |
| What the Open Balance Is Made Of | vertical bar, 340px, single selection, unstacked | Receivable / Customer Credit; `Open Balance (₹ Lac)` | `No open item in this scope.` |
| Top Debtors by Net Exposure | vertical bar, 340px, no point selection, unstacked | Receivable / Credit Held; `Open Balance (₹ Lac)` | `No customer carries an open receivable in this scope.` |
| Top Overdue Debtors | vertical bar, 340px, no point selection, unstacked | Overdue / Of which 90+; `Overdue (₹ Lac)` | `No customer is overdue in this scope on the due-date basis.` |
| Customer Concentration | donut, 340px, single selection, 50% inner radius, highlight selection, `otherThreshold=0` | Top 5 / Rank 6–10 / Rank 11–25 / All other customers | `No customer carries an open receivable in this scope.` |
| Overdue Movement | vertical line, 330px, single selection, unstacked | Overdue / 90+ Days / Cannot Age; `₹ Crore` | month-end reconstruction message recorded in runtime |
| Exception Trend | vertical bar, 330px, single selection, unstacked | Cannot Age / Old Unapplied Cash / Opening, No Bill Date; `Exception items, by transaction month` | `No exception-bearing transaction in this window.` |
| Billing vs Collection | vertical bar, 330px, single selection, unstacked | Billing / Collection / Credit Notes; `₹ Lac` | `Nothing was billed or collected in this period for the selected scope.` |

The first three charts include the ageing-basis item in their submitted page items. Concentration, trend, exception and billing/collection intentionally do not; they use the precise scope stated in their canonical calculation. This difference must be preserved, not accidentally unified.

### Live links, controls and UX constraints

- Every primary/secondary KPI that exists is a real anchor with an exact scoped target. The first set targets Pages 691 (party outstanding), 692 (open items), 694 (collections), 695 (advances) and the filtered variants recorded above; it never uses JavaScript-only dead cards.
- Controls cards target Pages 696/697 or their declared drill. The `Go to` strip is **11** teal link cards and is rendered only when the user is authorised. Its exact targets are Pages 691–697 except 698, plus 699–702; it carries current source scope and omits Page 698 because that needs a bill-line key.
- Measurement/unsupported-measure narratives are content-first boxed notes with a 3px left semantic border: neutral/info, warning or stop. They are not dismissible alerts and never render missing inputs as zero.
- Page 690 has no custom Excel button/process. Do not invent one when copying it. Default APEX report behavior remains native where the source has one.
- Reduced-motion preference disables card/segment transitions; mobile remains one exposure cell and progressively fewer KPI columns. Implement keyboard focus and real anchors before making any HSPL card clickable.
