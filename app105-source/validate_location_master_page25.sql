whenever sqlerror exit failure rollback
connect -name IMART

select item_name, label, display_sequence, lov_definition
  from apex_application_page_items
 where application_id = 105
   and page_id = 25
   and item_name in ('P25_CITYCODE', 'P25_STATECODE')
 order by display_sequence;

select dynamic_action_name, when_event_name, when_selection_type,
       when_element, static_id, number_of_actions
  from apex_application_page_da
 where application_id = 105
   and page_id = 25
   and static_id in ('set-state-from-city',
                     'toggle-location-master-document-assistant')
 order by static_id;

select button_name, button_template_id, button_template_options,
       icon_css_classes
  from apex_application_page_buttons
 where application_id = 105
   and page_id = 25
   and button_name = 'ADD_NEW_LOCATION';

exit
