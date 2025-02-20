---
title: Manage groups
description: Learn how to create, edit, update, and delete a group using Microsoft Entra PowerShell.
ms.topic: how-to
ms.date: 02/20/2025
author: csmulligan
manager: CelesteDG
ms.author: cmulligan
ms.reviewer: stevemutungi

#Customer intent: As an IT admin managing groups and users in Microsoft Entra ID, I want to learn how to create, edit and update a group in Microsoft Entra PowerShell so that I can automate group management tasks.
---

# Manage groups

In this tutorial, you learn how to create, edit, update, and delete a group using Microsoft Entra PowerShell. You also learn how to add and remove users from a group.

## Prerequisites

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Install the latest Microsoft Entra PowerShell module. For more information, see [Install the Microsoft Entra PowerShell module](installation.md).
- Have at least the [Groups Administrator role](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#groups-administrator).

## Create groups

To create a group, make sure you have the required permissions to create a group.

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All' 
```

To create a new group, run the following command.

```powershell
$groupParams = @{
    DisplayName = 'Contoso marketing'
    MailEnabled = $false
    SecurityEnabled = $true
    MailNickName = 'NotSet'
}
New-EntraGroup @groupParams
```

```Output
DisplayName  Id                                   MailNickname Description GroupTypes
-----------  --                                   ------------ ----------- ----------
Contoso marketing aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb NotSet                   {}
```

This command creates a new group with the name `Contoso marketing`.

Search for the created group by using the following command.

```powershell
Get-EntraGroup -Filter "displayName eq 'Contoso marketing'"
```

```Output
DisplayName        Id                                   MailNickname     Description        GroupTypes
-----------        --                                   ------------     -----------        ----------
Contoso marketing       aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb NotSet       Contoso marketing EMEA        {}
```

This command returns the details of the newly created group. You can also use the `GroupId` (GUID) to search, update, or delete the group.

## Update group details

Update the group description by running the following command.

```powershell
Get-EntraGroup -Filter "displayName eq 'Contoso marketing'" | Set-EntraGroup -Description 'Contoso marketing Global'
```

To confirm the updated description, run the [Get-EntraGroup](/powershell/module/microsoft.entra/get-entragroup) again.

```powershell
Get-EntraGroup -Filter "displayName eq 'Contoso marketing'"  
```

## Add user to a group

Add a user to the group by running the following command. The `GroupId` is the Group ID and the `MemberId` is the User ID. You can get the User ID from the [Microsoft Entra admin center](https://entra.microsoft.com/) or by running the [Get-EntraUser](/powershell/module/microsoft.entra/get-entrauser) command.

```powershell
$group = Get-EntraGroup -Filter "displayName eq 'Contoso marketing'"
$user = Get-EntraUser -UserId 'SawyerM@contoso.com'
Add-EntraGroupMember -GroupId $group.Id -MemberId $user.Id
```

To retrieve group members, use the command:

```powershell
$group = Get-EntraGroup -Filter "displayName eq 'Contoso marketing'"
Get-EntraGroup -GroupId $group.Id | Get-EntraGroupMember | Select-Object Id, DisplayName, '@odata.type' 
```

```Output
Id                                   DisplayName       @odata.type                     
------------------------------------ ----------------- -------------------------------
dddddddd-3333-4444-5555-eeeeeeeeeeee Sawyer Miller     #microsoft.graph.user
eeeeeeee-4444-5555-6666-ffffffffffff Alex Wilber       #microsoft.graph.user
aaaaaaaa-6666-7777-8888-bbbbbbbbbbbb My Application    #microsoft.graph.servicePrincipal
cccccccc-8888-9999-0000-dddddddddddd Contoso Group     #microsoft.graph.group
```

## Add user as a group owner

Add a group owner to a group by running the following command. The `GroupId` is the Group ID and the `OwnerId` is the User ID.

```powershell
$group = Get-EntraGroup -Filter "displayName eq 'Contoso marketing'"
$owner = Get-EntraUser -UserId 'AdeleV@contoso.com'
Add-EntraGroupOwner -GroupId $group.Id -OwnerId $owner.Id
```

To confirm the updated group owner, use the command:

```powershell
$group = Get-EntraGroup -Filter "displayName eq 'Contoso marketing'"
Get-EntraGroup -GroupId $group.Id | Get-EntraGroupOwner | Select-Object Id, DisplayName, '@odata.type'
```

```Output
Id                                   DisplayName       @odata.type
------------------------------------ ----------------- ---------------------------
aaaaaaaa-6666-7777-8888-bbbbbbbbbbbb Adele Vance       #microsoft.graph.user
```

## Query ownerless or empty groups

To query groups without owners, run the following command.

```powershell
$allGroups = Get-EntraGroup -All
$groupsWithoutOwners = foreach ($group in $allGroups) {
    $owners = Get-EntraGroupOwner -GroupId $group.Id
    if ($owners.Count -eq 0) {
        $group
    }
}
$groupsWithoutOwners | Format-Table DisplayName, Id, GroupTypes
```

```Output
DisplayName              Id                                   GroupTypes
-----------              --                                   ----------
Contoso marketing        aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb {}
HelpDesk admin group     eeeeeeee-4444-5555-6666-ffffffffffff {}
```

To query groups without members (empty groups), run the following command.

```powershell
$allGroups = Get-EntraGroup -All
$groupsWithoutMembers = foreach ($group in $allGroups) {
    $members = Get-EntraGroupMember -GroupId $group.Id
    if ($members.Count -eq 0) {
        $group
    }
}
$groupsWithoutMembers | Format-Table DisplayName, Id, GroupTypes
```

```Output
DisplayName             Id                                   GroupTypes
-----------            --                                   ----------
Contoso marketing      aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb {}
HelpDesk admin group   eeeeeeee-4444-5555-6666-ffffffffffff {}
```

## Clean up resources

To remove the group, use the command:

```powershell
Get-EntraGroup -Filter "displayName eq 'Contoso marketing'" | Remove-EntraGroup
```

## Related content

- [Manage users](manage-user.md)
- [Manage apps](manage-apps.md)
