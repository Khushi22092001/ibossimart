# Master Form Insights / KPI System — App 105 Plan

**Application:** Oracle APEX App 105 (BOSS ERP)  
**Audit date:** 30-Sep-2026  
**Status:** Research and implementation plan only. **No application, schema, CSS, JavaScript, process, or data change has been deployed.**

## 1. Executive decision

The requested system is feasible, but it must be implemented against the ERP's real master model rather than against labels visible in the navigation.

The live audit established these important facts:

1. **Supplier, Customer, Transporter, Agent/Broker and Contractor/Service Provider are not separate master forms.** They are `PARTY.PARTYTYPE` subtypes maintained on **Account / Party Master, Page 49**, with APEX context `P49_TNO`. Transactions use `PARTY.PARTYCODE`, so the drawer must resolve `TNO -> PARTYCODE` on the server.
2. **Material Master is Item Master, Page 59**, with APEX context `P59_TNO`. Transactions use `ITEM.ITEMCODE`, so the same server-side resolution rule applies.
3. **There is no active standalone Warehouse/Godown master.** The actual model is **Location / Branch, Page 25** plus **Storage Location, Page 128**. Stock links through `STOCK.LOCATIONCODE` and `STOCKSTORAGEDETAIL.STORAGELOCATIONCODE`.
4. **Company Vehicle, Page 91 exists but its module is inactive**, and current transaction rows do not reliably link to it: audited `GRN.COMPANYVEHICLECODE` usage is zero and audited vehicle-number matches to `COMPANYVEHICLE` are zero. Vehicle Insights must not be released yet.
5. Existing pages **910 Debtor 360, 923 Creditor 360, 935 Supplier 360 and 936 Item 360** contain valuable read-only formulas and scope rules that should be reused. Older `D_CUSTOMER_360VIEW*` / `D_SUPPLIER_360VIEW*` precomputed pages should not be used for the lazy-loaded master drawer.
6. Reservation, POD and GPS/current-location coverage is not present enough to support truthful KPIs: audited reservation rows = 0, POD detail rows = 0, weighment rows = 0. Those metrics must display **N/A / unavailable**, not fake zeroes.

**Recommended approval:** build the common framework and pilot only on Page 49 (Supplier subtype, then Customer subtype) and Page 59 (Material), behind a feature flag. Do not roll it out to every master.

## 2. Complete master inventory

The row-by-row audited inventory is in [master_form_inventory.csv](master_form_inventory.csv). It contains:

- classification;
- module group and live module code;
- actual form page;
- underlying table;
- declared database primary key where one exists;
- APEX context item;
- active/inactive navigation status;
- actual business entity represented by the page.

### 2.1 Transaction-linked business masters

| Class | Actual master | Page | APEX context | Database/business key | Main entity | Insight decision |
|---|---|---:|---|---|---|---|
| Party | Account / Party Master | 49 | `P49_TNO` | `PARTY.PARTYCODE`; `TNO` is unique | Supplier, Customer, Transporter, Agent, Contractor/Service Provider subtypes | **P0 Supplier and Customer; P1 Transporter; P2 Agent/Service Provider if justified** |
| Party | Vendor Onboarding Master | 350 | `P350_TNO` | `VENDOR.TNO` | Vendor onboarding registry | Hold: purchase transactions use `PARTYCODE`; validate `VENDORCODE/VENDORTNO` mapping first |
| Item | Item / Material Master | 59 | `P59_TNO` | `ITEM.TNO`; transactions use unique `ITEMCODE` | Material / SKU | **P0 pilot** |
| Item | Item Category | 55 | `P55_TNO` | APEX `TNO`; category code is the transaction-facing key | Material category | **P1 aggregate** |
| Item | Item Group | 37 | `P37_TNO` | `ITEMTYPE.TNO`; item rows use group/type code | Material group | **P1 aggregate** |
| Item | Item Specification | 13 | `P13_ITEMTNO`, `P13_SNO` | `ITEMSPECIFICATION(TNO, ITEMSPECIFICATIONCODE)` | Material specification | P2 only; custom DML and compound context need separate design |
| Location | Location / Branch | 25 | `P25_TNO` | `LOCATION.LOCATIONCODE` | Location; branches are identified by `LOCATION` flags | **P1 branch/location** |
| Location | Storage Location | 128 | `P128_TNO` | `STORAGELOCATION.STORAGELOCATIONCODE` | Storage/bin location | **P1 after stock allocation validation** |
| Logistics | Company Vehicle | 91 | `P91_TNO` | `COMPANYVEHICLE.TNO` | Fleet vehicle | **Not eligible now**: inactive and no reliable transaction key linkage |
| Organisational | Employee | 85 | `P85_TNO` | `EMPLOYEE.TNO`; transactions use employee/sales-executive code | Employee / potential salesperson | P2, salesperson subtype only after key and attribution validation |
| Organisational | Cost Centre | 120 | `P120_TNO` | `COSTCENTRE.TNO` | Cost centre | Not eligible now: ledger attribution coverage is too low for truthful KPIs |
| Organisational | Company | 4 | `P4_COMPANYCODE` | `COMPANY.COMPANYCODE` | Legal company | P2; branch dashboard is more actionable first |
| Organisational | Production Centre | 206 | `P206_TNO` | code/TNO context | Production centre | P2 after production/WIP definitions are approved |
| Asset | Asset | 675 | `P675_TNO`, `P675_SNO` | `ASSET.TNO` | Fixed asset | P2; separate asset-specific design |

### 2.2 Actual reference and configuration masters

These pages are real master/configuration pages, but most do not satisfy the transaction-history eligibility rule.

| Area | Masters and actual pages |
|---|---|
| Setup & Admin | Document Type 22; Financial Year 28; Code Scheme 40; Code Scheme for Master Module 42; Module Group 44; Module 45; Module Document Type 75; Module Location 77; BOSS User 81; My Parameter 110; Module Privilege 136; Module Document Type Wise TAC 225; Additional Business Place 248; Module Flow 264; Zone 287; GST Setup 308; Party Attribute 664; Process Routing 716; Process TAT 718; Process Escalation 720 |
| General Masters | City 8; Industry Sector 57; Packing Type 73; Vehicle Type 89; Item Make 106; Terms and Condition Head 173; Item Grade 367; Item Length 369; Item Width 371; Item Thickness 373 |
| Finance | TDS Nature 30; TDS Tax Category 32; TDS Payee Category 34; HSN 47; Party Type 71; Footer Account 93; Group of Party 97; Service Type Account 99; Footer Head 102; Bank 124; Tax Rule 177; SAC 326; Agent Commission Rate (active module, no APEX page mapping) |
| Inventory | Measuring Unit/UOM 51; Item Characteristics 53; Item Class 61; Item Nature 65; Item Account 211 |
| HR | Department 83; Designation 87; Shift 204; PT Slab 266; PF/ESIC Setting 332; Employee Category 340; Leave Scheme 342; Staff Type 602; Salary Head 604; Loan Category 608; Loan Type 610; Salary Head Account 612; Attendance Head 616; Salary Scheme 624; Loan Scheme 628; Reimbursement Policy 649; Traveling Mode 654; Expense Type 656; Conveyance Type 662 |
| Job / Freight / Asset | Service Type 95; Freight Type 79; Asset Category 668; Asset Category Depreciation Rate 679 |

Dormant/unmapped native pages also exist (for example Company Vehicle 91 and quality-related Pages 112/114/116), but they are not active master navigation targets and are excluded from rollout.

## 3. Eligibility decision

### 3.1 Eligible now or after a defined gate

| Priority | Master | Why it qualifies | Gate |
|---|---|---|---|
| P0 | Supplier subtype on Page 49 | Strong procurement, receipt and AP history | Confirm KPI value basis and status rules |
| P0 | Customer subtype on Page 49 | Strong sales, dispatch and AR history | Confirm KPI value basis and due-date behavior |
| P0 | Material on Page 59 | Stock, purchase and sales history | Never combine mixed UOM quantities |
| P1 | Location/Branch on Page 25 | Stock, sales, purchases and open operations by location | Use branch flag; enforce user location scope |
| P1 | Storage Location on Page 128 | Stock placement and movement | Validate exact storage-level balance calculation |
| P1 | Transporter subtype on Page 49 | GRN, dispatch and freight advice history | Exclude unsupported POD/GPS KPIs |
| P1 | Material Category on Page 55 | Useful item-level aggregation | Approve slow-moving threshold and value basis |
| P1 | Material Group on Page 37 | Useful item-level aggregation | Confirm `ITEM.ITEMTYPE` hierarchy |
| P2 | Salesperson subtype of Employee Page 85 | Sales/order history can be attributed | Confirm `SALESEXECUTIVECODE -> EMPLOYEE` mapping |
| P2 | Production Centre Page 206 | Operational history may be useful | Define trustworthy production/WIP measures |
| P2 | Asset Page 675 / Category 668 | Asset movement/depreciation history | Separate accounting definition and access review |

### 3.2 Insights not useful or not honest at present

- Tiny reference masters: City, UOM, HSN, SAC, item dimensions/grade/make/class/nature/characteristics, Packing Type, Vehicle Type, Freight Type, Industry Sector.
- Technical/security masters: Module, Module Group, Module Location, Module Privilege, BOSS User, Code Scheme, Module Flow, Process Routing/TAT/Escalation and related setup pages.
- HR configuration masters: designation, shift, salary/loan/attendance/leave/reimbursement setup.
- Tax/accounting configuration masters: TDS categories, Footer Account/Head, Tax Rule, GST Setup, Service Type Account, Item Account.
- Cost Centre until ledger attribution coverage is sufficient.
- Company Vehicle until transaction linkage is normalized.
- Vendor Page 350 until its relationship with transactional `PARTY.PARTYCODE` is proven and one master is declared authoritative.

These pages should not receive an Insights button merely for visual consistency.

## 4. Shared calculation rules

1. **As-of date:** database `TRUNC(SYSDATE)` unless a reviewed page-level as-of selector is explicitly introduced.
2. **YTD:** current ERP financial-year start through the as-of date, not calendar year. Resolve from the active `FINANCIALYEAR` record used by the session.
3. **MTD:** `TRUNC(as_of_date,'MM')` through the as-of date.
4. **Scope:** every query must apply the same company, location, document-type and panel authorization used by its target register. Existing `PCC_*` scoped views and `SAGAR.GetUserPanelAB_apex()` should be used where they already encode that rule.
5. **Record identity:** browser sends only the saved master context (`P49_TNO` or `P59_TNO`). The server validates record existence and resolves `PARTYCODE`/`ITEMCODE`. Names are never accepted as keys.
6. **Document status:** use current ERP status functions/latest-revision views; do not guess from labels. PO/SO amendments must not double-count replaced revisions.
7. **Money:** use base currency and clearly state whether the metric is line value or document total. The pilot recommendation below uses booked line value to match existing 935/936 analytics; tax-inclusive totals need explicit sign-off.
8. **Quantity:** never sum different measuring units. Return quantities as an array grouped by UOM. The drawer shows the primary UOM plus “+N units” when required.
9. **Null coverage:** unavailable due date, rate, reservation, POD or GPS context produces `N/A` plus a coverage note; never `0`.
10. **Returns/negative lines:** included in net value only where the source represents a signed accounting/business value; otherwise shown as a separate future metric.

## 5. Supplier Master KPI plan — Page 49, `PARTYTYPE='SUPPLIER'`

| KPI | Business meaning | Exact source | Formula / rule | Drilldown | Priority |
|---|---|---|---|---|---|
| Purchase YTD | Net booked purchases in current FY | `PCC_PURCHASEBILL h`, `PURCHASEBILLDETAIL d` | `SUM(d.AMOUNT)` where `d.TNO=h.TNO`, `h.PARTYCODE=:party_code`, FY and authorization scope | Page 935 Supplier 360; Page 142 Purchase Bill Register with `P142_PARTY` | P0 |
| Open PO | Active latest POs with positive remaining qty | `V_LATEST_PURCHASE_ORDERS`, `PURCHASEORDERDETAIL`, linked `GRN/GRNDETAIL` and `MATERIALIN/DETAIL` | `COUNT(DISTINCT po.TNO)` where set-based pending quantity equivalent to `GETPENDINGPOQUANTITY1(...)` is `>0` | Page 117 with `P117_PARTYNAME=:party_code`, active status | P0 |
| Open PO Value | Value still to receive | same as Open PO | `SUM(pending_qty * d.RATE)` by rate UOM; exclude cancelled/closed/short-closed lines under existing rules | Page 117 | P0 |
| Pending GRN | Ordered quantity not yet received/accepted | same as Open PO | set-based equivalent of existing pending-PO function, grouped by `RATEMEASURINGUNITCODE`; show document count as context | Page 117; current single `P117_GRNSTATUS` cannot express Pending + Partial together, so add a reviewed saved constraint before exact combined drilldown | P0 |
| Supplier Outstanding | Open supplier liability as of today | `VOUCHER`, `VOUCHERDETAIL`, `DRCRALLOCATION`; due-source joins from Page 923 | per open credit item: `d.AMOUNT - NVL(allocation,0)`; sum only positive remaining items; allocation includes only vouchers dated on/before as-of | Page 923 with `P923_PARTY=:party_code` | P0 |
| Overdue Payable | Open liability past its derived due date | Page 923 source chain: `PBPASS -> PURCHASEBILL -> PURCHASEBILLDETAIL -> PURCHASEORDER`, `JOBBILL/JOBORDER`, `ACCOUNTOPENING` | sum positive outstanding where derived due date `< as_of`; exclude null due dates and return coverage count | Page 923 | P0 |
| Last Purchase | Most recent booked purchase | `PCC_PURCHASEBILL.PURCHASEBILLDATE` | `MAX(PURCHASEBILLDATE)` by party and scope | Page 142 | P0 |
| Average Delivery Delay | Receipt performance versus promised date | `PURCHASEORDER.DELIVERYDATE`, `GRN.GRNDATE`, PO/GRN linkage | weighted by received qty: `SUM(max(grn_date-delivery_date,0)*received_qty)/SUM(received_qty)`; linked rows only | Page 145 GRN Register | P1 after business sign-off |

**Supplier recent activity:** latest 3–5 Purchase Orders (`PURCHASEORDERNO/DATE`), GRNs (`GRNNO/DATE`) and Purchase Bills (`PARTYBILLNO`, `PURCHASEBILLDATE`), each linked by TNO/code under the same authorization scope.

## 6. Customer Master KPI plan — Page 49, `PARTYTYPE='CUSTOMER'`

| KPI | Business meaning | Exact source | Formula / rule | Drilldown | Priority |
|---|---|---|---|---|---|
| Sales YTD | Net booked sales in current FY | `CCINVOICE h`, `CCINVOICEDETAIL d` | `SUM(d.AMOUNT)` for customer, FY and authorization scope | Page 174 with `P174_PARTY=:party_code` | P0 |
| Open Sales Orders | Latest active SOs with quantity left | `V_LATEST_ACTIVE_SALESORDERS`, `SALESORDERDETAIL`, `CCINVOICEDETAIL`; reconcile with `V_DASHBOARD_SALES_SUMMARY` | `COUNT(DISTINCT so.TNO)` where `GREATEST(order_qty-invoiced_qty,0)>0` | Page 170 with `P170_PARTY=:party_code`, active status | P0 |
| Open Order Value | Remaining un-invoiced order value | same as Open SO | `SUM(pending_qty * d.RATE)` using latest active revision | Page 170 | P0 |
| Pending Dispatch | Quantity/value awaiting dispatch | `V_DASHBOARD_SALES_SUMMARY` and SO/dispatch detail | pending quantity grouped by UOM; value = pending qty × order rate | Page 160 with `P160_PARTY=:party_code` | P0 |
| Receivable | Customer open-item exposure as of today | Page 910 `VOUCHER`, `VOUCHERDETAIL`, `DRCRALLOCATION` logic | per item receivable = `-(d.AMOUNT-NVL(allocation,0))`; sum positive receivable items | Page 910 with `P910_PARTY=:party_code` | P0 |
| Overdue | Receivable past derived due date | Page 910 due-date chain: invoice, service bill and account opening sources | sum positive receivable where derived due date `< as_of`; null due dates excluded and counted | Page 910 | P0 |
| Credit Utilization | Exposure against approved credit | `PARTY.CREDITAMOUNT` plus Receivable | `receivable / CREDITAMOUNT * 100`; if credit amount is null/zero, return `N/A` | Page 910 | P1 |
| Last Sale | Latest sales invoice | `CCINVOICE.CCINVOICEDATE` | `MAX(CCINVOICEDATE)` by customer and scope | Page 174 | P0 |

`PARTY.CREDITDAYS` is currently null across the audited customer population; it must not be used to manufacture overdue dates. Reuse the Page 910 document-specific due-date logic.

**Customer recent activity:** latest Sales Orders, Dispatch Advices, CC Invoices and receipts/allocations, maximum five rows total.

## 7. Material Master KPI plan — Page 59

| KPI | Business meaning | Exact source | Formula / rule | Drilldown | Priority |
|---|---|---|---|---|---|
| Current Stock | On-hand quantity | `V_STOCKCARD` / existing stock-card logic | `SUM(QUANTITY1)` through as-of date by `ITEMCODE`, grouped by UOM/specification and authorized location | Page 10 Item Ledger; Page 407 Stock Statement | P0 |
| Stock Value | Recorded inventory value | `V_STOCKCARD.AMOUNT` or the verified stock balance source behind Page 407 | `SUM(AMOUNT)` using recorded lot/stock rate; return missing-rate coverage (audited 4 of 4,283 rows missing rate) | Page 407 | P0 |
| Open PO Qty | Quantity expected from active purchase orders | `V_LATEST_PURCHASE_ORDERS`, `PURCHASEORDERDETAIL`, receipt/material-in aggregates | set-based pending-PO formula equivalent to `GETPENDINGPOQUANTITY1`, grouped by UOM/spec | Page 117 with `P117_ITEM`, `P117_ITEMSPECIFICATION` | P0 |
| Open SO Qty | Quantity committed on active sales orders | `V_LATEST_ACTIVE_SALESORDERS`, `SALESORDERDETAIL`, invoice aggregates | set-based equivalent to `GETPENDINGSOQUANTITY1`, grouped by UOM/spec | Page 170 with `P170_ITEM`, `P170_ITEMSPECIFICATION` | P0 |
| Planning Surplus / Shortage | Supply coverage, not available stock | Current Stock + Open PO − Open SO | calculate per UOM/spec only; label explicitly “Planning surplus/shortage” | Item 360 Page 936 | P0 |
| Last Purchase Rate | Most recent realised buy rate | `PCC_PURCHASEBILL`, `PURCHASEBILLDETAIL` | rate of latest valid bill line ordered by `PURCHASEBILLDATE,TNO,SNO`, returned with rate UOM and specification | Page 936 | P0 |
| Last Sale Rate | Most recent realised sale rate | `CCINVOICE`, `CCINVOICEDETAIL` | latest line rate ordered by `CCINVOICEDATE,TNO,SNO`, with UOM/spec | Page 174 | P1 |
| Last Movement | Latest inventory movement | `V_STOCKCARD.TRANSACTIONDATE` | `MAX(TRANSACTIONDATE)` by item and scope | Page 10 | P0 |

Do **not** show “Available” or “Reserved” in the pilot. `RESERVESTOCKSTORAGEDETAIL` exists but audited row count is zero; presenting Current − Reserved as an operational truth would be misleading.

**Material recent activity:** latest stock movement, purchase bill and sales invoice, with document number, date, quantity and UOM.

## 8. Warehouse / Location plan

There is no standalone warehouse master. Two scopes must remain distinct.

### 8.1 Location / Branch — Page 25

Candidate P1 KPIs:

- Stock Value: `SUM(V_STOCKCARD.AMOUNT)` by `LOCATIONCODE`.
- Stock Quantity: grouped by UOM; never one mixed total.
- SKU Count: `COUNT(DISTINCT ITEMCODE)` with non-zero balance.
- Inward Today: positive stock/receipt movement for today.
- Outward Today: negative stock/issue movement for today.
- Open PO Value and Open SO Value scoped by `LOCATIONCODE`.
- Pending Dispatch from `V_DASHBOARD_SALES_SUMMARY` / dispatch sources.

For records where `LOCATION.ISITBRANCH` indicates a branch, the title becomes **Branch Insights** and can add Sales MTD, Purchase MTD, Receivable and Payable. It must still remain 5–7 primary KPIs.

### 8.2 Storage Location — Page 128

Candidate P1 KPIs are Stock Quantity, Stock Value, SKU Count, Inward Today, Outward Today and Last Movement. The exact balance must first be reconciled to Page 407 using `STOCK`, `STOCKSTORAGEDETAIL`, `USEDSTOCK` and existing opening/balance functions. No rollout until totals match the existing stock statement.

Unsupported now: Available Stock, Reserved Stock and Processing Stock unless a populated and reconciled source is introduced.

## 9. Transporter Master plan — Page 49, `PARTYTYPE='TRANSPORTER'`

Candidate P1 KPIs:

| KPI | Source / definition |
|---|---|
| Trips MTD | distinct operational documents from `GRN` and/or `DESPATCHADVICE` with `TRANSPORTERCODE=:party_code`; define whether inward and outward trips are combined or split |
| Freight MTD | `SUM(FREIGHTADVICE.FREIGHTADVICEAMOUNT)` or approved net-payable basis by `TRANSPORTERCODE` and MTD |
| Active Trips | only if an explicit operational status source is approved; do not infer from missing invoice alone |
| Freight Bill Pending | unpassed/unsettled freight advice after exact workflow reconciliation |
| Transporter Outstanding | Page 923 open-item AP formula when transporter is an accounting party |
| Average Delivery Time | only for linked dispatch/receipt records with defined start/end events |
| Last Activity | latest GRN, Dispatch Advice or Freight Advice date |

Do not include POD Pending, GPS/current location or reliable detention until real data coverage exists. `PODDETAIL` currently has zero rows.

## 10. Vehicle Master plan

**Decision: not eligible for rollout now.**

- Page 91 exists but `COMPANYVEHICLE` module is inactive.
- `GRN.COMPANYVEHICLECODE` is not populated in the audited data.
- GRN, Dispatch and invoice vehicle-number values did not match Company Vehicle master rows in the audit.
- Existing Page 724 Vehicle 360 follows free-text `MATERIALOUT.VEHICLENO`; it is not a safe master-ID relationship.

Prerequisite project:

1. choose one canonical vehicle key;
2. populate it on inbound/outbound/freight transactions;
3. backfill and reconcile registrations;
4. enforce future linkage;
5. only then define Trips MTD/YTD, Last Trip, Freight, Turnaround, Detention and Utilization.

GPS/current location must remain absent unless a genuine GPS feed is added.

## 11. Branch plan — Page 25 branch records

| KPI | Definition | Source | Priority |
|---|---|---|---|
| Sales MTD | booked sales line value for branch location | `CCINVOICE/CCINVOICEDETAIL` | P1 |
| Purchase MTD | booked purchase line value for branch location | `PCC_PURCHASEBILL/PURCHASEBILLDETAIL` | P1 |
| Stock Value | recorded stock value at location | `V_STOCKCARD` | P1 |
| Open SO Value | latest active SO remaining value | SO latest view + detail/invoice aggregates | P1 |
| Open PO Value | latest active PO remaining value | PO latest view + receipt aggregates | P1 |
| Receivable | open AR items for location | Page 910 allocation logic with location filter | P1 |
| Payable | open AP items for location | Page 923 allocation logic with location filter | P1 |
| Pending Dispatch | remaining dispatch value | `V_DASHBOARD_SALES_SUMMARY` | P1 |

The first release should select six, not all eight. Cost-centre P&L is excluded: current ledger/cost-centre attribution is insufficient for a trustworthy branch profitability KPI. Page 906 can remain a separate analytical destination.

## 12. Material Category / Group aggregate plan

Both Page 55 Category and Page 37 Group can reuse one aggregate provider with a different item predicate.

| KPI | Formula | Priority |
|---|---|---|
| Materials | `COUNT(DISTINCT ITEM.ITEMCODE)` in category/group | P1 |
| Stock Value | sum item stock value | P1 |
| Open Purchase Value | sum item open PO remaining value | P1 |
| Open Sales Value | sum item open SO remaining value | P1 |
| Purchase MTD | sum purchase-bill line amount | P1 |
| Sales MTD | sum sales-invoice line amount | P1 |
| Shortage Items | count items where stock + open PO − open SO `< 0`, calculated per UOM/spec | P1 |
| Non-moving Items | count non-zero-stock items with no movement for approved threshold | P2 |

The non-moving threshold must be configuration (for example 90 days) and approved before release. Page 725 already supplies a sales-only category view; the drawer should link to it where useful but use the common provider for cross-functional values.

## 13. Exact source map

| Domain | Tables/views and key columns |
|---|---|
| Party identity | `PARTY(TNO, PARTYCODE, PARTYNAME, PARTYTYPE, CREDITAMOUNT, VENDORCODE, VENDORTNO)` |
| Material identity | `ITEM(TNO, ITEMCODE, ITEMNAME, ITEMCATEGORYCODE, ITEMTYPE, MEASURINGUNITCODE1, MEASURINGUNITCODE2)` |
| Purchase order | `PURCHASEORDER(TNO, PARTYCODE, PURCHASEORDERNO, PURCHASEORDERDATE, DELIVERYDATE, COMPANYCODE, LOCATIONCODE)`; `PURCHASEORDERDETAIL(TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY1,RATE,RATEMEASURINGUNITCODE,AMOUNT,DOCUMENTSTATUSCODE)`; `V_LATEST_PURCHASE_ORDERS` |
| Receipt | `GRN(TNO,PARTYCODE,PURCHASEORDERTNO,GRNNO,GRNDATE,TRANSPORTERCODE,VEHICLENO,LOCATIONCODE)`; `GRNDETAIL(TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,RECEIVEDQUANTITY1,ACCEPTEDQUANTITY1,REJECTEDQUANTITY1)` |
| Purchase bill | `PURCHASEBILL(TNO,PARTYCODE,PURCHASEBILLDATE,PARTYBILLNO,PURCHASEBILLAMOUNT,COMPANYCODE,LOCATIONCODE)`; `PURCHASEBILLDETAIL(TNO,SNO,PURCHASEORDERTNO,ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY1,RATE,RATEMEASURINGUNITCODE,AMOUNT)`; scoped `PCC_PURCHASEBILL` |
| AP / bill pass | `PBPASS(TNO,PARTYCODE,PURCHASEBILLTNO,PBPASSDATE,PBPASSAMOUNT,DUEDATE,PAIDAMOUNT,PAIDINADVANCE,SUMOFTDSAMOUNT)`; `PENDINGBILLS` is supporting coverage only; authoritative open-item formula comes from Page 923 ledger allocations |
| Sales order | `SALESORDER(TNO,PARTYCODE,SALESORDERNO,SALESORDERDATE,DELIVERYDATE,SALESORDERAMOUNT,LOCATIONCODE,SALESEXECUTIVECODE)`; `SALESORDERDETAIL(TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY1,RATE,RATEMEASURINGUNITCODE,AMOUNT,DESPATCHADVICEQUANTITY1,CCINVOICEQUANTITY1,DOCUMENTSTATUSCODE)`; `V_LATEST_ACTIVE_SALESORDERS` |
| Dispatch | `DESPATCHADVICE(TNO,PARTYCODE,SALESORDERTNO,DESPATCHADVICENO,DESPATCHADVICEDATE,TRANSPORTERCODE,VEHICLENO,LOCATIONCODE)`; `DESPATCHADVICEDETAIL(TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY1,CANCELEDQUANTITY1,RATE)`; `V_DASHBOARD_SALES_SUMMARY` |
| Sales invoice | `CCINVOICE(TNO,PARTYCODE,CCINVOICENO,CCINVOICEDATE,CCINVOICEAMOUNT,SALESORDERTNO,LOCATIONCODE)`; `CCINVOICEDETAIL(TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY1,RATE,RATEMEASURINGUNITCODE,AMOUNT)` |
| AR/AP open items | `VOUCHER`, `VOUCHERDETAIL(TNO,SNO,ACCOUNTCODE,AMOUNT,VOUCHERDATE,COMPANYCODE,LOCATIONCODE,MODULETNO)`, `DRCRALLOCATION(DRVOUCHERTNO,DRVOUCHERSNO,CRVOUCHERTNO,CRVOUCHERSNO,AMOUNT)` plus document due-date joins used on Pages 910/923 |
| Stock | `V_STOCKCARD/STOCKCARD(ITEMCODE,ITEMSPECIFICATIONCODE,LOCATIONCODE,QUANTITY1,RATE,AMOUNT,TRANSACTIONDATE)`; `STOCK`; `USEDSTOCK`; `STOCKSTORAGEDETAIL(TNO,STORAGELOCATIONCODE)` |
| Freight | `FREIGHTADVICE(TNO,TRANSPORTERCODE,FREIGHTADVICENO,FREIGHTADVICEDATE,FREIGHTADVICEAMOUNT,DUEDATE,PAIDAMOUNT,LOCATIONCODE)`; `FREIGHTADVICEDETAIL(TNO,SNO,MODULECODE,MODULETNO,QUANTITY1,RATE,AMOUNT,VEHICLENO)` |
| Location | `LOCATION(TNO,LOCATIONCODE,LOCATIONNAME,COMPANYCODE,ISDIVISION,ISITBRANCH,BRANCHTYPECODE)`; `STORAGELOCATION(TNO,STORAGELOCATIONCODE,STORAGELOCATIONNAME,PARENTCODE)` |

## 14. Drilldown map

Every link passes a code/TNO key, never only a displayed name.

| Insight | Target | Items to set |
|---|---:|---|
| Supplier Purchase YTD / Last Purchase | 935 Supplier 360 or 142 Purchase Bill Register | `P935_SUPPLIER` or `P142_PARTY` = `PARTYCODE` |
| Supplier Open PO | 117 Purchase Order Register | `P117_PARTYNAME=PARTYCODE`, active status; reviewed Pending+Partial constraint for pending GRN |
| Supplier Outstanding / Overdue | 923 Creditor 360 | `P923_PARTY=PARTYCODE`, company/location/date scope |
| Supplier Recent GRN | 145 GRN Register | `P145_PARTY=PARTYCODE` |
| Customer Open SO | 170 Sales Order Register | `P170_PARTY=PARTYCODE`, status |
| Customer Pending Dispatch | 160 Dispatch Register | `P160_PARTY=PARTYCODE` |
| Customer Sales / Last Sale | 174 CC Invoice Register | `P174_PARTY=PARTYCODE` |
| Customer Receivable / Overdue | 910 Debtor 360 | `P910_PARTY=PARTYCODE`, company/location/date scope |
| Material procurement analysis | 936 Item 360 | `P936_ITEMCODE=ITEMCODE`, optional UOM/spec |
| Material stock | 10 Item Ledger / 407 Stock Statement | `P10_ITEMCODE` or `P407_ITEM`; pass specification/location when available |
| Material Open PO | 117 | `P117_ITEM=ITEMCODE`, `P117_ITEMSPECIFICATION` when selected |
| Material Open SO | 170 | `P170_ITEM=ITEMCODE`, `P170_ITEMSPECIFICATION` when selected |
| Category | 725 Category 360 | category code, after target item mapping is confirmed |

Use `APEX_PAGE.GET_URL`, clear only the target page, and protect URLs/checksums according to the target page's security setting.

## 15. Common Oracle APEX architecture

### 15.1 Components

1. **One server package**, proposed `IMART_MASTER_INSIGHTS`, with no DML:
   - `GET_PAYLOAD(p_master_type, p_master_tno, p_company_code, p_location_code, p_as_of_date) return CLOB`;
   - server-side identity resolution and subtype validation;
   - authorization/scope enforcement;
   - master-specific aggregate providers;
   - JSON payload generation.
2. **One APEX AJAX/on-demand callback** per onboarded page, or one application-level callback if the current APEX version/security model supports it cleanly.
3. **One shared JavaScript renderer** for loading, loaded, empty, error and stale states.
4. **One shared CSS component** scoped under `.mi-...` classes so it cannot change register/forms globally.
5. **One configuration map**, preferably a table owned by the application schema but read-only to runtime code:

| Field | Purpose |
|---|---|
| `MASTER_TYPE` | `SUPPLIER`, `CUSTOMER`, `MATERIAL`, etc. |
| `PAGE_ID` | source master page |
| `CONTEXT_ITEM` | `P49_TNO`, `P59_TNO`, etc. |
| `KPI_CODE`, `LABEL`, `DISPLAY_ORDER` | rendered KPI definition |
| `FORMAT_CODE` | currency, number, quantity, percent, date, duration |
| `PROVIDER_CODE` | allow-listed package provider, **not arbitrary SQL text** |
| `DRILLDOWN_PAGE`, `DRILLDOWN_MAP` | target and key mapping |
| `STATUS_RULE` | neutral/positive/warning/critical mapping |
| `IS_ENABLED`, `FEATURE_FLAG` | controlled rollout |

Do not store executable free-form SQL in a user-editable configuration table.

### 15.2 Payload contract

```json
{
  "masterType": "SUPPLIER",
  "recordKey": "12345",
  "businessKey": "SUP001",
  "title": "Supplier Insights",
  "subtitle": "ABC Steel Ltd.",
  "asOf": "2026-09-30",
  "metrics": [
    {"code":"OPEN_PO","label":"Open PO","value":18,"format":"NUMBER","tone":"neutral","url":"..."}
  ],
  "recent": [
    {"type":"PO","documentNo":"PO/26/1842","date":"2026-09-29","url":"..."}
  ],
  "coverage": [],
  "refreshedAt": "2026-09-30T18:00:00+05:30"
}
```

The server returns escaped data; the client renders text nodes, not unsanitized HTML.

### 15.3 Saved/new record behavior

Several forms allocate a global TNO before the first save. Therefore `P49_TNO is not null` is **not** sufficient. The callback/button condition must verify that the master row exists in the table. For an unsaved record:

- disable Insights, or
- show “Insights will be available after this master record is created.”

No zero KPI payload is returned.

## 16. Drawer visual and interaction specification

- Desktop width: **400 px**, constrained to **360–440 px**.
- Position: fixed to the right of the viewport; overlay with its own surface and shadow. It must not change `.t-Body-main` width or margin.
- Mobile/narrow view: full-width modal sheet, not a squeezed 360 px panel.
- Background `#FFFFFF`; secondary surface `#F8FAFC`; border `#E2E8F0`; primary text `#172033`; secondary text `#64748B`; primary blue `#2563EB`.
- Green only for healthy/positive, amber only for warning, red only for overdue/critical. Neutral is the default.
- Header: title, master name/code, as-of timestamp, Refresh icon, Close button.
- Body: one primary KPI spanning the width, then compact two-column KPI cells; 4–7 KPIs total; 3–5 recent activities; one or two drilldown links.
- Loading: compact skeleton inside drawer only. The underlying form is never masked, refreshed or recolored.
- Error: inline retry state; form stays usable.
- Accessibility: `role="dialog"`, accessible name, focus trap while open, Escape closes, Close button keyboard accessible, and focus returns to the Insights button.
- Preserve underlying form scroll and cursor. Record `activeElement` and page scroll before open; never submit the page; never change Tab order of underlying items.

## 17. Query and performance strategy

1. **Zero KPI queries on master page load.** Only the button existence condition may perform a single indexed master-row existence check.
2. **One AJAX request per open** and one aggregate SQL statement/CTE per master wherever practical. Avoid seven round trips and avoid PL/SQL loops that call pending functions once per line.
3. Reproduce `GETPENDINGPOQUANTITY1` / `GETPENDINGSOQUANTITY1` business rules in set-based CTEs only after reconciliation tests prove identical totals.
4. Reuse `PCC_*` scoped views and Pages 910/923 allocation logic rather than duplicating weaker security or accounting formulas.
5. Client cache key: `MASTER_TYPE:TNO:COMPANY:LOCATION:AS_OF`. TTL 60–120 seconds; invalidate when master context changes; Refresh bypasses cache.
6. Initial response target: p95 under 800 ms for Supplier/Customer and under 1.2 s for Material. Hard timeout returns a non-blocking error state.
7. Instrument callback elapsed time and provider code in APEX debug/application log without logging sensitive amounts or names.
8. Before index DDL, capture explain plans and actual runtime. Current data volumes are modest, but PartyCode/date predicates on PO/SO headers should be measured. Any new index is a separately reviewed change.
9. No session-global precomputation and no population of legacy `D_*_360VIEW` tables on drawer open.

## 18. Pilot implementation plan

### Stage A — reviewed contract

1. Approve the KPI definitions and value basis (line value versus document total).
2. Approve status exclusions and FY/date scope.
3. Approve target drilldowns and the Pending+Partial PO constraint.
4. Freeze test suppliers, customers and materials covering normal and edge cases.

### Stage B — common shell, feature flag off

1. Create package specification/body and configuration allow-list.
2. Create shared drawer static region/template assets with `.mi-` scoping.
3. Add AJAX callback and client renderer.
4. Add server-side authorization tests and logging.

### Stage C — three pilot providers

1. Page 49 Supplier subtype.
2. Page 49 Customer subtype.
3. Page 59 Material.

The Page 49 button/provider changes dynamically by validated `PARTYTYPE`; it does not create duplicate supplier/customer forms.

### Stage D — reconcile before UI acceptance

- compare supplier purchase totals to Page 935 and registers;
- compare AP to Page 923;
- compare customer AR to Page 910;
- compare material purchase rates to Page 936;
- compare stock quantity/value to Pages 10 and 407;
- compare open PO/SO detail line-by-line for amendment, cancellation and partial-receipt cases.

### Stage E — controlled release

Enable for named test users, then one business role, then all authorized users only after reconciliation and performance sign-off.

## 19. Rollout sequence

1. **Pilot:** Supplier, Customer, Material.
2. **Phase 2A:** Location/Branch, Storage Location after stock reconciliation.
3. **Phase 2B:** Material Category, Material Group.
4. **Phase 2C:** Transporter without POD/GPS claims.
5. **Phase 3:** Salesperson if employee linkage and attribution are proven; Production Centre/Assets only under separate definitions.
6. **Blocked:** Company Vehicle until canonical linkage exists; Cost Centre until accounting coverage improves.

## 20. Test matrix

| Area | Test | Expected result |
|---|---|---|
| New record | Open unsaved master with preallocated TNO | Insights disabled/message; no KPI query; no fake zeroes |
| Existing record | Open saved supplier/customer/material | Form performs no KPI aggregate query until click |
| Lazy load | Click Insights once | One AJAX request; drawer loading then data; no page submit/refresh |
| Form state | Modify an unsaved field, place cursor mid-value, open/close drawer | value, cursor, scroll and dirty state remain unchanged |
| Keyboard | Open by keyboard, tab, press Escape | focus trapped in drawer; Escape closes; focus returns to button |
| Identity | Tamper browser request from supplier TNO to customer/material TNO | server rejects subtype/context mismatch |
| Authorization | User lacks company/location/document access | excluded data is never returned; drilldown cannot widen scope |
| XSS | Master/document name contains markup characters | rendered as escaped text |
| Supplier | Partial GRN, PO amendment, cancelled/short-closed line | open PO/quantity/value reconcile to approved register logic |
| Supplier AP | Part payment, advance, credit/debit allocation, null due date | Page 923 totals reconcile; null due date counted, not overdue |
| Customer | Partial dispatch/invoice and SO revision | open SO/pending dispatch reconcile without double-counting |
| Customer AR | Receipt/credit allocation and opening balance | Page 910 totals reconcile as of date |
| Material | Multiple specs/UOMs/locations | quantities remain separated by UOM/spec; no mixed total |
| Stock | Missing rate | quantity shown; value coverage warning; no fabricated rate |
| Drilldown | Click every KPI and recent row | correct target, code-based filter, checksum and authorization |
| Context change | Navigate to a different master record | old cached payload invalidated; no stale name/KPI flash |
| Repeat open | Close/reopen within TTL and use Refresh | cache reused; Refresh forces one new request |
| Failure | Timeout/SQL error/network loss | compact retry state; form remains usable and unchanged |
| Responsive | 320 px, tablet, desktop, browser zoom 200% | sheet/drawer usable; no horizontal page resize |
| Performance | representative high-history supplier/customer/material | p95 targets met; no N+1 query/function loop |
| Regression | Save/New/Delete/validation/approval on master | behavior identical with feature off and on |
| Accessibility | screen reader name, contrast, focus order | WCAG-compatible dialog behavior and visible focus |

## 21. Audit evidence and data-quality notes

- App 105 live Module map: 247 active module entries were inspected; native APEX metadata reported 211 form regions and 666 form-DML-like processes. Inventory was then restricted to real master/configuration pages rather than transaction pages.
- Party subtype population observed: Customer 2,143; Transporter 703; Account 460; Supplier 207; Account Group 83; Agent 56; Contractor/Service Provider 14; Bank 5.
- PO supplier linkage: 616/616; GRN-to-PO linkage: 1,225/1,230.
- SO customer linkage: 3,232/3,232; Dispatch linkage: 2,878/2,878.
- AP pending-bill coverage: 1,592 rows; 1,065 usable non-zero balances; 27 missing due-date context.
- AR dataset: 2,722 rows; Party-level customer `CREDITDAYS` was null throughout the audited population, hence Page 910 document logic is mandatory.
- Stock rate coverage: 4,279/4,283 rows; stock/storage linkage: 4,283/4,283.
- Reservation rows: 0; POD detail rows: 0; Weighment rows: 0; populated `GRN.COMPANYVEHICLECODE`: 0.

These are planning-time observations, not permanent assumptions. The implementation acceptance tests must re-check coverage in the target environment.

## 22. Review decisions required before implementation

1. Purchase/Sales YTD: booked **line value** (recommended, matches current 935/936 analytics) or tax-inclusive document total?
2. Pending GRN: quantity by UOM plus PO count, and approval to add an exact Pending+Partial drilldown constraint on Page 117?
3. Branch first release: which six of the eight proposed KPIs?
4. Non-moving threshold for Category/Group: 90 days or another reviewed rule?
5. Feature-flag pilot users/roles and the representative records for reconciliation?

No code or APEX component should be implemented until these definition choices and this plan are approved.
