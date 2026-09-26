# HSPL Sales Lifecycle Control Tower parity audit

Reference: HSPL application 900, page 730. Target: Ironmart application 105, page 721.

## Audit result

The earlier Ironmart page was not a structural parity build. It compressed several HSPL Interactive Reports into custom HTML, replaced native charts with approximations, omitted drill-state regions and reused one generic register. This caused empty sections, uneven register behaviour, non-native sticky headers, incorrect hover summaries and incomplete linked-page coverage.

## Required HSPL structure

- Hero, quick links, filters, quick periods and three-step usage guide.
- Lifecycle Pulse: Executive KPIs and Fulfilment Health.
- Sales Lifecycle Register Flow.
- Four native follow-up reports: Sales Confirmation, Sales Order, Vehicles Inside and CC Invoice.
- Lifecycle Trend chart.
- Bottlenecks cards.
- Action Centre: Exception Mix, Handoff Pressure and Stage Documents.
- Vehicle Control Tower: Vehicle KPIs and Vehicle Operational Detail.
- Commercial Analytics: Category Mix, Category 360, Item Performance, Top Customers and Agent Performance.
- Sales Confirmation Balance, Sales Confirmation 360 and Vehicle 360 registers.
- Customer Collections & Balance and Customer Credit Limit & Exposure.
- Category Flow summary and confirmation-vs-order detail.
- Exception Summary by Condition and Documents Behind the Selected Exception.
- Protected AJAX drill state for register, stage, exception, vehicle and category-flow selections.

## Ironmart compatibility mapping

| HSPL | Ironmart |
| --- | --- |
| Page 730 | Page 721 |
| Confirmation 360 page 731 | Page 722 |
| Order 360 page 734 | Page 723 |
| Vehicle 360 page 732 | Page 724 |
| Category 360 page 733 | Page 725 |
| Confirmation register page 520 | Page 701 |
| Sales order register page 16 | Page 170 |
| Dispatch register page 77 | Page 160 |
| Material-out / gate register | Page 167 |
| Weighment register page 314 | Page 132 |
| CC invoice register page 56 | Page 174 |
| Customer 360 page 655/693 | Page 511 |
| Item analysis page 656 | Page 726 |

## Implementation decision

Use the downloaded HSPL page export as the authoritative component model, preserve all native APEX reports/charts/cards and static IDs, remap only page/item references, and deploy the two HSPL chart/runtime assets into App 105. This preserves HSPL styling, hover, sticky report headers, report Actions/Search/Rows controls and click-through behaviour instead of recreating them approximately.

HSPL's unqualified `GetUserPanelAB_apex()` is mapped to the existing, executable `SAGAR.GetUserPanelAB_apex()` function. The panel guard remains server-enforced; it is not replaced with an unrestricted/null predicate. Ironmart's lifecycle source tables do not store a panel column, so the compatibility views classify their existing rows as Panel A, matching the current user's enforced Panel A context instead of silently excluding every row.

## Runtime verification

Verified in the live Ironmart application after deployment on 24-Sep-2026:

- Main page loads the complete HSPL region structure with no visible ORA/ERR/condition-processing error.
- Active period `01-08-2026 – 24-09-2026` renders live data: 549 confirmations, 871 orders and ₹50.23 Cr invoiced value.
- The three primary SVG chart surfaces render at full card dimensions (trend, exception mix and category mix); HSPL runtime/chart assets are used unchanged apart from enabling target page 721.
- Bottleneck drill `Order to dispatch` opens the native Stage Documents report with 372 records and Ironmart-specific next actions.
- Vehicle KPI drill refreshes the native Vehicle Operational Detail report and returns an explicit no-match state when the selected condition has no data.
- All eight lifecycle register links were opened and checked: Confirmation, Sales Order, Dispatch Advice, Gate In, First Weight, Second Weight, Gate Out and CC Invoice.
- Gate In was remapped to the real Page 167 item contract; the nonexistent `P167_MSTATUS` parameter was removed.
- First/Second Weight retain the native IR requests on Page 132 without passing nonexistent HSPL date/company/location items.
- Confirmation 360, Sales Order 360, Vehicle 360 and Category 360 pages were opened from Page 721 and checked for visible processing/ORA errors.
- Quick-period submit was exercised, then the page was restored to the full 55-day reporting period.
- Native register Search, Actions, Rows and sticky table-header presentation are present; the former custom/glitchy embedded table has been replaced by the HSPL native Interactive Report structure.

Two application-shell console messages remain outside this page's implementation: the host APEX `UnsafeHTML` loader reports DOMPurify ordering, and Oracle JET reports a missing locale module. Page 721 does not depend on either path for its charts: its three charts render through the deployed HSPL SVG runtime. There are no user-visible failures from these shell messages in the audited SLC flow.
