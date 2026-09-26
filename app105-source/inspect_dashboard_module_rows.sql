connect -name IMART
set pagesize 200 linesize 260 trimspool on
column modulegroupcode format a24
column modulegroupname format a34
column modulecode format a28
column modulename format a34
column iconname format a24

select modulegroupcode,modulegroupname,serialno,pageno,iconname
  from modulegroup
 where upper(modulegroupname) like '%DASHBOARD%'
 order by serialno;

select m.modulegroupcode,m.modulecode,m.modulename,m.pageno,m.entrypageno,m.serialno,m.iconname,m.isactive
  from module m
 where m.modulegroupcode in (
   select modulegroupcode from modulegroup where upper(modulegroupname) like '%DASHBOARD%'
 )
 order by m.modulegroupcode,m.serialno,m.modulename;
exit
