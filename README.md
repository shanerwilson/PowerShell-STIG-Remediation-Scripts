# 🛡️ PowerShell STIG Remediation Scripts

[![PowerShell](https://img.shields.io/badge/Language-PowerShell-blue?logo=powershell)](https://docs.microsoft.com/en-us/powershell/)
[![Windows Security](https://img.shields.io/badge/Windows-Security-blue?logo=windows)](https://learn.microsoft.com/en-us/windows/security/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![STIG Compliance](https://img.shields.io/badge/STIG-Compliance-critical)](https://public.cyber.mil/stigs/)

**Automating Windows hardening and DISA STIG compliance through modular PowerShell scripts.**

---

## 📋 About This Project

Welcome to my collection of PowerShell scripts designed to automate **DISA STIG** (Security Technical Implementation Guide) compliance tasks for Windows environments.

Each script:
- Focuses on **one specific STIG requirement**.
- Is **idempotent** (safe to run multiple times).
- Includes a clear `.SYNOPSIS`, `.DESCRIPTION`, and `.NOTES` block.
- Is written with **simplicity**, **clarity**, and **modularity** in mind.

---

## 🔥 Project Purpose

The goal of this project is to:
- Provide **easy-to-use** scripts for cybersecurity students, blue teamers, system administrators, and security engineers.
- Help achieve **faster STIG compliance** for Windows systems.
- **Build and showcase** my experience in Windows security hardening using PowerShell automation.

---

## 🛠️ How to Use

> ⚡ **Important:** Always **run PowerShell as Administrator** to apply system-level changes.

### Steps:
1. **Clone the repository:**
   ```bash
   git clone https://github.com/shanerwilson/PowerShell-STIG-Scripts.git
   ```

2. **Navigate** to the script that matches the STIG ID you are working on.  
   Example:
   ```plaintext
   WN10-AU-000500_Set-ApplicationLogMaxSize.ps1
   ```

3. **Run the script:**
   ```powershell
   .\WN10-AU-000500_Set-ApplicationLogMaxSize.ps1
   ```

4. **Verify** the output to confirm the remediation was applied successfully.

---

## 📂 Script Structure

Each script:
- Is named after the **STIG ID** it addresses.
- **Targets only one control** for easier testing, validation, and maintenance.

---

## ❗ Disclaimer

These scripts are provided **"as-is"** without any warranty, expressed or implied.  
They are intended for **educational and lab purposes only**.

Please:
- **Test thoroughly** in a **controlled/lab environment** before deploying to production.
- **Use at your own risk**.

I am **not responsible** for any damage, system failures, data loss, or security issues caused by the use or misuse of these scripts.

---

## 📜 License

This project is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for full details.

---

## 👤 Author

**Shane Wilson**  
- [GitHub](https://github.com/shanerwilson)
- [LinkedIn](https://www.linkedin.com/in/your-linkedin/)
