WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF
SET SERVEROUTPUT ON
declare c integer;begin c:=dbms_sql.open_cursor;dbms_sql.parse(c,q'~declare
 ack_keys clob;
 procedure ack_business is
  l_company production.companycode%type:=v('GLOBAL_COMPANYCODE');
  l_actor bossuser.bossusercode%type:=v('GLOBAL_BOSSUSERCODE');
  l_header production%rowtype;
  l_count number; l_flows number; l_passed number:=0;
  l_raw number; l_finished number; l_status varchar2(30);
  l_privileged boolean:=false;
 begin
  -- Use the authenticated ERP context, never the parsing-schema SQL USER.
  if :P197_TNO is null or l_company is null or l_actor is null or v('GLOBAL_LOGINNAME') is null then
   raise_application_error(-20079,'Production Pass requires a saved document and authenticated ERP context.');
  end if;
  select count(*) into l_count from bossuser
   where bossusercode=l_actor and upper(loginname)=upper(v('GLOBAL_LOGINNAME'));
  if l_count<>1 then raise_application_error(-20079,'ERP user context is invalid. Sign in again.');end if;
  select count(*) into l_count from moduleprivilege
   where modulecode='PRODUCTION' and companycode=l_company and bossusercode=l_actor and viewprivilege='YES';
  if l_count=0 then raise_application_error(-20079,'You do not have permission to view this Production document.');end if;
  begin select * into l_header from production where tno=:P197_TNO and companycode=l_company for update;
   exception when no_data_found then raise_application_error(-20079,'Production document was not found in your company.');end;
  -- EXISTS tolerates repeated/blank mapping rows without changing the permitted locations.
  select count(*) into l_count from modulelocation m
   where m.modulecode='PRODUCTION' and m.companycode=l_company
     and exists(select 1 from modulelocationdetail d where d.tno=m.tno and d.locationcode=l_header.locationcode);
  if l_count=0 then raise_application_error(-20079,'Production is not enabled for this document location.');end if;
  if trim(:P197_PASSFAILREMARK) is null then raise_application_error(-20079,'Enter a Pass note.');end if;
  l_status:=getdocumentstatuscode('PRODUCTION',l_header.tno);
  select count(*) into l_count from moduleprivilege
   where modulecode='PRODUCTION' and companycode=l_company and bossusercode=l_actor and statusprivilege='YES';
  l_privileged:=l_count>0;
  select count(*) into l_flows from moduleflow where modulecode='PRODUCTION' and companycode=l_company;
  -- A repeat request never creates a second voucher or repeats stock movement.
  if l_status='ACTIVE' then
   select count(*) into l_count from voucher where modulecode='PRODUCTION' and moduletno=l_header.tno;
   if l_count<>1 then raise_application_error(-20079,'Active Production has missing/duplicate vouchers. Review it before passing again.');end if;
   for r in(select tno from voucher where modulecode='PRODUCTION' and moduletno=l_header.tno)loop
    IMART_VOUCHER_BALANCE.assert_voucher(r.tno);
   end loop;
   :P197_STATUS:=l_status;
   return;
  end if;
  -- Apply the same saved quantity/allocation checks used by the Production form.
  select nvl(sum(quantity1),0) into l_raw from productionraw where tno=l_header.tno;
  select nvl(sum(quantity1),0) into l_finished from productionfinished where tno=l_header.tno;
  if l_raw<=0 or l_finished<=0 or l_raw<>l_finished then
   raise_application_error(-20025,'Input and Output Quantity Should be Equal and greater than zero.');
  end if;
  select count(*) into l_count from productionraw r where r.tno=l_header.tno and
   nvl(r.quantity1,0)<>(select nvl(sum(d.quantity1),0) from productionrawstockdetail d where d.tno=r.tno and d.sno=r.sno);
  if l_count>0 then raise_application_error(-20025,'Input Quantity and Stock Quantity Not Matching.');end if;
  select count(*) into l_count from productionfinished r where r.tno=l_header.tno and
   nvl(r.quantity1,0)<>(select nvl(sum(d.quantity1),0) from productionfinisheddetail d where d.tno=r.tno and d.sno=r.sno);
  if l_count>0 then raise_application_error(-20025,'Output Quantity and Finished Detail Quantity Not Matching.');end if;
  if l_flows>0 then
   -- Only the current user's assigned, still-pending stages may be passed.
   for r in(select p.tno from passfail p join moduleflow f on f.tno=p.moduleflowtno
     where f.modulecode='PRODUCTION' and f.companycode=l_company and p.moduletno=l_header.tno
       and p.bossusercode=l_actor and p.ispass is null and p.isfail is null
       and p.isforwarded is null and p.isrebounded is null
       and exists(select 1 from moduleflowuser u join bossuserrole br on br.bossuserrolecode=u.bossusercode
        join bossuser bu on bu.tno=br.tno where u.tno=f.tno and br.companycode=l_company and bu.bossusercode=l_actor)
     order by p.tno for update of p.ispass)loop
    update passfail set ispass='YES',remark=trim(:P197_PASSFAILREMARK) where tno=r.tno;
    l_passed:=l_passed+1;
   end loop;
   if l_passed=0 then raise_application_error(-20079,'No pending Production approval is assigned to you.');end if;
   sendpassfailforward('PRODUCTION',l_header.tno,l_header.productionno,l_company);
   l_status:=getdocumentstatuscode('PRODUCTION',l_header.tno);
  else
   -- With no configured flow, Pass has exactly the existing Status-change permission.
   if not l_privileged then raise_application_error(-20079,'Production Pass requires Status permission when no approval flow is configured.');end if;
   l_status:='ACTIVE';
  end if;
  if l_status='ACTIVE' then
   -- Preserve the purchase-bill posting prerequisite from the existing Status action.
   select count(*) into l_count from productionrawstockdetail d join stock s on s.tno=d.stocktno join grn g on g.tno=s.grntno
    where d.tno=l_header.tno and not exists(
      select 1 from pbpassdetailgrn x join pbpass b on b.tno=x.tno join voucher v on v.moduletno=b.tno where x.grntno=s.grntno);
   if l_count>0 then raise_application_error(-20025,'Post the Purchase Bill for the source GRN before passing Production.');end if;
   if l_flows=0 then setdocumentstatuscode('PRODUCTION',l_header.tno,'ACTIVE');end if;
   postproduction(l_header.tno);
  end if;
  :P197_STATUS:=getdocumentstatuscode('PRODUCTION',l_header.tno);
 end;
begin
 savepoint p197_pass_post;
 select json_array(to_char(:P197_TNO) null on null returning clob) into ack_keys from dual;
 imart_save_ack.begin_v2(:P197_IMART_SAVE_OP_ID,'P197_TNO',ack_keys,'STATUS');
 ack_business;
 select json_array(to_char(:P197_TNO) null on null returning clob) into ack_keys from dual;
 imart_save_ack.finish_v2(:P197_IMART_SAVE_OP_ID,ack_keys);
 :P197_IMART_STATUS_DONE:=:P197_IMART_SAVE_OP_ID;
exception when others then
 rollback to p197_pass_post;
 raise;
end;~',dbms_sql.native);dbms_sql.close_cursor(c);dbms_output.put_line('PASS_ACTION_PARSE_OK');exception when others then if dbms_sql.is_open(c)then dbms_sql.close_cursor(c);end if;raise;end;
/
EXIT
