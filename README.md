# Active Directory Lab & Automation
I started doing this lab to gain hands-on experience with deploying and managing a corporate-like domain controller with a tiered OU structure, GPO policies, and PowerShell automation scripts simulating real helpdesk workflows (user provisioning, security auditing, password resets).

## Key Objectives

- Deploy and configure a Windows Server domain controller from scratch
- Design a tiered OU structure separating privileged (Tier 0) accounts from standard users
- Implement Group Policies for password enforcement, access restrictions, and network resource management
- Automate common helpdesk tasks with PowerShell: bulk user provisioning, security auditing, and password reset/unlock workflows

## Environment
- KVM - virtualization platform
- Windows Server 2025 - Domain Controller - [iso](https://info.microsoft.com/ww-landing-windows-server-2022.html)
- Windows 11 - Domain-joined client - [iso](https://www.microsoft.com/en-us/evalcenter/download-windows-11-enterprise)
- Group Policy Management Console (GPMC) – Policy configuration
- PowerShell / Command Prompt – Administration and scripting
- Active Directory Users and Computers (ADUC) – User and group management

## Virtual machines setup

![Vm setup](screenshots/01-vmsetup.png)

