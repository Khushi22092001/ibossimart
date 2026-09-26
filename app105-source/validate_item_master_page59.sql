whenever sqlerror exit failure rollback
connect -name IMART

select page_id,
       page_name,
       case when instr(javascript_code, 'P59_ITEMCLASSIFICATIONCODE') > 0
            then 'INSTALLED'
            else 'MISSING'
       end assistant_fix,
       case when instr(javascript_code, 'syncCollapsedLayout') > 0
            then 'INSTALLED'
            else 'MISSING'
       end collapse_reflow_fix,
       case when instr(inline_css, 't-Tabs-item:only-child') > 0
            then 'INSTALLED'
            else 'MISSING'
       end single_tab_fix
  from apex_application_pages
 where application_id = 105
   and page_id = 59;

select count(*) required_item_count
  from apex_application_page_items
 where application_id = 105
   and page_id = 59
   and item_name in (
       'P59_ITEMCLASSIFICATIONCODE',
       'P59_ITEMNAME',
       'P59_ITEMNATURECODE',
       'P59_ITEMTYPE',
       'P59_MEASURINGUNITCODE1'
   )
   and is_required = 'Yes';

exit
