# Cross-Form Calculation and Save Integrity Audit

Date: 26 September 2026  
Application: IMART / APEX Application 105

## Result

Purchase Quotation (Page 710) ko is deployment mein bilkul change nahi kiya gaya. Purchase Quotation mein pehle mile calculation, fast-Tab, FD row-selection aur wrong-save jaise patterns ko baaki relevant forms mein audit kiya gaya.

## Forms fixed

### Purchase Order (Page 118)

- FD button ab clicked detail row ka TNO/SNO set karta hai.
- Footer Detail modal query ab selected row ke TNO aur SNO se filter hoti hai; kisi doosri row ka tax/footer nahi dikhega.
- Tab key ko daba kar rakhne par auto-repeat se row ke bahar jump/race hone se roka gaya.
- Detail aur Footer Detail save/recalculation complete hone ke baad, final commit se pehle server amount, discount, rate-after-discount, footer aur total verify karta hai.
- Mismatch par form save nahi hoga aur exact row/field error milega.

### Purchase Bill (Page 143)

- Active calculation AJAX ko complete hone ka wait karaya gaya; cell-level COMMIT aur fixed 400 ms summary timer hataya gaya.
- New/unsaved row ka FD button clicked row context set karta hai.
- Existing server reconciliation ke turant baad independent verification process add hua.
- Amount/footer/total mismatch par save rollback hoga aur exact error aayega.
- Held-Tab guard add hua.

### Purchase Bill Pass (Page 152)

- Chaar amount calculation events focusout ke badle actual value change par chalenge.
- Cell-level COMMIT aur fixed timer hataye gaye, taaki partial calculation save na ho.
- New/unsaved row FD button clicked row context set karta hai.
- Save/Create se pehle amount, footer aur total ka server-side verification add hua.
- Held-Tab guard add hua.

### Payment Advice (Page 140)

- Duplicate focusout calculation disable ki gayi.
- Calculation actual change par chalegi; sirf cursor/Tab movement par repeat nahi hogi.
- Fixed 400 ms refresh dependency hatayi gayi.
- Held-Tab guard add hua.

### Material In (Page 69)

- Quantity, balance aur unit-conversion actions actual value change par chalengi.
- Sirf Tab/focus movement se unnecessary recalculation nahi chalega.
- Held-Tab guard add hua.

### GRN (Page 146)

- Received quantity, accepted quantity, amount aur conversion actions actual value change par chalengi.
- Sirf focus/Tab movement par repeated calculation band ki gayi.
- Held-Tab guard add hua.

### Indent (Page 108)

- Pehle lagaye calculation/rate protections ko retain kiya gaya.
- Tab key hold karne se browser auto-repeat ke karan row skip/jump hone ka guard add hua.

### Loading Advice (Page 155)

- Pehle lagaye actual-change calculation protections ko retain kiya gaya.
- Held-Tab auto-repeat guard add hua.

## Audited; no matching patch required in this phase

### Purchase Enquiry (Page 708)

Is page ka main detail flow indent selection/Get Item hai. Purchase Quotation jaisa line rate/amount/FD calculation chain nahi mila, isliye is phase mein page change nahi kiya gaya.

### Comparative Statement (Page 712)

Current flow collection/workflow based hai. Purchase Quotation jaisa editable line FD and save-total chain nahi mila. Existing actual-change improvements ko disturb nahi kiya gaya.

## Existing historical data findings

Audit ne purane stored records mein kuch mismatches identify kiye. In records ko automatic update nahi kiya gaya, kyunki historical business data ko bina review badalna unsafe hota.

| Form | Existing findings |
| --- | --- |
| Purchase Order | 2 rate-after-discount, 1 rate, 1 amount, 146 footer mismatches |
| Purchase Bill | 1 amount, 2 footer, 8 total mismatches |
| Purchase Bill Pass | 31 footer, 14 total mismatches |

Ab affected document edit/save karte waqt server verification incorrect calculation ko save hone se rokegi aur exact error degi.

## Verification performed

- All 8 changed live pages exported/imported successfully.
- All 8 page JavaScript blocks passed syntax parsing.
- Purchase Order FD link and row-filter verified from live APEX metadata.
- Purchase Order, Purchase Bill and Purchase Bill Pass save-guard PL/SQL parsed successfully in the live database.
- Live process-order audit confirmed Purchase Order guard Footer Detail save/summary ke baad sequence 165 par hai; three guards se pehle koi explicit COMMIT nahi mila.
- Actual-change event mapping verified for Payment Advice, Material In, GRN and Purchase Bill Pass.
- Purchase Quotation Page 710 has no cross-form deployment marker and was not imported or changed.
- Follow-up unchanged-value audit converted 49 remaining calculation/data-derivation events from focus entry/exit to actual value `change`; navigation and read-only focus behavior was left intact.

Automated Windows browser smoke-check helper recovery ke baad bhi time out hua. Isliye live business records par blind UI edits/save nahi kiye gaye. Neeche diye checks user acceptance ke liye pending hain; source, live metadata and database verification complete hai.

## Backup and rollback

- Backup: `app105-source/backups/crossform-calc-integrity-before-20260926-224201/live-before`
- Deploy script: `app105-source/deploy_crossform_calc_integrity_20260926.sql`
- Verification script: `app105-source/verify_crossform_calc_integrity_20260926.sql`
- Exact 8-page rollback: `app105-source/rollback_crossform_calc_integrity_8pages_20260926.sql`
- Follow-up unchanged-recalculation backup: `app105-source/backups/crossform-unchanged-recalc-before-20260926-232911/live-before`
- Follow-up rollback: `app105-source/rollback_crossform_unchanged_recalc_20260926.sql`
- Follow-up verification: `app105-source/verify_crossform_unchanged_recalc_20260926.sql`

## User acceptance checks

Browser mein old cached JavaScript avoid karne ke liye hard refresh karein. Representative new/edit document par:

1. Bina value change kiye normal aur fast Tab karein: calculation repeat ya data blank nahi hona chahiye.
2. Quantity/rate badlein: amount, footer/tax, other amount aur total update hone chahiye.
3. Har row ka FD alag kholkar confirm karein ki usi row ka footer/tax dikh raha hai.
4. Deliberately inconsistent calculation ke saath save try karein: save block hokar exact row/field error aana chahiye.
