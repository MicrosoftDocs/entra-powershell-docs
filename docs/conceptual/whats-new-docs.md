---
title: What is new in Microsoft Entra PowerShell
description: "Learn about the latest features of Microsoft Entra PowerShell."
ms.topic: overview
ms.date: 03/04/2025
author: msewaweru
manager: CelesteDG
ms.author: eunicewaweru
ms.reviewer: stevemutungi254

zone_pivot_groups: entra-powershell-whats-new
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json

keywords: Microsoft Entra powershell, entra-powershell, manage entra resources using powershell, entra powershell new features, what's new in entra powershell

#customer intent: As a PowerShell user, I want an overview of the latest features of Microsoft Entra PowerShell module and all the related doc updates.
---

# What's new in Microsoft Entra PowerShell

This article lists all new articles that were added or had significant updates in the last month. It also lists the new features in the Microsoft Entra PowerShell module to manage Microsoft Entra resources.

:::zone pivot="whats-new-in-docs"

## What's new in docs

### February 2025

#### Updated articles

- [Create a custom application](create-custom-application.md) - Module GA docs bug bash updates
- [Grant and revoke API permissions programmatically](how-to-grant-revoke-api-permissions.md) - Module GA docs bug bash updates
- [Install Microsoft Entra PowerShell](installation.md) - Article improvements based on usability improvements on the module
- [Manage apps](manage-apps.md) - Article improvements based on usability improvements on the module
- [Manage devices](manage-devices.md) - Article improvements based on usability improvements on the module
- [Manage groups](manage-groups.md) - Conceptual Articles improvements - based on usability improvements on the module
- [Manage roles](manage-roles.md) - Module GA docs bug bash updates
- [Manage stale devices](manage-stale-devices.md) - Module GA docs bug bash updates
- [Manage users](manage-user.md) - Article improvements based on usability improvements on the module
- [Microsoft Entra PowerShell best practices](entra-powershell-best-practices.md) - Module GA docs bug bash updates
- [Navigate the Microsoft Entra PowerShell module](navigate-entraps.md) - Module GA docs bug bash updates
- [Recover deleted data](recover-deleted-data.md) - Article improvements based on usability improvements on the module
- [Use app-only authentication](app-only-access-auth.md) - Module GA docs bug bash updates

### January 2025

#### New articles

- [Manage user and group assignments](manage-user-group-assignment.md) - Learn how to report and remove user and group assignments to service principals.

#### Updated articles

- [Find Azure AD PowerShell and MSOnline cmdlets in Microsoft Entra PowerShell](azuread-powershell-to-entra-powershell-mapping.md)
  - Updates to reflect module updates
  - Updated the MSOnline cmdlet map to capture all cmdlets
- [Install the Microsoft Entra PowerShell module](installation.md)
  - Installation article improvements
  - Minor additions to installation instructions
  - Updates to reflect module updates
- [Manage users with Microsoft Entra PowerShell](manage-user.md) - Edits to clean up content
- [Navigate the Microsoft Entra PowerShell module](navigate-entraps.md) - Updates to reflect module updates
- [Recover deleted data with Microsoft Entra PowerShell](recover-deleted-data.md) - Updates to reflect module updates

### December 2024

#### New articles

- [Navigate the Microsoft Entra PowerShell module](navigate-entraps.md) - Consolidated the steps to get started with the Microsoft Entra PowerShell module.

#### Updated articles

- [Recover deleted data with Microsoft Entra PowerShell](recover-deleted-data.md) - Updated the article with minor edits.
- [Troubleshoot the Microsoft Entra PowerShell module](troubleshooting.md) - Updated the troubleshooting article to use a consistent format.

:::zone-end

:::zone pivot="module-version-history"

## The latest (recommended) version

- [Version 1.0.2][posh-1.0.2] - **February 2025**

  - **New Commands**: [Resolve-EntraTenant](/powershell/module/microsoft.entra/resolve-entratenant) - to resolve a Tenant ID or Domain Name to a Microsoft Entra ID Tenant.
  - **Bug Fixes and command improvements**:
    - Fixed - [New-EntraApplicationFromApplicationTemplate](/powershell/module/microsoft.entra/new-entraapplicationfromapplicationtemplate). PR [#1346](https://github.com/microsoftgraph/entra-powershell/pull/1346).
    - Fixed - [Get-EntraBetaApplicationTemplate](/powershell/module/microsoft.entra.beta/get-entrabetaapplicationtemplate) and [Get-EntraApplicationTemplate](/powershell/module/microsoft.entra/get-entraapplicationtemplate). PR [#1344](https://github.com/microsoftgraph/entra-powershell/pull/1344)
    - Fixed [#1325](https://github.com/microsoftgraph/entra-powershell/issues/1325): `Get-EntraUser` example without command context.
    - Fixed [#1328](https://github.com/microsoftgraph/entra-powershell/issues/1328): Expand methods in [Reset-EntraStrongAuthenticationMethodByUpn](/powershell/module/microsoft.entra/reset-entrastrongauthenticationmethodbyupn).
    - Fixed [#1326](https://github.com/microsoftgraph/entra-powershell/pull/1335): Remove `Format-Table` in [Get-EntraBetaDirSyncFeature](/powershell/module/microsoft.entra.beta/get-entrabetadirsyncfeature)

  - **Documentation enhancements**:
    - Enhanced examples for over 140 cmdlets with user-friendly parameters, such as using `ManagerId` instead of `RefObjectId`.

