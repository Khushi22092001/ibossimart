WHENEVER SQLERROR EXIT SQL.SQLCODE ROLLBACK
CONNECT -name IMART
SET DEFINE OFF SQLFORMAT JSON
SPOOL validation.log
select page_id,focus_cursor from apex_application_pages where application_id=105 and page_id=77;
select item_name,display_as from apex_application_page_items where application_id=105 and item_name='P77_CREATOR';
DECLARE c integer; q clob; begin select region_source into q from apex_application_page_regions where application_id=105 and page_id=76 and region_id=583680671318364752; c:=dbms_sql.open_cursor; begin dbms_sql.parse(c,q,dbms_sql.native); dbms_sql.close_cursor(c); exception when others then if dbms_sql.is_open(c) then dbms_sql.close_cursor(c); end if; raise; end; end;
/
select count(*) mapping_rows,count(d.locationname) named_locations,count(case when d.locationname is null then 1 end) unmatched_codes from modulelocation a left join modulelocationdetail c on c.tno=a.tno left join location d on d.locationcode=c.locationcode where a.companycode='1';
select count(*) blank_display_rows from modulelocation a left join modulelocationdetail c on c.tno=a.tno left join location d on d.locationcode=c.locationcode where a.companycode='1' and (case when d.locationname is not null then d.locationname when c.locationcode is not null then c.locationcode || ' (location unavailable)' else 'No location assigned' end) is null;
SPOOL OFF
EXIT
