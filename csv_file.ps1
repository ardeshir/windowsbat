$date = (Get-Date -format "yyyyMMddmmss")
$compname = $env:COMPUTERNAME
$logname = $compname + "_" + $date + "_ScanResults.csv"
$scanresults = "c:\temp\logs\" + $logname
new-item -path $scanresults -ItemType File -Force

# Add Content Headers to the CSV File
$csvheader = "ServerName, Classification, Other Data"
Add-Content -path $scanresults -Value $csvheader    