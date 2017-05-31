function log { param($string, $scnlg, $evntlg)
    # If Y is populated in the second position, add to log file.
    if ($scnlg -like "Y") { 
        Add-content -path $scanlog -Value $string
    }
    # If Y is populated in the third position, Log Item to Event Log As      well
    if ($evntlg -like "Y") {
        write-eventlog -logname Application -source "WindowsServerScanningScript" -eventID 1000 -entrytype Information -message "$string"
    }
    # If there are no parameters specified, write to the data collection file (CSV)
    if (!$scnlg) {
       $content = "$env:COMPUTERNAME,$string"
       Add-Content -path $scanresults -Value $content
    }
    # Verbose Logging
    write-host $string
}

$date = Get-Date
log "Starting WindowsServerScanningScript at $date ..." "Y" "Y"
log "Writing a message to the Event Log Only." "N" "Y"
log "ScriptStart,$date"