whenever sqlerror exit failure rollback
connect -name IMART

select page_id,
       process_name,
       when_button_pressed
  from apex_application_page_proc
 where application_id = 105
   and page_id = 37
   and process_name = 'Close Dialog';

exit
