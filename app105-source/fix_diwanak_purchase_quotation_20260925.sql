whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
    l_doc_no  quotation.quotationno%type;
    l_seeded  number;
    l_count   number;
begin
    insert into modulelocation (
        tno, companycode, modulecode, remark, creator, creationtime)
    select globaltno.nextval,
           '3',
           src.modulecode,
           'Seeded from canonical company module set',
           user,
           sysdate
      from modulelocation src
     where src.companycode = '1'
       and not exists (
           select 1
             from modulelocation target
            where target.companycode = '3'
              and target.modulecode = src.modulecode);

    l_seeded := sql%rowcount;

    select count(*)
      into l_count
      from codescheme
     where companycode = '3'
       and financialyearcode = '26-27'
       and modulecode = 'QUOTATION';

    if l_count = 0 then
        raise_application_error(-20002,
            'DIWANKA Purchase Quotation Code Scheme was not generated.');
    end if;

    select quotationno
      into l_doc_no
      from quotation
     where tno = 56983631
       and companycode = '3'
       and trunc(quotationdate) = date '2026-09-25'
     for update;

    if l_doc_no is null then
        setdocnonext(
            'QUOTATION', '3', '26-27', 'RC', 'PURCHASE', null,
            date '2026-09-25');

        l_doc_no := getdocno(
            'QUOTATION', '3', '26-27', 'RC', 'PURCHASE', null,
            date '2026-09-25');

        if l_doc_no is null then
            raise_application_error(-20003,
                'DIWANKA Purchase Quotation number generation still returned null.');
        end if;

        update quotation
           set quotationno = l_doc_no
         where tno = 56983631
           and quotationno is null;

        if sql%rowcount != 1 then
            raise_application_error(-20004,
                'Expected Purchase Quotation 56983631 was not updated.');
        end if;
    end if;

    dbms_output.put_line('DIWANKA module rows seeded: ' || l_seeded);
    dbms_output.put_line('DIWANKA quotation 56983631 number: ' || l_doc_no);
    commit;
end;
/

exit
