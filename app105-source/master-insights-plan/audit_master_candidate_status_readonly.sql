whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set heading on
set pagesize 0
set linesize 32767
set trimspool on
set sqlformat csv

connect -name IMART

spool app105-source/master-insights-plan/module_master_candidate_status.csv
select mg.modulegroupname,
       m.modulecode,
       m.modulename,
       m.mastertablename,
       m.detailtablename,
       m.pageno register_page,
       m.entrypageno form_page,
       m.isactive
  from module m
  left join modulegroup mg on mg.modulegroupcode = m.modulegroupcode
 where regexp_like(
       m.modulecode || ' ' || m.modulename || ' ' || m.formname || ' ' ||
       nvl(m.mastertablename,' '),
       '(MASTER|COMPANY|LOCATION|BRANCH|WAREHOUSE|STORAGE|PARTY|VENDOR|SUPPLIER|CUSTOMER|TRANSPORT|BROKER|AGENT|VEHICLE|ITEM|MATERIAL|MEASURING|UNIT|CATEGORY|GROUP|EMPLOYEE|SALESPERSON|DEPARTMENT|DESIGNATION|COSTCENTRE|BANK|CITY|STATE|QUALITY|GRADE|LENGTH|WIDTH|THICKNESS|MAKE|INDUSTRY|PACKING|FREIGHTTYPE|PRODUCTIONCENTRE|ASSETCATEGORY)',
       'i')
 order by mg.serialno, m.serialno, m.modulecode;
spool off

spool app105-source/master-insights-plan/apex_master_named_pages.csv
select s.id page_id,
       s.name page_name,
       s.alias page_alias,
       s.page_mode,
       case when exists (
           select 1 from apex_260100.wwv_flow_page_plugs p
            where p.flow_id = s.flow_id
              and p.page_id = s.id
              and p.plug_source_type = 'NATIVE_FORM') then 'Y' else 'N' end has_native_form,
       (select listagg(i.name || case when i.is_primary_key='Y' then '*' end, ', ')
                 within group (order by i.item_sequence, i.name)
          from apex_260100.wwv_flow_step_items i
         where i.flow_id = s.flow_id
           and i.flow_step_id = s.id
           and i.is_primary_key = 'Y') primary_key_items
  from apex_260100.wwv_flow_steps s
 where s.flow_id = 105
   and regexp_like(s.name || ' ' || s.alias,
       '(MASTER|COMPANY|LOCATION|BRANCH|WAREHOUSE|STORAGE|PARTY|VENDOR|SUPPLIER|CUSTOMER|TRANSPORT|BROKER|AGENT|VEHICLE|ITEM|MATERIAL|MEASURING|UNIT|CATEGORY|GROUP|EMPLOYEE|SALESPERSON|DEPARTMENT|DESIGNATION|COST CENTRE|BANK|CITY|STATE|QUALITY|GRADE|LENGTH|WIDTH|THICKNESS|MAKE|INDUSTRY|PACKING|FREIGHT TYPE|PRODUCTION CENTRE|ASSET CATEGORY)',
       'i')
 order by s.id;
spool off

exit
