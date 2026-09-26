# TNO/SNO internal-column fix — completion report

Completed on 26 September 2026.

## Live result

- Global Page 0 and Purchase Quotation Page 710 imported successfully into application 105.
- Live APEX metadata returned 8/8 Page 710 TNO/SNO columns as `NATIVE_HIDDEN`.
- All eight are excluded from grid export.
- The application-wide guard marker `HSPL_HIDE_INTERNAL_IG_KEYS_V1` is present in the fresh live Page 0 export.
- The guard uses the supported APEX grid `hideColumn` API and reruns after grid initialization, view changes, and region refreshes.
- Fresh live Page 710 export contains the safe UOM and HSN lookups that prevent ORA-01403 when a fast/incomplete row briefly has no matching lookup row.

## Verification evidence

Fresh post-deployment exports:

- `live-after/f105_page_0.sql`
- `live-after/f105_page_710.sql`

The live database query returned:

- DetailFooter: TNO hidden, SNO hidden
- DetailQuality: TNO hidden, SNO hidden
- Quotation Detail: TNO hidden, SNO hidden
- Terms and Condition: TNO hidden, SNO hidden

Chrome computer-control verification was attempted twice, but the existing browser debug surface timed out both times. The deployment itself was verified through live database metadata and a fresh post-deployment export.
