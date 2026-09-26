connect -name IMART

prompt -- Reattach only the existing GRN Detail region to Page 146's tabs container.
update apex_260100.wwv_flow_page_plugs
   set parent_plug_id = 633982718272365468
 where flow_id = 105
   and id = 791584114826107354
   and parent_plug_id is null;

commit;

select region_id,
       parent_region_id,
       display_sequence,
       region_name,
       static_id
  from apex_application_page_regions
 where application_id = 105
   and page_id = 146
   and region_name = 'GrnDetail';

exit
