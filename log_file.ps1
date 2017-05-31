$date = (Get-Date -format "yyyyMMddmmss")
$compname = $env:COMPUTERNAME
$logname = $compname + "_" + $date + "_ServerScanScript.log"
$scanlog = "c:\temp\logs\" + $logname 
new-item -path $scanlog -ItemType File -Force