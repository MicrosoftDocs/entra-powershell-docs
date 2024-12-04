---
title: What is new in Microsoft Entra PowerShell
description: "Learn about the latest features of Microsoft Entra PowerShell."
ms.topic: overview
ms.date: 12/03/2024
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

This article lists all new articles that were added or had significant updates in the last month. It also lists the new features in the Microsoft Entra PowerShell module, currently in public preview, to manage Microsoft Entra resources.

:::zone pivot="whats-new-in-docs"

## What's new in docs

### November 2024

**New articles**

- [Grant and revoke API permissions](how-to-grant-revoke-api-permissions.md): Learn how to grant and revoke API permissions for an application.
- [Manage guest users with Microsoft Entra PowerShell](manage-guest-users.md): Learn how to manage guest users in your organization.
- [Recover deleted data with Microsoft Entra PowerShell](recover-deleted-data.md): Learn how to recover deleted data using Microsoft Entra PowerShell.

**Updated articles**

- [Find Azure AD PowerShell and MSOnline cmdlets in Microsoft Entra PowerShell](azuread-powershell-to-entra-powershell-mapping.md): Added equivalents for the app proxy cmdlets. 
- [Install the Microsoft Entra PowerShell module](installation.md) : Updated the article in response to customer feedback.

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


### September 2024

**Updated articles**

- [Find Azure AD PowerShell and MSOnline cmdlets in Microsoft Entra PowerShell](azuread-powershell-to-entra-powershell-mapping.md) - Fixed broken links caused by the renaming of certain cmdlets.
- [Manage groups](manage-groups.md) - Added example improvements.
- [Manage users](manage-user.md) - Added example improvements.
- [What is Microsoft Entra PowerShell (preview)?](overview.md) - Added link to an external video.

:::zone-end

:::zone pivot="module-version-history"

## Module version history

- [Version 0.19.0-preview][posh-0.19.0] - **November 2024**

  - **New Global Secure Access Commands**: Added four cmdlets: `Enable-EntraBetaGlobalSecureAccessTenant`, `New-EntraBetaPrivateAccessApplication`, `Get-EntraBetaPrivateAccessApplication`, and `Get-EntraBetaGlobalSecureAccessTenantStatus`.
  - **Bug Fixes**:
    - Fixed [#1164](https://github.com/microsoftgraph/entra-powershell/issues/1164): Resolved missing types in certain beta commands.
    - Fixed [#1163](https://github.com/microsoftgraph/entra-powershell/issues/1163): Removed duplicate examples.
  - **Enhancements**:
    - Improved examples for over 130 cmdlets.
    - Added directory sync features and configurations examples.
  - **Security**:
    - Implemented security hardening measures in the release pipeline.

- [Version 0.18.0-preview][posh-0.18.0] - **October 2024**

  - Added usability-focused parameter switches to the `Set-EntraUserLicence` and `Set-EntraUserPassword` cmdlets.
  - Fixed issue [#1118](https://github.com/microsoftgraph/entra-powershell/issues/1118): Corrected parameter sets for `Find-EntraPermission`.
  - Improved documentation quality scores for 20 cmdlets.
  - Enhanced examples for 8 cmdlets.
  - Implemented platform-level security hardening in the release pipeline.

- [Version 0.17.0-preview][posh-0.17.0] - **October 2024**

  - Introduced usability parameter switches for over 480 cmdlets.
  - Added a new cmdlet: `Set-EntraDirSyncEnabled`.
  - Resolved issue [#1106](https://github.com/microsoftgraph/entra-powershell/issues/1106) – Corrected indentation errors.
  - Resolved issue [#1110](https://github.com/microsoftgraph/entra-powershell/issues/1110) – Added proper command examples to Help Synopsis.
  - Resolved issue [#1112](https://github.com/microsoftgraph/entra-powershell/issues/1112) – Provided missing parameter descriptions in Help Synopsis.
  - Added unit tests for 48 cmdlets.
  - Enriched examples for more than 15 cmdlets.

- [Version 0.16.0-preview][posh-0.16.0] - **September 2024**

  - Added a new cmdlet: `Reset-EntraStrongAuthenticationMethodByUpn`.
  - Fixed issue [#1090](https://github.com/microsoftgraph/entra-powershell/issues/1090) where `Get-EntraUserManager` ignored the `-Property` parameter.
  - Fixed broken links in the `Remove-EntraFeatureRolloutPolicyDirectoryObject` documentation.
  - Updated documentation for 300+ cmdlets to align with both `Beta` and `v1.0` versions.
  - Upgraded the pipeline to the latest version 5 of the Engineering Security and Release Platform (ESRP) for the CI/CD pipeline.
  - Added a sample script for retrieving [Entitlement-assignment-policies-without-approval](https://github.com/microsoftgraph/entra-powershell/blob/main/samples/identify-assignment-policies-without-approval.ps1).
  - Added 28 cmdlet aliases for backward compatibility.
  - Included examples for removing licenses in `Set-EntraUserLicense`.
  - Added unit tests for 48 commands.

- [Version 0.15.0-preview][posh-0.15.0] - **September 2024**

  - Added six new cmdlets for **FeatureRolloutPolicy**, **TrustedCertificateAuthority**, and **CustomSecurityAttributeDefinitionAllowedValue**.
  - Renamed over 40 cmdlets to follow [PowerShell cmdlet naming best practices](/powershell/scripting/developer/cmdlet/strongly-encouraged-development-guidelines#use-a-specific-noun-for-a-cmdlet-name-sd01), ensuring singular nouns are used.
  - Removed unused variables as part of code clean-up efforts.
  - Added a [developer documentation guide](https://github.com/microsoftgraph/entra-powershell/tree/main/development-docs) that covers development workflow, cmdlet best practices, pipeline best practices, and parameter best practices.
  - Updated configuration to manage the **required version** for dependent modules.
  - Enabled **PSScriptAnalyzer** for code analysis.
  - Housekeeping tasks, including improvements to the build and release pipelines.

- [Version 0.14.0-preview][posh-0.14.0] - **August 2024**

  - The `Get-EntraUser` cmdlet updated and no longer returns the `SignInActivity` by default. To retrieve sign-in activity, refer to [this example](/powershell/module/microsoft.graph.entra/get-entrauser#example-6-get-signinactivity-of-a-user).
  - Added 17 net new cmdlets (Custom Security attributes, Application template, Feature Rollout policy, Audit Directory logs, Audit sign in Logs, Administrative Unit)
  - Improved documentation for over 25 existing cmdlets.
  - Added documentation for more than 20 v1.0 cmdlets.
  - Added documentation for over 50 Beta cmdlets.
  - Enhanced over 40 cmdlets with better examples and detailed descriptions.
  - Bug fix to return actual Microsoft Graph types instead of PSCustomObjects.
  - Performed housekeeping tasks, including strengthening the build and release pipelines.

- [Version 0.13.0-preview][posh-0.13.0] - **August 2024**

  - Added five net new cmdlets (Microsoft Entra Policy, Application Password, Application Service Endpoints)
  - Documentation improvements for over 25 existing cmdlet references documentation.
  - Added over 50 Beta cmdlet references documentation.
  - Bug fix for `Get-EntraGroupMember` to return Service Principal as a member.
  - Bug fix to decouple SignInActivity with more examples.

- [Version 0.12.0-preview][posh-0.12.0] - **July 2024**

  - Added three new cmdlets for Global Secure Access - Private Access App segment management (preview)
  - Added missing types that were throwing warnings on missing types for Get-EntraApplication and Get-EntraBetaApplication commands.
  - Documentation improvements - Added Beta documentation for over 50 cmdlets
  - Added required permissions for 34 more commands.
  - Resolved broken link in `New-EntraRoleDefinition`.

- [Version 0.11.0-preview][posh-0.11.0] - **July 2024**

  - Added the required scopes in the examples for top cmdlets.
  - Resolved local build issue for PowerShell 7.x.
  - Bug fixes from GitHub issues.

- [Version 0.10.0-preview][posh-0.10.0] - **June 2024**

  - Added the ability to autoinstall module dependencies.
  - Official public preview release version.
  - Added Connect-Entra examples.

:::zone-end

[assign-app-roles]: create-assign-app-roles.md
[cmdlet-map]: azuread-powershell-to-entra-powershell-mapping.md
[posh-0.19.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.19.0-preview
[posh-0.18.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.18.0-preview
[posh-0.17.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.17.0-preview
[posh-0.16.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.16.0-preview
[posh-0.15.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.15.0-preview
[posh-0.14.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.14.0-preview
[posh-0.13.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.13.0-preview
[posh-0.12.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.12.0-preview
[posh-0.11.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.11.0-preview
[posh-0.10.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.10.0-preview
