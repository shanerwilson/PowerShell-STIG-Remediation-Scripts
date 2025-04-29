🛡️ PowerShell STIG Remediation Scripts


Automating Windows hardening and DISA STIG compliance with modular PowerShell scripts.

📋 About This Project
This repository contains PowerShell scripts designed to automate DISA STIG (Security Technical Implementation Guide) compliance tasks for Windows environments.

Each script:

Focuses on one specific STIG requirement.

Is idempotent (safe to run multiple times).

Includes a clear .SYNOPSIS, .DESCRIPTION, and .NOTES block.

Is built for simplicity, clarity, and modularity.

🔥 Project Purpose
The goal of this repository is to:

Provide easy-to-use scripts for cybersecurity students, blue teamers, system administrators, and security engineers.

Enable faster achievement of STIG compliance for Windows systems.

Build and demonstrate my expertise in system hardening using PowerShell automation.

🛠️ How to Use
⚡ Note: Always run PowerShell as Administrator to apply system-level changes.

Steps:
Clone this repository:

#git clone https://github.com/shanerwilson/PowerShell-STIG-Remediation-Scripts.git

Navigate to the script that corresponds to the STIG ID you are working on.
Example:

#WN10-AU-000500_Set-ApplicationLogMaxSize.ps1

Run the script in PowerShell:

#.\WN10-AU-000500_Set-ApplicationLogMaxSize.ps1

Review the output to confirm the remediation was applied successfully.

📂 Script Structure
Each script:

Is named after the STIG ID it remediates.

Targets a single control for clarity and modularity.

❗ Disclaimer
These scripts are provided "as-is" without any warranty, expressed or implied.
They are intended for educational and lab purposes only.

Always test thoroughly in a controlled/lab environment before deploying to production.
Use at your own risk.
I am not responsible for any damage, data loss, or security misconfigurations caused by the use or misuse of these scripts.

📜 License
This project is licensed under the MIT License.
See the LICENSE file for more details.

👤 Author
Shane Wilson
GitHub | LinkedIn
