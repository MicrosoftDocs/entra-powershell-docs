---
title: Navigate the Microsoft Entra PowerShell module
description: Navigate the Microsoft Entra PowerShell module to learn the core concepts, commands, and how to get help.

author: csmulligan
manager: CelesteDG
ms.topic: quickstart
ms.date: 01/21/2025
ms.author: cmulligan

#Customer intent: As an IT admin, I want to learn how to start using the Microsoft Entra PowerShell module, including authentication, core concepts, commands, and how to get help.
---

# Navigate the Microsoft Entra PowerShell module

Microsoft Entra PowerShell is a powerful tool for managing and administering Entra resources directly from PowerShell.

This article helps you navigate the module by outlining its core concepts.

## Prerequisites

- [Install the Microsoft Entra PowerShell module](installation.md).

## Sign in

Each cmdlet in Microsoft Entra PowerShell is protected by one or more permission scopes. To use Microsoft Entra PowerShell, the user logging in must consent to the required permission scopes for the cmdlet you plan to use.  You specify the permissions in the `Connect-Entra` cmdlet. Sign in with an admin account of your tenant, if prompted.

```powershell
Connect-Entra -Scopes 'User.Read.All'
```

Microsoft Entra PowerShell supports two types of authentication: *delegated access* and *app-only access*.
To see all the possible options, refer to the [authentication scenarios](authentication-scenarios.md).

## Find available commands

Microsoft Entra PowerShell cmdlets follow a standard naming convention for PowerShell, `Verb-Noun`. The verb describes the action (examples include `New`, `Get`, `Set`, `Remove`) and the noun describes the resource type (examples include `User`, `Group`, `ServicePrincipal`, `Device`). Nouns in Microsoft Entra PowerShell always start with the prefix `Entra`. For the full list of standard verbs, see the  [approved verbs for PowerShell commands](/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands).

> [!NOTE]
> For beta cmdlets, add a Beta prefix to the resource name. For example, use `Get-EntraBetaUser` instead of `Get-EntraUser` for the beta version.

You can get all available commands in Microsoft Entra PowerShell module by using the following command:

```powershell
Get-Command -Module Microsoft.Graph.Entra
```

To narrow this down, for instance, to find commands related to applications, run the following command.

```powershell
Get-Command -Module Microsoft.Graph.Entra* -Noun *application*
```

This command shows all the cmdlets, functions, and aliases included in the module for the application resource.

```Output
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Add-EntraApplicationOwner                          0.19.0     Microsoft.Graph.Entra
Function        Get-EntraApplication                               0.19.0     Microsoft.Graph.Entra
Function        Get-EntraApplicationExtensionProperty              0.19.0     Microsoft.Graph.Entra
Function        Get-EntraApplicationKeyCredential                  0.19.0     Microsoft.Graph.Entra
Function        Get-EntraApplicationLogo                           0.19.0     Microsoft.Graph.Entra
Function        Get-EntraApplicationOwner                          0.19.0     Microsoft.Graph.Entra
Function        Get-EntraApplicationPasswordCredential             0.19.0     Microsoft.Graph.Entra
```

## Get help

To find help with the Microsoft Entra PowerShell cmdlets, use `Get-Help` command for detailed help about specific commands, including their syntax, parameters, and usage examples.
For example, to learn more about the `Get-EntraUser` command, run the following command.

```powershell
Get-Help Get-EntraUser -Detailed
```

This command gives detailed help documentation, including the cmdlet's description, parameters, usage examples, and related commands, helping you understand how to use it effectively in various scenarios.

## Learn the basics

Get hands-on with Microsoft Entra PowerShell through our detailed how-to guides:

- [Manage users](manage-user.md)
- [Manage user licenses](how-to-manage-user-licenses.md)
- [Manage devices](manage-devices.md)
- [Manage stale devices](manage-stale-devices.md)
- [Manage groups](manage-groups.md)
- [Manage apps](manage-apps.md)
- [Manage roles](manage-roles.md)
