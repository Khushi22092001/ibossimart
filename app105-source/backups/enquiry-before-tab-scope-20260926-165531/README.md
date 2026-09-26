# Purchase Enquiry pre-change backup

Live APEX page 708 export taken before changing the Enquiry No. tab order and
the unordered-indent date-scope selector.

`live-before/f105_page_708.sql` is the authoritative rollback export.

Rollback only if required:

```text
sql -nohistory /nolog
connect -name IMART
@app105-source/backups/enquiry-before-tab-scope-20260926-165531/live-before/f105_page_708.sql
commit
exit
```
