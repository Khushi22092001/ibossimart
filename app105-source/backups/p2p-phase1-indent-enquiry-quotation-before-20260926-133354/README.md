# Phase 1 pre-change backup

Created before calculation-stability changes to APEX pages 108 (Indent), 708
(Purchase Enquiry), and 710 (Purchase Quotation).

- `live-before/f105.sql` is the authoritative live APEX component export for
  all three pages before deployment.
- `export-current/` contains the three local working page exports.
- The root of this folder contains the six earlier audit/export variants that
  were also preserved before work began.

Rollback the live pages only if required:

```text
sql -nohistory /nolog
connect -name IMART
@app105-source/backups/p2p-phase1-indent-enquiry-quotation-before-20260926-133354/live-before/f105.sql
commit
exit
```

The deployed change intentionally does not replace Purchase Quotation's
business save process or tax logic.
