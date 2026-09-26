# iBoss / Imart ERP Audit Report

## Simple Hinglish Summary

**Audit date:** 25 September 2026  
**Application:** Oracle APEX App 105 - Imart  
**Audit type:** Source code audit + Chrome runtime verification  
**Important:** Is audit ke dauran kisi transaction ko Save, Create, Post, Delete ya Update nahi kiya gaya. Application code aur database me koi change nahi kiya gaya.

---

# 1. Seedha Conclusion

Application normal condition me kaam kar sakti hai, lekin slow internet, fast clicking, multiple tabs, failed AJAX request aur do users ke ek hi record ko edit karne par serious problem aa sakti hai.

Sabse bade risks ye hain:

1. Purchase Bill me field se bahar nikalte hi database me data delete/insert aur commit ho raha hai.
2. Kuch calculation requests complete hone ka wait nahi kiya ja raha.
3. Financial reports bina login ke open ho rahe hain.
4. Report server ka username/password browser JavaScript me available hai.
5. Bahut saari pages par transaction ke beech-beech me `COMMIT` hai.
6. Custom grid update me old value/version check nahi hai, isliye ek user dusre user ka change overwrite kar sakta hai.
7. Browser console me important JavaScript files/dependencies load nahi hone ke errors aa rahe hain.
8. Session ID URLs me dikh rahi hai aur bahut saare links me carry ho rahi hai.
9. Error ko chupane wale `WHEN OTHERS THEN NULL` blocks hain, jisse user ko false success mil sakta hai.
10. Same page ko do browser tabs me open karne par APEX session state aapas me interfere kar sakti hai.

**Overall result:** Abhi system ko high concurrency aur unreliable network ke liye fully safe nahi maana ja sakta.

---

# 2. Sabse Pehle Kya Karna Chahiye

## P0 - Turant action

| Priority | Problem | Abhi kya dikkat de sakti hai | Kya fix karna hai |
|---|---|---|---|
| P0 | Financial pages public hain | Bina login financial data/report open ho sakta hai | Sabhi business pages par authentication aur authorization lagao |
| P0 | Browser me report-server password hai | Password copy karke report server access kiya ja sakta hai | Password turant rotate karo aur report server call backend se karao |
| P0 | Purchase Bill AJAX me commit | Tax/footer/detail partially save ho sakta hai | Field-level AJAX se commit hatao; final Save API me transaction rakho |
| P0 | Delete ke baad turant commit | Insert fail hua to purana data permanently delete rahega | Delete + insert + totals ko ek hi transaction me rakho |
| P0 | Save idempotent nahi hai | Double-click/retry se duplicate transaction ban sakta hai | Har Save ko unique request ID do |
| P0 | Custom grid lost-update risk | User A ka change User B silently overwrite kar sakta hai | Row version/checksum based optimistic locking lagao |

## P1 - P0 ke turant baad

| Priority | Problem | Risk | Fix |
|---|---|---|---|
| P1 | Page protection disabled | URL/item value manipulate ho sakta hai | APEX page protection enable karke regression test karo |
| P1 | Admin authorization always true | Normal user ko admin access mil sakta hai | Actual role/privilege query lagao; default deny rakho |
| P1 | Download process me record authorization nahi | Logged-in user dusre record ki file dekh sakta hai | File return karne se pehle module/record permission check karo |
| P1 | DOMPurify missing error | HTML component fail ya unsafe ho sakta hai | Required library load order aur APEX static resources repair karo |
| P1 | Oracle JET locale timeout | Charts/date/number components late ya fail ho sakte hain | Missing locale resource aur web-server static-file mapping fix karo |
| P1 | Silent exception handling | User ko success dikhe par operation fail ho | Error log + rollback + clear user error standard banao |

---

# 3. Chrome Me Live Verify Hui Problems

## 3.1 Bina login financial pages open ho rahi hain

Alag unauthenticated browser session me ye pages login ke bina successfully open hui:

- Account Ledger - Page 11
- Payable/Receivable Aging - Page 210
- Monthly Summary - Page 249
- Daily Summary - Page 250
- Account Ledger - Page 258
- Cost Centre Ledger - Page 275
- Trial Balance - Page 282
- Treegrid page - Page 365
- Trial Balance - Page 400
- Trial Balance - Page 401
- Trial Balance - Page 402

Account Ledger ne bina login report rows aur Voucher links bhi render kiye.

### Abhi kya dikkat aa sakti hai

- Financial information unauthorized person dekh sakta hai.
- Account LOV/filter ke through aur data access ho sakta hai.
- Voucher URLs discover ho sakti hain.
- Audit/compliance issue ho sakta hai.

### Fix

1. In pages ka Public flag remove karo.
2. Application authentication mandatory karo.
3. Har report/page par module privilege authorization scheme lagao.
4. Sirf navigation menu hide karna security nahi hai; server-side authorization zaroori hai.
5. Direct URL tests bina login ke automate karo.

---

## 3.2 Report password browser me hai

168 pages me report/PDF server credentials ka pattern mila. Loading Advice List, Account Ledger aur kai transaction pages me username/password browser JavaScript me generate ho raha hai.

Password is report me security ke liye repeat nahi kiya gaya.

### Abhi kya dikkat aa sakti hai

- Browser DevTools se password dekha ja sakta hai.
- Page source ya exported application se password mil sakta hai.
- User direct report server call kar sakta hai.
- Password leak hone ke baad application change karne se problem solve nahi hogi jab tak password rotate na ho.

### Fix

1. Existing password ko compromised maan kar turant rotate karo.
2. Browser JavaScript se username/password remove karo.
3. PDF/report request ko secured server-side PL/SQL/API se call karo.
4. Report user ko minimum read-only privileges do.
5. Secrets ko code/export me store mat karo.

---

## 3.3 Browser console errors

Chrome me multiple pages par ye errors repeat hue:

- `DOMPurify is required by a-unsafe-content`
- Oracle JET `localeElements` script load failure
- Oracle JET module timeout

### Abhi kya dikkat aa sakti hai

- Page normal dikhegi lekin koi component andar se initialize nahi hoga.
- Slow network par error zyada baar aa sakta hai.
- Chart, date, number formatting ya custom HTML component fail ho sakta hai.
- Dependent Dynamic Action required library ready hone se pehle run ho sakti hai.
- User ko kabhi page sahi aur kabhi incomplete dikhegi.

### Fix

1. APEX image/static resource mapping verify karo.
2. DOMPurify file network response verify karo.
3. Oracle JET locale file path aur MIME type verify karo.
4. Browser console ko production release test ka mandatory part banao.
5. Slow 3G/high-latency test me zero console error target rakho.

---

# 4. Purchase Bill - Page 143

## Main problems

### 4.1 Focusout par database update aur commit

Quantity/Rate field se focus nikalte hi Dynamic Action tax/footer data ko delete aur dubara insert karti hai. Isi AJAX request me commit bhi hai.

### 4.2 Wait for Result = No

Kuch important server actions ke liye browser response ka wait nahi karta. Next JavaScript, summary calculation ya region refresh pehle chal sakta hai.

### 4.3 Delete ke turant baad commit

Purchase Bill footer pehle delete hota hai, phir commit, uske baad insert hota hai. Insert fail hua to deleted footer rollback nahi ho sakta.

### 4.4 Custom detail DML me lost-update check nahi

Detail update sirf ROWID par hota hai. Old quantity/rate/version compare nahi hota.

## Abhi kya problem de sakti hai

- GST/tax footer missing ho sakta hai.
- Detail total aur footer total alag ho sakte hain.
- Screen par ek total aur database me doosra total ho sakta hai.
- Slow internet par purani AJAX response nayi value overwrite kar sakti hai.
- User tab change karke Save kare to calculation pending reh sakti hai.
- Two users ek bill edit karein to last Save pehle user ka data overwrite kar sakta hai.
- Request server par complete ho aur browser response lose ho jaye to user retry karke duplicate processing kara sakta hai.

## Recommended fix

1. Focusout/change AJAX me permanent DML aur commit band karo.
2. Browser par sirf preview calculation karo.
3. Final Create/Save par ek package/API call ho.
4. API me Master + Detail + Tax + Footer + GRN reference + Accounting sab ek transaction me ho.
5. Sab successful hone par sirf ek commit ho.
6. Error par complete rollback ho.
7. Save request ke saath unique request UUID bhejo.
8. Record me version number ya last-update timestamp compare karo.
9. AJAX pending ho to Save button temporarily disable karo.

---

# 5. Purchase Order - Page 118

## Problems

- 71 Dynamic Actions aur 32 processes hain.
- 6 explicit commits mile.
- PO create hone ke baad indent generation, footer, mail aur other processing alag-alag jagah chal rahi hai.
- Page me multiple tabs hain: General, Detail, Terms, Special Note, Payment, Attachment, E-Mail.
- Chrome me required fields missing hone par bhi Create button enabled tha. APEX submit validation ho sakti hai, lekin user ko early protection nahi milti.

## Abhi kya dikkat de sakti hai

- PO save ho jaye lekin indent creation fail ho.
- PO save ho jaye lekin footer/tax incomplete ho.
- E-mail fail ho par PO status unclear rahe.
- Tab ke hidden values stale reh sakte hain.
- Double-click/retry se duplicate follow-up processing ho sakti hai.

## Fix

- PO save ko central package me lao.
- Mail sending ko transaction commit ke baad reliable queue me bhejo.
- Email fail hone se PO rollback karna hai ya retry queue me dalna hai, clear rule banao.
- All tabs ka final validation Save ke time server par karo.
- Child rows aur footer ka transaction master ke saath atomic rakho.

---

# 6. Loading Advice - Pages 154 and 155

## Positive findings

- Loading Advice List read-only mode me properly load hui.
- Edit link correct Loading Advice form page 155 par ja raha tha.
- Inspected active record par Apply Changes aur Delete disabled the.

## Problems

- Page 154 ke PDF JavaScript me report-server credentials hain.
- Browser console me DOMPurify aur Oracle JET errors aaye.
- List me session ID bahut saare URLs me included hai.
- Loading Advice form me Loading Advice aur Detail tab architecture hai.
- Detail/save transaction ke complete database package/trigger sources available nahi hain.

## Abhi kya dikkat de sakti hai

- PDF/report credential leak.
- Slow network par PDF ya LOV/date component fail.
- Same Loading Advice two tabs me open karne par page session state interfere kar sakti hai.
- Detail save aur master save agar alag commits use karein to partial transaction possible hai.

## Fix

- PDF generation server-side karo.
- Master/detail save ka single API banao.
- Status-based disable ke saath server-side status check bhi karo.
- Update ke waqt row version check karo.
- Existing active/posted record ko package level par immutable/protected karo.

---

# 7. Purchase Module Problems

Affected important pages:

- Indent - 108
- Purchase Order - 118
- Purchase Bill - 143
- GRN - 146
- Purchase Bill Pass - 152
- Purchase Enquiry - 708
- Purchase Quotation - 710
- Comparative Statement - 712
- Rate Contract - 714

## Possible current impact

- Indent quantity aur PO quantity mismatch.
- GRN quantity aur Purchase Bill detail mismatch.
- Purchase Bill save ho par tax/accounting incomplete.
- Same PO ke against duplicate GRN/Bill linking.
- Comparative Statement/Quotation data stale hone ke baad PO create hona.
- Approval/status badalne ke baad purani tab se record update hona.

## Required architecture

`Indent -> Enquiry -> Quotation -> Comparative Statement -> PO -> GRN -> Purchase Bill -> Bill Pass -> Accounting`

Har next stage par ye checks server side hone chahiye:

- Source document still active hai.
- Pending quantity latest hai.
- Same source detail pe duplicate allocation nahi hai.
- User ke paas current company/location/module privilege hai.
- Source document version change nahi hua.
- Final posting ek atomic package se ho.

---

# 8. Sales / Order-to-Cash Module Problems

Affected pages:

- Sales Enquiry - 702/706
- Sales Quotation - 705
- Sales Order - 171
- Loading Advice - 155
- Despatch Advice - 161
- CC Invoice - 175
- Sales GRN - 184

## Possible current impact

- Enquiry change hone ke baad old quotation/order create ho sakta hai.
- Sales Order quantity aur dispatch quantity mismatch.
- Loading/Despatch data save ho lekin invoice creation fail.
- Invoice detail/footer/accounting me partial commit.
- Stock issue ho jaye lekin invoice/posting fail.
- Same loading advice ya SO se duplicate invoice.
- Credit limit/stock availability stale data par check ho sakti hai.

## Fix

- SO allocation, loading, dispatch, stock issue, invoice aur accounting ke clear transaction boundaries banao.
- Invoice creation ke liye idempotency key lagao.
- Stock posting aur accounting posting ka durable status rakho.
- Failure ke baad safe retry mechanism ho.
- Invoice/stock/accounting reconciliation report daily run karo.

---

# 9. Inventory Module Problems

Affected pages:

- Material In - 69
- Issue - 138
- Issue Return - 150
- Material Out - 168
- Kitting/Unkitting - 181
- Stock Transfer - 187
- Stock Taking - 246
- Stock Revaluation - 244
- Production - 197

## Possible current impact

- Stock quantity negative ya duplicate issue.
- Material In master save ho lekin detail incomplete.
- Issue/return ka stock ledger mismatch.
- Kitting me component consume ho jaye par finished stock add na ho.
- Stock transfer source se deduct ho par destination me add na ho.
- Production consumption aur production receipt partial ho.
- Same record two users update karein to quantity overwrite.

## Fix

- Stock operation ke liye one central Inventory Posting API banao.
- Source deduction + destination addition same transaction me ho.
- Stock balance check aur update row lock ke saath ho.
- Business document ID + line ID par unique posting reference ho.
- Duplicate posting database unique key se block ho.
- Negative-stock policy database/API me enforce ho.

---

# 10. Finance & Accounts Module Problems

Affected areas:

- Voucher - 156
- Debit Note - 159
- Credit Note - 166
- Payment Advice - 140
- Freight Advice - 199
- Service Bill - 213/305
- Purchase Bill and Sales Invoice posting
- Account Ledger/Trial Balance reports

## Possible current impact

- Business document save ho par voucher posting fail.
- Voucher save ho par source document status update fail.
- Debit/Credit Note partial footer or ledger posting.
- Same transaction duplicate post ho sakta hai.
- Ledger report public access se data exposure.
- Opening/closing balance wrong company/year/session state se calculate ho sakta hai.
- Backdated transaction ke baad stale report result.

## Fix

- Har financial posting ko unique source module + source TNO + posting type key do.
- Duplicate accounting entry database unique constraint se roko.
- Source transaction aur accounting posting ka consistent status rakho.
- Posting package exception par full rollback kare.
- Trial Balance, Ledger, source documents aur posting tables ka reconciliation banao.
- Financial reports ko login + module authorization ke peeche rakho.

---

# 11. Freight Module Problems

Affected pages:

- Freight Advice - 199
- Loading Advice - 155
- Payment/advance related fields

## Possible current impact

- Freight advance alag AJAX commit se save ho sakta hai.
- Loading Advice cancel/change hone ke baad Freight Advice stale reh sakta hai.
- Duplicate transporter advance/payment.
- Vehicle/driver/contact information unauthorized report/export me aa sakti hai.

## Fix

- Loading, freight calculation, advance and settlement ko linked transaction state machine do.
- Advance payment par unique reference aur approval check ho.
- Cancellation/reversal ke liye separate reversal transaction use karo; records delete mat karo.
- Driver/mobile/vehicle data ko sensitive data treat karo.

---

# 12. Job & Services Module Problems

Affected pages:

- Service Order - 179
- Service Bill - 213/305
- Service Bill Pass - 221

## Possible current impact

- Service Bill pages par 6 no-wait server actions mile.
- Service/tax/footer calculations out of order complete ho sakti hain.
- Bill save ho aur Bill Pass/accounting fail ho.
- Same service entry duplicate bill ho sakti hai.

## Fix

- Page 213 ke no-wait database actions ko highest priority par review karo.
- Service completion quantity/amount ko bill save ke waqt dubara verify karo.
- Bill Pass aur accounting posting ko idempotent banao.
- Footer calculation central tax engine/package se karao.

---

# 13. HR / Payroll Module Problems

Affected areas:

- Attendance
- Leave/OD requests
- Loan request/sanction
- Salary
- Salary voucher/payment
- Full and Final
- Reimbursement

## Possible current impact

- Same employee/month ki salary duplicate process.
- Attendance edit hone ke baad old salary calculation save.
- Loan deduction aur salary posting mismatch.
- Full and Final me component save ho par voucher fail.
- Employee personal/financial information authorization issue se expose.

## Fix

- Employee + payroll month + company par unique payroll run key rakho.
- Payroll run ko draft, validated, posted, paid states do.
- Posted payroll direct edit na ho; reversal/adjustment use ho.
- Attendance version/time stamp payroll calculation ke saath store karo.
- HR pages par strict role and row-level authorization lagao.

---

# 14. Asset Module Problems

Affected pages:

- Asset - 675
- Asset Transfer - 692
- Asset Sale - 670
- Asset Discard - 672
- Depreciation - 677

## Possible current impact

- Asset location transfer half complete.
- Asset sale/discard save ho par accounting entry fail.
- Depreciation same period me duplicate run.
- Asset value aur GL value mismatch.

## Fix

- Asset event ledger banao: acquisition, transfer, depreciation, sale, discard.
- Company + asset + period + event type unique key rakho.
- Depreciation batch idempotent ho.
- Asset and finance posting same controlled API/workflow se ho.
- Asset register vs GL reconciliation report banao.

---

# 15. Tabs Se Related Problems

97 pages par around 100 tab containers identify hue.

## Abhi kya dikkat ho sakti hai

- Hidden tab ke browser values aur APEX session values different ho sakte hain.
- Region refresh hidden tab ki unsaved value overwrite kar sakta hai.
- Tab switch ke time pending AJAX complete nahi hui ho.
- Same event multiple times bind ho sakta hai.
- User final tab par Save kare aur first tab calculation pending ho.
- Same page do browser tabs me open ho to session-state collision ho sakti hai.

## Standard tab pattern

1. Tab switch normally client-side ho; database commit na ho.
2. Tab opening par mandatory DML mat chalao.
3. Lazy load read-only data ke liye allowed ho.
4. Final Save par all-tab server validation ho.
5. Pending AJAX counter ho; Save tab tak disabled ho jab tak required request finish na ho.
6. Region refresh se pehle unsaved grid/form state check ho.
7. Same document ko two tabs me detect karne ke liye document version/token use ho.

---

# 16. Save Button Standard

Har ERP Save ko ye flow follow karna chahiye:

1. User Save click kare.
2. Button immediately disable ho.
3. Loading indicator dikhe.
4. Second click ignore ho.
5. Required AJAX complete ho ya cancel ho.
6. Client basic format validation ho.
7. Server authorization check ho.
8. Server complete business validation kare.
9. Record version check ho.
10. Parent/detail/tax/stock/accounting ek API me process ho.
11. Database constraints validate hon.
12. Sirf ek final commit ho.
13. Request ID aur result audit table me save ho.
14. Success response ke baad safe navigation ho.

## Response lose ho jaye to

User retry kare to same request ID server ko mile. Server check kare:

- Pehle request complete ho chuki hai: same success/result return karo.
- Pehle request processing me hai: `Processing` response do.
- Pehle request fail hui: safe retry allow karo.

Naya duplicate transaction create nahi hona chahiye.

---

# 17. Error Handling Standard

Current code me 93 possible `WHEN OTHERS THEN NULL` patterns mile.

## Problem

- Error chup jata hai.
- User ko success lag sakta hai.
- Support team root cause trace nahi kar sakti.
- Partial data silently reh sakta hai.

## Required standard

Har error log me ho:

- Error/reference ID
- Application/page
- User
- Company and financial year
- Module and transaction TNO
- Request ID
- Process name
- SQL error and backtrace
- Timestamp

User ko technical SQL text nahi, simple message mile:

> Transaction save nahi hua. Koi data commit nahi kiya gaya. Reference ID: XYZ

---

# 18. Concurrency Standard

Two users same record edit karte waqt:

1. Record load ke time `ROW_VERSION` ya `LAST_UPDATE_TIMESTAMP` browser ko do.
2. Save ke waqt database me same version compare karo.
3. Version changed ho to Save reject karo.
4. User ko message do ki record kisi aur user ne update kiya hai.
5. Latest changes reload/compare karne ka option do.

Sirf ROWID check concurrency protection nahi hai.

---

# 19. Security Standard

1. Login ke bina sirf Login page available ho.
2. Har module page par server-side authorization ho.
3. Admin scheme actual admin role check kare.
4. Page protection and checksum enable ho.
5. Secure, HttpOnly, SameSite cookie configuration verify ho.
6. Session ID ko URL me minimize/remove karo.
7. Password/API key JavaScript ya export me na ho.
8. File download se pehle record-level privilege check ho.
9. SQL error browser ko return na ho.
10. Direct URL and item manipulation security tests automate karo.

---

# 20. Recommended Implementation Plan

## Phase 1 - Security containment

- Public financial pages secure karo.
- Report credentials rotate/remove karo.
- Admin authorization repair karo.
- Page protection and secure-cookie testing karo.

## Phase 2 - Data integrity

- Purchase Bill page 143 fix karo.
- Page 213 Service Bill no-wait actions fix karo.
- Explicit commit inventory review karo.
- Purchase Order, CC Invoice, Freight Advice, Debit/Credit Note priority transaction review karo.

## Phase 3 - Concurrency and duplicate protection

- Custom ROWID DML pages par optimistic locking.
- Request UUID/idempotency ledger.
- Database unique constraints for business duplicates.

## Phase 4 - Tabs and AJAX

- Focusout database commits remove karo.
- AJAX sequencing/error handling standardize karo.
- Pending request guard lagao.
- Same-page multi-tab tests karo.

## Phase 5 - Runtime dependencies and performance

- DOMPurify load error fix.
- Oracle JET locale timeout fix.
- Heavy page/Dynamic Action consolidation.
- SQL plans and indexes audit.

## Phase 6 - Testing and monitoring

- Automated tests.
- Central logs.
- Reconciliation reports.
- Production alerting.

---

# 21. Testing Jo Staging Par Karna Zaroori Hai

Ye tests production par nahi kiye gaye kyunki ye data change kar sakte hain:

- Save double-click
- Save triple-click
- 500 ms network latency
- Request timeout during Save
- Browser disconnect after Save
- Server commit ho lekin browser response lose ho
- Save while field AJAX is running
- Rapid tab switching
- Same document two browser tabs me
- Two users same record update karein
- Database constraint error
- Package exception after parent save
- Accounting failure after stock posting
- Session expiration during Save

Har test ka expected result:

- Transaction exactly once save ho.
- Ya complete save ho, ya complete rollback ho.
- Partial data na rahe.
- Duplicate data na bane.
- User ko clear final status mile.
- Retry safe ho.

---

# 22. Audit Limitations

Repository me complete database source available nahi tha. Isliye inki final verification pending hai:

- Table constraints
- Foreign keys
- Unique keys
- Indexes
- Database packages
- Procedures/functions
- Triggers
- Autonomous transactions
- Database jobs
- Complete accounting/stock posting internals

In objects ka source/export milne ke baad database-level audit ka second part karna zaroori hai.

---

# 23. Final Recommendation

Full rewrite ki zaroorat decide karne ka abhi koi reason nahi hai. Recommended approach hai:

**Identify -> Secure -> Make Atomic -> Add Locking -> Add Idempotency -> Standardize -> Test**

Sabse pehle public financial access aur leaked credentials close karo. Uske baad Purchase Bill page 143 aur Service Bill page 213 ke asynchronous database actions fix karo. Phir application-wide commits, custom grid DML, tabs, AJAX aur concurrency ko standard pattern par lao.

Target rule simple hona chahiye:

> User interface asynchronous ho sakta hai, lekin ERP business transaction hamesha complete, atomic, authorized, version-checked aur exactly-once hona chahiye.

