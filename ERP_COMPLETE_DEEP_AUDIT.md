# iboss Oracle APEX ERP — Complete Deep Audit

**Application:** Imart / Application 105  
**Audit date:** 25 September 2026  
**Audit mode:** Read-only; no Save, Submit, Delete, Apply, Approve, Post or database-changing action was performed  
**Source instruction:** `Application Audit.txt` ke 46 audit sections follow kiye gaye hain  
**Language:** Simple Hinglish, with technical evidence where required

---

# 1. Executive Summary

Pehle diya gaya short report complete application audit nahi tha. Is revised audit mein:

- **625 canonical APEX pages** statically inspect kiye gaye.
- **22,008 APEX components** ka component-level inventory banaya gaya.
- **13 top-level module hubs** Chrome mein live load karke verify kiye gaye.
- **38 high-risk master aur transaction entry pages** Chrome mein read-only load kiye gaye.
- **2,286 regions, 9,440 items, 3,049 buttons, 4,896 Dynamic Actions, 9,811 DA actions, 1,941 processes, 321 Interactive Grids, 417 Interactive Reports aur 99 tab containers** scan kiye gaye.
- 625-page detailed inventory, 22,008-component inventory aur 250-row remediation backlog alag CSV files mein diya gaya hai.

## Seedha conclusion

Current ERP normal conditions mein kaam kar sakta hai, lekin source aur runtime evidence ke basis par ise abhi confidently yeh guarantee nahi di ja sakti:

> Har transaction slow network, repeat click, multiple tabs, stale record aur concurrent users mein exactly once, complete, atomic aur correct save hoga.

Sabse serious concerns:

1. **Application-level page protection disabled hai.**
2. **Administration authorization scheme unconditional `return true` karta hai.**
3. **Authentication cookies secure flag ke bina configured hain.**
4. **168 pages mein report credentials source/URLs mein hard-coded pattern mila; 7 aise pages public-marked bhi hain.** Actual secret values report mein repeat nahi kiye gaye.
5. **11 business/report pages public-marked hain**, login page ko chhod kar.
6. **398 explicit `COMMIT` statements 199 pages mein hain**, jabki explicit `ROLLBACK` sirf 10 pages mein mila.
7. **190 pages mein COMMIT mila but same page source mein ROLLBACK nahi mila.** Yeh har page ko automatically broken prove nahi karta, par transaction boundary fragmented hone ka strong signal hai.
8. **42 pages ke 46 custom Interactive Grid DML processes ROWID se update karte hain**, lekin old-value checksum/row-version comparison visible nahi hai. Lost update possible hai.
9. **Purchase Bill page 143 mein two no-wait Dynamic Action server calls** mile; inmein server-side work/commit present hai. Slow network aur rapid user interaction mein race/partial-state risk confirmed architectural issue hai.
10. **141 pages par unsaved-change warning explicitly disabled hai.**
11. **172 transaction entry pages mein processes hain but declarative page validations zero hain.** Kuch pages custom PL/SQL validation processes use karte hain, isliye iska matlab “validation bilkul nahi hai” nahi hai; standardization aur sequencing audit required hai.
12. Chrome console par repeatedly **DOMPurify missing**, **Oracle JET locale resource script error/timeout**, aur ek page par **IG `add-row` action error** observe hua.

## Overall risk rating

| Area | Rating | Reason |
|---|---|---|
| Data integrity | Critical / High | Mid-flow commits, custom DML, weak stale-update protection |
| Security | Critical | Page protection off, admin authorization always true, public business pages, hard-coded credentials |
| Slow-network safety | High | DA/AJAX-heavy forms, no-wait actions, repeatable server calls |
| Concurrency | High | 42 pages with ROWID-based custom updates without visible row version check |
| Multiple tabs/session state | High | Large item/session-state footprint and many AJAX/DA flows |
| Error handling | High | Uneven rollback; browser console failures; possible false-success paths |
| Maintainability | High | 4,896 DAs and 1,495 explicit DML statements spread across pages |
| Performance | Medium/High | Heavy forms, many grids/actions, repeated resource-load errors |

---

# 2. Scope, Evidence and Limitations

## Audited evidence

1. APEX export under:
   `app105-source/business-insights-live-export/f105/application`
2. Chrome live runtime using the authenticated ERP session supplied by the user.
3. Top-level hubs, representative master pages, and major end-to-end transaction pages.
4. Browser console errors.
5. Application/security shared components.

Duplicate `_1.sql` page copies were not counted as separate canonical pages.

## Important limitation

No Save/Submit/Delete/Post/Approve action was executed because the user asked for audit only and application data must not be changed. Therefore:

- Actual insert/update/delete outcomes were not generated.
- No double-click Save was executed against production.
- No artificial network throttling was applied to production.
- No User A/User B destructive concurrency test was executed.
- Database schema definitions, constraints, triggers and package bodies are not all present in this export, so database-level claims are limited to visible APEX source.

Where runtime mutation is required, this report says:

**INSUFFICIENT EVIDENCE — REQUIRES STAGING RUNTIME TESTING.**

---

# 3. Application Architecture Overview

| Item | Evidence |
|---|---|
| Application ID | 105 |
| Application name | Imart |
| Default owner/schema | IMART |
| Export/runtime version | APEX 26.1.2 visible in source/runtime assets |
| Compatibility mode | 21.2 |
| Authentication | Custom `VALIDATEBOSSUSER` is configured |
| Session state commits | `IMMEDIATE` |
| Page protection | Disabled at application level |
| Secure authentication cookie | `N` in both exported authentication schemes |
| Administration authorization | Function body returns true |
| Main UI pattern | Large form pages, Interactive Grids, Dynamic Actions, tabs, page-level PL/SQL |
| Transaction style | Master form DML + multiple child IG processes + page PL/SQL + DA PL/SQL |

## Current development philosophy

Source strongly shows Oracle Forms-style thinking:

- Field change/focus-out ke time database-side actions.
- Detail table ko Save se pehle populate/delete/rebuild karna.
- Page processes ke beech explicit commits.
- Session state ko current form state jaisa treat karna.
- One logical form ko many DAs/processes mein distribute karna.
- `Get TNo`, `Get Document No`, child-grid save, footer calculation aur follow-up posting alag-alag processing points par karna.

Forms mein yeh synchronous trigger chain jaisa feel deta hai. Browser/APEX mein har DA/AJAX ek separate request ho sakta hai; isliye timing aur request failure se state split ho sakti hai.

---

# 4. Complete Module Inventory

Module assignment page name/purpose se automated classification hai. Cross-module pages ko intentionally separate rakha gaya hai.

| Module | Pages | Master forms | Transaction forms | Lists/reports | DAs | Processes | Commits | Rollbacks | DML | Tabs |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Asset Management | 20 | 1 | 6 | 10 | 170 | 58 | 8 | 0 | 39 | 6 |
| Finance & Accounts | 87 | 9 | 36 | 21 | 719 | 246 | 65 | 1 | 164 | 14 |
| Freight / Logistics | 15 | 3 | 2 | 7 | 167 | 52 | 16 | 2 | 65 | 3 |
| General Masters / Setup | 85 | 53 | 8 | 19 | 692 | 384 | 90 | 0 | 103 | 10 |
| HR & Payroll | 70 | 8 | 24 | 21 | 509 | 220 | 29 | 0 | 83 | 9 |
| Inventory Control | 16 | 0 | 5 | 4 | 81 | 40 | 4 | 0 | 29 | 1 |
| Job & Services | 9 | 1 | 3 | 4 | 162 | 55 | 20 | 0 | 79 | 3 |
| Order to Cash / Sales | 45 | 0 | 12 | 21 | 523 | 170 | 41 | 3 | 265 | 9 |
| Procure to Pay / Purchase | 55 | 0 | 18 | 23 | 693 | 243 | 46 | 4 | 373 | 12 |
| Reports / MIS / Dashboard | 18 | 0 | 0 | 18 | 16 | 7 | 0 | 0 | 0 | 0 |
| Visitor Management | 3 | 0 | 2 | 0 | 31 | 16 | 6 | 0 | 6 | 2 |
| Cross-module / Other | 202 | 0 | 68 | 65 | 1,133 | 450 | 73 | 3 | 289 | 30 |

Complete 625-page list: `audit-output-20260925/complete-page-inventory.csv`.

---

# 5. Chrome Runtime Coverage

## All top-level hubs verified

- Setup & Admin
- General Masters
- Procure to Pay
- Order to Cash
- Freight Management
- Finance & Accounts
- Asset Management
- Job & Services
- Visitor Management
- Inventory Control
- Hire to Retire
- Reports
- Dashboard

All 13 hubs authenticated Chrome session mein render hue; none redirected to login.

## Master and entry pages loaded read-only

**Masters:** Company Master, Location Master, Employee Master, Item Master, Vendor.  
**Purchase/Inventory:** Material In, Indent, Purchase Order, Requisition, Weighment, Issue, Payment Advice, Purchase Bill, GRN, PO Amendment, Issue Return, Purchase Bill Pass, Loading Advice.  
**Finance:** Voucher, Debit Note.  
**Sales/OTC:** Dispatch Advice, Material Out, Sales Order, CC Invoice, Sales GRN, Proforma Invoice, Sales Enquiry, Sales Quotation.  
**Freight/Service:** Freight Advice, Service Bill Pass.  
**HR/Payroll:** Employee Salary, Salary Voucher.  
**Asset:** Asset Opening, Asset Sale, Asset.  
**Purchase sourcing:** Purchase Enquiry, Purchase Quotation, Rate Contract.

## Runtime observations

- Most transaction forms are very large: examples include 100–268 form controls and 1–7 Interactive Grids.
- Runtime detected tabs on most major transaction pages.
- Browser forms commonly use `novalidate`; this is an APEX pattern and by itself validation bypass proof nahi hai. Correctness depends on APEX/server processes.
- Purchase Bill and Voucher pages rendered, but automation DOM evaluation timed out because the client pages were heavy. This is a performance signal, not alone a defect proof.
- Console errors repeatedly occurred across navigations:
  - DOMPurify required by `a-unsafe-content`.
  - Oracle JET `localeElements` script error and load timeout.
  - Locale resource load failure.
  - At least one `No such action "add-row"` Interactive Grid error.

---

# 6. Complete Event Inventory

| Event / component | Count | Main risk |
|---|---:|---|
| Page ready | 1,513 | Too much initialization; duplicate binding after refresh |
| Focusout | 932 | Forms-style WVI behavior; fires during fast navigation and tab changes |
| Click | 805 | Repeat-click and sequencing risk |
| After dialog close | 785 | Parent page refresh/state overwrite risk |
| Change | 501 | Multiple overlapping requests while user continues editing |
| IG begin record edit | 151 | Row initialization/business logic timing |
| IG selection change | 86 | Wrong selected row if request returns late |
| Double-click | 52 | Duplicate action risk if server-side logic attached |
| Focusin | 36 | Repeated initialisation/call risk |
| Custom event | 13 | Hidden dependency between components |
| After refresh | 10 | Event re-binding and duplicate-handler risk |
| Unload | 3 | Unreliable place for server business logic |
| Async/no-wait DA actions | 19 | Dependent logic can proceed before server completes |

Event counts come from all canonical pages.

---

# 7. Critical Defect Register

## APEX-001 — Application page protection disabled

**Status:** Confirmed defect  
**Evidence:** `application/create_application.sql`, `p_page_protection_enabled_y_n=>'N'`  
**Problem:** URLs/items ke checksum protection ka application-level safety weakened hai.  
**Failure scenario:** User page/item parameters manipulate karke unauthorized or unintended state request karta hai.  
**Impact:** Security, session-state manipulation, direct-page access.  
**Severity:** P0  
**Fix:** Page protection enable in staging; every page/item URL flow regression-test; public pages and prepared URLs separately validate.  
**Implementation:** Structural security change  
**Regression risk:** High.

## APEX-002 — Administration authorization always true

**Status:** Confirmed defect  
**Evidence:** `shared_components/security/authorizations/administration_rights.sql`, function body `return true;`  
**Problem:** Scheme name admin rights bolta hai but actual authorization kisi ko reject nahi karta.  
**Failure scenario:** Any authenticated user reaches a component protected only by this scheme.  
**Impact:** Privilege escalation.  
**Severity:** P0  
**Fix:** Role/privilege table-based authorization with deny-by-default; direct URL negative tests.  
**Implementation:** Security refactor  
**Regression risk:** High.

## APEX-003 — Hard-coded report credentials

**Status:** Confirmed defect  
**Evidence:** Credential/URL patterns found in 168 canonical page files; actual secrets intentionally omitted from this report.  
**Problem:** Browser source, export, logs, history and copied URLs can expose reusable credentials.  
**Failure scenario:** User opens report URL or inspects source/history and obtains a credential.  
**Impact:** Report-system unauthorized access and data exposure.  
**Severity:** P0  
**Fix:** Rotate exposed credentials; remove from all pages; use server-side credential store and proxy endpoint; never put credentials in URL/query string.  
**Implementation:** Security + integration redesign  
**Regression risk:** Medium/High.

## APEX-004 — Public business/report pages

**Status:** Confirmed configuration; anonymous access previously runtime-verified on representative pages  
**Pages:** 11, 210, 249, 250, 258, 275, 282, 365, 400, 401, 402; login page 9999 excluded  
**Problem:** Business and financial pages are marked public. Seven public pages also contain hard-coded report credential patterns.  
**Impact:** Financial/business data exposure.  
**Severity:** P0/P1  
**Fix:** Require authentication + explicit authorization; direct anonymous URL test for every listed page.  
**Implementation:** Quick fix plus security review  
**Regression risk:** Medium.

## APEX-005 — Secure cookie disabled

**Status:** Confirmed configuration  
**Evidence:** Both authentication scheme exports show `p_use_secure_cookie_yn=>'N'`.  
**Problem:** Authentication cookie does not request Secure behavior.  
**Impact:** Session theft risk if any non-HTTPS path/misconfiguration exists.  
**Severity:** P1  
**Fix:** HTTPS-only deployment, Secure + HttpOnly + SameSite review, cookie regression test.  
**Implementation:** Quick security fix.

## APEX-006 — Purchase Bill no-wait DML/commit

**Status:** Confirmed architectural defect  
**Page:** 143 Purchase Bill  
**Event:** Focusout/DA server calls  
**Evidence:** Two DA actions use `p_wait_for_result=>'N'`; visible DML/commit exists in the associated page section.  
**Problem:** Browser dependent actions can continue while server-side mutation is still running.  
**Failure scenario:** User changes field, switches tab or clicks Save before prior request finishes; late response commits older/intermediate data.  
**Impact:** Wrong footer/detail, partial save, stale overwrite, false success.  
**Severity:** P0  
**Fix:** Remove transaction DML from focusout; calculate in memory or use one promise-controlled request; final Save must call one atomic business API.  
**Implementation:** Structural refactor  
**Regression risk:** High.

## APEX-007 — Fragmented explicit commits

**Status:** Confirmed application-wide pattern  
**Evidence:** 398 explicit commits across 199 pages; 190 pages have commit but no rollback in the same page source.  
**Problem:** One logical ERP transaction may commit in pieces across DA, page process or helper call.  
**Failure scenario:** Parent/footer commits, later child/accounting/stock process fails.  
**Impact:** Partial transaction and reconciliation failure.  
**Severity:** P0/P1 depending on page  
**Fix:** Remove UI-layer commits; call one business service per logical Save; one commit after all validation/DML; `rollback; raise;` on exception.  
**Implementation:** Refactor + database package redesign.

## APEX-008 — Lost-update protection gap in custom IG DML

**Status:** Confirmed design gap; actual collision requires staging runtime test  
**Evidence:** 46 custom processes on 42 pages use `APEX$ROW_STATUS` and ROWID-based update/delete. Page 143 updates by `TNO + ROWID`; adjacent native IG process explicitly has `prevent_lost_updates='Y'`.  
**Problem:** ROWID identifies the row but does not prove it still contains the version originally read.  
**Failure scenario:** User A and B open same document; B saves; A later saves old values and overwrites B.  
**Impact:** Silent lost update.  
**Severity:** P1  
**Fix:** Add `ROW_VERSION` or `LAST_UPDATED_AT` check in update predicate; if SQL%ROWCOUNT=0 show stale-record error; standardize all custom grid DML.  
**Implementation:** Database + APEX refactor.

## APEX-009 — Unsaved-change protection disabled

**Status:** Confirmed configuration pattern  
**Evidence:** 141 pages explicitly set unsaved warning to `N`.  
**Problem:** User tab switch/navigation/back/refresh se edited browser data lose kar sakta hai.  
**Impact:** User work loss and re-entry errors.  
**Severity:** P1/P2  
**Fix:** Enable warning where safe; custom IG/model dirty-state test; do not treat intermediate DA commits as substitute for final Save.

## APEX-010 — Browser dependency errors

**Status:** Confirmed in Chrome runtime  
**Evidence:** Repeated DOMPurify and Oracle JET locale load errors/timeouts; IG `add-row` error observed.  
**Problem:** Some UI components may initialize incompletely, especially on slow networks.  
**Impact:** Broken rendering, date/number localization errors, grid command failure.  
**Severity:** P1  
**Fix:** Correct APEX static resource deployment/version alignment, load DOMPurify before unsafe-content component, verify JET NLS resources, fix invalid IG action calls.

---

# 8. Key Transaction Page Matrix

`Validations` below means declarative APEX page validations only. Custom PL/SQL processes may still validate.

| Page | Form | Processes | DAs | IGs | Tabs | DML | Commits | Rollbacks | Declarative validations | Main risk |
|---:|---|---:|---:|---:|---:|---:|---:|---:|---:|---|
| 69 | Material In | 21 | 47 | 3 | 1 | 31 | 1 | 1 | 0 | Child/source conversion and inventory receipt sequencing |
| 108 | Indent | 13 | 46 | 2 | 1 | 5 | 3 | 0 | Pre-save detail generation and multiple commits |
| 118 | Purchase Order | 32 | 71 | 4 | 1 | 40 | 6 | 0 | Multiple child tables, email/payment side effects, fragmented commits |
| 140 | Payment Advice | 18 | 36 | 1 | 1 | 4 | 1 | 0 | Finance reference duplication/retry |
| 143 | Purchase Bill | 16 | 62 | 5 | 1 | 66 | 10 | 0 | No-wait DML/commit, footer/tax race, lost update |
| 146 | GRN | 20 | 71 | 5 | 1 | 32 | 3 | 3 | Inventory/storage atomicity and quantity validation |
| 152 | Purchase Bill Pass | 21 | 72 | 6 | 1 | 42 | 5 | 0 | TDS/advance/footer/accounting partial commit |
| 155 | Loading Advice | 14 | 41 | 1 | 1 | 19 | 1 | 1 | PO quantity and dispatch/logistics consistency |
| 156 | Voucher | 14 | 31 | 4 | 0 | 5 | 0 | 1 | Ledger balance and custom grid concurrency |
| 171 | Sales Order | 19 | 69 | 5 | 1 | 37 | 6 | 0 | Order totals, terms, detail overwrite |
| 175 | CC Invoice | 32 | 94 | 7 | 1 | 76 | 11 | 2 | Invoice/stock/freight/accounting multi-entity atomicity |
| 184 | Sales GRN | 15 | 47 | 3 | 1 | 18 | 6 | 0 | Return stock + voucher posting partial commit |
| 199 | Freight Advice | 20 | 72 | 4 | 2 | 46 | 9 | 1 | Footer/TDS/master totals and duplicate advice |
| 221 | Service Bill Pass | 15 | 46 | 7 | 1 | 39 | 2 | 0 | Job/GRN/production links and delete/rebuild pattern |
| 383 | Proforma Invoice | 10 | 20 | 4 | 1 | 16 | 0 | 0 | Large required-field set, custom IG DML |
| 622 | Employee Salary | 7 | 15 | 1 | 0 | 4 | 1 | 0 | Payroll repeat processing |
| 666 | Asset Opening | 5 | 19 | 0 | 0 | 1 | 1 | 0 | Opening value duplication |
| 670 | Asset Sale | 6 | 16 | 1 | 1 | 5 | 1 | 0 | Asset status/accounting split |
| 675 | Asset | 11 | 34 | 5 | 1 | 17 | 2 | 0 | Asset/account details lost update |
| 682 | Salary Voucher | 7 | 16 | 1 | 1 | 4 | 1 | 0 | Payroll-to-finance duplicate voucher |
| 702 | Sales Enquiry | 17 | 65 | 5 | 1 | 31 | 4 | 0 | Detail/T&C custom DML and repeat processing |
| 705 | Sales Quotation | 17 | 53 | 5 | 1 | 28 | 2 | 0 | Detail/T&C concurrent overwrite |
| 708 | Purchase Enquiry | 14 | 26 | 5 | 1 | 36 | 3 | 0 | Supplier enquiry detail generation |
| 710 | Purchase Quotation | 12 | 46 | 4 | 1 | 30 | 4 | 0 | Quotation detail stale update |
| 714 | Rate Contract | 16 | 53 | 4 | 1 | 20 | 4 | 0 | Rate detail lost update and repeated detail generation |

---

# 9. Procure-to-Pay End-to-End Audit

## Expected flow

Indent → Purchase Enquiry → Purchase Quotation → Comparative Statement → Rate Contract → Purchase Order → PO Amendment → Loading Advice → Material In → GRN → Purchase Bill → Purchase Bill Pass → Payment Advice → Voucher.

## Main cross-page risks

| Stage | Pages | Problem/risk | Possible current impact | Recommended fix |
|---|---|---|---|---|
| Demand | 108, 130 | Detail DML + commits before final business completion | Duplicate/partial requisition or indent | Draft state or single final API |
| Sourcing | 708, 710, 712, 714 | Many DAs and custom detail DML | Wrong quotation/rate selected after late AJAX | Request sequencing + row version |
| PO | 118, 148 | Multiple child grids and commits | Header saved but footer/T&C/acceptance incomplete | Atomic PO package |
| Logistics | 155, 69 | Source PO/loading-advice quantities are copied/updated through page logic | Received/loaded balance becomes inconsistent | Database service locks source rows and validates remaining quantity |
| GRN | 146 | Stock/storage/job grids and master/detail processes | Stock may differ from GRN header/detail | One GRN posting transaction |
| Purchase Bill | 143 | No-wait DML/commit, 5 grids, 10 commits | Footer/tax/GRN selection mismatch | Remove focusout commits; final atomic Save |
| Bill Pass | 152 | TDS, advance, footer and GRN links | Financial liability partially posted | Atomic bill-pass posting package |
| Payment | 140, 156 | Advice and voucher are separate transaction surfaces | Duplicate payment/voucher on retry | Idempotency key + unique business constraint |

## Current issue that can appear now

- PB amount/footer can reflect an earlier field value if focusout request returns late.
- PO/GRN/Material In quantity balance can be stale when two users process the same source document.
- A child grid may save while another footer/terms grid fails.
- Document number may be consumed or assigned even if later processing fails; exact behavior requires procedure/sequence runtime trace.
- User may retry after response loss and create duplicate business action unless database idempotency prevents it.

---

# 10. Order-to-Cash End-to-End Audit

## Expected flow

Sales Enquiry → Sales Quotation → PO Receipt → Sales Order → Loading Advice → Dispatch Advice → CC Invoice → Freight Advice → Bill Receipt/Voucher.

## Main risks

- Page 171 Sales Order has 5 grids, 69 DAs, 6 explicit commits and custom ROWID detail update.
- Page 175 CC Invoice is one of the most complex pages: 7 grids, 94 DAs, 76 visible DML statements and 11 commits.
- Invoice page handles item, stock, footer, freight advance, e-way bill and voucher-related work across multiple processes.
- Freight advance updates into Loading Advice occur from invoice-side logic, increasing cross-module coupling.
- Sales GRN has voucher posting and multiple commits; return stock and accounting may diverge if one part fails.

## Recommended architecture

Create database services such as:

- `sales_order_api.save_order`
- `dispatch_api.post_dispatch`
- `invoice_api.post_invoice`
- `sales_return_api.post_return`

Each service should validate source status/version, save all child rows, post stock/accounting, write audit trail, and commit exactly once.

---

# 11. Inventory Control Audit

Critical pages include Material In, GRN, Issue, Issue Return, Material Out, Stock Transfer, Kitting/Unkitting, Production, MRN and Stock Taking.

Main risks:

- Quantity is handled in master/detail/storage grids across separate APEX processes.
- Custom row-status DML occurs on many stock pages.
- Stock movement may be posted from purchase, sales, freight, production and asset flows.
- Without source-row lock/version check, two transactions can consume the same remaining quantity.
- Browser-based totals must never be accepted as final stock truth.

Required database rules:

1. Stock posting API owns quantity validation.
2. Source allocation row is locked or version-checked.
3. Negative stock rule is enforced centrally.
4. Every movement has immutable reference: module, transaction TNO, line SNO, movement type.
5. Retry with same idempotency key returns prior result, not a second movement.

---

# 12. Finance & Accounts Audit

Pages include Voucher, Payment Advice, Debit/Credit Note, Bill Receipt, Reverse Charge, RTGS, payable bills, challans, ledgers, trial balance and financial reports.

Main risks:

- Explicit commits are widespread: 65 in Finance classification, but only 1 rollback occurrence in the same classified sources.
- Ledger/report pages include hard-coded external-report credential patterns.
- Public financial pages create direct data-exposure risk.
- Page-level PL/SQL can update accounting from other modules, making transaction ownership unclear.
- A balanced voucher must be checked server-side immediately before commit.

Must-have controls:

- Debit total = credit total database validation.
- Posting period open check.
- Unique source-module/source-TNO voucher constraint.
- Reversal instead of destructive edit after posting.
- Immutable audit trail with user, timestamp, session, request ID and old/new values.

---

# 13. HR & Payroll Audit

Chrome runtime covered Employee Master, Employee Salary and Salary Voucher; static scan covered attendance, leave, loan, PF/ESI, salary, reimbursement, separation and full/final pages.

Risks:

- Payroll pages use page-level DML/commit patterns similar to operational modules.
- Repeat-click or response loss can create duplicate salary voucher/payment advice.
- Attendance revisions and salary calculation need period/version locking.
- Sensitive employee information requires strict page and row-level authorization.

Fix:

- Payroll run ID + status machine: Draft → Calculated → Reviewed → Posted → Paid.
- One active run per company/location/period.
- Recalculation creates version, not silent overwrite.
- Posting API is idempotent and produces one voucher set.

---

# 14. Asset Management Audit

Chrome runtime covered Asset Opening, Asset Sale and Asset. Static scan covered category, transfer, discard, depreciation and fixed-asset reports.

Risks:

- Asset master/account details are multi-grid and include custom DML.
- Sale/discard/transfer changes status and finance together; separate commit can leave wrong state.
- Depreciation requires period-level idempotency and locking.

Fix:

- `asset_api` owns lifecycle transition.
- Valid transitions enforced in database.
- Sale/discard/transfer + accounting is one transaction.
- Depreciation has unique key `(asset_id, period)` and rerun-safe behavior.

---

# 15. General Masters and Setup Audit

85 pages are classified under setup/general masters, including 53 master entry pages.

Main risks:

- Masters affect every downstream transaction; duplicate or stale master updates have wide impact.
- Account, item specification and item-related pages contain custom grid DML patterns.
- Admin authorization weakness makes setup pages especially sensitive.
- Master codes used in historical transactions must not be hard-deleted.

Standard:

- Unique database constraints on business keys.
- Effective-from/to or active flag instead of delete.
- Optimistic locking on edit.
- Maker/checker for financial/tax/privilege masters.
- Usage check before deactivation.

---

# 16. Tab Architecture Audit

99 tab containers across 96 pages were detected.

High-risk tab pages include Purchase Order, Purchase Bill, GRN, Purchase Bill Pass, Loading Advice, Sales Order, CC Invoice, Freight Advice, Service Bill Pass, Sales/Purchase Enquiry/Quotation, Rate Contract and Asset.

| Failure scenario | Current risk | Required design |
|---|---|---|
| User edits Tab 1 then switches to Tab 2 | Browser value may not be in session state | Keep draft in client model; do not persist business data on tab switch |
| Tab switch triggers AJAX | Late response can overwrite newer tab state | Request token/cancellation and response-version check |
| Region refresh | Unsaved values or grid edits can disappear | Dirty-state guard; refresh only read-only regions |
| Save while AJAX active | Old derived values may be submitted | Disable final Save until required requests settle |
| Hidden tab required fields | Validation may appear late/confusing | Server validation returns tab/field-specific error and activates tab |
| Same page in two browser tabs | Session state can be shared/stale | Use page instance/document token and avoid global application-item working state |

Recommended pattern:

- Tabs remain client-side presentation controls.
- Tab switch must not commit business tables.
- Final Save receives the complete logical document.
- Large drafts may use APEX Collection or staging table keyed by user + document draft UUID, but staging must not be treated as posted data.
- Final service validates every tab, posts atomically, and cleans draft only after success.

---

# 17. Dynamic Action and AJAX Audit

4,896 DAs and 9,811 DA actions are present. The main events are ready, focusout, click, dialog close and change.

Problems:

- High number of page-ready and focusout events creates hidden sequencing.
- `Wait for Result = N` exists on 19 actions; six on Service Bill, three on another Service Bill, and two on Purchase Bill are high priority.
- DA PL/SQL frequently performs insert/update/delete and sometimes commit.
- Items to Submit/Return must be reviewed component-wise; missing item creates stale server state.

Standard AJAX pattern:

1. Use AJAX for lookup, validation preview and read-only calculation.
2. Do not commit core ERP transactions from blur/focusout/change.
3. Give every request explicit input items and structured JSON response.
4. Show spinner and disable only dependent control.
5. Add success, error and finally handlers.
6. Ignore stale response using request sequence/token.
7. Server validation remains authoritative.
8. Final posting uses normal submit or one dedicated atomic endpoint.

---

# 18. Save/Commit Audit

## Current common pattern

Button/field event → Dynamic Action PL/SQL → detail delete/insert/update → optional commit → grid refresh → final page submit → master form DML → multiple child processes.

## Why unsafe

Every arrow may be a different HTTP request. If request 2 succeeds and request 3 fails, database already changed. Browser success/failure display does not necessarily represent the whole logical transaction.

## Required standard Save pattern

User clicks Save  
→ disable Save immediately  
→ assign/reuse client request UUID  
→ wait for required non-mutating AJAX  
→ client validation for convenience  
→ server receives complete document  
→ authorization and status/version check  
→ server-side business validation  
→ parent + children + totals + stock + accounting in one transaction  
→ database constraints  
→ audit log  
→ one commit  
→ durable result stored against request UUID  
→ success response  
→ safe navigation.

If response is lost, user retry sends same request UUID and server returns original result instead of posting again.

---

# 19. Concurrency Audit

## Confirmed pattern

42 pages have custom ROWID-based IG update/delete processes. Example Page 143 uses `WHERE TNO=:P143_TNO AND ROWID=:ROWID` without visible old-value predicate. Native APEX IG process on an adjacent grid explicitly enables lost-update prevention, showing mixed standards on the same page.

## User A/User B scenario

1. A and B open same PO/PB/GRN.
2. B changes quantity and saves.
3. A still sees old quantity and saves.
4. ROWID still matches.
5. A can overwrite B unless trigger/package/version condition stops it.

**INSUFFICIENT EVIDENCE — REQUIRES STAGING RUNTIME TESTING** to prove final DB outcome, because all triggers/packages are not available.

Required optimistic locking:

- `ROW_VERSION NUMBER` increment on every update, or precise `LAST_UPDATED_AT`/checksum.
- Update predicate includes original version.
- Zero updated rows means stale record; no commit; show clear message.
- Parent version changes when any child changes.

---

# 20. Multiple Browser Tab and Session-State Audit

Main concern: same APEX session can be used by multiple browser tabs. Page items/application items are not a replacement for document-instance state.

Possible problem now:

- Tab A opens Customer/Vendor/Document A.
- Tab B opens same page for Document B.
- An AJAX call submits only some page items.
- Session state from the latest request can influence later calculation/LOV/process if code reads session state instead of explicit inputs.

Fix:

- Every document page gets immutable page-instance/draft UUID.
- AJAX receives all required values explicitly.
- Do not use global application items for editable document context.
- Test Back, Forward, refresh, duplicate tab, two same-page records and session expiry.

---

# 21. Error Handling and False Success

False success means user sees/assumes save completed although full business transaction did not.

Risks:

- Commit inside intermediate DA/process.
- Error after earlier commit cannot fully rollback.
- Browser loses final response after server commit; user retries.
- Console dependency error breaks client follow-up while server work may already be done.
- `raise_application_error` exists in many places, but atomic rollback boundary is inconsistent.

Standard error contract:

```text
SUCCESS: request_id, document_id, document_no, committed_version
VALIDATION_ERROR: field/tab/component, user-safe message
STALE_DATA: current_version, reload_required
DUPLICATE_REQUEST: original committed result
SYSTEM_ERROR: correlation_id only; technical detail in server log
```

Never show success until final commit completes.

---

# 22. Data Integrity Audit

Required database-level controls:

- Unique document number by company, financial year, location and document type.
- Unique request/idempotency key.
- Foreign keys for master/detail/source references.
- Positive/non-negative quantity and rate checks as business permits.
- Header total reconciles with detail + tax + freight + discount + rounding.
- Posted status transition constraints.
- One stock/accounting posting per source transaction/version.
- Currency precision and rounding centrally defined.
- GST/TDS rules calculated server-side and versioned by effective date.
- No hard delete of posted transaction; use cancel/reversal.

Browser `required` attributes are UX support only; database/service validation is authoritative.

---

# 23. Security Audit

Priority actions:

1. Rotate all report credentials visible in export/URLs.
2. Remove credentials from JavaScript and URL query strings.
3. Fix Administration Rights scheme.
4. Enable page protection after regression inventory.
5. Require authentication/authorization on 11 public business pages.
6. Enable Secure cookies and review SameSite/HttpOnly.
7. Review direct-page access for every form/report.
8. Review item protection for identifiers, status, company/location and financial year.
9. Audit dynamic SQL and HTML escaping separately where database package source becomes available.

No security setting was changed during this audit.

---

# 24. Performance Audit

Confirmed signals:

- Heavy pages: Purchase Bill and Voucher DOM inspection timed out in automation after page render.
- Major pages contain 60–94 DAs and up to 7 IGs.
- Repeated JET locale timeout and DOMPurify resource error add load-time instability.
- Many region/grid refresh flows may repeat queries and event binding.

Required measurement before tuning:

- APEX Debug at level 9 for key Save and load flows.
- Browser network waterfall under 200–500 ms latency.
- SQL Monitor/AWR for long queries and PL/SQL.
- Payload size, number of AJAX calls and duplicate calls per user action.
- IG query execution plans and indexes on source keys, status, company/location/FY, TNO/SNO.

Do not add indexes blindly; use execution evidence.

---

# 25. Oracle Forms-to-APEX Migration Issues

| Forms concept | Existing APEX pattern | Compatibility | Risk | Recommended APEX pattern |
|---|---|---|---|---|
| WHEN-VALIDATE-ITEM | Focusout/change DA PL/SQL | Risky | Request races and premature DML | Client hint + server validation on final Save |
| POST/COMMIT_FORM | Explicit commit in DA/process | Critical | Partial logical transaction | One database business API and one commit |
| Block record state | `APEX$ROW_STATUS` custom DML | Acceptable with modification | Lost update without version | Native IG DML or custom version check |
| GO_BLOCK/GO_ITEM | Tab/focus navigation | Risky | Hidden async work continues | Tabs are presentation only; explicit state |
| EXECUTE_QUERY | Region refresh | Acceptable with modification | Unsaved data overwritten | Dirty-state guard and targeted refresh |
| Synchronous trigger chain | Multiple DAs/AJAX | Critical when mutating | Different completion order | Promise sequencing; final atomic endpoint |
| Form-global state | APEX session/application items | Risky | Multi-tab interference | Explicit request payload + page-instance token |
| PRE-INSERT numbering | Get TNo/Get Document No processes | Acceptable with modification | Gaps/duplicate/retry behavior | Database sequence + idempotent allocation policy |
| Form-level transaction | Many page/IG processes | Critical | Partial parent/child save | Transaction service owns whole document |

---

# 26. Recommended Coding Standard

The proposed **iboss Oracle APEX Development & Transaction Safety Standard**:

1. One logical ERP document has one owner package/API.
2. UI does not issue `COMMIT` or `ROLLBACK` in Dynamic Actions.
3. Business API validates, writes all entities, logs and commits once.
4. Every posting request has idempotency key.
5. Every editable transaction has optimistic version.
6. DAs cannot mutate posted business data on focusout/change.
7. AJAX has explicit Items to Submit/Return and structured errors.
8. Tabs do not save business tables.
9. Client calculations are preview only; server recalculates.
10. Database constraints protect keys, relationships, totals/status where feasible.
11. Exceptions are logged with correlation ID and re-raised.
12. No `WHEN OTHERS THEN NULL` in transactional code.
13. No reusable secret in page source, URL or JavaScript.
14. Authorization is deny-by-default and tested by direct URL.
15. Naming pattern: `MODULE_ENTITY_ACTION`, with consistent page/process/static IDs.
16. Posted records are reversed, not silently rewritten.
17. Every Save emits audit trail: user, time, request, old/new version and source.
18. Slow-network, double-click and concurrency tests are release gates.

---

# 27. Automated Test Catalogue

All mutating tests below must run in staging with disposable data.

| ID | Precondition | Steps | Expected result | Failure result | Severity |
|---|---|---|---|---|---|
| NET-01 | New transaction | Throttle 500 ms; enter fields rapidly | Latest values win; no early DML | Old value saved | P0 |
| NET-02 | Valid document | Disconnect immediately after Save | Server outcome discoverable by request ID | User cannot know and retry duplicates | P0 |
| NET-03 | Valid document | Timeout response after server commit; retry | Same original result returned | Second document/posting | P0 |
| UI-01 | Save enabled | Double/triple-click Save | One request/business result | Duplicate rows/numbers | P0 |
| UI-02 | Multi-tab form | Rapidly switch tabs during lookup | No lost/overwritten values | Late response overwrites | P1 |
| UI-03 | Unsaved grid row | Refresh region or page | Warning/draft preserved | Silent loss | P1 |
| UI-04 | AJAX running | Click final Save | Save waits or blocks | Stale derived values saved | P0 |
| CON-01 | Same record/version | A and B edit; B saves; A saves | A gets stale-data error | A overwrites B | P0 |
| CON-02 | Same source PO | Two users receive same remaining qty | One succeeds within balance | Over-receipt | P0 |
| TAB-01 | Same session | Same page, two documents in tabs | State isolated | Document A gets B data | P0 |
| ERR-01 | Inject child constraint error | Save complete document | Nothing committed | Header/other child remains | P0 |
| ERR-02 | Inject accounting exception | Post GRN/PB/invoice | Entire transaction rolls back | Stock/accounting diverges | P0 |
| SEC-01 | Anonymous browser | Open each public business URL | Login/403 | Business data visible | P0 |
| SEC-02 | Low privilege user | Direct admin/master URL | Access denied | Page/action available | P0 |
| PERF-01 | Representative large document | Load/edit/save at 200–500 ms latency | Defined SLA, no console timeout | Missing components/errors | P1 |
| SES-01 | Session near expiry | Save after expiry | Re-auth + safe retry, no partial commit | False success/duplicate | P0 |

For every test capture APEX Debug, browser network/console, request ID, database rows before/after and audit log.

---

# 28. Prioritized Implementation Roadmap

## Phase 1 — Critical Security and Data Integrity

- Rotate/remove hard-coded credentials.
- Fix admin authorization.
- Protect public business pages.
- Create production-safe backup and staging clone.
- Stop new page-level commits.
- Refactor Page 143 Purchase Bill no-wait mutating actions.
- Add idempotency for high-value posting flows.

## Phase 2 — Transaction and Concurrency

- Standard transaction APIs for PO, GRN, PB, PB Pass, Sales Order, Invoice, Freight, Voucher.
- Add row version to 42 affected custom ROWID pages.
- Enforce unique posting/source constraints.
- Central rollback/error contract.

## Phase 3 — Tabs and AJAX

- Review 96 tab pages.
- Remove business DML from tab/focusout/change.
- Add request tokens, loading indicators and pending-request guard.
- Enable reliable dirty-state/unsaved warnings.

## Phase 4 — Performance

- Fix DOMPurify/JET resources.
- Baseline top 20 heavy forms.
- Reduce redundant DA/AJAX/refresh.
- Tune proven slow SQL and indexes.

## Phase 5 — Code Standardization

- Naming, error logging, package ownership, audit trail.
- Convert custom IG DML to standard safe template.
- Remove duplicated business rules from JavaScript/page/package layers.

## Phase 6 — UX

- Immediate Save feedback.
- Clear progress, retry and correlation ID.
- Tab-specific validation messages.
- Safe navigation and stale-data recovery.

---

# 29. Effort Classification

| Change | Effort | Why |
|---|---|---|
| Rotate/remove report credentials | Medium | 168 pages/integrations and report server changes |
| Fix admin authorization | Small/Medium | Code small, privilege regression broad |
| Protect public pages | Small/Medium | Configuration small, consumer impact must be checked |
| Enable page protection | Large | URL/item checksum regression across legacy navigation |
| Purchase Bill atomic redesign | Large | 5 grids, 62 DAs, 66 DML occurrences, 10 commits |
| PO/GRN/PB/PB Pass APIs | Very Large | Cross-module source, stock, tax and accounting rules |
| Optimistic locking on 42 pages | Large | Schema/version + process + UX + concurrency tests |
| AJAX/tab standardization | Very Large | 4,896 DAs and 96 tab pages |
| Resource/console fixes | Small/Medium | Deployment/config alignment plus regression |
| Full automated test suite | Very Large | Requires staging data, fault injection and DB assertions |

---

# 30. Deliverables and How to Use Them

1. **This report:** `ERP_COMPLETE_DEEP_AUDIT.md`
2. **Every canonical page:** `audit-output-20260925/complete-page-inventory.csv`
3. **Every parsed component:** `audit-output-20260925/complete-component-inventory.csv`
4. **Module totals:** `audit-output-20260925/module-summary.csv`
5. **Event totals:** `audit-output-20260925/event-summary.csv`
6. **Static risk signals:** `audit-output-20260925/static-risk-signals.csv`
7. **250-row master backlog:** `audit-output-20260925/ERP_APPLICATION_MASTER_REMEDIATION_REGISTER.csv`
8. **Reproducible audit generator:** `audit_apex_application.ps1`

The CSV master register has the requested columns:

`ID, Module, Page, Page Name, Event, Component, Issue, Root Cause, Failure Scenario, Data Risk, Severity, Current Pattern, Recommended Pattern, Action Required, Implementation Type, Priority, Testing Required, Status`.

---

# 31. Final Recommendation

Full rewrite recommend nahi kiya gaya. Correct path:

**Identify → Classify → Standardize → Refactor → Stage-test → Release in controlled phases.**

First pilot Page 143 Purchase Bill ya Page 146 GRN par mat start karein without safety net; pehle common transaction API, request ID, logging and optimistic locking template define karein. Then one medium-complexity transaction par prove karein, followed by PO → GRN → PB → PB Pass chain.

Current answer to the 1,000-user question:

> **No — current evidence ke basis par system ko different network conditions and concurrent use mein exactly-once, complete, consistent and auditable save guarantee nahi di ja sakti.**

Main reasons are fragmented commits, no-wait mutation, mixed lost-update protection, client/session-state dependencies, weak security boundaries and inconsistent error/rollback architecture.

No application, database, security setting or ERP data was changed during this audit.
