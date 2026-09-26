set pagesize 100
set linesize 220
connect -name IMART

select process_name, process_point
  from apex_260100.wwv_flow_processing
 where flow_id = 105
   and process_name = 'OPEN_INBOUND_WORKFLOW_MODULE';

select case when instr(javascript_code_onload, 'Home: full inbound workflow launcher') > 0 then 'PRESENT' else 'MISSING' end as launcher_js,
       case when instr(inline_css, 'rights-aware workflow launcher on Home') > 0 then 'PRESENT' else 'MISSING' end as launcher_css
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 1
   and security_group_id = 4744311978888504;

select count(*) as configured_modules
  from module
 where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                      'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                      'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
   and upper(nvl(isactive, 'NO')) = 'YES';

exit
