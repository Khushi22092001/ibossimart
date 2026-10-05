# Purchase Order Party / Delivery Date tab-order fix

- Scope: Oracle APEX application 105, page 118 only.
- Root cause: the page-specific keyboard header array placed `P118_PARTYCODE` before `P118_DELIVERYDATE_input`, while date inputs were intentionally left to the browser's native Tab handling. This created a Party -> Delivery Date -> Party loop.
- Change: reordered only those two entries so the header sequence is Purchase Order Date -> Delivery Date -> Party -> Is Open Spec.
- Database postcondition: `P118_TAB_ORDER_OK`.
- Chrome verification after a full reload:
  - Purchase Order Date + Tab -> `P118_DELIVERYDATE_input`
  - Delivery Date + Tab -> `P118_PARTYCODE`
  - Party + Tab -> `P118_ISOPENSPEC`
- Form values were identical before and after the keyboard test.
- No save, validation, process, Dynamic Action, grid, CSS, or other page was changed.
- Pre-change export: `app105-source/backups/p118-tab-order-before-20261003/f105_page_118.sql`.
