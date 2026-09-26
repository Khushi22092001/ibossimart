whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback off pagesize 400 linesize 260 long 2000 longchunksize 2000
connect -name IMART
column region_name format a45
column panel_text format a150
select page_id,
       region_name,
       substr(regexp_replace(region_source, '[[:space:]]+', ' '),
              greatest(1, regexp_instr(upper(region_source), 'PANEL') - 55), 150) panel_text
  from apex_application_page_regions
 where application_id=105
   and (page_id between 902 and 940 or page_id=721)
   and instr(upper(nvl(region_source,' ')), 'PANEL') > 0
 order by page_id, display_sequence, region_name;
exit
