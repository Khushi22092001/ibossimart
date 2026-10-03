$ErrorActionPreference = 'Stop'
$inventory = Import-Csv "$PSScriptRoot/master_form_inventory.csv"
$metadata = Import-Csv "$PSScriptRoot/report_catalog_metadata.csv"
$lines = [System.Collections.Generic.List[string]]::new()
$lines.Add('begin')
function SqlValue($value) { if ([string]::IsNullOrEmpty($value)) { return 'null' }; return "'" + $value.Replace("'", "''") + "'" }
foreach ($entry in $inventory) {
    $cols = @($metadata | Where-Object { $_.MODULECODE -eq $entry.MODULE_CODE -and $_.MASTERTABLENAME -eq $entry.TABLE_NAME })
    if (!$cols.Count -or !$entry.PAGE_ID -or $entry.NAVIGATION_STATUS -notlike 'ACTIVE*') { continue }
    $names = @($cols.COLUMN_NAME)
    $label = $entry.TABLE_NAME + 'NAME'
    if ($label -notin $names) { $label = $cols[0].LABELCOLUMNNAME }
    if ($label -notin $names) { $label = @($cols | Where-Object { $_.COLUMN_NAME -match 'NAME$' -and $_.DATA_TYPE -eq 'VARCHAR2' } | Select-Object -First 1).COLUMN_NAME }
    if (!$label -or $label -notin $names) { $label = if ('TNO' -in $names) { 'TNO' } else { $names[0] } }
    $code = $entry.TABLE_NAME + 'CODE'
    if ($code -notin $names) { $code = if ('TNO' -in $names) { 'TNO' } else { $label } }
    $key = if ('TNO' -in $names) { 'TNO' } else { $code }
    $changed = @('DATEMODIFY','CREATIONTIME','DATECREATED','DATECRATED') | Where-Object { $_ -in $names } | Select-Object -First 1
    $status = @('PARTYSTATUS','ISACTIVE','DOCUMENTSTATUS','EMPLOYEESTATUS') | Where-Object { $_ -in $names } | Select-Object -First 1
    $context = @($entry.APEX_CONTEXT_ITEM.Split(','))[0]
    # Compound/custom form contexts use the authorized register link.
    $form = if ($entry.APEX_CONTEXT_ITEM -like '*,*' -or $entry.PAGE_ID -eq '13') { $cols[0].PAGENO } else { $entry.PAGE_ID }
    if ($entry.APEX_CONTEXT_ITEM -like '*,*' -or $entry.PAGE_ID -eq '13') { $context = '' }
    $contextColumn = $context -replace '^P[0-9]+_', ''
    if ($contextColumn -in $names) { $key = $contextColumn }
    $args = @((SqlValue $entry.MODULE_CODE),(SqlValue $entry.MASTER_NAME),(SqlValue $entry.MODULE_GROUP),(SqlValue $entry.TABLE_NAME),(SqlValue $code),(SqlValue $label),(SqlValue $key),(SqlValue ([string]$changed)),(SqlValue ([string]$status)),(SqlValue ([string]$context)))
    $lines.Add('insert into imart_mr_catalog(module_code,master_name,master_group,table_name,code_column,name_column,key_column,changed_column,status_column,context_item,form_page,register_page) values (' + ($args -join ',') + ',' + $form + ',' + $cols[0].PAGENO + ');')
}
$lines.Add('end;')
$lines.Add('/')
[System.IO.File]::WriteAllLines("$PSScriptRoot/reports_catalog_seed.sql", $lines)
Write-Output "Generated $($lines.Count - 3) master catalogue entries."
