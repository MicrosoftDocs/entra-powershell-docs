---
title: "Versioning, release cadence, and breaking changes"
description: "This article describes versioning, release cadence, and breaking change information for the Microsoft Entra PowerShell module."

ms.topic: concept-article
ms.date: 06/26/2024
ms.service: entra

author: omondiatieno
manager: CelesteDG
ms.author: jomondi
ms.reviewer: stevemutungi

#customer intent: As a Microsoft Entra PowerShell user, I want to understand the versioning, release cadence, and breaking changes policies so that I can plan and manage updates to my production environment effectively and minimize the risk of disruptions caused by breaking changes.
---

# Versioning, release cadence, and breaking changes

If you use Microsoft Entra PowerShell modules, it's important to understand the versioning, release schedule, and breaking change policies to manage updates effectively and reduce the risk of disruptions.

This article covers the versioning scheme used by Microsoft Entra PowerShell modules, the release cadence for planned updates, and the policies for breaking changes.

## Versioning

The Microsoft Entra PowerShell modules follow [Semantic Versioning](https://semver.org/) for version numbering. Versions of the  modules fall into one of the following three categories:

- **Generally available (v1.0)**: Module versions 1.0.0 and higher without _preview_ in the version are Generally Available, and any breaking changes correspond to a major version increment.
- **Beta**: Module versions below 1.0.0 correspond to beta Microsoft Graph APIs. New resource capabilities typically debut in the Beta version. Breaking changes and deprecations occur in the Beta module from time to time. Use of Beta in production environments isn't supported, and there are no guarantees that a beta feature is promoted to the current version.
- **Feature Preview**: Module versions with preview in the version are feature previews for Microsoft Entra PowerShell. You can expect breaking changes and deprecations in preview versions, and use in production environments isn't supported.

## Modules

There are two Microsoft Entra PowerShell modules:

- **[Microsoft.Graph.Entra](https://www.powershellgallery.com/packages/Microsoft.Graph.Entra/)**: Installs the GA(v1.0) module to manage Microsoft Graph resources with `/v1.0` API version.
- **[Microsoft.Graph.Entra.Beta](https://www.powershellgallery.com/packages/Microsoft.Graph.Entra.Beta/)**: Installs the Beta module to manage Microsoft Graph resources with `/beta` API version.

## Release cadence

Planned updates to the Microsoft Entra PowerShell module are released on the first Wednesday of each month. These
12 planned updates per calendar year are in two categories:

- **Major versions**: If a breaking change is necessary, a major version increment is released. For example, version 1.6.0 to version 2.0.0. Major version updates are released no more often than two times per year.

> We may make exceptions to this policy for security or reliability issues.

- **Minor versions**: 10 per calendar year that doesn't introduce breaking changes. The second number in
  the version number is updated. For example, version 1.0.0 to version 1.1.0.

- **Experimental versions**: Every two weeks. Users can try out the latest versions without waiting for a full release by building the module from the GitHub repo.

> Unplanned patch versions can be released at any time to fix bugs and don't introduce breaking changes. The third number in the version number is updated. For example, version 1.2.0 to
version 1.2.1.

## Breaking changes

> [!IMPORTANT]
> Breaking changes can occur at any point for non-GA (Beta module) and feature preview modules. Non-GA
> modules aren't required to adhere to breaking change policies.

### Use latest version

Only the latest major version receives full support, including new features, bug fixes, and updates. We strongly recommend upgrading to the [latest version](https://aka.ms/entrapsgallery) of the Entra PowerShell module to get the latest improvements and security updates.

## See Also

- [What's new in Microsoft Entra PowerShell][whats-new]?

<!-- link references -->
[whats-new]: whats-new-docs.md
