whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

create or replace trigger companyai_modulelocation
after insert on company
for each row
begin
    if :new.companycode <> '1' then
        insert into modulelocation (
            tno, companycode, modulecode, remark, creator, creationtime)
        select globaltno.nextval,
               :new.companycode,
               src.modulecode,
               'Seeded from canonical company module set',
               user,
               sysdate
          from modulelocation src
         where src.companycode = '1'
           and not exists (
               select 1
                 from modulelocation target
                where target.companycode = :new.companycode
                  and target.modulecode = src.modulecode);
    end if;
end;
/

show errors trigger companyai_modulelocation
commit;
exit
