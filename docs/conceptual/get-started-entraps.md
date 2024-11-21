---
title: Get started with the module
description: Get started with the Microsoft Entra PowerShell module, including installation, core concepts, commands, and how to get help.

author: csmulligan
manager: CelesteDG
ms.topic: quickstart
ms.date: 11/20/2024
ms.author: cmulligan

#Customer intent: As an IT admin, I want to learn how to use start with the Microsoft Entra PowerShell module, including installation, core concepts, commands, and how to get help.
---

# Quickstart: Get started with the Microsoft Entra PowerShell module

Microsoft Entra PowerShell is a powerful tool for managing and administering Entra resources directly from PowerShell. [Explore more about Entra PowerShell](overview.md).

This article helps you get started with Microsoft Entra PowerShell and teaches its core concepts.

## Prerequisites

- [Install the Microsoft Entra PowerShell Module](installation.md).

## Verify successful installation

You can check if the module is loaded by running the command `Get-Module -Name Microsoft.Graph.Entra`. In case the module isn't loaded, you can import it by running the following command:

```powershell
Import-Module -Name Microsoft.Graph.Entra
```

Keep the Microsoft Entra PowerShell module updated to ensure access to the latest commands and features by running the command: `Update-Module -Name Microsoft.Graph.Entra`.

## Sign in

Microsoft Entra PowerShell supports two types of authentication: _delegated access_, and _app-only access_. To use Microsoft Entra PowerShell, you need to authenticate to access Microsoft Entra resources. Sign in with an admin account of your tenant, if prompted.

```powershell
Connect-Entra -Scopes 'User.Read.All'
```

To see all the possible options, refer to the [authentication scenarios][authentication-scenarios].

## Find available commands

Microsoft Entra PowerShell cmdlets follow a standard naming convention for PowerShell, `Verb-Noun`. The verb describes the action (examples include `New`, `Get`, `Set`, `Remove`) and the noun describes the resource type (examples include `User`, `Group`, `ServicePrincipal`, `Device`). Nouns in Microsoft Entra PowerShell always start with the prefix `Entra`. For the full list of standard verbs, see the  [approved verbs for PowerShell commands][approved-verbs].

> [!NOTE]
> For beta cmdlets, add a Beta prefix to the resource name. For example, use `Get-EntraBetaUser` instead of `Get-EntraUser` for the beta version.

You can get all available commands in Microsoft Entra PowerShell module by using the following command:

```powershell
Get-Command -Module Microsoft.Graph.Entra
```

You can narrow this down. For instance, to find commands related to applications, run the following command:

```powershell
Get-Command -Module Microsoft.Graph.Entra* -Noun *application*
```

This command shows all the cmdlets, functions, and aliases included in the module for the `application` resource.

## Get help

To be effective with the Microsoft Entra PowerShell, you need to use `Get-Help` command for detailed help about specific commands, including their syntax, parameters, and usage examples.
For example, to learn more about the`Get-EntraUser` command, run:

```powershell
Get-Help Get-EntraUser -Detailed
```

This command gives detailed help documentation, including the cmdlet's description, parameters, usage examples, and related commands, helping you understand how to use it effectively in various scenarios.

## Data collection

Microsoft Entra PowerShell collects telemetry data by default. We collection information about the `Microsoft Entra PowerShell version` and the `cmdlet` executed. Microsoft aggregates collected data to identify patterns of usage to identify common issues and to improve the experience of Microsoft Entra PowerShell.
Microsoft Entra PowerShell doesn't collect any private or personal data. For example, the usage data helps identify issues such as cmdlets with low success and helps prioritize our work.

## Learn the basics

Get hands-on with Microsoft Entra PowerShell through our detailed how-to guides:

- [Manage users](manage-user.md)
- [Manage user licenses](how-to-manage-user-licenses.md)
- [Manage devices](manage-devices.md)
- [Manage stale devices](manage-stale-devices.md)
- [Manage groups](manage-groups.md)
- [Manage apps](manage-apps.md)
- [Manage roles](manage-roles.md)
