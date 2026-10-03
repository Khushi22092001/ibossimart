whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
declare src clob;begin
 for k in (select distinct type from imart_mr_creation_pkg_backup order by type) loop
  src:='create or replace ';
  for r in (select text from imart_mr_creation_pkg_backup where type=k.type order by line) loop src:=src||r.text;end loop;
  execute immediate src;
 end loop;
 update apex_260100.wwv_flow_page_plugs p set plug_source=(select b.plug_source from imart_mr_creation_backup b where b.id=p.id) where p.flow_id=105 and p.id in (select id from imart_mr_creation_backup);
end;
/
commit;
exit
