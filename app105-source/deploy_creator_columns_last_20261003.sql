whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
create table imart_auditcol_ir_bak_20261003 as
select c.* from apex_260100.wwv_flow_worksheet_columns c join apex_260100.wwv_flow_steps s on s.flow_id=c.flow_id and s.id=c.page_id
where c.flow_id=105 and c.page_id<800 and regexp_like(s.name,'register|list|master|report','i')
and not regexp_like(s.name,'dashboard|analytics|insights|360|command|control tower|prototype|testing','i')
and not exists(select 1 from apex_260100.wwv_flow_page_plugs p where p.flow_id=c.flow_id and p.page_id=c.page_id and p.plug_source_type='NATIVE_FORM')
and regexp_replace(upper(c.db_column_name),'[^A-Z]','') in ('CREATOR','CREATIONTIME','CREATIONDATE','CREATEDBY','CREATEDON','CREATEDAT');
create table imart_auditcol_rpt_bak_20261003 as select r.* from apex_260100.wwv_flow_worksheet_rpts r where r.flow_id=105 and r.worksheet_id in(select worksheet_id from imart_auditcol_ir_bak_20261003);
create table imart_auditcol_ig_bak_20261003 as
select c.* from apex_260100.wwv_flow_region_columns c join apex_260100.wwv_flow_steps s on s.flow_id=c.flow_id and s.id=c.page_id
where c.flow_id=105 and c.page_id<800 and regexp_like(s.name,'register|list|master|report','i')
and not regexp_like(s.name,'dashboard|analytics|insights|360|command|control tower|prototype|testing','i')
and not exists(select 1 from apex_260100.wwv_flow_page_plugs p where p.flow_id=c.flow_id and p.page_id=c.page_id and p.plug_source_type='NATIVE_FORM')
and regexp_replace(upper(c.name),'[^A-Z]','') in ('CREATOR','CREATIONTIME','CREATIONDATE','CREATEDBY','CREATEDON','CREATEDAT');
create table imart_auditcol_igrc_bak_20261003 as select r.* from apex_260100.wwv_flow_ig_report_columns r where r.column_id in(select id from imart_auditcol_ig_bak_20261003);
declare
  l_plain varchar2(32767); l_audit varchar2(32767); l_token varchar2(4000); l_new varchar2(32767); l_n number; l_max number; l_updates number:=0; l_seq number;
begin
  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>0,p_default_owner=>'IMART');
  for r in(select * from imart_auditcol_rpt_bak_20261003 where report_columns is not null) loop
    l_plain:=null; l_audit:=null;
    for j in 1..regexp_count(r.report_columns,':')+1 loop
      l_token:=regexp_substr(r.report_columns,'[^:]+',1,j);
      if l_token is not null then
        select count(*) into l_n from imart_auditcol_ir_bak_20261003 c where c.worksheet_id=r.worksheet_id and c.db_column_name=l_token;
        if l_n>0 then l_audit:=l_audit||':'||l_token; else l_plain:=l_plain||':'||l_token; end if;
      end if;
    end loop;
    l_new:=ltrim(l_plain||l_audit,':');
    if l_new<>r.report_columns then
      update apex_260100.wwv_flow_worksheet_rpts set report_columns=l_new where id=r.id and flow_id=105;
      l_updates:=l_updates+sql%rowcount;
    end if;
  end loop;
  for w in(select distinct worksheet_id from imart_auditcol_ir_bak_20261003) loop
    select nvl(max(display_order),0) into l_max from apex_260100.wwv_flow_worksheet_columns where worksheet_id=w.worksheet_id and id not in(select id from imart_auditcol_ir_bak_20261003);
    l_seq:=0;
    for c in(select * from imart_auditcol_ir_bak_20261003 where worksheet_id=w.worksheet_id order by display_order,id) loop
      l_seq:=l_seq+10;
      update apex_260100.wwv_flow_worksheet_columns set display_order=l_max+l_seq where id=c.id and flow_id=105;
    end loop;
  end loop;
  for v in(select distinct r.view_id from imart_auditcol_igrc_bak_20261003 r) loop
    select nvl(max(display_seq),0) into l_max from apex_260100.wwv_flow_ig_report_columns where view_id=v.view_id and column_id not in(select id from imart_auditcol_ig_bak_20261003);
    l_seq:=0;
    for c in(select * from imart_auditcol_igrc_bak_20261003 where view_id=v.view_id order by display_seq,id) loop
      l_seq:=l_seq+10;
      update apex_260100.wwv_flow_ig_report_columns set display_seq=l_max+l_seq where id=c.id;
    end loop;
  end loop;
  for v in(select distinct region_id from imart_auditcol_ig_bak_20261003) loop
    select nvl(max(display_sequence),0) into l_max from apex_260100.wwv_flow_region_columns where region_id=v.region_id and id not in(select id from imart_auditcol_ig_bak_20261003);
    l_seq:=0;
    for c in(select * from imart_auditcol_ig_bak_20261003 where region_id=v.region_id order by display_sequence,id) loop
      l_seq:=l_seq+10;
      update apex_260100.wwv_flow_region_columns set display_sequence=l_max+l_seq where id=c.id and flow_id=105;
    end loop;
  end loop;
  select count(*) into l_n from apex_260100.wwv_flow_worksheet_columns c join imart_auditcol_ir_bak_20261003 b on b.id=c.id where decode(c.display_in_default_rpt,b.display_in_default_rpt,0,1)<>0;
  if l_n<>0 then raise_application_error(-20001,'IR visibility changed');end if;
  select count(*) into l_n from apex_260100.wwv_flow_ig_report_columns c join imart_auditcol_igrc_bak_20261003 b on b.id=c.id where decode(c.is_visible,b.is_visible,0,1)<>0;
  if l_n<>0 then raise_application_error(-20002,'IG visibility changed');end if;
  wwv_flow_imp.component_end;
  dbms_output.put_line('REORDERED_REPORT_LAYOUTS='||l_updates||';VISIBILITY_UNCHANGED');
end;
/
commit;
exit
