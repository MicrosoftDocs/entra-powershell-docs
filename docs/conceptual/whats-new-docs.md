---
title: What is new in Microsoft Entra PowerShell
description: "Learn about the latest features of Microsoft Entra PowerShell."
ms.topic: overview
ms.date: 07/16/2025
author: msewaweru
manager: mwongerapk
ms.author: eunicewaweru
ms.reviewer: stevemutungi

zone_pivot_groups: entra-powershell-whats-new
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json

keywords: Microsoft Entra powershell, entra-powershell, manage entra resources using powershell, entra powershell new features, what's new in entra powershell

#customer intent: As a PowerShell user, I want an overview of the latest features of Microsoft Entra PowerShell module and all the related doc updates.
---

# What's new in Microsoft Entra PowerShell

This article lists all new articles that were added or had significant updates in the last month. It also lists the new features in the Microsoft Entra PowerShell module to manage Microsoft Entra resources.

:::zone pivot="whats-new-in-docs"

## What's new in docs

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

### February 2025

#### Updated articles

Improvements based on module usability and docs bug bash feedback:

- [Create a custom application](create-custom-application.md)
- [Grant and revoke API permissions programmatically](how-to-grant-revoke-api-permissions.md)
- [Install Microsoft Entra PowerShell](installation.md)
- [Manage apps](manage-apps.md)
- [Manage devices](manage-devices.md)
- [Manage groups](manage-groups.md)
- [Manage roles](manage-roles.md)
- [Manage stale devices](manage-stale-devices.md)
- [Manage users](manage-user.md)
- [Microsoft Entra PowerShell best practices](entra-powershell-best-practices.md)
- [Navigate the Microsoft Entra PowerShell module](navigate-entraps.md)
- [Recover deleted data](recover-deleted-data.md)
- [Use app-only authentication](app-only-access-auth.md)

:::zone-end

:::zone pivot="module-version-history"

## The latest (recommended) version

- [Version 1.0.9][posh-1.0.9] - **June 2025**

  - **New Commands**:
    - [Get-EntraInactiveSigninUser](/powershell/module/microsoft.entra/get-entrainactivesigninuser) to retrieve users without an interactive sign-in since a specified number of days ago.
  
  - **Bug Fixes and command improvements**:
    - Fixed Visibility parameter validation in `Set-EntraGroup`. PR [#1488](https://github.com/microsoftgraph/entra-powershell/pull/1488).
    - Fixed `NewEntraApplicationKeyCredential`.PR [#1491](https://github.com/microsoftgraph/entra-powershell/pull/1491).
    - Fixed metadata to support new PlatyPS build pipeline. PR [#1493](https://github.com/microsoftgraph/entra-powershell/pull/1493).
    - Fixed `New-EntraBetaPrivateAccessApplication` cmdletbinding. PR [#1495](https://github.com/microsoftgraph/entra-powershell/pull/1495).
    - Added `ResetRedemption` parameter. PR [#1485](https://github.com/microsoftgraph/entra-powershell/pull/1485).
    - Added `NewUserPrincipalName` parameter to `Restore-EntraDeletedDirectoryObject`. PR [#1497](https://github.com/microsoftgraph/entra-powershell/pull/1497).

  - **Documentation enhancements**:
    - Enhanced cmdlets examples.
    - Updated `Add-EntraDeviceRegisteredOwner` permissions.

## Module version history

- [Version 1.0.8][posh-1.0.8] - **May 2025**

  - **New Commands**:
    - [Test-EntraScript](/powershell/module/microsoft.entra/test-entrascript)

  - **Bug Fixes and command improvements**:
    - Fixed - Sub-modules must have the same version as the root module. PR [#1464](https://github.com/microsoftgraph/entra-powershell/pull/1464).
    - Fixed return service principals in `Get-EntraGroupOwner` response. PR [#1470](https://github.com/microsoftgraph/entra-powershell/pull/1470).
    - Fixed OdataId uris. PR [#1480](https://github.com/microsoftgraph/entra-powershell/pull/1480).

- [Version 1.0.7][posh-1.0.7] - **May 2025**

  - **Bug Fixes and command improvements**:
    - Replaced dash with hyphen in Group functions. PR [#1450](https://github.com/microsoftgraph/entra-powershell/pull/1450).
    - Fixed `New-EntraApplication` multiple RequiredResourceAccess entries failure. PR [#1458](https://github.com/microsoftgraph/entra-powershell/pull/1458).
    - Fixed `Get-EntraUserExtension` for parity with `Get-AzureADUserExtension`. PR [#1451](https://github.com/microsoftgraph/entra-powershell/pull/1451).

:::zone-end

[posh-1.0.9]: https://www.powershellgallery.com/packages/Microsoft.Entra/1.0.9
[posh-1.0.8]: https://www.powershellgallery.com/packages/Microsoft.Entra/1.0.8
[posh-1.0.7]: https://www.powershellgallery.com/packages/Microsoft.Entra/1.0.7
