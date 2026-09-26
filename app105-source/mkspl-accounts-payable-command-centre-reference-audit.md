# MKSPL reference audit — Accounts Payable Command Centre

## Read-only source and HSPL boundary

This specification records **MKSPL application 110, Page 708, `AP-COMMAND-CENTRE`**, audited from runtime and Page Designer on 23 September 2026. MKSPL was used only for reference; no source component, page, process, data or shared asset was changed.

If HSPL implementation is later authorized, keep HSPL's current design system. Do not copy MKSPL's data-scope `Panel` control into HSPL when HSPL does not have an equivalent. Do not build a separate portlet landing page, visual side panel, red action buttons, or a dark/black hover state.

## Identity and intent

| Property | MKSPL reference |
| --- | --- |
| Page/alias/group | 708 / `AP-COMMAND-CENTRE` / Payables Intelligence |
| Mode/template | Normal / Standard |
| Authentication/cache/reload | Required / application default browser cache, server cache disabled / always reload on submit |
| Dynamic actions/processes | None; Processing tree has no business process |

AP is the `SUNDRYCREDITORS` control-account subtree. It is **not** a Party Type report. The page help explicitly says the old alternative population misses accounts within the true creditor subtree and includes accounts outside it, so it cannot reconcile to the general ledger.

`GRIRACCOUNT`/GRNI is deliberately outside this payable total because it is not under `SUNDRYCREDITORS`; it has its own unbilled-liability page and GL tie-out.

## Canonical payable model

One open line is one `VoucherDetail` line. The sign is the AR mirror:

```sql
payable = VoucherDetail.Amount - effective_allocation
```

Positive is open credit/payable. Negative is vendor debit: advance, unapplied payment, contra sale or debit note. The allocation bridge applies negative allocation to debit lines and positive allocation to credit lines. It counts only when both voucher headers exist and are dated on/before the selected as-of date.

The page's own audit says no current orphan allocation touches the AP control account, but preserves the two-header join so a future orphan cannot corrupt a historical as-of result.

`To Date` is both inclusive flow end and as-of date. `From Date` changes only payments, bill bookings and debit-note flows—not position, ageing or advances.

## Filters

| Item | Default/behaviour | Semantic meaning |
| --- | --- | --- |
| `P708_FROMDATE` | financial year begin | flow-window start |
| `P708_TODATE` | current date | as-of date plus flow end |
| `P708_COMPANY` | all/null; only creditors with movement | company scope |
| `P708_LOCATION` | all/null; cascade on Company | location scope |
| `P708_PANEL` | A/B selector when no enforced user scope | MKSPL-only access scope |
| `P708_AGEBASIS` | DUE radio in inline drawer | Due Date or Document Date |
| `APPLY` | hot submit with refresh icon | recompute dashboard |
| `OPENFILTERS` | opens `p708Drawer` | select Ageing Basis |
| `RESETFILTERS` | reset redirect | clear drawer inputs |

## Shared CTE and source-date hierarchy

Every financial region repeats the canonical AP CTE instead of querying a pre-aggregated balance:

1. Recursively select `SUNDRYCREDITORS` descendants.
2. Construct `Asof` from `P708_TODATE`.
3. Construct effective allocations from `DrCrAllocation`, retaining only both-side voucher pairs dated on/before `Asof`.
4. Aggregate allocation by line and calculate `Pay = Amount - allocation` for posted control-account lines on/before `Asof`.
5. Apply user-level MKSPL scope, optional panel, Company and Location.
6. Calculate the general-ledger control sum in the same SQL statement for read-consistent tie-out.

### Bill/document/due date derivation

| Source type | Document date | Due date |
| --- | --- | --- |
| `PBPASS` | Party Bill Date, falling back to Purchase Bill Date | Purchase Bill Date + Purchase Order credit days, falling back to party credit days |
| `JBPASS` | Party Bill Date, falling back to Job Bill Date | Job Bill Date + Job Order credit days |
| `OPENING` | `AccountOpening.BillDate` | `AccountOpening.BillDueDate` |
| other voucher | voucher date for Document Age | no due date unless a supported source above supplies it |

The due-basis disclosure must state that due dates cover about one third of current open value: ~93% of trade purchase bills but almost none of opening carry-forward. `Party.CreditDays` exists on only two creditor accounts and cannot safely infer missing terms.

### Ageing buckets

0 = Not Due; 1–3 = 1–30/31–60/61–90; 4–6 = 91–180/181–365/over 365; 7 = Cannot Age. Due basis uses lateness and sends missing due date to bucket 7. Document basis measures age from source document and therefore covers all rows. Weighted days overdue excludes no-due items from both the amount-weighted numerator and denominator.

## Page composition

1. **Accounts Payable Command Centre** header.
2. **Filters** and **Advanced Filters** drawer.
3. **Payable Position** band.
4. **Measurement Basis** dynamic disclosure.
5. **Payables Pulse** then primary and secondary KPI strips.
6. **Ageing** and **Ageing Distribution**.
7. Seven charts.
8. **Control and Traceability**, exceptions, unsupported-measure disclosure, privilege-aware sibling navigation.

### Position band

- Gross Outstanding Payable = positive open credits.
- Vendor Debits Held = absolute negative open amounts; never net it silently out of the headline.
- Net Vendor Liability = signed payable less vendor debit.
- Counts vendors owing/owed separately.
- Validates `Net` against `SUM(VoucherDetail.Amount)` for control-account descendants in the same query. Threshold: absolute difference `< 0.005`; failure displays exact rupee difference.

## Measurement-basis safety notices

- Historical as-of dates before 01-04-2026 are not valid because the detailed ledger starts at cutover and pre-history appears as opening journals.
- Due basis quantifies `Cannot Age`; it does not hide missing due dates.
- Document basis is stated as age, not lateness.
- Only opening lines that retained original bill date can be aged prior to cutover. Others are floored at cutover and traced by `AP-O01`.

## Primary KPI strip — definitions and links

| KPI | Definition | MKSPL drill |
| --- | --- | --- |
| Gross Outstanding Payable | positive open control-account lines | 709 Vendor-wise Payable, focus ALL |
| Not Yet Due | bucket 0; unavailable under Document basis | 710 Bill-wise Payable, bucket 0 |
| Total Overdue | buckets 1–6, excluding Cannot Age | 710, bucket OD |
| Cannot Age — No Due Date | bucket 7, forced Due basis | 710, bucket 7 |
| 90+ Days | buckets 4–6; includes 180+ and weighted days | 710, bucket 90 |
| Payments in Period | actual negative AP lines for PAYMENT/CASHPAYMENT/BANKPAYMENT; not movement in outstanding | 712 Payments and Settlement |
| Vendor Advances / Unapplied | negative open payment lines | 713 Advances and Unapplied Payments |
| Payable + Advance Together | vendors with both positive and negative open position | 713, `P713_BOTH=Y` |
| Internal Vendors | active parties with `IsCompanyAccount=YES` | 709, focus INTERNAL |
| Internal Payable | gross positive AP for same internal population | 709, focus INTERNAL |

## Secondary strip — definitions and links

| KPI | Rule |
| --- | --- |
| 180+ / 365+ | due-date past-due open AP; Page 710 buckets 5 and 6 |
| Active / Overdue Vendors | non-zero vendor position / at least one past-due positive item; Page 709 |
| Due Next 7 / 30 | due strictly after as-of through +7/+30; Page 710 |
| Weighted Days Overdue | amount weighted over valid-due-date positive AP; Page 710 WTD |
| Top 10 Concentration | ten largest positive vendor payables / gross AP; Page 709 |
| Old Unapplied Payments | open negative payments older than 90 days; control `AP-P03`, Page 715 |
| Critical Exceptions | exact critical predicate and drill Page 715 category CRITICAL: old unapplied payments, unposted bill pass, cross-company allocation, over-allocation, orphan AP allocation and null scope |
| Unbilled Liability (GRNI) | `OpenGRIRCost` PENDING joined to GRN; Page 714; explicitly separate from AP |
| Payment Approval Pending | `PaymentAdvice` not done and dated on/before as-of; Page 712 |
| Due Today | open positive AP with due date exactly as-of; Page 710 DT |
| Vendors Above Credit Limit | shown as a non-numeric explicit exclusion because creditor `Party.CreditAmount` is populated on zero accounts |

## Charts

| Chart | Exact analytical meaning |
| --- | --- |
| What the Open Balance Is Made Of | classifies open lines into purchase/job/freight/cash purchase/necessity/service bill, debit note, bill discounting, contra sale, payment, receipt/credit-in or journal; positive payable and vendor debit in ₹ lakh |
| Top Vendors by Net Exposure | top 12 vendors by positive payable with paired vendor debit; explicit outer ordering retains bar order |
| Top Overdue Vendors | top 12 positive due-date past-due vendors, including component 90+ value |
| Vendor Concentration | exhaustive donut bands Top 5 / 6–10 / 11–25 / other; numeric prefixes force correct rank order because MKSPL donut sorts labels alphabetically |
| Overdue Movement | monthly as-of spine, re-evaluating allocations per month end; overdue, 90+, Cannot Age in ₹ crore |
| Exception Trend | monthly count of Cannot Age, old unapplied payments, opening without bill date |
| Bills Booked vs Payments Made | flow-only monthly series: posted AP booking module set, payment across PAYMENT/CASH/BANK, debit note separately; ₹ lakh |

## Controls and disclosures

Exception cards:

- `AP-B01` bill passes never posted to ledger (approved liability missing from GL),
- `AP-B05` duplicate supplier bill number groups within vendor,
- `AP-O01` opening AP with age understated,
- AP-vs-GL reconciliation on Page 716, including cross-company allocation count.

Unsupported-measure disclosure must state, rather than fake:

- zero usable vendor master credit limits,
- credit days exist on only two creditor masters and document-derived due dates remain the reliable route,
- payment-mode coverage is limited to Payment Advice although bank can be inferred from contra account across payments,
- no reversal/cancellation state; only deletion/orphan traces exist.

## Privilege-aware navigation

The `Go to` cards are emitted only for pages authorised for the signed-in user (with `BOSS` bypass matching menu behaviour): 709–716 and 718–721. They cover vendor list, bill list, Creditor 360, payments, advances, GRNI, exceptions, reconciliation, forecast/trends, Daily Payment MIS, Weekly Review and Monthly MIS. Bill Detail Page 717 is excluded because it needs a specific `(Tno,Sno)` line context.

## HSPL build conditions and acceptance criteria

1. Verify every table/module relationship in HSPL first; PBPASS/JBPASS source joins cannot be guessed.
2. Port the canonical open-item contract once and reuse it across all regions; all KPI counts must match their drill predicates.
3. Preserve GRNI exclusion and separate it only when an HSPL GRNI page can reconcile to the appropriate control account.
4. Build all target pages before making their cards clickable; otherwise show planned features as non-clickable.
5. Do not expose the MKSPL `Panel` UI in HSPL. Use existing HSPL authorization condition only if it is already a trustworthy equivalent.
6. Verify an after-as-of payment does not settle the historical position; verify all eight ageing branches, plus positive/negative signs.
7. Test that the vendor/AP tie-out, control counts, GRNI value, payment-flow amount and every chart all use the same Company/Location/as-of scope.
8. Follow current compact HSPL form/report styling; do not copy a dark chart hover, extra sidebar, portals or default APEX export behaviour.

---

## Visual, chart and interaction supplement — verified 23 September 2026

This supplement captures the live Page 708 presentation and JET runtime configuration. It is a complete MKSPL reference, not authorization to introduce a new MKSPL visual shell into HSPL.

### Theme, header and responsive layout

- Source canvas/surface/tinted/ink/muted/border: `#F1EEE8`, `#FFFFFF`, `#F8F4EE`, `#241A0E`, `#82755F`, `#E3DACB`.
- Source AP semantic colors: primary `#7A5717`, secondary `#8A4B2A`, indigo accent `#3730A3`, violet `#6D28D9`, gold `#A16207`, success `#0F766E`, warning `#B45309`, danger `#B4243C`, slate `#5C5344`; payable `#59391B`; vendor debit `#1B4C55`. Map these roles to HSPL tokens at import.
- `.ds-ap-head` is a 16px rounded gold/brown gradient (`#5E430F → #7A5717 → #96691C`) with upper-right white radial highlight, 22px/26px/18px padding, 25px/700 white title and 13px subtitle. It contains `FINANCE · ACCOUNTS PAYABLE`, the scoped description and chips for as-of, flow period, ageing basis, company, location, Panel, base currency and last posting.
- Chips are 11.5px rounded translucent capsules. MKSPL Panel is a scope chip/control only; it must not create a visual panel in HSPL.
- Filters use the common white 14px rounded/1px bordered card, compact 10.5px uppercase labels and 34px controls: From Date, To Date/As-of, Company, Location, Panel, Apply, Ageing Basis. The age-basis button opens the drawer; it does not replace a page section.
- **Payable Position** is exactly three equal cells at desktop / 12px gap: Gross Outstanding Payable uses payable brown left rule, Vendor Debits Held uses debit teal left rule, Net Vendor Liability uses primary-gold rule and tinted backing. At <=1024px it is one cell per row.

### KPI, ageing and disclosure layout

The source uses responsive report grids, not portlet tiles: five KPI cards per row, stepping to four <=1400px, three <=1100px, two <=820px, one <=600px. Cards are white 14px-radius surfaces with 3px semantic left rule, 15px/16px/14px padding, 38px tile, 10px uppercase title, 26px tabular number and 11px supporting text. Hover elevates only 3px and lightens its shadow; focus-visible has a 2px outline. This is incompatible with a dark/black hover and must be mapped to HSPL’s approved light hover.

Primary-card order/style in the live page:

1. Gross Outstanding Payable — gold/inbox;
2. Not Yet Due — success/calendar-check;
3. Total Overdue — amber/exclamation;
4. Cannot Age — indigo/question;
5. 90+ Days — danger/fire;
6. Payments in Period — teal/upload;
7. Vendor Advances / Unapplied — violet/hand;
8. Payable + Advance Together — amber/random;
9. Internal Vendors — slate/building;
10. Internal Payable — gold/inbox.

Secondary layout continues as: 180+ amber; 365+ danger; Active Vendors teal; Overdue Vendors amber; Due Next 7/30 success; Weighted Days indigo; Top 10 Concentration gold; Old Unapplied Payments violet; Critical Exceptions danger; Unbilled Liability and Payment Approval Pending teal; Due Today success. `Vendors Above Credit Limit — NOT MEASURABLE` is a plain, non-clickable disclosure—not zero, no fake KPI and no link.

The ageing bar is 30px tall, 8px-rounded and uses the same exact bucket progression as AR: `#0F766E`, `#0E7490`, `#0369A1`, `#A16207`, `#B45309`, `#9A3412`, `#B4243C`, `#6D28D9` for Not Due through Cannot Age. Its legend has 9px square keys and tabular amounts; hover brightens segments by 12% only.

### Chart inventory — exact live JET settings

Charts sit inside white 14px dashboard panels with pale-tinted 12px/16px headers and the common small title dot. Every chart has an on/bottom legend, `hoverBehavior=dim`, rescale on legend hide/show, automatic display/data animation, auto-rotated category labels, unstacked vertical orientation and zoom/scroll off. Observed base series colours are blue `rgb(48,159,219)`, green `rgb(60,175,133)`, yellow `rgb(251,206,74)`, then red `rgb(233,91,84)` when a fourth series exists.

| Region | Exact type / height / interaction | Series & axis | No-data message |
| --- | --- | --- | --- |
| What the Open Balance Is Made Of | vertical bar, 340px, single selection | Payable / Vendor Debit; `Open Balance (₹ Lac)` | `No open item in this scope.` |
| Top Vendors by Net Exposure | vertical bar, 340px, no point selection | Payable / Vendor Debit; `Open Balance (₹ Lac)` | `No vendor carries an open payable in this scope.` |
| Top Overdue Vendors | vertical bar, 340px, no point selection | Overdue / Of which 90+; `Overdue (₹ Lac)` | `No vendor is overdue in this scope on the due-date basis.` |
| Vendor Concentration | donut, 340px, single selection, 50% inner radius, highlight selection, `otherThreshold=0` | Top 5 / Rank 6–10 / Rank 11–25 / All other vendors | `No vendor carries an open payable in this scope.` |
| Overdue Movement | vertical line, 330px, single selection | Overdue / 90+ Days / Cannot Age; `₹ Crore` | month-end reconstruction message recorded in runtime |
| Exception Trend | vertical bar, 330px, single selection | Cannot Age / Old Unapplied Payments / Opening, No Bill Date; `Exception items, by transaction month` | `No exception-bearing transaction in this window.` |
| Bills Booked vs Payments Made | vertical bar, 330px, single selection | Bills Booked / Payments Made / Debit Notes; `₹ Lac` | `Nothing was booked or paid in this period for the selected scope.` |

The first three charts submit Ageing Basis with their scope; concentration, movement, exception and flow charts intentionally do not. That separation mirrors their business definitions and is part of the implementation contract.

### Navigation, disclosure and functional visual rules

- Existing KPI cards are real anchors with scope-preserving targets: Pages 709 (vendor outstanding), 710 (open items), 712 (payments), 713 (advances), 714/716 (controls/reconciliation) and declared filtered variants. Never make a navigational-looking HSPL card clickable before its target exists.
- `Go to` is a responsive series of 12 teal link cards for authorized targets: advances, daily MIS, exceptions, GRNI, monthly MIS, bill-wise, payments, reconciliation, trends/cash forecast, vendor-wise, weekly review and Creditor 360. Bill Detail Page 717 is excluded because it requires a concrete line key.
- Non-measurable/measurement-basis material uses semantic left-border narrative notes; it is not a dismissible alert and missing data is never rendered as 0.
- Page 708 has no dedicated custom Excel process/button. Retain native report behavior only where it exists; do not add a custom Excel affordance merely for visual symmetry.
- Respect `prefers-reduced-motion`: card and ageing hover/reveal transitions switch off. Preserve keyboard focus visibility and light report-row hover. There must be no red action buttons, dark hover or extra panel when translated to HSPL.
