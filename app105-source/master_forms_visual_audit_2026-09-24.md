# Master forms visual audit

**Audit date:** 24 September 2026  
**Mode:** visual-only. No master record, page metadata, or CSS was changed.

## Scope

All 18 active master-related modules from the live catalogue were checked:

- Setup & Admin: Code Scheme for Master Module.
- General Masters: City, Terms and Condition Head, Packing Type, Vehicle Type,
  Industry Sector, Item Grade, Item Length, Item Make, Item Thickness and
  Item Width.
- Finance & Accounts: Account Master and Vendor Master.
- Inventory Control: Item Master, Item Category, Item Class and Item Nature.
- Hire to Retire: Employee Master.

The 13 compact modal masters were opened through their normal register **Edit**
action (not by a direct dialog URL). This is important because those pages are
intended to run inside an APEX modal.

## Passed visual checks

- Every compact modal opened without an APEX error and its visible fields,
  including Remark where present, fit within the dialog without clipping.
- Their post-save header actions are intentionally icon-only. No button's
  visible content was clipped.
- Account Master: all 8 tabs opened — Account, Office Address, Works Address,
  Attributes, Policy, Company, Bank and Attachment. Its visible child grids
  used the standard light-blue selection.
- Employee Master: all 10 tabs opened — Employee Master, Qualification,
  Experience, References, Salary, Loan Account, Family, Attachment, Earned
  Salary and Changes. Every visible child grid rendered; selected rows used
  light-blue, not the old dark-blue treatment.
- Vendor Master: Vendor and Office Address tabs both opened normally.
- Item Master Detail grid rendered with visible rows and light-blue selection.
- Terms & Condition Head Detail grid rendered with visible rows and light-blue
  selection.

## Candidate for your verification

1. **Item Master (page 59):** it has only one tab, `Item Master`. When the
   page is scrolled about 74px, its tab label sits behind the sticky page
   header and only the purple active indicator remains visible. The form and
   Detail grid remain present, and there is no lost navigation because it is a
   single-tab form, but it is visually inconsistent with the repaired
   Purchase Order tab behaviour.

## No issues found in

Code Scheme, City, Packing Type, Vehicle Type, Industry Sector, Item Grade,
Item Length, Item Make, Item Thickness, Item Width, Item Category, Item Class,
Item Nature, Account Master, Vendor Master, Employee Master, Terms and
Condition Head, or Item Master Detail-grid rendering.
