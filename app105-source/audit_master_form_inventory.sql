whenever sqlerror exit sql.sqlcode rollback
set pagesize 500
set linesize 300
connect -name IMART

/* Read-only discovery of every active live master-data module, regardless of
   its navigation group. This includes Item Master in Setup & Admin as well as
   the General Masters launcher. */
select modulegroupcode, modulegroupname, serialno
  from modulegroup
 order by serialno, modulegroupcode;

select m.modulecode,
       m.modulename,
       m.formname,
       mg.modulegroupname,
       m.modulegroupcode,
       m.moduletype,
       m.moduletypecode,
       m.pageno register_page,
       m.entrypageno form_page,
       m.isactive
  from module m
  left join modulegroup mg on mg.modulegroupcode=m.modulegroupcode
 where m.isactive='YES'
   and (mg.modulegroupname='General Masters'
        or upper(nvl(m.modulename, ' ')) like '%MASTER%'
        or upper(nvl(m.formname, ' ')) like '%MASTER%')
 order by mg.serialno, m.serialno, m.modulecode;

/* Visual-risk inventory for the matching entry forms. */
with master_forms as (
  select distinct m.entrypageno page_id
    from module m
    left join modulegroup mg on mg.modulegroupcode=m.modulegroupcode
   where m.isactive='YES'
     and m.entrypageno is not null
     and (mg.modulegroupname='General Masters'
          or upper(nvl(m.modulename, ' ')) like '%MASTER%'
          or upper(nvl(m.formname, ' ')) like '%MASTER%')
)
select s.id page_id,
       s.name page_name,
       (select count(*) from apex_260100.wwv_flow_page_plugs p
         where p.flow_id=105 and p.page_id=s.id and p.plug_source_type='NATIVE_IG') interactive_grids,
       (select count(*) from apex_260100.wwv_flow_page_plugs p
         where p.flow_id=105 and p.page_id=s.id and p.plug_source_type='NATIVE_FORM') form_regions,
       case when dbms_lob.instr(nvl(s.inline_css,to_clob('')), 'a-GV-row') > 0
                  or dbms_lob.instr(nvl(s.inline_css,to_clob('')), 'a-GV-cell') > 0
            then 'YES' else 'NO' end has_local_grid_row_style
  from apex_260100.wwv_flow_steps s
 where s.flow_id=105 and s.id in (select page_id from master_forms)
 order by s.id;

exit
