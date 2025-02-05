---
title: What is new in Microsoft Entra PowerShell
description: "Learn about the latest features of Microsoft Entra PowerShell."
ms.topic: overview
ms.date: 02/05/2025
author: msewaweru
manager: CelesteDG
ms.author: eunicewaweru
ms.reviewer: stevemutungi254

zone_pivot_groups: entra-powershell-whats-new
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json

keywords: Microsoft Entra powershell, entra-powershell, manage entra resources using powershell, entra powershell new features, what's new in entra powershell

#customer intent: As a PowerShell user, I want an overview of the latest features of Microsoft Entra PowerShell module and all the related doc updates.
---

# What's new in the Microsoft Entra PowerShell module

This article lists all new articles that were added or had significant updates in the last month. It also lists the new features in the Microsoft Entra PowerShell module to manage Microsoft Entra resources.

:::zone pivot="whats-new-in-docs"

## What's new in docs

### January 2025

**New articles**

- [Manage user and group assignments](manage-user-group-assignment.md) - Learn how to report and remove user and group assignments to service principals.

**Updated articles**

- [Find Azure AD PowerShell and MSOnline cmdlets in Microsoft Entra PowerShell](azuread-powershell-to-entra-powershell-mapping.md)
  - Updates to reflect v0.22.0 module updates
  - Updated the MSOnline cmdlet map to capture all cmdlets
- [Install the Microsoft Entra PowerShell module](installation.md)
  - Installation article improvements
  - Minor additions to installation instructions
  - Updates to reflect v0.22.0 module updates
- [Manage users with Microsoft Entra PowerShell](manage-user.md) - Edits to clean up content
- [Navigate the Microsoft Entra PowerShell module](navigate-entraps.md) - Updates to reflect v0.22.0 module updates
- [Recover deleted data with Microsoft Entra PowerShell](recover-deleted-data.md) - Updates to reflect v0.22.0 module updates

### December 2024

**New articles**

- [Navigate the Microsoft Entra PowerShell module](navigate-entraps.md) - Consolidated the steps to get started with the Microsoft Entra PowerShell module.

**Updated articles**

- [Recover deleted data with Microsoft Entra PowerShell](recover-deleted-data.md) - Updated the article with minor edits.
- [Troubleshoot the Microsoft Entra PowerShell module](troubleshooting.md) - Updated the troubleshooting article to use a consistent format.

### November 2024

**New articles**

- [Grant and revoke API permissions](how-to-grant-revoke-api-permissions.md): Learn how to grant and revoke API permissions for an application.
- [Manage guest users with Microsoft Entra PowerShell](manage-guest-users.md): Learn how to manage guest users in your organization.
- [Recover deleted data with Microsoft Entra PowerShell](recover-deleted-data.md): Learn how to recover deleted data using Microsoft Entra PowerShell.

**Updated articles**

- [Find Azure AD PowerShell and MSOnline cmdlets in Microsoft Entra PowerShell](azuread-powershell-to-entra-powershell-mapping.md): Added equivalents for the app proxy cmdlets. 
- [Install the Microsoft Entra PowerShell module](installation.md): Updated the article in response to customer feedback.

### October 2024

**New articles**

- [Manage devices](manage-devices.md): How to manage device identities and monitoring related events.
- [Manage stale devices](manage-stale-devices.md): Best practices for efficient device management and compliance.
- [Manage roles](manage-roles.md): How to assign roles to users.
- [Manage user licenses](how-to-manage-user-licenses.md): How to manage Microsoft Entra user licenses.

**Updated Articles**

- [Assign app roles to a service principal](create-assign-app-roles.md): Enhanced parameter usability, replacing `ObjectId` with `UserId`.
- [Create a custom application](create-custom-application.md): Added a PowerShell script for custom app creation.
- [Manage apps](manage-apps.md): 
  - Updated usability parameter switches.
  - Added a section on listing applications that don’t require user assignment.
- [Manage groups](manage-groups.md): Updated usability parameter switches.
- [Manage users with Microsoft Entra PowerShell](manage-user.md): Updated usability parameter switches.
- [Microsoft Entra PowerShell best practices](entra-powershell-best-practices.md): Updated usability parameter switches.
- [Migrate to Microsoft Entra PowerShell](migration-guide.md): Updated usability parameter switches.

:::zone-end

:::zone pivot="module-version-history"

## The latest (recommended) version

- [Version 1.0.1][posh-1.0.1] - **January 2025**

  - **New Commands**: [Update-EntraOauth2PermissionGrant](/powershell/module/microsoft.entra/update-entraoauth2permissiongrant), [Get-EntraUserAuthenticationMethod](/powershell/module/microsoft.entra/get-entrauserauthenticationmethod), [Get-EntraBetaUserAuthenticationMethod](/powershell/module/microsoft.entra.beta/get-entrabetauserauthenticationmethod), [Update-EntraBetaUserAuthenticationRequirement](/powershell/module/microsoft.entra.beta/update-entrabetauserauthenticationrequirement), and [Get-EntraBetaUserAuthenticationRequirement](/powershell/module/microsoft.entra.beta/get-entrabetauserauthenticationrequirement).
  - **Bug Fixes and command improvements**:
    - RequiredResourceAccess can't be an array. [#1229](https://github.com/microsoftgraph/entra-powershell/pull/1229).
    - [Get-EntraContext](/powershell/module/microsoft.entra/get-entracontext) - include Microsoft Entra PowerShell version in the response.

  - **Documentation enhancements**:
    - Improved examples for over 250 cmdlets, adding more examples and Microsoft Entra ID inbuilt roles.
    - Adding syntax sections for Global Secure Access commands.
    - Fixed example for [New-EntraBetaPrivateAccessApplicationSegment](/powershell/module/microsoft.entra.beta/new-entrabetaprivateaccessapplication).

