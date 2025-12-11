---
title: What is new in Microsoft Entra PowerShell
description: "Learn about the latest features of Microsoft Entra PowerShell."
ms.topic: overview
ms.date: 12/11/2025
author: msewaweru
manager: mwongerapk
ms.author: eunicewaweru
ms.reviewer: KenitoInc, givinalis

zone_pivot_groups: entra-powershell-whats-new
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json

keywords: Microsoft Entra powershell, entra-powershell, manage entra resources using powershell, entra powershell new features, what's new in entra powershell

#customer intent: As a PowerShell user, I want an overview of the latest features of Microsoft Entra PowerShell module and all the related doc updates.
---

# What's new in Microsoft Entra PowerShell

This article lists all new articles that were added or had significant updates in the last month. It also lists the new features in the Microsoft Entra PowerShell module to manage Microsoft Entra resources.

:::zone pivot="whats-new-in-docs"

## What's new in docs

### November 2025

#### New articles

- [Install Microsoft Entra PowerShell offline](offline-installation.md) - Learn how to install the Microsoft Entra PowerShell module in offline environments using nupkg files and a local repository.
- [Manage administrative units](manage-administrative-units.md) - Learn how to manage administrative units for granular delegation of permissions in Microsoft Entra ID.
- [Manage Microsoft MCP Server for Enterprise permissions](how-to-manage-mcp-server-permissions.md) - Learn how to grant and revoke delegated permissions for MCP clients to access enterprise resources through Microsoft MCP Server.


### June 2025

#### New articles

- [Generate a password expiration report using Microsoft Entra PowerShell](report-users-expired-password.md) - Learn how to generate and export a report of users with expired or soon-to-expire passwords.
- [Manage per-user MFA settings in Microsoft Entra ID](how-to-manage-per-user-mfa.md) - Learn how to configure and manage multi-factor authentication settings for individual users.
- [View and export apps with expiring secrets and certificates](report-apps-with-expiring-secrets-certificates.md) - Learn how to identify and export a list of applications with secrets or certificates that are about to expire.
- [View and export delegated permissions for users and service principals](report-delegated-permissions-by-users-service-principals.md) - Learn how to identify and export delegated permissions assigned to users and service principals.

#### Updated articles

- [Manage guest accounts using Microsoft Entra PowerShell](manage-guest-users.md) - Add examples for managing guest sponsors

### April 2025

#### New articles

- [Offboard users](offboard-user.md) - Learn to offboard users by invalidating sessions, resetting passwords, and removing device ownership.

#### Updated articles

- [Manage guest users](manage-guest-users.md) - Refined code snippets to improve readability and ensure alignment with best practices.
- [Manage users](manage-user.md) - Refined code snippets to improve readability and ensure alignment with best practices.
- [Manage user licenses using Microsoft Entra PowerShell](how-to-manage-user-licenses.md) - Improved metadata and keywords for better search engine visibility.


:::zone-end

:::zone pivot="module-version-history"

## Latest (recommended) version

- [Version 1.0.13][posh-1.0.13] - **November 2025**

  - **New Commands**:
    - [Grant-EntraBetaMcpServerPermission](/powershell/module/microsoft.entra.beta.applications/grant-entrabetamcpserverpermission): Grants delegated permissions to Model Context Protocol (MCP) clients for accessing the Microsoft MCP Server for Enterprise.
    - [Revoke-EntraBetaMcpServerPermission](/powershell/module/microsoft.entra.beta.applications/revoke-entrabetamcpserverpermission): Revokes delegated permissions from a specified client for Microsoft MCP Server for Enterprise in Microsoft Entra ID.

  - **New Parameters**:
    - [Get-EntraContact](/powershell/module/Microsoft.Entra.DirectoryManagement/Get-EntraContact) & [Get-EntraBetaContact](/powershell/module/Microsoft.Entra.Beta.DirectoryManagement/Get-EntraBetaContact):
      - Added `-HasErrorsOnly` parameter to return only contacts with service provisioning errors.
    - [Get-EntraGroup](/powershell/module/Microsoft.Entra.Groups/Get-EntraGroup) & [Get-EntraBetaGroup](/powershell/module/Microsoft.Entra.Beta.Groups/Get-EntraBetaGroup):
      - Added `-HasErrorsOnly` parameter to return only groups that have service provisioning errors.
      - Added `-HasLicenseErrorsOnly` parameter to return only groups that have members with license errors.
    - [Get-EntraUser](/powershell/module/Microsoft.Entra.Users/Get-EntraUser) & [Get-EntraBetaUser](/powershell/module/Microsoft.Entra.Beta.Users/Get-EntraBetaUser):
      - Added `-EnabledFilter` parameter which filters users based on the state of their accounts. Valid values are `EnabledOnly` and `DisabledOnly`.
      - Added `-HasErrorsOnly` parameter which returns only users that have one or more service provisioning or validation errors (surfaced via the `serviceProvisioningErrors` collection).
      - Added `-LicenseReconciliationNeededOnly` parameter which returns only users whose service provisioning errors include license-related issues indicating that license reconciliation is needed (for example, insufficient licenses, dependency violations, mutually exclusive plans).
      - Added `-Synchronized` parameter which returns only users synchronized from on-premises Active Directory (those with `onPremisesSyncEnabled eq true`). This is useful for distinguishing cloud-only identities from hybrid managed identities.
      - Added `-UnlicensedUsersOnly` parameter which returns only users who have no assigned licenses.

  - **Bug Fixes**:
    - Fixed [Get-EntraUser](/powershell/module/Microsoft.Entra.Users/Get-EntraUser) issue where handling of guest UPNs was corrected to properly escape/quote special characters so that `user@external#EXT#@tenant.onmicrosoft.com` no longer triggers "unterminated string literal" errors.
    - [Set-EntraUserManager](/powershell/module/Microsoft.Entra.Users/Set-EntraUserManager) `-ManagerId` parameter type corrected from `Guid` to `String`, enabling UPN (and not just objectId) for the manager reference.

