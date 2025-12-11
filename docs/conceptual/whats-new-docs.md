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

- [Version 1.1.0][posh-1.1.0] - **December 2025**

  - **Features**:
    - Removed version pinning of Microsoft Graph PowerShell modules from version `2.25.0` to allow users to use the latest version of the module without any version restriction.
    - Added sample scripts on how to apply batch operations in Graph API calls for performance improvement on operations involving a lot of API calls.

  - **New Parameters**:
    - [Get-EntraDevice](/powershell/module/Microsoft.Entra.DirectoryManagement/Get-EntraDevice) & [Get-EntraBetaDevice](/powershell/module/Microsoft.Entra.Beta.DirectoryManagement/Get-EntraBetaDevice):
      - Added `-LogonTimeBefore` parameter to filter devices with last sign-in before a specified date.
      - Added `-Stale` parameter to filter devices that haven't signed in for 2 months or more.
      - Added `-NonCompliant` parameter to filter devices that are not compliant with organizational policies.
      - Added `-IsManaged` parameter to filter devices based on whether they are managed by a Mobile Device Management (MDM) solution.
      - Added `-JoinType` parameter to filter devices by join type: MicrosoftEntraJoined, MicrosoftEntraHybridJoined, or MicrosoftEntraRegistered.
    - [Get-EntraServicePrincipal](/powershell/module/Microsoft.Entra.Applications/Get-EntraServicePrincipal) & [Get-EntraBetaServicePrincipal](/powershell/module/Microsoft.Entra.Beta.Applications/Get-EntraBetaServicePrincipal):
      - Added `-AssignmentRequired` parameter to filter by whether user assignment is required to access the application. When set to `$true`, returns only service principals where user assignment is required. When set to `$false`, returns only service principals where user assignment is not required.
      - Added `-ApplicationType` parameter to filter by application type such as: AppProxyApps, EnterpriseApps, ManagedIdentity and MicrosoftApps.

  - **Bug Fixes**:
    - Fixed an issue where Microsoft.Entra.Beta.Applications module was experiencing a parsing issue in PowerShell 5.1.

## Module version history

[Version 1.0.13][posh-1.0.13] - **November 2025**

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

[Version 1.0.12][posh-1.0.12] - **September 2025**

- **Bug Fixes**:
  - Moved `Get-EntraUnsupportedCommand` to the root modules - Microsoft.Entra and Microsoft.Entra.Beta - and removed it from sub-modules to align with its usage in `Enable-EntraAzureADAlias`. PR [#1543](https://github.com/microsoftgraph/entra-powershell/pull/1543)
  - Enabled `Enable-EntraAzureADAlias` cmdlet in the beta module. PR [#1542](https://github.com/microsoftgraph/entra-powershell/pull/1542)

- **Cmdlet Enhancements**:
  - Added the `-AppendSelected` parameter to high usage cmdlets in applications, users, and groups sub-modules. PR [#1518](https://github.com/microsoftgraph/entra-powershell/pull/1518)
  - Implemented authentication checks across all cmdlets to indicate the correct permissions in case of a failed connection using `Connect-Entra`.
  - Updated the `-Features` parameter under `Set-EntraDirSyncFeature` command to allow processing of multiple features at once.. PR [#1527](https://github.com/microsoftgraph/entra-powershell/pull/1527)
  - Extended the `Get-EntraUser` command to include `-PageSize` parameter. PR [#1526](https://github.com/microsoftgraph/entra-powershell/pull/1526)

[Version 1.0.11][posh-1.0.11] - **August 2025**

- **Bug Fixes**:
  - Updated cmdlet binding for `Remove-EntraBetaPrivateAccessApplicationSegment` command. PR [#1524](https://github.com/microsoftgraph/entra-powershell/pull/1524)

  - **Cmdlet Enhancements**:
    - Updated the verb on `Update-EntraSignedInUserPassword` command to `Set-EntraSignedInUserPassword`. PR [#1516](https://github.com/microsoftgraph/entra-powershell/pull/1516)
    - Updated the command name `Set-EntraUserPassword` to `Set-EntraUserPasswordProfile` and the corresponding parameters. PR [#1519](https://github.com/microsoftgraph/entra-powershell/pull/1519)
    - Removed `Microsoft.Graph.Users.Functions` dependency for performance improvement. PR [#1521](https://github.com/microsoftgraph/entra-powershell/pull/1521)



:::zone-end

[posh-1.1.0]: https://www.powershellgallery.com/packages/Microsoft.Entra/1.1.0
[posh-1.0.13]: https://www.powershellgallery.com/packages/Microsoft.Entra/1.0.13
[posh-1.0.12]: https://www.powershellgallery.com/packages/Microsoft.Entra/1.0.12
[posh-1.0.11]: https://www.powershellgallery.com/packages/Microsoft.Entra/1.0.11


