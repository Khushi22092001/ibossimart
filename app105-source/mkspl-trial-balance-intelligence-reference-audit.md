# MKSPL Trial Balance Intelligence — Read-only Reference Audit and HSPL Build Specification

**Status:** Reference audit complete; **no import or HSPL modification is authorised by this document.**

**Source inspected:** MKSPL Oracle APEX application 110, page 675 (`TRIAL-BALANCE-INTELLIGENCE`) and its running page.  
**Audit date:** 23 September 2026.  
**Target, when authorised:** HSPL / IMART application 105.  
**Strict boundary:** MKSPL is a read-only reference. Do not save, edit, delete, import into, or otherwise change MKSPL. Do not change HSPL until the user explicitly says **“import”**.

---

## 1. What this page is — and is not

MKSPL page 675 is a **general-ledger command centre**, not the older/basic trial-balance page already attempted in HSPL.

It combines:

1. a hierarchy-aware trial balance;
2. financial-year opening and period movement calculations;
3. a three-part Balance Control proof (opening, movement, closing);
4. scope-aware warnings when a location filter breaks the normal double-entry proof;
5. group-to-group and ledger-to-ledger drill navigation;
6. a dedicated, formatted, full-20-level Excel export; and
7. a separate navigation link to Trial Balance **Analytics** (page 704).

It is **not** a dashboard panel layout. `P675_PANEL` is a data-access/filter value (`A`/`B`) and must never be implemented as a visible side panel or a dashboard panel component. The requested HSPL implementation must use the current HSPL design system and must not reintroduce panels.

### Difference from Trial Balance Analytics

Page 675 is **Trial Balance Intelligence**, the operational hierarchy and ledger-trace page. The header CTA opens **Trial Balance Analytics** on page 704 and forwards the currently selected scope. They are different pages and must remain different in HSPL.

---

## 2. Reference identity and page settings

| Property | MKSPL value |
|---|---|
| Application | 110 (`mkspldashboard`) |
| Page | 675 |
| Alias | `TRIAL-BALANCE-INTELLIGENCE` |
| Page name | Trial Balance Intelligence |
| Page group | Financial Intelligence |
| Page mode | Normal page |
| Template | Standard |
| Authentication | Required |
| Page authorization | None on the page itself |
| Page access protection | Unrestricted |
| Browser cache | Disabled |
| Reload on submit | Always |
| Page JavaScript files / global declaration / execute on load | Empty |
| Page-specific dynamic actions | No page-specific DA was found |

The page is server-rendered intentionally. `Apply`, control visibility, resets, and custom download use normal submit processing. Do not fake this with a client-only redraw that changes accounting scope without re-querying the server.

---

## 3. User-facing information architecture

Render in this order. Preserve behavior and content meaning; fit the markup/styling into the live HSPL theme.

1. **Intelligence header** — SQL-generated heading/summary and the Analytics CTA.
2. **Filter bar** — primary scope filters and Apply / Balance Control / Advanced Filter actions.
3. **Advanced Filters** — right-side inline drawer; not a panel.
4. **Balance Control heading** — explanatory section heading.
5. **Balance Control report** — hidden by default; shown only after the user chooses Show Balance Control.
6. **Balance Basis** — explanation and conditional warning.
7. **Trial Balance heading** — instructional section heading.
8. **Trial Balance interactive report** — hierarchy-aware rows, normal IR search/actions, plus a custom Download action.
9. **Trial Balance Totals** — independently calculated grand totals inserted into/under the visible report.
10. **Trial Balance Basis note** — explains hierarchy, totals, filters, and the difference between this download and normal IR Actions export.

### Header content contract

The SQL header contains:

- eyebrow: `Finance · General Ledger`;
- title: `Trial Balance Intelligence`;
- subtitle: `Opening balances, period movement, closing position, financial exceptions and complete voucher traceability.`;
- right-side CTA: `Trial Balance Analytics →`;
- scope chips:
  - Period: From Date → To Date;
  - financial year (or an outside-known-FY indication);
  - Company / `All companies`;
  - Location / `All locations`;
  - Panel `A + B`, or the enforced user panel with `(enforced)`;
  - selected account group/ledger, only when supplied;
  - P&L line, only when `P675_PNLBUCKET` is supplied;
  - `INR (base, single-currency ledger)`;
  - `Last posting` based on the latest accessible `VoucherDetail` posting date.

The header region submits:

```text
P675_FROMDATE,P675_TODATE,P675_COMPANY,P675_LOCATION,P675_PANEL,
P675_ACCOUNTGROUP,P675_PNLBUCKET
```

### Analytics CTA linkage

Header CTA target is page **704** and carries:

```text
P704_FROMDATE, P704_TODATE, P704_COMPANY, P704_LOCATION,
P704_PANEL, P704_ACCOUNTGROUP
```

The target clears page 704. Preserve every item mapping when building HSPL. Do not point the CTA to the Intelligence page itself.

---

## 4. Page-item contract

All filters use session state. The items below are the reference contract; HSPL item names can differ only if every report, process, URL, condition, and test is updated consistently.

| Reference item | Type / layout | Default and source | Behavior |
|---|---|---|---|
| `P675_FROMDATE` | Date Picker Popup, mandatory, sequence 10, span 2 | First day of current financial year: `FinancialYearBegin` where current date is within the financial year | First day of the movement window. Everything before it within the FY becomes opening. |
| `P675_TODATE` | Date Picker Popup, mandatory, sequence 20, span 2 | `trunc(sysdate)` formatted `DD-MM-RRRR` | Closing as-at date. Voucher movement is inclusive through this date. |
| `P675_COMPANY` | Native Select List, sequence 30, span 3 | Null is `All companies`; LOV lists only companies with accessible `VoucherDetail` data | Filters all financial data and location LOV. |
| `P675_LOCATION` | Native Select List, sequence 40, span 3 | Null is `All locations`; dependent on Company | LOV lists accessible locations, constrained by current Company. Filtering a location may legitimately make the ledger unbalanced where vouchers post across locations; show the warning described below. |
| `P675_PANEL` | Native Select List, sequence 50, span 2 | `A + B` / null, with `A` and `B` values | Shown only when `GetUserPanelAB_apex()` returns null. If a user is restricted, the server-enforced panel is used and the selector is hidden. |
| `P675_LEVEL` | Number field, sequence 60, span 2 | `3`, minimum `1` | Hierarchy depth. Hidden when Ledger Only is `Y`. Level 1 = statements; level 3 is typical group/subgroup view; chart currently reaches 9; group drill requests current level + 3. |
| `P675_ACCOUNTGROUP` | Native Popup LOV, sequence 70, span 5 | Blank means `Whole chart of accounts` | Searches the full 7,307-row Party chart, including group and posting accounts, not the old groups-only LOV. Duplicate names show `[PartyCode]`. Selected group shows descendants; selected posting account shows itself. |
| `P675_LEDGERONLY` | Single check box, sequence 75, span 2 | `N` | `Y` flattens report to posting accounts, ordered by name, and hides Level. It does not alter figures or scope. |
| `P675_PNLBUCKET` | Hidden state item | None | P&L bucket scope transferred from elsewhere / carried in state. Never expose as an unfinished UI control. |
| `P675_SHOWBC` | Hidden state item | `N` | Controls Balance Control visibility. `Y` only after Show Balance Control submit process. |
| `P675_ZERO` | Select List in drawer, span 6 | `N` | UI choices: `Hide accounts that close at zero` and `Show every account`. SQL behavior: rows pass when `Y`, otherwise closing amount must exceed 0.005. |
| `P675_NOMOVE` | Select List in drawer, span 6 | `Y` | UI choices: `Include them - a carried balance is still a balance` and `Only accounts that moved in the period`. SQL behavior: `Y` includes no-movement accounts; otherwise movement must exceed 0.005. |

### Primary filter LOVs

Company LOV:

```sql
Select c.CompanyName d, c.CompanyCode r
  From Company c
 Where Exists (
       Select 1
         From VoucherDetail v
        Where v.CompanyCode = c.CompanyCode
          And ((Select GetUserPanelAB_apex() From dual) Is Null
               Or v.Panel = (Select GetUserPanelAB_apex() From dual)))
 Order By 1
```

Location LOV (with `P675_COMPANY` submitted):

```sql
Select l.LocationName d, l.LocationCode r
  From Location l
 Where Exists (
       Select 1
         From VoucherDetail v
        Where v.LocationCode = l.LocationCode
          And (:P675_COMPANY Is Null Or v.CompanyCode = :P675_COMPANY)
          And ((Select GetUserPanelAB_apex() From dual) Is Null
               Or v.Panel = (Select GetUserPanelAB_apex() From dual)))
 Order By 1
```

Account-group/ledger Popup LOV:

```sql
Select p.PartyName
    || Case When Count(*) Over (Partition By p.PartyName) > 1
            Then '  [' || p.PartyCode || ']' End d,
       p.PartyCode r
  From Party p
 Order By p.PartyName, p.PartyCode
```

Popup behavior is `fetch_on_search`, contains match, minimum characters `0`, null display `Whole chart of accounts`.

### Date conversion rule

All reference page SQL parses dates using:

```sql
to_date(:P675_FROMDATE, 'DD-MM-RRRR')
to_date(:P675_TODATE,   'DD-MM-RRRR')
```

HSPL must use one consistent date model. If HSPL Date Picker session values use native `DATE` values instead, change every consumer together and prove the inclusive To-Date behavior remains intact.

---

## 5. Actions, conditions, and processes

| Component | Reference action | Condition / effect |
|---|---|---|
| `APPLY` | Hot button, `fa-refresh`, submit request `APPLY`, validations on, processing indicator on | Re-evaluates every financial query with the current scope. |
| `SHOWBC` | `Show Balance Control`, `fa-balance-scale`, submit | Visible only when `P675_SHOWBC != 'Y'`; after-submit process sets `P675_SHOWBC := 'Y'`. |
| `HIDEBC` | `Hide Balance Control`, `fa-eye-slash`, submit | Visible only when `P675_SHOWBC = 'Y'`; after-submit process sets `P675_SHOWBC := 'N'`. |
| `OPENFILTERS` | `Advanced Filters`, `fa-sliders` | Redirect target is exactly `javascript:apex.theme.openRegion('p675Drawer');`. No page submit. |
| `RESETFILTERS` | `Reset All Filters`, `fa-times` | Redirect to page 675 with clear-cache `675`; restores all normal defaults/state. It appears in the drawer. |
| `DOWNLOAD20` | `Download`, `fa-file-excel-o`, IR search-bar right position | Submit process performs special 20-level Excel export; indicator off; it is not the ordinary Interactive Report export. |

After-submit processes, in order:

```plsql
-- Show Balance Control (when SHOWBC button pressed)
:P675_SHOWBC := 'Y';

-- Hide Balance Control (when HIDEBC button pressed)
:P675_SHOWBC := 'N';
```

Download process identity:

| Property | Value |
|---|---|
| Name | `Download 20-Level Trial Balance` |
| Process point | Processing |
| Type | Execute Code / PL/SQL |
| Button condition | `DOWNLOAD20` |
| Static ID | `download-20-level` |
| MIME type | `application/vnd.ms-excel` |
| Filename | `trial-balance-YYYYMMDD-HH24MI.xls` |

---

## 6. Financial-data model and accounting rules

This is the non-negotiable finance contract. Do not replace it with a simple sum of visible report rows.

### Source tables and conventions

| Entity | Purpose |
|---|---|
| `FinancialYear` | Finds the financial-year beginning for From Date. |
| `Opening` | Official opening balance snapshot at financial-year start. |
| `Voucher` | Supplies carry-forward voucher records to exclude. |
| `VoucherDetail` | Transaction posting lines, signed `Amount`, company/location/panel and date scope. |
| `Party` | Chart of accounts and hierarchy. Posting accounts and groups are both present. |

Signed amount convention:

```text
Debit  = negative VoucherDetail.Amount
Credit = positive VoucherDetail.Amount
```

All figures are base currency INR. The reference ledger has no relevant currency or exchange-rate column in the voucher chain. Do not present multicurrency conversion as though it exists.

### Financial-year fallback

Determine `Fb` as the `FinancialYearBegin` containing From Date. If From Date lies outside every configured FY, fall back to From Date itself. This prevents the whole page becoming empty: opening becomes nil while period movement remains meaningful.

```sql
Select nvl(
         (Select f.FinancialYearBegin
            From FinancialYear f
           Where :from_date Between f.FinancialYearBegin And f.FinancialYearEnd),
         :from_date) Fb
  From dual
```

### Carry-forward exclusion

Voucher records with:

```sql
VoucherNo = 'OPENING'
```

are carry-forward vouchers. They are already represented by `Opening`; therefore exclude their `TNO` from every `VoucherDetail` movement calculation. Counting them as period movement double-counts opening balances.

### Scope rule used everywhere

Every Opening and VoucherDetail query must apply the same scope:

```sql
((Select GetUserPanelAB_apex() From dual) Is Null
 Or data.Panel = (Select GetUserPanelAB_apex() From dual))
And (:P675_PANEL    Is Null Or data.Panel        = :P675_PANEL)
And (:P675_COMPANY  Is Null Or data.CompanyCode  = :P675_COMPANY)
And (:P675_LOCATION Is Null Or data.LocationCode = :P675_LOCATION)
```

Do **not** apply a chosen panel in place of a server-enforced panel. Both checks are required. In HSPL, use the equivalent current-user panel function and target-table columns after verifying them.

### Opening, movement, and closing formulas

For a posting account:

```text
Opening signed = Opening.OpeningAmount at FyBegin
               + VoucherDetail.Amount from FyBegin through the day before From Date
               (excluding OPENING voucher records)

Period debit   = sum(-Amount) where Amount < 0 and From Date <= VoucherDate <= To Date
Period credit  = sum( Amount) where Amount > 0 and From Date <= VoucherDate <= To Date

Opening debit  = max(-Opening signed, 0)
Opening credit = max( Opening signed, 0)

Closing signed = Opening signed - Period debit + Period credit
Closing debit  = max(-Closing signed, 0)
Closing credit = max( Closing signed, 0)
```

Date predicates are inclusive in the expected way:

```sql
VoucherDate >= FyBegin
VoucherDate <  ToDate + 1
```

The pre-From-Date portion is only movement from FY start through the day before From Date. It must not include an older FY.

### Aggregate leaves first; hierarchy second

Debit and credit are classified at posting-account level first and then rolled up the chart hierarchy. This is essential: netting a parent’s signed total first can wrongly erase debit/credit sides.

### Chart hierarchy and synthetic roots

The chart is built from `Party` and then grafted into synthetic statement roots:

```text
BALANCESHEET
  ├─ ASSETS
  └─ LIABILITIES

PROFITANDLOSS
  ├─ INCOME
  └─ EXPENSES
```

The statement placement is derived from `NatureOfAccountCode`. Missing/unclassified records are represented as `NOSTATEMENT` / `UNCLASSIFIED` and must not drill to a dead page.

The full CTE design in the reference uses the following conceptual chain:

```text
Fy → Carry → Party / hierarchy ordering → Walk → Graft → Tree
→ opening + movement at leaf → Bal → scope → visible Node → Agg
```

`Walk`, `Graft`, and `Tree` establish safe hierarchy ordering and descendants before aggregation. Preserve the same sequence in HSPL, even if exact CTE names change.

### P&L bucket classifier

Reference bucket rules are:

| Account placement | `P675_PNLBUCKET` |
|---|---|
| Income | `REVENUE` |
| Direct Cost | `DIRECT` |
| Depreciation | `DEPN` |
| Account `4892` | `FIN` |
| Account `7481` | `TAX` |
| Remaining expenditure | `OPEX` |

Header display labels are Revenue, Direct Cost, Depreciation, Finance Cost, Tax, and Operating Expense. Validate HSPL account coding before copying the hard-coded 4892/7481 rules.

### Row inclusion

The user scope is one of:

1. whole chart;
2. all descendants of selected group;
3. selected ledger alone; or
4. selected P&L bucket.

The Advanced Filters then apply:

```sql
(:P675_ZERO   = 'Y' Or ClosingDebit + ClosingCredit > 0.005)
And (:P675_NOMOVE = 'Y' Or PeriodDebit + PeriodCredit > 0.005)
```

Use an absolute decimal tolerance of **0.005** for zero/equality logic. Do not use visually rounded currency values to decide whether the books balance.

---

## 7. Balance Control and Balance Basis

### Visibility

The `Balance Control` Classic Report is initially hidden. Its server-side condition is:

```plsql
nvl(:P675_SHOWBC, 'N') = 'Y'
```

It has static ID `balance-control`, CSS class `ds-finbalwrap`, Blank with Attributes template, sequence 18, and submits:

```text
P675_FROMDATE,P675_TODATE,P675_COMPANY,P675_LOCATION,P675_PANEL
```

### Three proofs

The report renders three HTML metrics, each with debit, credit, absolute difference and status:

| Card | Heading | Debit / credit source |
|---|---|---|
| Opening | `Opening as at <From Date>` | Sum of posting-account opening debit vs credit |
| Movement | `Movement <From Date> – <To Date>` | Sum of period debit vs credit |
| Closing | `Closing as at <To Date>` | Sum of posting-account closing debit vs credit |

State class is:

```text
OK:   absolute difference < 0.005
Warn: absolute difference < 1
Bad:  otherwise
```

Display compact rupee values in Crore/Lakh at `>= 10,000,000` / `>= 100,000`, but calculate and display the difference at full precision.

### Balance Basis note

The reference’s explanatory note says, in substance:

- Opening comes from `Opening` at FY begin, plus VoucherDetail from FY begin to the day before From Date.
- ERP year-end close resets Income and Expenditure and carries net to `PROFITANDLOSSACCOUNT`.
- Movement is VoucherDetail inside the selected window.
- Closing is Opening + Movement under the signed convention.
- `OPENING` vouchers are excluded because they are the opening.
- Difference comparisons are at full precision, never only the rounded displayed amount.

### Conditional cross-location warning

When a location filter is selected, the page tests for vouchers in the selected date window that use more than one distinct `LocationCode`:

```sql
Select d.Tno, Count(Distinct d.LocationCode) Legs
  From VoucherDetail d
 Where d.VoucherDate >= :FromDate
   And d.VoucherDate <  :ToDate + 1
   And user-panel and company scope apply
 Group By d.Tno
Having Count(Distinct d.LocationCode) > 1
```

If any exist, show a warning that a location-scoped trial balance may not balance because the other leg is excluded. Company-level or higher scope is expected to balance; the reference asserts that no voucher crosses a company boundary. This is a warning, not a data error.

---

## 8. Trial Balance interactive report

Region type is **Interactive Report** (`NATIVE_IR`), not an Interactive Grid or plain Classic Report.

Its page items to submit are:

```text
P675_FROMDATE,P675_TODATE,P675_COMPANY,P675_LOCATION,P675_PANEL,
P675_LEVEL,P675_ACCOUNTGROUP,P675_PNLBUCKET,P675_ZERO,P675_NOMOVE,
P675_LEDGERONLY
```

### Report result model

| Field | Purpose / visibility |
|---|---|
| `SEQ` | Hidden hierarchy/order helper. |
| `LVL` | Hidden hierarchy level helper used for drill-level increments. |
| `ACCOUNT` | Visible tree-labelled account/group name. |
| `ACCOUNT_URL` | Hidden destination URL. |
| `TREECLASS` | Hidden visual class. |
| `ACCOUNT_CODE` | Hidden technical account key. |
| `KIND` | Visible: Group or posting account. |
| `PARENT_GROUP` | Hierarchy/group context field; retain as a report field even if default layout hides it. |
| `OPENING_DEBIT` | Visible numeric currency. |
| `OPENING_CREDIT` | Visible numeric currency. |
| `PERIOD_DEBIT` | Visible numeric currency. |
| `PERIOD_CREDIT` | Visible numeric currency. |
| `CLOSING_DEBIT` | Visible numeric currency. |
| `CLOSING_CREDIT` | Visible numeric currency. |
| `MOVEMENT_PCT` | Visible. `((PeriodDebit - PeriodCredit) / abs(opening)) * 100`; blank when opening is effectively zero. Never show a false `0%`. |
| `LAST_POSTING` | Visible last VoucherDetail posting date for the account/scope. |
| `POSITION` | Visible: Off tree / No nature / Dormant / Nil / Debit / Credit. |
| `POSITION_CLASS` | Hidden style helper. |

Account HTML is equivalent to:

```html
<span class="#TREECLASS#"><a href="#ACCOUNT_URL#">#ACCOUNT#</a></span>
```

Position uses a class-bearing span. Escape settings must allow the intended generated HTML while all source values remain safely escaped/sanitized.

### Hierarchy rendering and user expectations

- Group rows are indented and visibly distinct from posting accounts.
- Groups carry the sum of their descendant posting accounts.
- `Ledger Only = Y` gives a flat posting-account list; it does not reclassify accounts or discard the total.
- Synthetic/unclassified nodes get non-clickable `javascript:void(0)` with a disabled-anchor class. Do not make a fake navigable link.
- First account column is sticky in reference styling. Use HSPL’s table responsiveness safely; do not use brittle fixed widths that break the current application.
- Normal IR search, Actions menu, saved report capability, paging, and default IR download remain available.

### Drill links

| Clicked row | Destination | Values passed |
|---|---|---|
| Group | Same page 675 | `P675_ACCOUNTGROUP` = group; `P675_LEVEL` = clicked level + 3; preserve From/To/Company/Location/Panel. |
| Posting ledger | Page 677, `ledger-account-analysis` | `P677_ACCOUNT`, `P677_FROMDATE`, `P677_TODATE`, `P677_COMPANY`, `P677_LOCATION`, `P677_PANEL`; clear page 677. |
| Synthetic/unclassified node | None | Non-clickable only. |

The group click must preserve date and scope. A drill that clears Company, Location, Panel, or filter scope is wrong.

---

## 9. Trial Balance Totals

The totals are not an arithmetic sum of the visible hierarchy rows, because every group already contains its children. They are independently calculated over the scoped posting accounts.

### Required behavior

1. Reuse the same accounting calculation, date window, carry exclusion, panel/company/location scope, account/P&L scope, Zero and No-Movement filters as the report.
2. Aggregate **posting accounts only**.
3. Evaluate opening, period, and closing debit-credit difference with 0.5 / 0.005 thresholds as in the reference.
4. If whole ledger scope, show Balance Control-style badges: `Opening OK / Opening ≠`, `Period OK / Period ≠`, `Closing OK / Closing ≠`.
5. If filtered to Account Group or P&L bucket, do not claim the sub-scope independently balances. Say `Filtered scope — a part does not balance` and show net movement as debit or credit.
6. Render a totals row at the bottom of the real IR data table, including the APEX fixed-header clone. The reference’s small script runs immediately, again around 150ms and 600ms, and after `apexafterrefresh`; it selects the last live data table with body rows.
7. Keep a visible fallback totals region if the insertion script cannot attach. The page must still disclose totals rather than silently failing.

### Critical implementation caution

The reference uses column-number CSS selectors and a script that works with its exact IR order. For HSPL, make the selector resilient to current HSPL report column order and user-saved reports. Functional parity is required; copying fragile `nth-child` selectors verbatim is not.

---

## 10. Special 20-level Excel download

This is materially different from the ordinary Interactive Report Actions → Download export. Both exports must coexist.

### Scope and hierarchy

- Generates a server-side `.xls` file through `owa_util` / `htp` HTML, not `apex_data_export`.
- Always emits hierarchy levels **1 through 20**, regardless of the visible `P675_LEVEL`.
- Intentionally ignores Ledger Only by hard-coding its full-hierarchy branch; this is not a bug.
- The actual current chart is eight levels deep, but export deliberately reserves the full 20-level implementation.
- Applies From Date, To Date, Company, Location, enforced/user Panel, Account Group/P&L scope, Zero, and No-Movement settings.
- Must use the same financial semantic query as the page. Export/report parity is a mandatory acceptance test.

### Workbook specification

| Property | Required behavior |
|---|---|
| Filename | `trial-balance-YYYYMMDD-HH24MI.xls` |
| MIME | `application/vnd.ms-excel` |
| Worksheet title | `Trial Balance` |
| Format | Excel-compatible HTML `.xls` |
| Font | Calibri 10pt |
| Frozen area | First four rows: title, subtitle, blank, column headings |
| Currency | INR base currency |
| Numeric format | `#,##,##0.00` |
| Blank numeric cells | Blank if null or absolute value `< 0.005` |
| Row treatment | Group styling varies by levels 1, 2, and 3+; ledgers white; totals amber; group name indentation uses four non-breaking spaces per level. |

### Exact exported columns

1. Account
2. Level
3. Kind
4. Opening Dr
5. Opening Cr
6. Period Dr
7. Period Cr
8. Closing Dr
9. Closing Cr
10. Last Posting
11. Position

The export also contains title/scope metadata: period, company, location, enforced/selected panel, statement that it is full hierarchy through level 20, and INR/base currency. Its final note explains that group rows include children and must not be summed as independent totals.

End the download process with `apex_application.stop_apex_engine` after streaming output.

---

## 11. Reference visual behavior to retain semantically

MKSPL classes include `ds-finbal`, `ds-finbalwrap`, `ds-fin-sectionregion`, `ds-finnote`, `ds-fintree-*`, and total-row helpers. Their exact colours/gradients are **not** a mandate for HSPL.

For HSPL, retain these visual meanings using the existing theme tokens:

- hierarchy levels are visibly differentiated;
- group links are clearly discoverable without dark/opaque hover states;
- group and ledger rows remain legible when selected/hovered;
- opening/movement/closing statuses communicate good/warn/bad without red action buttons;
- zero/full scope warning is readable and not confused with a failure;
- totals have a clear but accessible emphasis;
- table header and sticky first account column remain stable and responsive;
- the current HSPL light design is preserved; do not import black shading, old MKSPL card style, or a side panel.

Avoid old fragile CSS that assumes fixed column positions if HSPL report customisations can rearrange columns. Use stable classes/data attributes or DOM IDs.

---

## 12. HSPL implementation plan — execute only after explicit “import”

### Phase 0 — safeguard and preflight

1. Export/backup the current HSPL page(s) affected before any edit.
2. Verify current page inventory and navigation entry. Do not reuse a broken/old Trial Balance page blindly.
3. Verify HSPL table/view/function equivalents for: `FinancialYear`, `Opening`, `Voucher`, `VoucherDetail`, `Party`, `Company`, `Location`, and current-user panel function.
4. Compare HSPL column data types and naming for dates, signed amount, `TNO`, account code, company, location, panel, hierarchy parent, and account nature.
5. Run read-only reconciliation queries before UI work: a whole-company date range must balance debit/credit at opening, movement and closing.
6. Confirm target pages for Trial Balance Analytics and Ledger Account Analysis exist in HSPL. Map page numbers/items from HSPL, not MKSPL page numbers by assumption.

### Phase 1 — page shell and filters

1. Create or rebuild the HSPL Intelligence page in the current HSPL design language.
2. Create the primary filter item set and hidden state items.
3. Implement panel enforcement first, then Company/Location LOV dependency.
4. Build the header and outbound Analytics mapping.
5. Build the Advanced Filters inline drawer, only with the two filters and reset action; no panel component.

### Phase 2 — finance engine

1. Build one validated base CTE/query contract for fiscal opening + pre-period + movement.
2. Build and validate the Party hierarchy / synthetic root grafting.
3. Validate debit/credit-at-leaf aggregation with a selected known group and ledger.
4. Add filters, P&L buckets, Level, and Ledger Only only after base totals match.
5. Implement no-dead-link handling for synthetic/unclassified nodes.

### Phase 3 — reports and downloads

1. Add Balance Control behind its Show/Hide state.
2. Add Balance Basis and cross-location warning.
3. Add the Interactive Report and column configuration.
4. Add independent totals with robust fixed-header handling and fallback.
5. Add custom 20-level Excel process; do not substitute default IR export.
6. Add standard IR actions/export alongside custom export.

### Phase 4 — integration and hardening

1. Implement and test group/ledger/Analytics links with all scope parameters.
2. Test clear-cache/reset/default session behavior.
3. Test all roles, particularly enforced Panel A/B users.
4. Test desktop and narrower layouts using current HSPL styling.
5. Inspect network/server timings and query plans before release; use indexed predicates and remove duplicated expensive work only if reconciled results remain exact.
6. Import/deploy only after each acceptance item below passes.

---

## 13. Acceptance matrix

| Area | Pass condition |
|---|---|
| Default dates | From is current FY start; To is today; totals cover correct inclusive window. |
| Outside FY | Page remains populated; opening is nil/fallback and movement remains valid. |
| Signed convention | Known negative posting appears as debit and positive posting as credit. |
| Carry-forward | `OPENING` vouchers are not double-counted. |
| Whole-company balance | Opening, movement, and closing debit/credit differences satisfy 0.005 threshold where data is valid. |
| Location warning | A location with cross-location vouchers displays the warning; company-wide scope does not produce a false warning. |
| Panel security | A restricted user cannot remove or override enforced panel scope. |
| Company/location LOVs | Only accessible values appear; location responds to Company. |
| Account POPUP LOV | Full chart searchable; duplicate names show code; group and ledger both resolve. |
| Level drill | Clicking a group passes it as scope and raises depth by 3 while retaining date/company/location/panel. |
| Ledger drill | Click goes to HSPL ledger-analysis target with all expected inputs. |
| Synthetic row | Non-clickable; no blank/new page or invalid URL. |
| Ledger Only | Only leaves shown; figures/totals unchanged for same scope. |
| Zero / no-movement | `Y`/`N` behavior matches reference semantics exactly. |
| Totals | Totals are leaf-based, not sum-of-group-row based; remain visible after IR refresh. |
| Custom download | Full 20-level hierarchy, scoped data, 11 columns, metadata, freeze panes, formatted currency, and no Ledger Only flattening. |
| Default IR export | Remains available and remains different from custom 20-level output. |
| Analytics CTA | Opens HSPL analytics target, forwards all six scope values, and does not point to Intelligence. |
| Theme | No side panel, black hover/shading, red action buttons, layout flicker, or broken sticky table behavior. |
| Performance | Initial render and Apply meet agreed target without incorrect caching or stale-user data. |

---

## 14. Known risks and decisions required before import

1. **Schema parity is not assumed.** MKSPL table/function names must be checked against HSPL first.
2. **Account codes 4892 and 7481 may not mean Finance Cost / Tax in HSPL.** Confirm chart mapping before transferring P&L bucket rules.
3. **Current HSPL Trial Balance may be old/basic.** It must be audited/removed from navigation only after the replacement is verified; do not break existing users during build.
4. **Server-side calculations are potentially expensive.** Page report, totals, balance control, and custom download intentionally repeat parts of the calculation. Optimise only with reconciled query outputs and explain any materialisation/index decision.
5. **HTML/XLS output must stay safe.** Escape account text/metadata before streaming HTML; allow only intentional report HTML in APEX output expressions.
6. **No visual copy-paste from MKSPL.** Use HSPL current design classes/tokens. MKSPL is a functionality reference, not a styling source.
7. **No change without explicit approval.** The next action is only allowed when the user says `import`.

---

## 15. Build hand-off checklist for the next session

Before editing anything, read this file fully and then obtain/confirm:

- the HSPL Builder session and target application/page decision;
- HSPL schema-equivalence results;
- HSPL analytics and ledger-analysis page mappings;
- confirmation that the user has said **“import”**;
- a fresh HSPL page export/backup; and
- an agreed performance baseline.

Then implement feature-by-feature behind a backup, validate against this acceptance matrix, and make no MKSPL changes at any stage.

---

## 16. Visual, interaction and accessibility supplement — verified 23 September 2026

This supplement closes the earlier visual-specification gap. It was captured read-only from the live MKSPL runtime, its generated DOM and its shared `design-system.css`; no value below is an inferred design decision.

### 16.1 Reference presentation boundary

- Reference page: application 110 / page 675 / alias `TRIAL-BALANCE-INTELLIGENCE`.
- Shared source stylesheet observed: `design-system.css` (static-file version `v2461305144622`). Page 675 itself has no page-specific CSS or JavaScript.
- Its finance canvas is `#EEF0F6`; white working surfaces are `#FFFFFF`; tinted surfaces are `#F6F7FC`; ink/muted/border are `#141A2E` / `#6B7391` / `#DFE2ED`.
- MKSPL’s finance palette is primary `#3730A3`, secondary `#4F46E5`, accent `#0E7490`, gold `#A16207`, success `#0F766E`, warning `#B45309`, danger `#B4243C`, slate `#4B5471`. These are reference facts, **not** permission to replace HSPL’s current token palette when importing.
- The source has neither KPI cards nor charts on this page. It is a dense analytical register, not a portal/portlet surface.

### 16.2 Header and filter bar

The header is a full-width `.ds-fin-head` band with 24px/26px/22px padding, 16px radius, a layered navy-to-near-black gradient (`#252B45 → #171C31 → #0D1120`), indigo/teal radial light, a very subtle 26px grid and a 3px indigo-to-teal bottom rule. It contains:

1. the `FINANCE · GENERAL LEDGER` eyebrow (10.5px, 800 weight, 0.2em uppercase tracking),
2. the 33px / 800 white title,
3. 13.5px muted-white subtitle,
4. scope chips for Period, Financial Year, Company, Location, Panel, Currency and Last posting, and
5. one upper-right CTA, `Trial Balance Analytics →`, which must target **Page 704** rather than Page 675 and forward from/to/company/location/panel.

Chips wrap instead of overflowing; each is 11.5px with a 9px rounded border and dark translucent fill. At <=760px the title becomes 25px and header padding becomes 18px; at `prefers-reduced-motion: reduce`, reveal/hover transitions are removed.

The filter region is `.ds-dash-filters`: white surface, 14px radius, 1px border and shallow finance shadow, 12px/16px padding (14px lower padding on this page), 16–18px lower gap. Labels are uppercase 10.5px / weight 800 / 0.07em tracking. Inputs and date inputs are 34px tall, 13px; Apply is 34px. Controls, in exact display order, are **From Date, To Date, Company, Location, Panel, Levels, Account popup LOV, Ledger Only, Apply, Show Balance Control, Advanced Filters**.

### 16.3 Register composition and rendering rules

- Section labels are 12px, 800-weight uppercase text with 0.13em tracking and a horizontal rule continuing to the right.
- `Balance Control` is followed by the single explanatory `Balance Basis` note (`.ds-finnote`): 9px × 12px padding, 10px radius, tinted finance surface, border, 11.5px/1.5 line-height and indigo information icon. It explains the opening/movement/closing formula before the register.
- The Trial Balance itself is one Interactive Report inside `ds-dash-panel ds-register`: white surface, 14px radius, 1px border, shallow shadow and horizontal scroll contained inside the register—not the page.
- Its toolbar is native IR: column search selector, Row Search, Go, Rows selector (default 100), Actions, and a separate `Download` button. **The toolbar Actions export is the native report export; the separate Download is the custom 20-level hierarchy Excel action. They must remain different.**
- Register columns are: Account, Kind, Opening Dr, Opening Cr, Period Dr, Period Cr, Closing Dr, Closing Cr, Movement %, Last Posting, Position. Numeric columns are right-aligned, tabular/monospace; header and data density is the compact native IR treatment.
- Hierarchy indentation is a visible contract: level 1=0px; levels 2–8 add 18px each (18, 36, 54, 72, 90, 108, 126px). Parent/group labels use progressively lighter weights; leaf labels use normal report ink. A code chip, where supplied, has 1px × 6px padding, 5px radius and slate tint.
- Position pills are compact rounded chips: Debit dark-blue tint, Credit brown tint, Flat slate tint, Watch warning tint, and OK green tint. `ds-nolink` synthetic rows are explicitly non-clickable.

### 16.4 Live interaction contract

| Visible control | Exact behavior | Implementation guardrail |
| --- | --- | --- |
| Group row | Opens the same Trial Balance at that group and adds 3 to requested depth | keep all current scope values; parent must not become a ledger detail link |
| Ledger row | Opens the ledger-analysis target with current scope | only a posting ledger is a ledger drill |
| Synthetic P&L row | Appears in hierarchy/totals but has no navigation | render text, not a blank/invalid anchor |
| `Levels` | editable numeric depth; runtime default was `3` | the label must stay within the item’s grid span—do not reintroduce the P902 grid error |
| `Account` | searchable Popup LOV, initial text `Whole chart of accounts` | preserve code disambiguation and clear scope semantics |
| `Ledger Only` | checkbox | hides groups without changing scoped leaf totals |
| `Show Balance Control` | toggles the balance-control material | does not change accounting scope |
| `Advanced Filters` | exposes zero/no-movement inclusion and other advanced choices | do not collapse the user’s chosen context |
| `Download` | invokes custom Excel | 20-level hierarchy and metadata/freeze panes; not default IR export |
| native `Actions` | standard Interactive Report actions/download | must remain available independently of custom export |

The register has no custom dark row hover. The shared dashboard report hover is a light green-grey (`#E6EEEC`); HSPL implementation must keep its approved light hover and no black shading. Links get a 2px green focus outline with a 2px offset. All animations and hover transforms are disabled for reduced-motion preference.

### 16.5 Import-time visual mapping

Use this as a complete **reference behavior** record, but preserve the current compact HSPL shell, header, action alignment, no-right-panel layout, no-red-button rule and approved token system. Replicate the register density, information order, hierarchy indentation, button separation and responsive behavior; map MKSPL finance colors to existing HSPL semantic tokens rather than pasting a second design system.
