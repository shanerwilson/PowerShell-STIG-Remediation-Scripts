<#
.SYNOPSIS
Ensures Windows 10 compliance with STIG ID WN10-AU-000580 by enabling audit failures for MPSSVC Rule-Level Policy Changes.

.DESCRIPTION
- Verifies Administrator privileges.
- Forces advanced audit policy subcategory usage.
- Configures the audit policy.
- Verifies setting after applying.
- No interactive copy-paste issues.

.NOTES
Author: Shane Wilson
Tested on: Windows 10 Pro (x64)
Run As: Administrator
#>

# --- Check for Administrator Privileges ---
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "This script must be run as an Administrator. Exiting..."
    exit
}

# --- Enable 'Audit: Force audit policy subcategory settings' ---
$regPath = "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa"
$regName = "SCENoApplyLegacyAuditPolicy"

if ((Get-ItemProperty -Path $regPath -Name $regName -ErrorAction SilentlyContinue).$regName -ne 1) {
    Write-Host "🔧 Enabling 'Force audit policy subcategory settings'..."
    Set-ItemProperty -Path $regPath -Name $regName -Value 1
} else {
    Write-Host "✅ 'Force audit policy subcategory settings' already enabled."
}

# --- Configure Auditing for MPSSVC Rule-Level Policy Change Failures ---
try {
    auditpol /set /subcategory:"MPSSVC Rule-Level Policy Change" /failure:enable
    Write-Host "✅ WN10-AU-000580 remediation applied: MPSSVC Rule-Level Policy Change Failure auditing enabled."
}
catch {
    Write-Error "❌ Failed to configure audit policy. $_"
}

# --- Verification Step ---
Write-Host ""
Write-Host "🔍 Verifying audit policy setting..." -ForegroundColor Cyan

Start-Sleep -Seconds 2  # Small delay to ensure policy applies

$policyStatus = (auditpol /get /subcategory:"MPSSVC Rule-Level Policy Change" | Select-String "Failure")

if ($policyStatus -and $policyStatus.ToString().Contains("Enabled")) {
    Write-Host "✅ Verification Passed: Failure auditing for MPSSVC Rule-Level Policy Change is enabled." -ForegroundColor Green
} else {
    Write-Host "❌ Verification Failed: Failure auditing for MPSSVC Rule-Level Policy Change is NOT enabled." -ForegroundColor Red
}
