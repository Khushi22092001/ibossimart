whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set serveroutput on

declare
    l_valid_rowid rowid;
    l_duplicate_source_rowid rowid;
    l_duplicate_sno dfreightbillreceiptdetail.sno%type;
begin
    select d.rowid
      into l_valid_rowid
      from dfreightbillreceiptdetail d
     where d.tno is not null and d.sno is not null
       and not exists (
             select 1 from dfreightbillreceiptdetail x
              where x.tno=d.tno and x.sno=d.sno and x.rowid<>d.rowid)
       and rownum=1;

    update dfreightbillreceiptdetail set sno=sno where rowid=l_valid_rowid;
    rollback;
    dbms_output.put_line('UNCHANGED_IDENTITY_ALLOWED');

    select source_rowid,target_sno
      into l_duplicate_source_rowid,l_duplicate_sno
      from (
        select d.rowid source_rowid, other.sno target_sno
          from dfreightbillreceiptdetail d
          join dfreightbillreceiptdetail other on other.tno=d.tno and other.rowid<>d.rowid
         where d.tno is not null and d.sno is not null
           and not exists (
                 select 1 from dfreightbillreceiptdetail same_key
                  where same_key.tno=d.tno and same_key.sno=d.sno and same_key.rowid<>d.rowid)
           and rownum=1
      );

    begin
        update dfreightbillreceiptdetail set sno=l_duplicate_sno where rowid=l_duplicate_source_rowid;
        raise_application_error(-20099,'Identity guard did not reject a duplicate Bill Receipt line ID.');
    exception
        when others then
            if sqlcode=-20033 then
                dbms_output.put_line('DUPLICATE_IDENTITY_REJECTED');
            else
                raise;
            end if;
    end;
    rollback;
end;
/

select trigger_name,status
  from user_triggers
 where trigger_name='DFREIGHTBILLRECEIPTDETAIL_BIU_IDENTITY_GUARD';
exit
