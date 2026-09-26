# Purchase Quotation pre-change backup

Live APEX page 710 export taken before skipping Quotation No. in the tab order
and mapping the selected Enquiry LOV row's Party into `P710_PARTYCODE`.

`live-before/f105_page_710.sql` is the authoritative rollback export.

Rollback only if required:

```text
sql -nohistory /nolog
connect -name IMART
@app105-source/backups/quotation-before-tab-party-output-20260926-170525/live-before/f105_page_710.sql
commit
exit
```
