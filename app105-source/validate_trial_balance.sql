connect -name IMART
set define off
set pagesize 60 linesize 260 trimspool on
with
params as (
  select date '2026-04-01' from_date,
         date '2026-09-23' to_date,
         cast(null as varchar2(100)) company_code,
         cast(null as varchar2(100)) location_code
    from dual
),
nodes (account_code, account_name, parent_code, kind, sort_segment) as (
  select '~BALANCESHEET', 'Balance Sheet', null, 'Statement', '01' from dual union all
  select '~ASSETS', 'Assets', '~BALANCESHEET', 'Group', '01' from dual union all
  select '~LIABILITIES', 'Liabilities', '~BALANCESHEET', 'Group', '02' from dual union all
  select '~PROFITANDLOSS', 'Profit & Loss', null, 'Statement', '02' from dual union all
  select '~NOSTATEMENT', 'Other Accounts', null, 'Statement', '03' from dual union all
  select p.partycode,
         nvl(p.partyname,p.partycode),
         case when p.parentcode is not null then p.parentcode
              when upper(p.natureofaccountcode) = 'ASSETS' then '~ASSETS'
              when upper(p.natureofaccountcode) = 'LIABILITIES' then '~LIABILITIES'
              when upper(p.natureofaccountcode) in ('INCOME','EXPENSES') then '~PROFITANDLOSS'
              when upper(p.partycode) = 'PROFITANDLOSS' then '~PROFITANDLOSS'
              else '~NOSTATEMENT' end,
         case when exists (select 1 from party c where c.parentcode=p.partycode)
              then 'Group' else 'Ledger' end,
         upper(nvl(p.partyname,p.partycode))||'|'||p.partycode
    from party p
   where p.partytypecode in ('ACCOUNTGROUP','ACCOUNT')
),
tree as (
  select n.account_code, n.account_name, n.parent_code, n.kind,
         level lvl,
         sys_connect_by_path(replace(n.account_code,'/','%2F'),'/')||'/' node_path,
         sys_connect_by_path(replace(n.sort_segment,'/','-'),'/') sort_path
    from nodes n
   start with n.parent_code is null
 connect by nocycle prior n.account_code=n.parent_code
),
fy as (
  select f.financialyearcode, f.financialyearbegin
    from financialyear f cross join params x
   where x.from_date between f.financialyearbegin and f.financialyearend
),
opening_amounts as (
  select o.accountcode,
         sum(nvl(o.openingamount,0)) opening_amount
    from opening o cross join params x cross join fy
   where o.financialyearcode=fy.financialyearcode
     and (x.company_code is null or o.companycode=x.company_code)
     and (x.location_code is null or o.locationcode=x.location_code)
   group by o.accountcode
),
movement_amounts as (
  select d.accountcode,
         sum(case when d.voucherdate < x.from_date then nvl(d.amount,0) else 0 end) pre_amount,
         sum(case when d.voucherdate between x.from_date and x.to_date and nvl(d.amount,0)>0 then d.amount else 0 end) period_debit,
         sum(case when d.voucherdate between x.from_date and x.to_date and nvl(d.amount,0)<0 then -d.amount else 0 end) period_credit,
         max(case when d.voucherdate between x.from_date and x.to_date then d.voucherdate end) last_posting
    from voucherdetail d cross join params x cross join fy
   where d.voucherdate between fy.financialyearbegin and x.to_date
     and (x.company_code is null or d.companycode=x.company_code)
     and (x.location_code is null or d.locationcode=x.location_code)
   group by d.accountcode
),
ledger_balances as (
  select t.account_code, t.node_path,
         nvl(o.opening_amount,0)+nvl(m.pre_amount,0) opening_net,
         nvl(m.period_debit,0) period_debit,
         nvl(m.period_credit,0) period_credit,
         m.last_posting
    from tree t
    left join opening_amounts o on o.accountcode=t.account_code
    left join movement_amounts m on m.accountcode=t.account_code
   where t.kind='Ledger'
),
aggregated as (
  select t.account_code, t.account_name, t.kind, t.lvl, t.sort_path,
         sum(l.opening_net) opening_net,
         sum(l.period_debit) period_debit,
         sum(l.period_credit) period_credit,
         max(l.last_posting) last_posting
    from tree t
    left join ledger_balances l on l.node_path like t.node_path||'%'
   group by t.account_code,t.account_name,t.kind,t.lvl,t.sort_path
)
select lvl, account_code, account_name, kind,
       opening_net, period_debit, period_credit,
       opening_net+period_debit-period_credit closing_net,
       to_char(last_posting,'DD-MM-RRRR') last_posting
  from aggregated
 where lvl<=3
 order by sort_path;
exit
