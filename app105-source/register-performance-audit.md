# Register performance audit

Status: Phase 1 complete — static source inventory.  This document records
evidence from the APEX application export, not assumed runtime timings.

## Scope

The application export contains 38 pages whose page name identifies them as a
register.  Each needs runtime measurement before it can be classified as fast
or slow.  `SUBMIT` means the current Apply/Refresh button posts the complete
APEX page; `DA refresh` means it uses a Dynamic Action to refresh only its
report region.

| Page | Register | Apply mechanism | DA events | Native region refreshes | AJAX LOVs |
| ---: | --- | --- | ---: | ---: | ---: |
| 68 | Material In | DA refresh | 4 | 1 | 5 |
| 107 | Indent | SUBMIT | 9 | 3 | 6 |
| 129 | Requisition | SUBMIT | 2 | 0 | 2 |
| 137 | Issue | SUBMIT | 2 | 0 | 6 |
| 139 | Payment Advice | SUBMIT | 3 | 0 | 0 |
| 142 | Purchase Bill | SUBMIT | 3 | 0 | 1 |
| 145 | GRN | SUBMIT | 3 | 0 | 4 |
| 147 | PO Amendment | SUBMIT | 3 | 0 | 2 |
| 151 | Purchase Bill Pass | SUBMIT | 5 | 1 | 2 |
| 160 | Despatch Advice | SUBMIT | 2 | 0 | 1 |
| 167 | Material Out | SUBMIT | 3 | 0 | 1 |
| 170 | Sales Order | SUBMIT | 4 | 1 | 5 |
| 174 | CC Invoice | SUBMIT | 3 | 0 | 3 |
| 194 | Gate Pass | SUBMIT | 2 | 0 | 1 |
| 207 | Reverse Charge | no standard Refresh button | 1 | 0 | 0 |
| 212 | Service Bill | DA refresh | 3 | 1 | 1 |
| 216 | Sale Incentive Rate | no standard Refresh button | 0 | 0 | 0 |
| 220 | Service Bill Pass | SUBMIT | 3 | 0 | 0 |
| 229 | GSTR1 | no standard Refresh button | 0 | 0 | 0 |
| 243 | Stock Revaluation | SUBMIT | 3 | 0 | 2 |
| 245 | Stock Taking | SUBMIT | 3 | 0 | 2 |
| 265 | PT Slab | SUBMIT | 2 | 0 | 2 |
| 291 | Purchase Party Payment | no standard Refresh button | 2 | 0 | 0 |
| 293 | Fixed Asset | SUBMIT | 1 | 0 | 1 |
| 294 | Depreciation | SUBMIT | 1 | 0 | 0 |
| 295 | Freight Rate Approval | no standard Refresh button | 2 | 0 | 1 |
| 304 | Service Bill | DA refresh | 3 | 1 | 1 |
| 316 | Import | SUBMIT | 3 | 0 | 1 |
| 349 | Vendor | no standard Refresh button | 1 | 0 | 0 |
| 351 | GSTR9 | no standard Refresh button | 0 | 0 | 0 |
| 375 | Pending Dispatch Quantity | no standard Refresh button | 0 | 0 | 0 |
| 414 | Schedule | SUBMIT | 2 | 0 | 0 |
| 417 | TDS Challan | DA refresh | 3 | 1 | 5 |
| 419 | ESIC Challan | DA refresh | 3 | 1 | 5 |
| 644 | Visitor Gate pass | SUBMIT | 1 | 0 | 1 |
| 707 | Enquiry | SUBMIT | 2 | 0 | 1 |
| 709 | Quotation | SUBMIT | 2 | 0 | 1 |
| 711 | Comparative Statement | SUBMIT | 2 | 0 | 2 |

## Verified shared finding

Material In (page 68) uses a `DEFINED_BY_DA` Refresh button.  Its `Refresh
Report` Dynamic Action runs one native refresh against its report region and
then collapses the filter drawer.  Sales Order (page 170) uses `SUBMIT` for
the equivalent button.  A full submit rebuilds the page shell, navigation,
filters, report, and all page-load code, whereas the benchmark refreshes only
the report region.

This is an evidence-based candidate for the common user-visible delay and for
the filter-time shell flicker.  It is not yet changed: each migration must
first prove that no page process or validation depends on full submit, and its
before/after request count, elapsed time, row count, and result ordering must
be verified.

## SQL review queue (static complexity signals only)

The following is **not a performance verdict**.  It is a safe prioritisation
queue generated from exported SQL structure, so that runtime database plans
are requested only for queries that warrant them.  Query length, pre-aggregated
subqueries, `GROUP BY`, and application functions are useful review signals,
but do not establish elapsed time or an indexing need.

| Priority | Page | Register | Static signal |
| --- | ---: | --- | --- |
| 1 | 170 | Sales Order | 252 SQL lines; two pre-aggregated subqueries; three grouping stages; function-derived display/filter values |
| 1 | 139 | Payment Advice | 513 SQL lines; 47 multi-value `INSTR` predicates; 24 application function calls |
| 1 | 145 | GRN | 469 SQL lines; three subqueries; 37 multi-value `INSTR` predicates |
| 1 | 151 | Purchase Bill Pass | 229 SQL lines; seven subqueries and grouping |
| 1 | 220 | Service Bill Pass | 184 SQL lines; six subqueries and grouping |
| 2 | 174 | CC Invoice | 252 SQL lines; two subqueries and grouping |
| 2 | 147 | PO Amendment | 259 SQL lines; three subqueries and two grouping stages |
| 2 | 709 | Quotation | 196 SQL lines; four subqueries and grouping |
| 2 | 711 | Comparative Statement | 139 SQL lines; four subqueries and two grouping stages |
| 2 | 707 | Enquiry | 86 SQL lines; ten subqueries |

Material In has an 80-line report query with no subquery or grouping stage,
which is consistent with—but does not alone prove—its better perceived
performance.

## Sales Order deep-audit finding

The page 170 report has a second independent SQL-risk candidate.  It joins
Sales Order header/detail/footer data and computes pre-aggregated Despatch
Advice and CC Invoice quantities across their source tables before applying
the Sales Order date and other filters in the outer query.  It also groups the
result afterwards.  This requires an execution plan and representative binds
before any SQL or index change; changing it without those would risk different
totals or result rows.

## Next measurement gate

For every page with a standard Apply action, collect in a logged-in browser:

1. Apply-to-first-row elapsed time.
2. Request count, request type, and longest request.
3. Region-refresh versus full-submit behavior.
4. SQL monitor/explain-plan evidence for any request above the Material In
   baseline.
5. Result row count and ordering for the same filter before/after each fix.

Only after that gate should the shared submit-to-region-refresh migration be
applied to the compatible group.  SQL rewrites and indexes remain out of scope
until database execution evidence is available.
