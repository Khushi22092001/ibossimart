whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on serveroutput on pagesize 200 linesize 260
connect -name IMART

declare
begin
  update apex_260100.wwv_flow_page_da_events
     set bind_event_type='focusout',
         last_updated_on=sysdate,
         last_updated_by=user
   where flow_id=105
     and page_id=108
     and security_group_id=4744311978888504
     and bind_event_type='change'
     and id in (
       38655220772424864,38674434078424870,38675385466424870,38676216658424870,
       38677161981424870,38678094661424870,38679011173424871,38679837553424871,
       38685015215424872,38685850495424873,38686755567424873,38689496568424874,
       38693986569424875,38695799794424875,38697214257424876,38698059739424876
     );
  if sql%rowcount<>16 then
    raise_application_error(-20001,'Indent rollback count mismatch: expected 16');
  end if;

  update apex_260100.wwv_flow_page_da_events
     set bind_event_type='focusout',
         last_updated_on=sysdate,
         last_updated_by=user
   where flow_id=105
     and page_id=710
     and security_group_id=4744311978888504
     and bind_event_type='change'
     and id in (
       41132957840923805,41134401336923805,41135242887923806,
       41168016454923814,41169860550923814,41173922492923815
     );
  if sql%rowcount<>6 then
    raise_application_error(-20002,'Quotation rollback count mismatch: expected 6');
  end if;
  commit;
end;
/

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',
    p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,
    p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,
    p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select page_id,bind_event_type,count(*) event_count
  from apex_260100.wwv_flow_page_da_events
 where flow_id=105
   and security_group_id=4744311978888504
   and ((page_id=108 and id in (
          38655220772424864,38674434078424870,38675385466424870,38676216658424870,
          38677161981424870,38678094661424870,38679011173424871,38679837553424871,
          38685015215424872,38685850495424873,38686755567424873,38689496568424874,
          38693986569424875,38695799794424875,38697214257424876,38698059739424876))
     or (page_id=710 and id in (
          41132957840923805,41134401336923805,41135242887923806,
          41168016454923814,41169860550923814,41173922492923815)))
 group by page_id,bind_event_type
 order by page_id,bind_event_type;

exit
