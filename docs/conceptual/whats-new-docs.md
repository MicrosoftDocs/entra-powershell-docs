---
title: What is new in Microsoft Entra PowerShell
description: "Learn about the latest features of Microsoft Entra PowerShell."
ms.topic: overview
ms.date: 08/26/2024
author: omondiatieno
manager: CelesteDG
ms.author: jomondi
ms.reviewer: stevemutungi254
keywords: Microsoft Entra powershell, entra-powershell, manage entra resources using powershell, entra powershell new features, what's new in entra powershell

#customer intent: As a PowerShell user, I want an overview of the latest features of Microsoft Entra PowerShell module.
---

# What's new in the Entra PowerShell module

This article lists all new articles that were added or had significant updates in the last month. It also lists the new features in the Microsoft Entra PowerShell module, currently in public preview, to manage Microsoft Entra resources.

## What's new in docs

### July 2024

#### New articles

- [Azure AD  PowerShell cmdlet map][cmdlet-map] -  Find the equivalent cmdlets in Microsoft Entra PowerShell for deprecated Azure AD, Azure AD Preview, and MSOnline PowerShell modules to accelerate migration.
- [Assign app roles to a service principal][assign-app-roles] - Assign app roles in Microsoft Entra PowerShell to automate application consent.

#### Updated articles

- The [reference TOC](/powershell/module/microsoft.graph.entra) is updated to group cmdlets for easier navigation.

## Module version history

- [Version 0.15.0-preview][posh-0.15.0]

  - Added six new cmdlets for **FeatureRolloutPolicy**, **TrustedCertificateAuthority**, and **CustomSecurityAttributeDefinitionAllowedValue**.
  - Renamed over 40 cmdlets to follow [PowerShell cmdlet naming best practices](/powershell/scripting/developer/cmdlet/strongly-encouraged-development-guidelines#use-a-specific-noun-for-a-cmdlet-name-sd01), ensuring singular nouns are used.
  - Removed unused variables as part of code clean-up efforts.
  - Added a [developer documentation guide](https://github.com/microsoftgraph/entra-powershell/tree/main/development-docs) that covers development workflow, cmdlet best practices, pipeline best practices, and parameter best practices.
  - Updated configuration to manage the **required version** for dependent modules.
  - Enabled **PSScriptAnalyzer** for code analysis.
  - Housekeeping tasks, including improvements to the build and release pipelines.

- [Version 0.14.0-preview][posh-0.14.0]

  - The `Get-EntraUser` cmdlet has been updated and no longer returns the `SignInActivity` by default. To retrieve sign-in activity, refer to [this example](/powershell/module/microsoft.graph.entra/get-entrauser#example-6-get-signinactivity-of-a-user).
  - Added 17 net new cmdlets (Custom Security attributes, Application template, Feature Rollout policy, Audit Directory logs, Audit sign in Logs, Administrative Unit)
  - Improved documentation for over 25 existing cmdlets.
  - Added documentation for more than 20 v1.0 cmdlets.
  - Added documentation for over 50 Beta cmdlets.
  - Enhanced over 40 cmdlets with better examples and detailed descriptions.
  - Bug fix to return actual Microsoft Graph types instead of PSCustomObjects.
  - Performed housekeeping tasks, including strengthening the build and release pipelines.

- [Version 0.13.0-preview][posh-0.13.0]

  - Added five net new cmdlets (Entra Policy, Application Password, Application Service Endpoints)
  - Documentation improvements for over 25 existing cmdlet references documentation.
  - Added over 50 Beta cmdlet references documentation.
  - Bug fix for `Get-EntraGroupMember` to return Service Principal as a member.
  - Bug fix to decouple SignInActivity with more examples.

- [Version 0.12.0-preview][posh-0.12.0]

  - Added three new cmdlets for Global Secure Access - Private Access App segment management (preview)
  - Added missing types that were throwing warnings on missing types for Get-EntraApplication and Get-EntraBetaApplication commands.
  - Documentation improvements - Added Beta documentation for over 50 cmdlets
  - Added required permissions for 34 more commands.
  - Resolved broken link in `New-EntraRoleDefinition`.

- [Version 0.11.0-preview][posh-0.11.0]

  - Added the required scopes in the examples for top cmdlets.
  - Resolved local build issue for PowerShell 7.x.
  - Bug fixes from GitHub issues.

- [Version 0.10.0-preview][posh-0.10.0]

  - Added the ability to autoinstall module dependencies.
  - Official public preview release version.
  - Added Connect-Entra examples.

[assign-app-roles]: create-assign-app-roles.md
[cmdlet-map]: azuread-powershell-to-entra-powershell-mapping.md
[posh-0.15.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.15.0-preview
[posh-0.14.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.14.0-preview
[posh-0.13.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.13.0-preview
[posh-0.12.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.12.0-preview
[posh-0.11.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.11.0-preview
[posh-0.10.0]: https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/0.10.0-preview
