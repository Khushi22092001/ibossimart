# Schedule Get Item wrong-table action — staged repair

## Scope

Live Page 415 (Schedule) exposes an unconditioned **Get Item** button in the `SCHEDULEDETAIL` grid. Its dynamic action deletes and inserts `MATERIALOUTDETAIL`, using `P415_REFERENCETNO`, even though Page 415 has no such page item and its grid is backed by `SCHEDULEDETAIL`.

The staged page export removes only that button and its `getItem` Dynamic Action. It does not change the Schedule form, its detail-grid save process, document calculations, or any Material Out records.

## Evidence and deployment boundary

Live APEX metadata confirms the button and action are active and that `P415_REFERENCETNO` does not exist. The repair is staged for review and explicit approval only; it has not been imported into production.

Static verification confirms the staged page has no remaining references to the removed component IDs, `MATERIALOUTDETAIL`, or `P415_REFERENCETNO`.
