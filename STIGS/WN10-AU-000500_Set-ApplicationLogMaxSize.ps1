<#
.SYNOPSIS
Ensures the Windows Application event log size is configured to at least 32,768 KB (32 MB), in compliance with DISA STIG WN10-AU-000500.

.DESCRIPTION
This script checks the 'MaxSize' registry setting under the Application log configuration path and sets it to 32,768 KB if it is not present or set too low.
This setting ensures sufficient log data is retained for auditing and forensic analysis purposes, aligning with Windows 10 STIG compliance requirements.

.STIG ID
WN10-AU-000500

.LINK
https://stigaview.com/products/win10/v3r1/WN10-AU-000500/

.NOTES
Author: Shane Wilson
Tested on: Windows 10 Pro (x64)
Run this script with administrative privileges.

#>

# Define the registry path and value details
$registryPath = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application'
$valueName = 'MaxSize'
$desiredValue = 32768  # 32,768 KB

# Check if the registry path exists; if not, create it
if (-not (Test-Path -Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

# Retrieve the current value of MaxSize, if it exists
$currentValue = Get-ItemProperty -Path $registryPath -Name $valueName -ErrorAction SilentlyContinue

# Set or update the MaxSize value as needed
if ($null -eq $currentValue) {
    # Property does not exist; create it with the desired value
    New-ItemProperty -Path $registryPath -Name $valueName -Value $desiredValue -PropertyType DWord -Force | Out-Null
    Write-Host "Registry value '$valueName' created with value '$desiredValue' at '$registryPath'."
} elseif ($currentValue.$valueName -lt $desiredValue) {
    # Property exists but is less than desired; update it
    Set-ItemProperty -Path $registryPath -Name $valueName -Value $desiredValue -Force
    Write-Host "Registry value '$valueName' updated to '$desiredValue' at '$registryPath'."
} else {
    Write-Host "Registry value '$valueName' already set to '$($currentValue.$valueName)' at '$registryPath'. No changes made."
}
