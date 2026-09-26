set pagesize 100
set linesize 220
set define off
connect -name IMART
begin
  apex_session.attach(p_app_id=>105,p_page_id=>1,p_session_id=>22102041901353);
end;
/
column myboxlabel format a30
column myboxkey format a36
select p.myboxlabel,
       p.myboxkey,
       p.parentkey,
       p.bossusercode,
       p.companycode,
       p.pageno,
       p.iconname,
       p.serialno
  from myboxtree_apexmenu p
 where p.bossusercode = '1'
   and p.companycode = '1'
 order by p.serialno,p.myboxlabel
 fetch first 120 rows only;
begin apex_session.detach; end;
/
exit
