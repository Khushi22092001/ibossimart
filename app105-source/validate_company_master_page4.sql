whenever sqlerror exit failure rollback
connect -name IMART

select item_name, label, display_as, region, display_sequence
  from apex_application_page_items
 where application_id = 105
   and page_id = 4
   and item_name = 'P4_COPYTOWORKADDRESS';

select dynamic_action_name, when_event_name, when_selection_type,
       when_element, static_id, number_of_actions
  from apex_application_page_da
 where application_id = 105
   and page_id = 4
   and static_id in ('copy-office-address-to-work-address',
                     'toggle-company-master-document-assistant');

exit
