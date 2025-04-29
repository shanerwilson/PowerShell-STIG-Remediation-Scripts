Welcome to my collection of PowerShell scripts designed to automate DISA STIG (Security Technical Implementation Guide) compliance tasks for Windows environments.

These scripts are intended to help speed up the remediation process and standardize security hardening based on STIG guidelines.

Each script:

Focuses on one specific STIG requirement.

Is written to be idempotent (safe to run multiple times).

Contains a clear .SYNOPSIS, .DESCRIPTION, and .NOTES block.

Is written with simplicity, clarity, and modularity in mind.

🔥 Project Purpose
The goal of this repository is to:

Provide easy-to-use scripts for cybersecurity students, blue teamers, system administrators, and security engineers.

Enable faster achievement of STIG compliance for Windows systems.

Build and share my experience in hardening systems using PowerShell automation.

🛠️ Usage
Note: Always run PowerShell as Administrator to apply system-level changes.

Steps:
Clone this repository:

#git clone https://github.com/shanerwilson/PowerShell-STIG-Scripts.git

Navigate to the script that corresponds to the STIG ID you are working on.

#WN10-AU-000500_Set-ApplicationLogMaxSize.ps1

Run the script in PowerShell:

#.\WN10-AU-000500_Set-ApplicationLogMaxSize.ps1

Review the output to confirm remediation was applied successfully.

Each script:

Is named after the STIG ID it remediates.

Targets a single control for clarity and modularity.

❗ Disclaimer
Disclaimer:
These scripts are provided "as-is" without any warranty, expressed or implied.
They are intended for educational and lab purposes only.
Always test thoroughly in a controlled/lab environment before using them in any production or live system.
Use at your own risk.
I am not responsible for any damage, data loss, or security misconfigurations caused by the use or misuse of these scripts.

📜 License
This project is licensed under the MIT License.

👤 Author
Shane Wilson

