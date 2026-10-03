# Transaction register seven-day defaults

User scope: transaction registers only. Masters and dashboards excluded.

## Published

Application 105: 124 existing From/To items on 62 transaction register pages.
From default: `TRUNC(SYSDATE)-6`; To default: `TRUNC(SYSDATE)`.
Existing session dates take precedence (`USE_CACHE_BEFORE_DEFAULT=YES`).
Backup: `IMART_REGDATE_BAK_20261003` (124 original item definitions).
Deployment: `deploy_transaction_seven_day_defaults_20261003.sql`.
Audited scope and live metadata: `verification/transaction-seven-day-approved-scope-20261003.csv`
and `verification/transaction-seven-day-live-20261003.csv`.
Scope CSV includes BOM List 201, which was explicitly excluded from deployment.

No queries, processes, Dynamic Actions, dashboard components, navigation, theme or business data were changed by this deployment.

## Chrome verification

Fresh page scopes on 3 October 2026 displayed 27 September–3 October on:
Payment Advice, Indent, Purchase Enquiry, Purchase Quotation, Comparative Statement,
Rate Contract, Purchase Order, PO Amendment, Loading Advice, Material In, GRN,
Purchase Bill, Purchase Bill Pass and Voucher Posting.
Voucher uses combobox date controls, not the textbox placeholders used elsewhere.
Freight Advice was visited but its date values were not verified by the placeholder selector.

GRN custom From 20 September was applied, then normal URL reloaded; From remained
20 September. Test scope restored to 27 September, with To 3 October.
Proof: `verification/grn-seven-day-default-20261003.png`.

Existing cached Payment Advice From 30 September was preserved on normal entry.
Fresh page-cache-cleared scope correctly used 27 September.
The existing Reset button did not clear that cached date in this check; no Reset
handler was changed. Reloading an explicit `clear=<page>` URL intentionally clears
page session state again and is not a custom-date persistence test.

## Outstanding / not claimed complete

Voucher Apply custom From 20 September was visible in the control but normal reload
returned to 27 September. Existing browser errors included DOMPurify / Oracle JET
translation loading errors. Cause of Apply/session persistence is not established;
do not attribute it to defaults without investigating its Dynamic Action and submit items.

Registers without existing From/To filters are not covered by this deployment.
Do not claim every transaction register is implemented; adding date controls and
binding them to the correct business date requires separate mapping and testing.
Masters, period ledgers, financial summary/analytical pages and dashboards retain
their existing date rules.
