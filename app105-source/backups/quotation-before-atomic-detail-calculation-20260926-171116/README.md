# Purchase Quotation atomic detail calculation backup

This backup was taken immediately before changing Page 710 detail amount and FD/tax refresh behavior.

Restore with SQLcl while connected to the target schema:

```sql
@app105-source/backups/quotation-before-atomic-detail-calculation-20260926-171116/live-before/f105_page_710.sql
```
