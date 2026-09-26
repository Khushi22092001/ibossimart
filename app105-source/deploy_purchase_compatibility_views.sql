whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback off
connect -name IMART

create or replace view pcc_purchaseorder as
select x.*, cast('A' as varchar2(10)) panel from purchaseorder x;

create or replace view pcc_purchasebill as
select x.*, cast('A' as varchar2(10)) panel from purchasebill x;

create or replace view pcc_materialin as
select x.*, cast('A' as varchar2(10)) panel from materialin x;

create or replace view pcc_grn as
select x.*, cast('A' as varchar2(10)) panel from grn x;

create or replace view pcc_pbpass as
select x.*, cast('A' as varchar2(10)) panel from pbpass x;

create or replace view pcc_voucher as
select x.*, cast('A' as varchar2(10)) panel from voucher x;

create or replace view pcc_enquiry as
select x.*, cast('A' as varchar2(10)) panel from enquiry x;

create or replace view pcc_quotation as
select x.*, cast('A' as varchar2(10)) panel from quotation x;

create or replace view pcc_freightadvice as
select x.*, cast('A' as varchar2(10)) panel from freightadvice x;

create or replace view pcc_indent as
select x.*, cast('A' as varchar2(10)) panel from indent x;

create or replace view pcc_comparativestatement as
select x.*, cast('A' as varchar2(10)) panel from comparativestatement x;

commit;
prompt PURCHASE_COMPATIBILITY_VIEWS_DEPLOYED
