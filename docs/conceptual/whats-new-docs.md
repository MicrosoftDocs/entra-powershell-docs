---
title: What is new in Microsoft Entra PowerShell
description: "Learn about the latest features of Microsoft Entra PowerShell."
ms.topic: overview
ms.date: 05/09/2025
author: msewaweru
manager: CelesteDG
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

## April 2025

#### New articles

- [Offboard users](offboard-user.md) - Learn to offboard users by invalidating sessions, resetting passwords, and removing device ownership.

### Updated articles

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

- [Version 1.0.5][posh-1.0.5] - **March 2025**

  - **New Commands**:
    - [Get-EntraAuthenticationMethodUserRegistrationDetailReport](/powershell/module/microsoft.entra/get-entraauthenticationmethoduserregistrationdetailreport) - to retrieve authentication method registration report.
    - [Set-EntraUserSponsor](/powershell/module/microsoft.entra/set-entrausersponsor) - to update a user's sponsor.
  - **Bug Fixes and command improvements**:
    - Fixed -Add SendCertificateChain to `Connect-Entra` command.
    - Fixed - `Reset-EntraBetaStrongAuthenticationMethodByUpn` - added missing authentication method.
    - Fixed - `Set-EntraUserExtension` - Add support for support `ExtensionNameValues` parameter.
    - Added parameter validations for the Per-user MFA-based commands.
  - **Documentation enhancements**:
    - Add per-user MFA report example.
    - Add disable password policy example.

