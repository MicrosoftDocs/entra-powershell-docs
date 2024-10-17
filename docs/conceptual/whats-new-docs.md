---
title: What is new in Microsoft Entra PowerShell
description: "Learn about the latest features of Microsoft Entra PowerShell."
ms.topic: overview
ms.date: 10/03/2024
author: omondiatieno
manager: CelesteDG
ms.author: jomondi
ms.reviewer: stevemutungi254

zone_pivot_groups: entra-powershell-whats-new
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json

keywords: Microsoft Entra powershell, entra-powershell, manage entra resources using powershell, entra powershell new features, what's new in entra powershell

#customer intent: As a PowerShell user, I want an overview of the latest features of Microsoft Entra PowerShell module.
---

# What's new in the Microsoft Entra PowerShell module

This article lists all new articles that were added or had significant updates in the last month. It also lists the new features in the Microsoft Entra PowerShell module, currently in public preview, to manage Microsoft Entra resources.

:::zone pivot="whats-new-in-docs"

## What's new in docs

### September 2024

**Updated articles**

- [Find Azure AD PowerShell and MSOnline cmdlets in Microsoft Entra PowerShell](azuread-powershell-to-entra-powershell-mapping.md) - Fixed broken links caused by the renaming of certain cmdlets.
- [Manage groups](manage-groups.md) - Added example improvements.
- [Manage users](manage-user.md) - Added example improvements.
- [What is Microsoft Entra PowerShell (preview)?](overview.md) - Added link to an external video.

### August 2024

**Updated articles**

- [Azure AD  PowerShell cmdlet map][cmdlet-map] - Updated the cmdlet map with new cmdlet equivalents in Microsoft Entra PowerShell.

### July 2024

**New articles**

- [Azure AD  PowerShell cmdlet map][cmdlet-map] -  Find the equivalent cmdlets in Microsoft Entra PowerShell for deprecated Azure AD, Azure AD Preview, and MSOnline PowerShell modules to accelerate migration.
- [Assign app roles to a service principal][assign-app-roles] - Assign app roles in Microsoft Entra PowerShell to automate application consent.

**Updated articles**

- The [reference TOC](/powershell/module/microsoft.graph.entra) is updated to group cmdlets for easier navigation.

### June 2024

**New articles**

- [Microsoft Entra PowerShell overview (preview)](overview.md) - What is Microsoft Entra PowerShell, and how can you use it to manage Microsoft Entra resources?
- [Get started with the Microsoft Entra PowerShell module](quickstart-entra-powershell.md) - Learn the core concepts and get started with the Microsoft Entra PowerShell module.
- [Navigate the Microsoft Entra PowerShell module](navigate-entra-powershell.md) - Learn how to navigate the Microsoft Entra PowerShell module to manage Microsoft Entra resources.
- [Install the Microsoft Entra PowerShell module](installation.md) - New article on how to install the Microsoft Entra PowerShell module.
- [Manage users with Microsoft Entra PowerShell](manage-user.md)
- [Manage apps with Microsoft Entra PowerShell](manage-apps.md)  
- [Manage groups with Microsoft Entra PowerShell](manage-groups.md)
- [Authentication scenarios](authentication-scenarios.md)- New article on using [App-only authentication](app-only-access-auth.md) and [Delegated authentication](delegated-access-auth.md).
- [Create a custom application](create-custom-application.md) - New article on creating a custom application in Microsoft Entra PowerShell.
- [Migration guide](migration-guide.md) - New article on how to migrate from Azure AD PowerShell to Microsoft Entra PowerShell.
- [Troubleshoot common errors in Microsoft Entra PowerShell](troubleshooting.md) - New article on how to troubleshoot and fix common errors in Microsoft Entra PowerShell.
- [Microsoft Entra PowerShell best practices](entra-powershell-best-practices.md) - Best practices for using the Microsoft Entra PowerShell module to boost performance, enhance security, and scale reliably.
- [Versioning, release cadence, and breaking changes](entraps-versioning-release-cadence.md) - Understand the versioning, release schedule, and breaking change policies to manage updates effectively and reduce the risk of disruptions.

:::zone-end

:::zone pivot="module-version-history"

## Module version history

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
[posh-0.17.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.17.0-preview
[posh-0.16.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.16.0-preview
[posh-0.15.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.15.0-preview
[posh-0.14.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.14.0-preview
[posh-0.13.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.13.0-preview
[posh-0.12.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.12.0-preview
[posh-0.11.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.11.0-preview
[posh-0.10.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.10.0-preview
