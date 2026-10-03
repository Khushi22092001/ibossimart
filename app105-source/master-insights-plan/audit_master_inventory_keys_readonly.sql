-- App 105 Master Insights planning audit.
-- Read-only: inventories the actual master/configuration pages selected from
-- the live Module map and reports database primary-key columns where present.

set sqlformat csv
set feedback off
set heading on
set pagesize 50000
set linesize 32767
set trimspool on
set define off
set sqlblanklines on

spool app105-source/master-insights-plan/master_form_inventory.csv

with inventory (classification, module_group, module_code, master_name,
                page_id, table_name, apex_context_item, navigation_status) as (
  select 'ORGANISATIONAL','Setup & Admin','COMPANY','Company',4,'COMPANY','P4_COMPANYCODE','ACTIVE' from dual union all
  select 'REFERENCE','Setup & Admin','DOCTYPE','Document Type',22,'DOCTYPE','P22_TNO','ACTIVE' from dual union all
  select 'LOCATION','Setup & Admin','LOCATION','Location / Branch',25,'LOCATION','P25_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Setup & Admin','FINANCIALYEAR','Financial Year',28,'FINANCIALYEAR','P28_TNO','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','CODESCHEME','Code Scheme',40,'CODESCHEME','P40_TNO','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','CODESCHEMEMASTER','Code Scheme for Master Module',42,'CODESCHEMEMASTER','P42_MODULECODE','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','MODULEGROUP','Module Group',44,'MODULEGROUP','P44_TNO','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','MODULE','Module',45,'MODULE','P45_MODULECODE','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','MODULEDOCTYPE','Module Document Type',75,'MODULEDOCTYPE','P75_TNO','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','MODULELOCATION','Module Location',77,'MODULELOCATION','P77_TNO','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','BOSSUSER','BOSS User',81,'BOSSUSER','P81_TNO','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','MYPARAMETER','My Parameter',110,'MYPARAMETER','P110_TNO','ACTIVE' from dual union all
  select 'ORGANISATIONAL','Setup & Admin','COSTCENTRE','Cost Centre',120,'COSTCENTRE','P120_TNO','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','MODULEPRIVILEGE','Module Privilege',136,'MODULEPRIVILEGE','P136_TNO','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','MODULEDOCTYPEWISETAC','Module Document Type Wise TAC',225,'MODULEDOCTYPEWISETAC','P225_TNO','ACTIVE' from dual union all
  select 'ORGANISATIONAL','Setup & Admin','ADDITIONALBUSINESSPLACE','Additional Business Place',248,'ADDITIONALBUSINESSPLACE','P248_TNO,P248_SNO','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','MODULEFLOW','Module Flow',264,'MODULEFLOW','P264_TNO','ACTIVE' from dual union all
  select 'LOCATION','Setup & Admin','ZONE','Zone',287,'ZONE','P287_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Setup & Admin','GSTSETUP','GST Setup',308,'GSTSETUP','P308_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Setup & Admin','PARTYATTRIBUTE','Party Attribute',664,'PARTYATTRIBUTE','P664_TNO','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','PROCESSROUTING','Process Routing',716,'PROCESSROUTING','P716_TNO','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','PROCESSTAT','Process TAT',718,'PROCESSTAT','P718_TNO','ACTIVE' from dual union all
  select 'TECHNICAL','Setup & Admin','PROCESSESCALATION','Process Escalation',720,'PROCESSESCALATION','P720_TNO,P720_SNO','ACTIVE' from dual union all

  select 'REFERENCE','General Masters','CITY','City',8,'CITY','P8_TNO','ACTIVE' from dual union all
  select 'REFERENCE','General Masters','INDUSTRYSECTOR','Industry Sector',57,'INDUSTRYSECTOR','P57_TNO','ACTIVE' from dual union all
  select 'REFERENCE','General Masters','PACKINGTYPE','Packing Type',73,'PACKINGTYPE','P73_TNO','ACTIVE' from dual union all
  select 'LOGISTICS','General Masters','VEHICLETYPE','Vehicle Type',89,'VEHICLETYPE','P89_TNO','ACTIVE' from dual union all
  select 'LOGISTICS','General Masters','COMPANYVEHICLE','Company Vehicle',91,'COMPANYVEHICLE','P91_TNO','INACTIVE MODULE' from dual union all
  select 'REFERENCE','General Masters','ITEMMAKE','Item Make',106,'ITEMMAKE','P106_TNO','ACTIVE' from dual union all
  select 'REFERENCE','General Masters','TERMSANDCONDITIONHEAD','Terms and Condition Head',173,'TERMSANDCONDITIONHEAD','P173_TNO','ACTIVE' from dual union all
  select 'REFERENCE','General Masters','ITEMGRADE','Item Grade',367,'ITEMGRADE','P367_TNO','ACTIVE' from dual union all
  select 'REFERENCE','General Masters','ITEMLENGTH','Item Length',369,'ITEMLENGTH','P369_TNO','ACTIVE' from dual union all
  select 'REFERENCE','General Masters','ITEMWIDTH','Item Width',371,'ITEMWIDTH','P371_TNO','ACTIVE' from dual union all
  select 'REFERENCE','General Masters','ITEMTHICKNESS','Item Thickness',373,'ITEMTHICKNESS','P373_TNO','ACTIVE' from dual union all

  select 'PARTY','Finance & Accounts','PARTY','Account / Party Master',49,'PARTY','P49_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','PARTYTYPE','Party Type',71,'PARTYTYPE','P71_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','TDSNATURE','TDS Nature',30,'TDSNATURE','P30_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','TDSTAXCATEGORY','TDS Tax Category',32,'TDSTAXCATEGORY','P32_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','TDSPAYEECATEGORY','TDS Payee Category',34,'TDSPAYEECATEGORY','P34_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','HSN','HSN',47,'HSN','P47_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','FOOTERACCOUNT','Footer Account',93,'FOOTERACCOUNT','P93_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','GROUPOFPARTY','Group of Party',97,'GROUPOFPARTY','P97_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','JOBTYPEACCOUNT','Service Type Account',99,'JOBTYPEACCOUNT','P99_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','FOOTERHEAD','Footer Head',102,'FOOTERHEAD','P102_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','BANK','Bank',124,'BANK','P124_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','TAXRULE','Tax Rule',177,'TAXRULE','P177_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','SAC','SAC',326,'SAC','P326_TNO','ACTIVE' from dual union all
  select 'PARTY','Finance & Accounts','VENDOR','Vendor Onboarding Master',350,'VENDOR','P350_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Finance & Accounts','AGENTCOMMISSIONRATE','Agent Commission Rate',null,'AGENTCOMMISSIONRATE',null,'ACTIVE, NO APEX PAGE MAP' from dual union all

  select 'ITEM','Inventory Control','ITEM','Item / Material Master',59,'ITEM','P59_TNO','ACTIVE' from dual union all
  select 'ITEM','Inventory Control','ITEMCATEGORY','Item Category',55,'ITEMCATEGORY','P55_TNO','ACTIVE' from dual union all
  select 'ITEM','Inventory Control','ITEMTYPE','Item Group',37,'ITEMTYPE','P37_TNO','ACTIVE' from dual union all
  select 'ITEM','Inventory Control','ITEMSPECIFICATION','Item Specification',13,'ITEMSPECIFICATION','P13_ITEMTNO,P13_SNO','ACTIVE, CUSTOM DML' from dual union all
  select 'REFERENCE','Inventory Control','MEASURINGUNIT','Measuring Unit / UOM',51,'MEASURINGUNIT','P51_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Inventory Control','ITEMCHARACTERISTICS','Item Characteristics',53,'ITEMCHARACTERISTICS','P53_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Inventory Control','ITEMCLASS','Item Class',61,'ITEMCLASS','P61_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Inventory Control','ITEMNATURE','Item Nature',65,'ITEMNATURE','P65_TNO','ACTIVE' from dual union all
  select 'LOCATION','Inventory Control','STORAGELOCATION','Storage Location',128,'STORAGELOCATION','P128_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Inventory Control','ITEMACCOUNT','Item Account',211,'ITEMACCOUNT','P211_TNO','ACTIVE' from dual union all

  select 'ORGANISATIONAL','Hire to Retire','DEPARTMENT','Department',83,'DEPARTMENT','P83_TNO','ACTIVE' from dual union all
  select 'ORGANISATIONAL','Hire to Retire','EMPLOYEE','Employee',85,'EMPLOYEE','P85_TNO','ACTIVE' from dual union all
  select 'ORGANISATIONAL','Hire to Retire','DESIGNATION','Designation',87,'DESIGNATION','P87_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','SHIFT','Shift',204,'SHIFT','P204_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','PTSLAB','PT Slab',266,'PTSLAB','P266_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','PFANDESICSETTING','PF and ESIC Setting',332,'PFANDESICSETTING','P332_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','CATEGORY','Employee Category',340,'CATEGORY','P340_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','LEAVESCHEME','Leave Scheme',342,'LEAVESCHEME','P342_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','STAFFTYPE','Staff Type',602,'STAFFTYPE','P602_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','SALARYHEAD','Salary Head',604,'SALARYHEAD','P604_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','LOANCATEGORY','Loan Category',608,'LOANCATEGORY','P608_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','LOANTYPE','Loan Type',610,'LOANTYPE','P610_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','SALARYHEADACCOUNT','Salary Head Account',612,'SALARYHEADACCOUNT','P612_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','ATTENDENCEHEAD','Attendance Head',616,'ATTENDENCEHEAD','P616_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','SALARYSCHEME','Salary Scheme',624,'SALARYSCHEME','P624_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','LOANSCHEME','Loan Scheme',628,'LOANSCHEME','P628_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','CONVEYANCESCHEME','Reimbursement Policy',649,'CONVEYANCESCHEME','P649_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','TRAVELINGMODE','Traveling Mode',654,'TRAVELINGMODE','P654_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','EXPENSETYPE','Expense Type',656,'EXPENSETYPE','P656_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Hire to Retire','CONVEYANCETYPE','Conveyance Type',662,'CONVEYANCETYPE','P662_TNO','ACTIVE' from dual union all

  select 'REFERENCE','Job & Services','JOBTYPE','Service Type',95,'JOBTYPE','P95_TNO','ACTIVE' from dual union all
  select 'ORGANISATIONAL','Job & Services','PRODUCTIONCENTRE','Production Centre',206,'PRODUCTIONCENTRE','P206_TNO','ACTIVE' from dual union all
  select 'REFERENCE','Freight Management','FREIGHTTYPE','Freight Type',79,'FREIGHTTYPE','P79_TNO','ACTIVE' from dual union all

  select 'REFERENCE','Asset Management','ASSETCATEGORY','Asset Category',668,'ASSETCATEGORY','P668_TNO','ACTIVE' from dual union all
  select 'ITEM','Asset Management','ASSET','Asset',675,'ASSET','P675_TNO,P675_SNO','ACTIVE' from dual union all
  select 'REFERENCE','Asset Management','ASSETCATEGORYDEPRATE','Asset Category Depreciation Rate',679,'ASSETCATEGORYDEPRATE','P679_TNO','ACTIVE' from dual
), pk as (
  select c.table_name,
         listagg(cc.column_name, ',') within group (order by cc.position) as db_primary_key
    from user_constraints c
    join user_cons_columns cc
      on cc.constraint_name = c.constraint_name
     and cc.table_name = c.table_name
   where c.constraint_type = 'P'
   group by c.table_name
)
select i.classification,
       i.module_group,
       i.module_code,
       i.master_name,
       i.page_id,
       i.table_name,
       p.db_primary_key,
       i.apex_context_item,
       i.navigation_status,
       case i.module_code
         when 'PARTY' then 'Party subtypes: Supplier, Customer, Transporter, Agent, Contractor/Service Provider'
         when 'ITEM' then 'Material / SKU'
         when 'ITEMCATEGORY' then 'Material category'
         when 'ITEMTYPE' then 'Material group'
         when 'ITEMSPECIFICATION' then 'Material specification'
         when 'LOCATION' then 'Company location; branch is represented by LOCATION flags'
         when 'STORAGELOCATION' then 'Storage bin/location under LOCATION; no standalone warehouse master found'
         when 'COMPANYVEHICLE' then 'Fleet vehicle; inactive module and transaction linkage not established'
         when 'VENDOR' then 'Vendor onboarding registry; transactions use PARTY.PARTYCODE'
         else i.master_name
       end as main_business_entity
  from inventory i
  left join pk p on p.table_name = upper(i.table_name)
 order by case i.classification
            when 'PARTY' then 1 when 'ITEM' then 2 when 'LOCATION' then 3
            when 'LOGISTICS' then 4 when 'ORGANISATIONAL' then 5
            when 'REFERENCE' then 6 else 7 end,
          i.module_group, i.page_id nulls last, i.module_code;

spool off
exit
