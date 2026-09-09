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

## Create an isolated virtual network in KVM for the lab, separate from the host network

![Virtual network setup](screenshots/01-network/adlab-network.png)

*Note: DHCPv4 is enabled here initially for basic connectivity, then later disabled in favor of a dedicated DHCP Server role on the domain controller (see below)*

## Deploy a Windows Server 2022 VM and a Windows 11 client VM, both attached to the isolated network.

![NIC configuration](screenshots/01-network/nic-setup.png)
![NIC configuration](screenshots/01-network/ipconfig.png)
## Install the Active Directory Domain Services role and promote the server to a new forest, `labcorp.com`

![AD DS role installation](screenshots/02-dc-setup/add-roles.png)
![Deployment configuration](screenshots/02-dc-setup/new-forest.png)
![Deployment configuration](screenshots/02-dc-setup/static-ip.png)

## Install the DHCP Server role and configure a scope with router, DNS, and domain name options, replacing the hypervisor's default DHCP

![DHCP scope configuration](screenshots/08-dhcp/dhcp-role.png)
![DHCP scope configuration](screenshots/08-dhcp/new-scope-config.png)
![Scope options](screenshots/08-dhcp/scope-options.png)

*Correction: Start IP address is 10.10.10.20*

## Design a tiered OU structure in ADUC, separating privileged Tier 0 accounts from regular users, organized by department

![OU structure in ADUC](screenshots/03-ou-structure/ou-structure.png)

## Join the domain from the Windows 11 client, check if DHCP is working properly

![OU structure in ADUC](screenshots/03-ou-structure/whoami.png)
![Deployment configuration](screenshots/08-dhcp/client-lease.png)

## Configure a domain-wide password policy on the Default Domain Policy, enforcing minimum length of 3 characters and no complexity (tests only)

![Password policy settings](screenshots/04-gpo-password/password-policy.png)
![Password policy settings](screenshots/04-gpo-password/reset-password.webp)
![Password policy settings](screenshots/04-gpo-password/change-password.webp)

## Create a GPO restricting Control Panel access for standard users, linked to the Users OU

![Control Panel restriction GPO](screenshots/05-gpo-controlpanel/apply-restriction.png)

## Configure a GPO to automatically map a shared network drive for domain users at logon

![Drive map configuration](screenshots/06-gpo-drivemap/drive-map-config.png)
![Mapped drive on client](screenshots/06-gpo-drivemap/mapped-drive-result.png)

## Write a PowerShell script to bulk-create AD users from a CSV file, generating usernames and temporary passwords automatically

![Script execution](screenshots/07-scripts/import-users-run.png)

## Write a PowerShell script that generates an HTML report of inactive accounts, non-expiring passwords, and Domain Admins membership

![Audit report](screenshots/07-scripts/report-html.png)

## Write a PowerShell script to reset a user's password and unlock their account

![Script execution](screenshots/07-scripts/reset-password.png)
