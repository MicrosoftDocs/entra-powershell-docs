---
title: Recover deleted data
description: Learn how to recover deleted application, group, service principal, administrative unit, or user objects in Microsoft Entra PowerShell.
ms.topic: how-to
ms.date: 10/24/2024
author: csmulligan
manager: CelesteDG
ms.author: cmulligan
ms.reviewer: stevemutungi

#Customer intent: As an IT admin I want to learn how to recover deleted data in Microsoft Entra PowerShell so that I can restore deleted objects in my organization.
---

# Recover deletable data in Microsoft Entra PowerShell

If you have accidentally deleted data from your directory there may be some options for recovering the lost data using Microsoft Entra PowerShell. You can recover deleted objects, such as application, group, service principal, administrative unit, or user objects in the first 30 days after deletion. After 30 days, the deleted object is permanently deleted and cannot be recovered.
This article explains how to find and recover deleted data using Microsoft Entra PowerShell.

## Prerequisites

To manage roles with Microsoft Entra PowerShell, you need:

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Microsoft Entra PowerShell module installed. Follow the [Install Microsoft Entra PowerShell module](installation.md) guide to install the module.
- Grant yourself the least privileged delegated permission indicated for the operation.

## Restore deleted groups

To restore a deleted group, use the `Get-EntraDeletedGroup` cmdlet to list the deleted groups. This cmdlet retrieves soft-deleted groups from a directory. When a group is deleted, it is soft deleted and can be recovered within 30 days. After 30 days, the group is permanently deleted and cannot be recovered.

> [!NOTE]
> Only Unified Groups (also known as Office 365 Groups) can be restored; Security groups cannot be restored.

To restore deleted groups you must have at least the [Groups Administrator role](/entra/identity/role-based-access-control/permissions-reference#groups-administrator) role. However, to restore role-assignable groups, the calling user must be assigned the [Privileged Role Administrator](/entra/identity/role-based-access-control/permissions-reference#privileged-role-administrator) role.

To find all recoverable deleted groups, use the following command:

```powershell
Connect-Entra -Scopes 'Group.Read.All'
Get-EntraDeletedGroup
```

```Output
DisplayName Id                                   MailNickname Description GroupTypes
----------- --                                   ------------ ----------- ----------
test21      00aa00aa-bb11-cc22-dd33-44ee44ee44ee test21       desc1       {Unified, DynamicMembership}
test22      11bb11bb-cc22-dd33-ee44-55ff55ff55ff test22       desc2       {Unified, DynamicMembership}
test23      22cc22cc-dd33-ee44-ff55-66aa66aa66aa test23       desc3       {Unified, DynamicMembership}
test24      33dd33dd-ee44-ff55-aa66-77bb77bb77bb test24       desc4       {Unified, DynamicMembership}
```

Once you have identified the group you want to restore, use the `Restore-EntraDeletedDirectoryObject` cmdlet to restore the deleted group. The `-Id` parameter specifies the object ID of the deleted group to restore.

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All' 
Restore-EntraDeletedDirectoryObject -Id '00aa00aa-bb11-cc22-dd33-44ee44ee44ee'
```

```Output
Id                                   DeletedDateTime
--                                   ---------------
00aa00aa-bb11-cc22-dd33-44ee44ee44ee
```

## Restore deleted applications

Applications have two objects: the application registration and the service principal. For more information on the differences between the registration and the service principal, see [Apps and service principals in Microsoft Entra ID](/entra/identity-platform/app-objects-and-service-principals).
When you delete an application, the application registration by default enters the soft-delete state. To restore a soft-deleted application, we recommend to use the `Get-EntraDeletedApplication` cmdlet first, to get the deleted application's details.

To restore deleted applications  ------itt tartok---------------- 
To restore deleted applications or service principals: Application Administrator, Cloud Application Administrator, or Hybrid Identity Administrator.  https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.entra/restore-entradeleteddirectoryobject?view=entra-powershell


you must have at least the [Groups Administrator role](/entra/identity/role-based-access-control/permissions-reference#groups-administrator) role. However, to restore role-assignable groups, the calling user must be assigned the [Privileged Role Administrator](/entra/identity/role-based-access-control/permissions-reference#privileged-role-administrator) role.




## Get-EntraDeletedDirectoryObject

## Next step -or- Related content


