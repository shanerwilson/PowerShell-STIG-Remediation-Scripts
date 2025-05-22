<#
🔐 BitLocker TPM + Pre-Boot PIN Configuration Script

This PowerShell script enables **BitLocker drive encryption** on the Windows **C: drive** using **TPM + Pre-Boot PIN authentication**. It is designed to enhance system boot security and mitigate recent BitLocker bypass vulnerabilities.

📌 Reference: https://cybersecuritynews.com/bitlocker-encryption-bypassed/

---

## 💡 Features

- Verifies admin privileges and TPM status
- Enables Group Policy settings via registry to enforce:
  - TPM + PIN protection
  - Pre-Boot Authentication
- Prompts for and validates a secure PIN (4–20 digits)
- Applies TPM + PIN protector to the OS drive
- Encrypts the drive using XTS-AES256 (used space only)
- Backs up the recovery key to a local folder

---

## 🧰 Requirements

- Windows 10/11 (Pro, Enterprise, or Education)
- TPM 1.2 or 2.0 (enabled and ready)
- Run script as **Administrator**

---

## 🚀 Usage

1. Open **PowerShell as Administrator**
2. Run the script:
   .\Enable-BitLockerPreBootPIN.ps1
#>

# Script begins below

# Ensure the script is run with administrative privileges
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(
    [Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You do not have Administrator rights to run this script.`nPlease re-run this script as an Administrator."
    exit
}

# Check if TPM is present and ready
$tpm = Get-Tpm
if ($tpm.TpmPresent -ne $true -or $tpm.TpmReady -ne $true) {
    Write-Error "TPM is not present or not ready. Cannot proceed with BitLocker setup."
    exit
}

# Enable Group Policy settings for BitLocker PIN
$registryPath = "HKLM: \ Software \ Policies \ Microsoft \ Pve"
if (-not (Test-Path $registryPath)) {
    New-Item -Path $registryPath -Force | Out-Null
}

Set-ItemProperty -Path $registryPath -Name "UseAdvancedStartup" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "EnableBDEWithNoTPM" -Value 0 -Type DWord
Set-ItemProperty -Path $registryPath -Name "UseTPM" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "UseTPMPIN" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "UseTPMKey" -Value 0 -Type DWord
Set-ItemProperty -Path $registryPath -Name "UseTPMKeyPIN" -Value 0 -Type DWord
Set-ItemProperty -Path $registryPath -Name "EnablePIN" -Value 1 -Type DWord
Set-ItemProperty -Path $registryPath -Name "RequireStartupPIN" -Value 1 -Type DWord

# Prompt user for a secure PIN
$pin = Read-Host -AsSecureString "Enter a numeric PIN for BitLocker pre-boot authentication (4–20 digits)"

# Convert SecureString to plain text for validation (use cautiously)
$pinPlain = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto(
    [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pin)
)

# Validate PIN length and numeric content
if ($pinPlain.Length -lt 4 -or $pinPlain.Length -gt 20 -or ($pinPlain -match '\D')) {
    Write-Error "Invalid PIN. Ensure it's 4–20 digits and contains only numbers."
    exit
}

# Convert back to SecureString
$securePin = ConvertTo-SecureString -String $pinPlain -AsPlainText -Force

# Add TPM + PIN protector
Add-BitLockerKeyProtector -MountPoint "C:" -TPMAndPinProtector -Pin $securePin

# Enable BitLocker encryption
Enable-BitLocker -MountPoint "C:" -EncryptionMethod XtsAes256 -UsedSpaceOnly -TPMandPinProtector -Pin $securePin -SkipHardwareTest

# Backup recovery key
$recoveryKeyPath = "C:\BitLockerRecoveryKey"
if (-not (Test-Path $recoveryKeyPath)) {
    New-Item -ItemType Directory -Path $recoveryKeyPath -Force | Out-Null
}
Backup-BitLockerKeyProtector -MountPoint "C:" -RecoveryKeyPath $recoveryKeyPath

Write-Output "BitLocker has been enabled with pre-boot PIN. Recovery key saved to $recoveryKeyPath."
