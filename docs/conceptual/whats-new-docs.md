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

:::zone-end

:::zone pivot="module-version-history"

## The latest (recommended) version

- [Version 1.0.2][posh-1.0.2] - **February 2025**

  - **New Commands**: [Resolve-EntraIdTenant](/powershell/module/microsoft.entra/resolve-entratenant) - to resolve a Tenant ID or Domain Name to a Microsoft Entra ID Tenant.
  - **Bug Fixes and command improvements**:
    - Fixed - [New-EntraApplicationFromApplicationTemplate](/powershell/module/microsoft.entra/new-entraapplicationfromapplicationtemplate). PR [#1346](https://github.com/microsoftgraph/entra-powershell/pull/1346).
    - Fixed - [Get-EntraBetaApplicationTemplate](/powershell/module/microsoft.entra.beta/get-entrabetaapplicationtemplate) and [Get-EntraApplicationTemplate](/powershell/module/microsoft.entra/get-entraapplicationtemplate). PR [#1344](https://github.com/microsoftgraph/entra-powershell/pull/1344)
    - Fixed [#1325](https://github.com/microsoftgraph/entra-powershell/issues/1325): `Get-EntraUser` example without command context.
    - Fixed [#1328](https://github.com/microsoftgraph/entra-powershell/issues/1328): Expand methods in [Reset-EntraStrongAuthenticationMethodByUpn](/powershell/module/microsoft.entra/reset-entrastrongauthenticationmethodbyupn).
    - Fixed [#1326](https://github.com/microsoftgraph/entra-powershell/pull/1335): Remove `Format-Table` in [Get-EntraBetaDirSyncFeature](/powershell/module/microsoft.entra.beta/get-entrabetadirsyncfeature)

  - **Documentation enhancements**:
    - Enhanced examples for over 140 cmdlets with user-friendly parameters, such as using `ManagerId` instead of `RefObjectId`.

## Module version history

- [Version 1.0.1][posh-1.0.1] - **January 2025**

  - **New Commands**: [Update-EntraOauth2PermissionGrant](/powershell/module/microsoft.entra/update-entraoauth2permissiongrant), [Get-EntraUserAuthenticationMethod](/powershell/module/microsoft.entra/get-entrauserauthenticationmethod), [Get-EntraBetaUserAuthenticationMethod](/powershell/module/microsoft.entra.beta/get-entrabetauserauthenticationmethod), [Update-EntraBetaUserAuthenticationRequirement](/powershell/module/microsoft.entra.beta/update-entrabetauserauthenticationrequirement), and [Get-EntraBetaUserAuthenticationRequirement](/powershell/module/microsoft.entra.beta/get-entrabetauserauthenticationrequirement).
  - **Bug Fixes and command improvements**:
    - RequiredResourceAccess can't be an array. [#1229](https://github.com/microsoftgraph/entra-powershell/pull/1229).
    - [Get-EntraContext](/powershell/module/microsoft.entra/get-entracontext) - include Microsoft Entra PowerShell version in the response.

  - **Documentation enhancements**:
    - Improved examples for over 250 cmdlets, adding more examples and Microsoft Entra ID inbuilt roles.
    - Adding syntax sections for Global Secure Access commands.
    - Fixed example for [New-EntraBetaPrivateAccessApplicationSegment](/powershell/module/microsoft.entra.beta/new-entrabetaprivateaccessapplication).

- [Version 0.22.0][posh-0.22.0] - **January 2025**

  - **New capability**: Install submodules automatically when installing the umbrella module (Microsoft.Entra).
  - **New Commands**: `Get-EntraDeletedAdministrativeUnit`, `Get-EntraDeletedDevice`, `Get-EntraUserAuthenticationMethod`, `Get-EntraUserInactiveSignIn`, `Get-EntraDeletedUser`, `Update-EntraOauth2PermissionGrant`, `Get-EntraUserAdministrativeUnit`, `Get-EntraUserRole`, `Get-EntraUserGroup`, and `Get-EntraDeletedServicePrincipal`.
  - **Bug Fixes**:
    - Fixed [#1178](https://github.com/microsoftgraph/entra-powershell/issues/1178): Add a command to update an existing OAuth2PermissionGrant.
    - Fixed [#1147](https://github.com/microsoftgraph/entra-powershell/issues/1147): Add `-Limit` as an alias for `-Top` and `-Select` as an alias for `-Property`.
    - Fixed [#929](https://github.com/microsoftgraph/entra-powershell/issues/929): Refactored Connect-Entra to act as a proxy command for `Connect-MgGraph`.
  - **Enhancements**:
    - Improved examples for over 100 cmdlets.

- [Version 0.21.0-preview][posh-0.21.0] - **January 2025**

  - **Bug fixes**: Fixed bugs caused by splitting the Entra PowerShell module into modular submodules (failing tests, pipeline updates).  
  - **Dependency version update**: Upgraded Microsoft Graph PowerShell SDK from `2.15.0` to `2.25.0`.

- [Version 0.20.0-preview][posh-0.20.0] - **December 2024**

  - **Engineering build**: Split the module into submodules.
  - **Module rename**: Renamed the module from `Microsoft.Graph.Entra` to `Microsoft.Entra`.

- [Version 0.19.0-preview][posh-0.19.0] - **November 2024**

  - **New Global Secure Access Commands**: Added four cmdlets: `Enable-EntraBetaGlobalSecureAccessTenant`, `New-EntraBetaPrivateAccessApplication`, `Get-EntraBetaPrivateAccessApplication`, and `Get-EntraBetaGlobalSecureAccessTenantStatus`.
  - **Bug Fixes**:
    - Fixed [#1164](https://github.com/microsoftgraph/entra-powershell/issues/1164): Resolved missing types in certain Beta commands.
    - Fixed [#1163](https://github.com/microsoftgraph/entra-powershell/issues/1163): Removed duplicate examples.
  - **Enhancements**:
    - Improved examples for over 130 cmdlets.
    - Added directory sync features and configurations examples.
  - **Security**:
    - Implemented security hardening measures in the release pipeline.

:::zone-end

[assign-app-roles]: create-assign-app-roles.md
[cmdlet-map]: azuread-powershell-to-entra-powershell-mapping.md
[posh-1.0.2]: https://www.powershellgallery.com/packages/Microsoft.Entra/1.0.2
[posh-1.0.1]: https://www.powershellgallery.com/packages/Microsoft.Entra/1.0.1
[posh-0.22.0]: https://www.powershellgallery.com/packages/Microsoft.Entra/0.22.0
[posh-0.21.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.21.0-preview
[posh-0.20.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.20.0-preview
[posh-0.19.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.19.0-preview
