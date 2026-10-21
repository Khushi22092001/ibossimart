
package imart_register_kpis authid definer as
 procedure payload(p_page number);
 procedure apply_status(p_page number,p_mode varchar2,p_status varchar2);
 function selected_mode(p_page number) return varchar2;
 function selected_status(p_page number) return varchar2;
 function creation_test(p_page number,p_mode varchar2) return varchar2;
end;
