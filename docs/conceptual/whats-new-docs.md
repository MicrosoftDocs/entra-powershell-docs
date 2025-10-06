---
title: What is new in Microsoft Entra PowerShell
description: "Learn about the latest features of Microsoft Entra PowerShell."
ms.topic: overview
ms.date: 09/02/2025
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

## Latest (recommended) version

- [Version 1.0.12][posh-1.0.12] - **September 2025**

  - **Bug Fixes**:
    - Moved `Get-EntraUnsupportedCommand` to the root modules - Microsoft.Entra and Microsoft.Entra.Beta-  and removed it from sub-modules to align with its usage in `Enable-EntraAzureADAlias`. PR [#1543](https://github.com/microsoftgraph/entra-powershell/pull/1543)
    - Enabled `Enable-EntraAzureADAlias` cmdlet in the beta module. PR [#1542](https://github.com/microsoftgraph/entra-powershell/pull/1542)

  - **Cmdlet Enhancements**:
    - We have added the `-AppendSelected` parameter to high usage cmdlets in applications, users, and groups sub-modules. PR [#1518](https://github.com/microsoftgraph/entra-powershell/pull/1518)
    - Implemented authentication checks across all cmdlets to indicate the correct permissions in case of a failed connection using `Connect-Entra`.
    - Updated the -Features parameter under Set-EntraDirSyncFeature command to allow processing of multiple features at once.. PR [#1527](https://github.com/microsoftgraph/entra-powershell/pull/1527)
    - Extended the Get-EntraUser command to include -PageSize parameter. PR [#1526](https://github.com/microsoftgraph/entra-powershell/pull/1526)

## Module version history

[Version 1.0.11][posh-1.0.11] - **August 2025**

- **Bug Fixes**:
  - Updated cmdlet binding for `Remove-EntraBetaPrivateAccessApplicationSegment` command. PR [#1524](https://github.com/microsoftgraph/entra-powershell/pull/1524)

  - **Cmdlet Enhancements**:
    - Updated the verb on `Update-EntraSignedInUserPassword` command to `Set-EntraSignedInUserPassword`. PR [#1516](https://github.com/microsoftgraph/entra-powershell/pull/1516)
    - Updated the command name `Set-EntraUserPassword` to `Set-EntraUserPasswordProfile` and the corresponding parameters. PR [#1519](https://github.com/microsoftgraph/entra-powershell/pull/1519)
    - Removed `Microsoft.Graph.Users.Functions` dependency for performance improvement. PR [#1521](https://github.com/microsoftgraph/entra-powershell/pull/1521)

- [Version 1.0.10][posh-1.0.10] - **July 2025**

  - **New Commands**:
    - [New-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra/new-entraserviceprincipalkeycredential). PR [#1487](https://github.com/microsoftgraph/entra-powershell/pull/1487)

  - **Bug Fixes**:
    - Fixed `Remove-EntraUserExtension`. PR [#1509](https://github.com/microsoftgraph/entra-powershell/pull/1509)

  - **Documentation enhancements**:
    - Updates to comply with Platy PS v2 pipeline. PRs [#1498](https://github.com/microsoftgraph/entra-powershell/pull/1498), [#1501](https://github.com/microsoftgraph/entra-powershell/pull/1501), and [#1506](https://github.com/microsoftgraph/entra-powershell/pull/1506)

  - **Other Enhancements**:
    - Adding zero-trust assessments samples. PR [#1341](https://github.com/microsoftgraph/entra-powershell/pull/1341)

:::zone-end

[posh-1.0.12]: https://www.powershellgallery.com/packages/Microsoft.Entra/1.0.12
[posh-1.0.11]: https://www.powershellgallery.com/packages/Microsoft.Entra/1.0.11
[posh-1.0.10]: https://www.powershellgallery.com/packages/Microsoft.Entra/1.0.10

