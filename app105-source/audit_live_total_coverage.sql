whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 500
set linesize 320
set long 20000
connect -name IMART

prompt === LIVE TOTAL COVERAGE FOR TRANSACTION FORMS ===
with compact_pages(page_id) as (
  select column_value from table(sys.odcinumberlist(
    4,5,8,9,14,15,16,22,25,26,28,30,32,34,37,39,42,44,47,49,51,53,55,57,
    59,61,62,63,65,67,71,73,75,77,79,81,83,85,87,89,91,93,95,97,99,102,
    104,106,108,110,112,114,116,118,120,122,124,128,130,133,136,138,140,
    143,146,148,150,152,155,156,159,161,166,168,171,173,175,177,179,181,
    184,187,188,189,191,193,195,197,199,202,204,206,208,211,213,215,217,
    218,221,223,225,230,242,244,246,248,252,264,266,270,274,277,285,287,
    289,301,303,305,308,312,313,317,320,326,332,334,336,338,340,342,344,
    346,348,350,352,355,356,367,369,371,373,381,383,415,418,420,602,604,
    606,608,610,612,614,616,618,620,622,624,626,628,630,632,634,636,639,
    641,643,645,647,649,652,654,656,658,660,662,664,666,668,670,672,675,
    677,679,682,684,686,688,690,692,694,696,702,705,706,708,710,712,714,
    716,718,720))
), candidates as (
  select i.page_id, i.page_name, i.region_id, i.region_name,
         c.column_id, c.name, c.display_sequence
    from apex_260100.apex_appl_page_igs i
    join compact_pages p on p.page_id = i.page_id
    join apex_260100.apex_appl_page_ig_columns c
      on c.application_id = i.application_id
     and c.page_id = i.page_id
     and c.region_id = i.region_id
   where i.application_id = 105
     and upper(i.is_editable) = 'YES'
     and nvl(upper(c.is_visible), 'YES') = 'YES'
     and (regexp_like(c.name, '(QUANTITY|QTY)[0-9]*$', 'i')
          or regexp_like(c.name, 'AMOUNT[0-9]*$', 'i'))
), native_sum as (
  select distinct a.page_id, a.region_id, a.column_id
    from apex_260100.apex_appl_page_ig_rpt_aggs a
   where a.application_id = 105
     and upper(a.function) = 'SUM'
     and nvl(upper(a.is_enabled), 'YES') = 'YES'
)
select c.page_id,
       c.page_name,
       listagg(distinct c.region_name, ', ') within group (order by c.region_name) as regions,
       listagg(distinct c.name, ', ') within group (order by c.name) as total_columns
  from candidates c
  left join native_sum n
    on n.page_id = c.page_id
   and n.region_id = c.region_id
   and n.column_id = c.column_id
 where regexp_like(c.page_name,
       '(Indent|Order|Enquiry|Quotation|Statement|Bill|GRN|Issue|Advice|Voucher|Receipt|Payment|Invoice|Challan|Transfer|Return|Requisition|Loading|Material|Gate Pass|Note|Contract|Production|Rake|Sale|Purchase|Dispatch|Despatch|Debit|Credit|Journal|Opening|Salary|Depreciation|Asset|Loan|Full and Final)', 'i')
 group by c.page_id, c.page_name
 order by c.page_id;

exit
