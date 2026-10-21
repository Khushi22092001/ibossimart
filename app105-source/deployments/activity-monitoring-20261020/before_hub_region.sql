
Error starting at line : 10 File @ D:\GIT Projects\ibossimart\app105-source\deployments\activity-monitoring-20261020\inspect_hub_export.sql
In command -
SELECT CONTENTS FROM TABLE(APEX_EXPORT.GET_APPLICATION(p_application_id=>105,p_components=>APEX_T_VARCHAR2('REGION:720000000000000007')))
Error at Command Line : 10 Column : 28 File @ D:\GIT Projects\ibossimart\app105-source\deployments\activity-monitoring-20261020\inspect_hub_export.sql
Error report -
SQL Error: ORA-20001: Unsupported component type: REGION
ORA-06512: at "APEX_260100.WWV_FLOW_GEN_API2", line 15055
ORA-06512: at "APEX_260100.WWV_FLOW_GEN_API2", line 14982
ORA-06512: at "APEX_260100.WWV_FLOW_EXPORT_INT", line 2854
ORA-06512: at "APEX_260100.WWV_FLOW_EXPORT_API", line 110
ORA-06512: at line 1
Help: https://docs.oracle.com/error-help/db/ora-20001/
Rollback
