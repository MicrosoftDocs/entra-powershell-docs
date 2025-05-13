---
title: Navigate the Microsoft Entra PowerShell module
description: Navigate the Microsoft Entra PowerShell module to learn the core concepts, commands, and how to get help.

author: csmulligan
manager: CelesteDG
ms.topic: quickstart
ms.date: 05/08/2025
ms.author: cmulligan

#Customer intent: As an IT admin, I want to learn how to start using the Microsoft Entra PowerShell module, including authentication, core concepts, commands, and how to get help.
---

# Navigate the Microsoft Entra PowerShell module

Microsoft Entra PowerShell is a powerful tool for managing and administering Entra resources directly from PowerShell.

This article helps you navigate the module and outlines its core concepts.

## Prerequisites

- [Install the Microsoft Entra PowerShell module](installation.md).

## Sign in

Each cmdlet in Microsoft Entra PowerShell is protected by one or more permission scopes. To use Microsoft Entra PowerShell, users signing in must consent to the required permission scopes for the cmdlet they plan to use. Specify the permissions in the `Connect-Entra` cmdlet. Sign in with an admin account for your tenant, if prompted.

```powershell
Connect-Entra -Scopes 'User.Read.All'
```

Microsoft Entra PowerShell supports two types of authentication: *delegated access* and *app-only access*.
To see all the possible options, refer to the [authentication scenarios](authentication-scenarios.md).

## Find available commands

Microsoft Entra PowerShell cmdlets follow a standard naming convention for PowerShell, `Verb-Noun`. The verb describes the action (examples include `New`, `Get`, `Set`, `Remove`) and the noun describes the resource type (examples include `User`, `Group`, `ServicePrincipal`, `Device`). Nouns in Microsoft Entra PowerShell always start with the prefix `Entra`. For the full list of standard verbs, see the  [approved verbs for PowerShell commands](/powershell/scripting/developer/cmdlet/approved-verbs-for-windows-powershell-commands).

> [!NOTE]
> For Beta cmdlets, add a Beta prefix to the resource name. For example, use `Get-EntraBetaUser` instead of `Get-EntraUser` for the Beta version.

You can get all available commands in Microsoft Entra PowerShell module by using the following command:

```powershell
Get-Command -Module Microsoft.Entra*
```

To narrow this down, for instance, to find commands related to applications, run the following command.

```powershell
Get-Command -Module Microsoft.Entra* -Noun *application*
```

This command shows all the cmdlets, functions, and aliases included in the module for the application resource.

```Output
CommandType     Name                                               Version    Source
-----------     ----                                               -------    ------
Function        Add-EntraApplicationOwner                          1.0.1     Microsoft.Entra
Function        Get-EntraApplication                               1.0.1     Microsoft.Entra
Function        Get-EntraApplicationExtensionProperty              1.0.1     Microsoft.Entra
Function        Get-EntraApplicationKeyCredential                  1.0.1     Microsoft.Entra
Function        Get-EntraApplicationLogo                           1.0.1     Microsoft.Entra
Function        Get-EntraApplicationOwner                          1.0.1     Microsoft.Entra
Function        Get-EntraApplicationPasswordCredential             1.0.1     Microsoft.Entra
```

## View supported properties and methods for a command

To see more properties beyond the default output, run the following command to view all supported properties:

```powershell
Get-EntraUser -UserId 'rsmith@contoso.com' | Get-Member
```

This command displays all user properties and methods.

```Output
accountEnabled                        NoteProperty          bool accountEnabled=True
ageGroup                              NoteProperty          object ageGroup=null
businessPhones                        NoteProperty          Object[]
city                                  NoteProperty          string city=Bellevue
companyName                           NoteProperty          object companyName=null
consentProvidedForMinor               NoteProperty          object
country                               NoteProperty          string
createdDateTime                       NoteProperty          datetime createdDateTime
creationType                          NoteProperty          object creationType=null
deletedDateTime                       NoteProperty          object deletedDateTime=null
DeletionTimestamp                     NoteProperty          object DeletionTimestamp=null
department                            NoteProperty          string department=Retail
DirSyncEnabled                        NoteProperty          object DirSyncEnabled=null
displayName                           NoteProperty          string displayName=Adele Vance
employeeHireDate                      NoteProperty          object employeeHireDate=null
employeeId                            NoteProperty          object employeeId=null
employeeLeaveDateTime                 NoteProperty          object employeeLeaveDateTime=null
employeeOrgData                       NoteProperty          object employeeOrgData=null
employeeType                          NoteProperty          object employeeType=null
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
