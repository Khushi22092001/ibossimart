set pagesize 300 linesize 260 trimspool on
connect -name IMART

prompt === Visible page items named or labelled Panel (expect no rows) ===
select page_id,item_name,display_as,label
from apex_application_page_items
where application_id=105
  and (page_id=721 or page_id between 902 and 940)
  and (upper(item_name) like '%PANEL%' or upper(nvl(label,' ')) like '%PANEL%')
  and upper(display_as) <> 'HIDDEN'
order by page_id,item_name;

prompt === Visible interactive-report columns labelled Panel (expect no rows) ===
select page_id,region_name,column_alias,report_label,display_text_as
from apex_application_page_ir_col
where application_id=105
  and (page_id=721 or page_id between 902 and 940)
  and upper(nvl(report_label,' ')) like '%PANEL%'
  and upper(nvl(display_text_as,'STANDARD_REPORT_COLUMN')) not like 'HIDDEN%'
order by page_id,region_name,column_alias;

prompt === Default interactive reports exposing PANEL (expect no rows) ===
select r.page_id,r.region_id,r.report_name,r.report_columns
from apex_application_page_ir_rpt r
where r.application_id=105
  and (r.page_id=721 or r.page_id between 902 and 940)
  and instr(':'||upper(nvl(r.report_columns,' '))||':',':PANEL:') > 0
  and exists (
      select 1
      from apex_application_page_ir_col c
      where c.application_id=r.application_id
        and c.page_id=r.page_id
        and c.region_id=r.region_id
        and upper(c.column_alias)='PANEL'
        and upper(nvl(c.display_text_as,'STANDARD_REPORT_COLUMN')) not like 'HIDDEN%'
  )
order by r.page_id,r.region_id;

prompt === User-facing region text mentioning Panel (expect no rows) ===
select page_id,region_name
from apex_application_page_regions
where application_id=105
  and (page_id=721 or page_id between 902 and 940)
  and (
       instr(upper(nvl(region_source,' ')),'>PANEL<') > 0
    or instr(upper(nvl(region_source,' ')),'PANEL <B>') > 0
    or instr(upper(nvl(region_source,' ')),'SECOND PANEL') > 0
    or instr(upper(nvl(region_source,' ')),'PANEL SAYS') > 0
    or instr(upper(nvl(region_source,' ')),'OUTSIDE THE DATA PANEL') > 0
    or instr(upper(nvl(region_source,' ')),'LOCATION OR PANEL') > 0
  )
order by page_id,region_name;
exit
