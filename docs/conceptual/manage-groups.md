---
title: Manage groups
description: Learn how to create, edit, update, and delete a group in Microsoft Entra PowerShell.
ms.topic: how-to
ms.date: 10/05/2024
author: csmulligan
manager: CelesteDG
ms.author: cmulligan
ms.reviewer: stevemutungi

#Customer intent: As an IT admin managing groups and users in Microsoft Entra ID, I want to learn hot to create, edit and update a group in Microsoft Entra PowerShell so that I can automate group management tasks.
---

# Manage groups

In this tutorial, you learn how to create, edit, update, and delete a group in Microsoft Entra PowerShell. You also learn how to add and remove users from a group.

## Prerequisites

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Install the latest Microsoft Entra PowerShell module. For more information, see [Install the Microsoft Entra PowerShell module](installation.md).
- Have at least the [Groups Administrator role](/entra/identity/role-based-access-control/permissions-reference#groups-administrator).

## Create groups

To create a group, make sure you have the required permissions to create a group.

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All' 
```

To create a new group, run the following command.

```powershell
$groupParams = @{
    DisplayName = 'My new group'
    MailEnabled = $false
    SecurityEnabled = $true
    MailNickName = 'NotSet'
}
New-EntraGroup @groupParams
```

```Output
DisplayName  Id                                   MailNickname Description GroupTypes
-----------  --                                   ------------ ----------- ----------
My new group aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb NotSet                   {}
```

This command creates a new group with the name `My new group`.

Search for the created group by using the following command.

```powershell
Get-EntraGroup -Filter "DisplayName eq 'My new group'"
```

```Output
DisplayName        Id                                   MailNickname     Description        GroupTypes
-----------        --                                   ------------     -----------        ----------
My new group       aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb NotSet       My new group        {Unified}
```

This command returns the details of the newly created group. You can also use the `GroupId` (GUID) to search, update, or delete the group.

## Update groups

Update the group description by running the following command. The `GroupId` is the Group ID.

```powershell
$group = Get-EntraGroup -Filter "DisplayName eq 'My new group'"
$groupParams = @{
    GroupId = $group.Id
    Description = 'This is my new updated group details'
}
Set-EntraGroup @groupParams
```

To confirm the updated description, run the [Get-EntraGroup](/powershell/module/microsoft.graph.entra/get-entragroup) again.

```powershell
Get-EntraGroup -Filter "DisplayName eq 'My new group'"  
```

## Add a user to a group

Add a user to the group by running the following command. The `GroupId` is the Group ID and the `RefObjectId` is the User ID. You can get the User ID from the [Microsoft Entra admin center](https://entra.microsoft.com/) or by running the [Get-EntraUser](/powershell/module/microsoft.graph.entra/get-entrauser) command.

```powershell
$group = Get-EntraGroup -Filter "DisplayName eq 'My new group'"
$user = Get-EntraUser -UserId 'SawyerM@contoso.com'
$memberParams = @{
    GroupId = $group.Id
    RefObjectId = $user.Id
}
Add-EntraGroupMember @memberParams
```

## Add a user as a group owner

Add a group owner to a group by running the following command. The `GroupId` is the Group ID and the `RefObjectId` is the User ID.

```powershell
$group = Get-EntraGroup -Filter "DisplayName eq 'My new group'"
$owner = Get-EntraUser -UserId 'AdeleV@contoso.com'
$ownerParams = @{
    GroupId = $group.Id
    RefObjectId = $owner.Id
}
Add-EntraGroupOwner @ownerParams
```

To confirm the updated group owner, run the [Get-EntraGroupOwner](/powershell/module/microsoft.graph.entra/get-entragroupowner) command. This command returns the User ID of one or more group owners.

```powershell
$group = Get-EntraGroup -Filter "DisplayName eq 'My new group'"
Get-EntraGroupOwner -GroupId $group.Id
```

```Output
Id                                   DeletedDateTime
--                                   ---------------
aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb
eeeeeeee-4444-5555-6666-ffffffffffff
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
DisplayName           Id                                   GroupTypes
-----------           --                                   ----------
My new group          aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb {}
HelpDesk admin group  eeeeeeee-4444-5555-6666-ffffffffffff {}
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
DisplayName           Id                                   GroupTypes
-----------           --                                   ----------
My new group          aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb {}
HelpDesk admin group  eeeeeeee-4444-5555-6666-ffffffffffff {}
```

## Clean up resources

To remove the group, run the following command.

```powershell
$group = Get-EntraGroup -Filter "DisplayName eq 'My new group'"
Remove-EntraGroup -GroupId $group.Id
```

## Related content

- [Manage users](manage-user.md)
- [Manage apps](manage-apps.md)
