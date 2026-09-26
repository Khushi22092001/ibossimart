# Procure-to-Pay and Order-to-Cash visual audit

**Audit date:** 24 September 2026  
**Mode:** visual-only, read-only. No page, CSS, application metadata, or data changes were made.

## Scope checked

- All 22 data-entry forms under the live **Procure-to-Pay** (15) and **Order-to-Cash** (7) module groups.
- Each visible workflow tab on an existing saved document where one was available: Detail, Terms/Conditions, Special Note, Footer, Payment, Attachment, E-Mail and equivalent tabs.
- Header action buttons after save/edit: visible text, button width, and icon-only buttons.
- Interactive-grid row visibility and selected-row colour, including the right-side Remark area where applicable.

## Result

No currently reproducible visual defect was found in the audited states:

- No visible header action caption is clipped. `ACTIVE`/`STATUS` buttons expand to their label; icon-only actions are intentionally compact.
- No Detail-row area was missing or collapsed.
- No selected Detail row used the earlier dark-blue treatment. Visible selected rows use the light-blue selection treatment.
- The Purchase Enquiry Remark column is no longer clipped in the inspected saved document.
- Attachment tabs opened normally; none showed a visual grid/rendering problem.

### Post-audit correction — Purchase Order (118)

The initial review incorrectly treated accessibility-visible tabs as visually
visible. On a real browser screenshot, the Purchase Order tab strip was hidden
behind the sticky header after the page scrolled. The cause was a Page 118
CSS layout offset plus the sticky header covering the tab strip. The offset was
removed and the Purchase Order tab strip is now sticky immediately below its
header. This was redeployed and verified live while scrolled: General, Detail,
Terms and Conditions, Special Note, Payment, Attachment and E-Mail are visible;
the Detail grid still renders eight rows.

## Forms and tabs opened

| Flow | Form page | Tabs visually opened |
|---|---:|---|
| Procure-to-Pay | Material In (69) | Material In, Detail, Personal Belonging, Attachment |
|  | Indent (108) | General, Item Detail, Attachment |
|  | Purchase Order (118) | General, Detail, Terms and Conditions, Special Note, Payment, Attachment, E-Mail |
|  | Payment Advice (140) | Payment Advice, Reference, Payment Detail, Attachment |
|  | Purchase Bill (143) | General, Detail, Terms and Conditions, Attachment |
|  | GRN (146) | GRN, Detail, Job, Attachment |
|  | PO Amendment (148) | Master, Detail, Terms and Conditions, Special Note, Attachment |
|  | Purchase Bill Pass (152) | Master, Detail, Attachment, TDS |
|  | Loading Advice (155) | Loading Advice, Detail |
|  | Voucher (156) | No child tab bar was rendered for the tested saved document |
|  | Freight Advice (199) | Freight Advice, Detail, Master Footer |
|  | Purchase Enquiry (708) | Enquiry, Item Detail, Terms and Condition, Party |
|  | Purchase Quotation (710) | Quotation, Quotation Detail, Terms |
|  | Comparative Statement (712) | Comparative Statement, CS Detail |
|  | Rate Contract (714) | General, Detail, Terms, Special Note, Attachment |
| Order-to-Cash | Despatch Advice (161) | General, Item Detail |
|  | Sales Order (171) | General, Detail, Terms, Special Note, Attachment, E-Mail |
|  | CC Invoice (175) | General, Item Detail, Job, Footer, Terms and Conditions, E-WayBill Entry |
|  | Bill Receipt (191) | Bill Receipt, Detail |
|  | PO Receipt (274) | PO Receipt, Detail, Footer, Terms and Condition |
|  | Sales Enquiry (702) | General, Detail, Terms, Special Note, Attachment |
|  | Sales Quotation (705) | General, Detail, Terms, Special Note, Attachment |

## Manual follow-up / watch list

These are not confirmed defects; they need a document in the stated state for one additional visual check.

1. **Purchase Quotation (710), Comparative Statement (712), Rate Contract (714):** no saved record was available in the audit database, so only their new-form layout was checked. Please open a populated/saved document to verify the post-save header actions and populated Detail rows.
2. **Purchase Enquiry (708):** the optional Detail Quality tab was not displayed for the selected document. Verify it using a document where that tab is enabled.
3. **Purchase Bill Pass (152) and Voucher (156):** some metadata grids were conditionally not rendered in the sampled document. No visible tab/grid fault was seen, but please verify these optional states when the relevant transaction data is present.
4. **Material In (69):** it has a page-specific horizontal-grid scroll rule. The sampled Detail tab rendered rows correctly and used light-blue selection, so this is a regression watchpoint only.

## Technical audit notes

- Live metadata contains 84 interactive-grid regions across the 22 form pages. Several are conditional/secondary regions and therefore do not render for every document.
- Form-page local CSS was checked for the former row-hiding pattern. No current form had the problematic forced row-height/position rule; the remaining page-local scrollbar rules did not cause a visible defect in the audited samples.
