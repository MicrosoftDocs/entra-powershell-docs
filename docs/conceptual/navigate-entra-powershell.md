---
title: Navigate the Microsoft Entra PowerShell module
description: Learn about the cmdlet structure and how to find the right commands in Microsoft Entra PowerShell.

author: csmulligan
manager: CelesteDG
ms.topic: concept-article
ms.date: 06/26/2024
ms.author: cmulligan

#Customer intent: As a new user of the Microsoft Entra PowerShell module, I want to easily find the command I need for a specific task, so that I can manage Microsoft Entra ID resources effectively.
---
# Navigate the Microsoft Entra PowerShell module

This guide shows you how to effectively use the Microsoft Entra PowerShell module. It explains command naming conventions, demonstrates how to find and use Microsoft Entra PowerShell commands and features. Before you can navigate a module, you need to ensure it's [installed][installation] and available in your PowerShell session.

## Command naming conventions

Microsoft Entra PowerShell cmdlets follow a standard naming convention for PowerShell, `Verb-Noun`. The verb describes the action (examples include `New`, `Get`, `Set`, `Remove`) and the noun describes the resource type (examples include `User`, `Group`, `ServicePrincipal`, `Device`). Nouns in Microsoft Entra PowerShell always start with the prefix `Entra`. For the full list of standard verbs, see [Approved verbs for PowerShell Commands][approved-verbs].

> [!NOTE]
> For beta cmdlets, add a Beta prefix to the resource name. For example, use `Get-EntraBetaUser` instead of `Get-EntraUser` for the beta version.

## Explore module commands

### Import the module

Import the Microsoft Entra PowerShell module if you haven't installed it yet.

```powershell
Import-Module -Name Microsoft.Graph.Entra
```

You can check if the Module is loaded by running the command `Get-Module -Name Microsoft.Graph.Entra`.

### Find available commands

You can use the `Get-Command` command to search for available commands in the module. For instance, to find commands related to applications, run the following command:

```powershell
Get-Command -Module Microsoft.Graph.Entra* -Noun *application*
```

This command shows all the cmdlets, functions, and aliases included in the module for the `application` resource.

### List parameters

Once you identify the correct command, use the `Get-Help` command to view all its parameters. For example, to see the parameters for the `Get-EntraUser` command, run the following command:

```powershell
Get-Help Get-EntraUser -Detailed
```

This command gives detailed help documentation, including the cmdlet's description, parameters, usage examples, and related commands, helping you understand how to use it effectively in various scenarios.

> [!TIP]
> Keep Microsoft Entra PowerShell module updated to ensure access to the latest commands and features by running the command `Update-Module -Name Microsoft.Graph.Entra`


[approved-verbs]: /powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands
[installation]: installation.md