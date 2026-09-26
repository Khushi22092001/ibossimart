whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

begin
  update apex_260100.wwv_flow_page_plugs
     set lazy_loading = 'Y',
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 156
     and security_group_id = 4744311978888504
     and id in (796947375311330313, 796947423968330314)
     and nvl(lazy_loading, 'N') <> 'Y';

  if sql%rowcount <> 2 then
    raise_application_error(-20001, 'Expected Cost Centre and Reference helper grids were not found in their eager-load state.');
  end if;
end;
/
commit;

select plug_name, lazy_loading
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 156
   and security_group_id = 4744311978888504
   and id in (796947375311330313, 796947423968330314)
 order by id;

exit
