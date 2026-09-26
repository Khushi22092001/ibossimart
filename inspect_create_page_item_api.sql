set pages 300
set lines 240
set long 50000
select text
  from all_source
 where owner = 'APEX_260100'
   and name = 'WWV_FLOW_IMP_PAGE'
   and type = 'PACKAGE'
   and line between
       (select min(line)
          from all_source
         where owner = 'APEX_260100'
           and name = 'WWV_FLOW_IMP_PAGE'
           and type = 'PACKAGE'
           and upper(text) like '%PROCEDURE CREATE_PAGE_ITEM%')
       and
       (select min(line) + 120
          from all_source
         where owner = 'APEX_260100'
           and name = 'WWV_FLOW_IMP_PAGE'
           and type = 'PACKAGE'
           and upper(text) like '%PROCEDURE CREATE_PAGE_ITEM%')
 order by line;
exit
