---
title: Recover deleted data
description: Learn how to restore soft-deleted users, groups, and apps with Microsoft Entra PowerShell. Learn cmdlets, steps, and pipelining solutions for one-step data recovery.
ms.topic: how-to
ms.date: 02/12/2025
author: csmulligan
manager: CelesteDG
ms.author: cmulligan
ms.reviewer: stevemutungi

#Customer intent: As an IT admin I want to learn how to recover deleted data in Microsoft Entra PowerShell so that I can restore deleted objects in my organization.
---

# Recover deleted data

This article explains how to find and recover deleted data using Microsoft Entra PowerShell.

If you accidentally delete data from your directory, you can recover it using Microsoft Entra PowerShell. You can restore deleted objects, such as applications, groups, service principals, administrative units, or user objects, within 30 days of deletion. After 30 days, the data is permanently deleted and can't be recovered.

## Prerequisites

To recover deleted data with Microsoft Entra PowerShell, you need:

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Microsoft Entra PowerShell module installed. Follow the [Install Microsoft Entra PowerShell module](installation.md) guide to install the module.
- Grant yourself the least privileged delegated permission indicated for the operation.

## Restore groups

To restore deleted groups, you need at least the [Groups Administrator](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#groups-administrator) role. For role-assignable groups, you must have the [Privileged Role Administrator](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#privileged-role-administrator) role.

> [!NOTE]
> Only Unified Groups (also known as Office 365 Groups) can be restored; Security groups can't be restored.

### Step 1: Find deleted groups

Use the [Get-EntraDeletedGroup](/powershell/module/microsoft.entra/get-entradeletedgroup) cmdlet to find deleted groups.

```powershell
Connect-Entra -Scopes 'Group.Read.All'
Get-EntraDeletedGroup
```

This cmdlet retrieves soft-deleted groups, which can be recovered within 30 days. After 30 days, the group is permanently deleted and can't be recovered.

```Output
DisplayName Id                                   MailNickname Description GroupTypes
----------- --                                   ------------ ----------- ----------
test21      00aa00aa-bb11-cc22-dd33-44ee44ee44ee test21       desc1       {Unified, DynamicMembership}
test22      11bb11bb-cc22-dd33-ee44-55ff55ff55ff test22       desc2       {Unified, DynamicMembership}
test23      22cc22cc-dd33-ee44-ff55-66aa66aa66aa test23       desc3       {Unified, DynamicMembership}
test24      33dd33dd-ee44-ff55-aa66-77bb77bb77bb test24       desc4       {Unified, DynamicMembership}
```

### Step 2: Restore soft-deleted groups

After identifying the group to restore, use the [Restore-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra/restore-entradeleteddirectoryobject) cmdlet with the `-Id` parameter to specify the object ID of the deleted group.

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All' 
$group = Get-EntraDeletedGroup -Filter "displayName eq 'test21'"
Restore-EntraDeletedDirectoryObject -Id $group.Id
```

The output shows the group ID and the deleted date and time as empty, indicating that the group has been restored.
```Output
Id                                   DeletedDateTime
--                                   ---------------
00aa00aa-bb11-cc22-dd33-44ee44ee44ee
```

You can also restore the group in one step if you know its display name or group ID, using pipelining:

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All' 
Get-EntraDeletedGroup -Filter "displayName eq 'test21'" | Restore-EntraDeletedDirectoryObject #if you know the display name
Get-EntraDeletedGroup -Id '00aa00aa-bb11-cc22-dd33-44ee44ee44ee' | Restore-EntraDeletedDirectoryObject #if you know the group ID
```

## Restore applications

To restore deleted applications, you need one of the following Microsoft Entra roles: [Application Administrator](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#application-administrator), [Cloud Application Administrator](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#cloud-application-administrator), or [Hybrid Identity Administrator](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#hybrid-identity-administrator).

Applications have two objects: the application registration and the service principal. For more information on the differences between the registration and the service principal, see [Apps and service principals in Microsoft Entra ID](/entra/identity-platform/app-objects-and-service-principals).
When you delete an application, the application registration by default enters the soft-deleted state.

### Step 1: Find deleted applications

To restore a soft-deleted application, you can use the [Get-EntraDeletedApplication](/powershell/module/microsoft.entra/get-entradeletedapplication) cmdlet first, to get the deleted application's details.

```powershell
Connect-Entra -Scopes 'Application.Read.All'
Get-EntraDeletedApplication -All
```

In the returned list, you can see the display name, ID, application ID, sign-in audience, and publisher domain of the deleted applications.

```Output
DisplayName Id                                   AppId                                 SignInAudience PublisherDomain
----------- --                                   -----                                 -------------- ---------------
TestApp1    aaaaaaaa-bbbb-cccc-1111-222222222222 00001111-aaaa-2222-bbbb-3333cccc4444  AzureADMyOrg   contoso.com
TestApp2    bbbbbbbb-cccc-dddd-2222-333333333333 11112222-bbbb-3333-cccc-4444dddd5555  AzureADMyOrg   contoso.com
TestApp3    cccccccc-dddd-eeee-3333-444444444444 22223333-cccc-4444-dddd-5555eeee6666  AzureADMyOrg   contoso.com
```

To get the deleted application by display name, use the following command:

```powershell
Connect-Entra -Scopes 'Application.Read.All'
Get-EntraDeletedApplication -Filter "displayName eq 'TestApp1'"
```

In the result, you can see the same details as in the previous example.

```Output
DisplayName Id                                   AppId                                SignInAudience PublisherDomain
----------- --                                   -----                                -------------- ---------------
TestApp1    aaaaaaaa-bbbb-cccc-1111-222222222222 00001111-aaaa-2222-bbbb-3333cccc4444 AzureADMyOrg   contoso.com
```

### Step 2: Restore soft-deleted applications

After identifying the app to restore, use the [Restore-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra/restore-entradeleteddirectoryobject) cmdlet with the `-Id` parameter to specify the service principal ID. Restoring an application doesn’t automatically restore its service principal—you need to run this cmdlet separately to restore the deleted service principal.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All' 
Restore-EntraDeletedDirectoryObject -Id 'aaaaaaaa-bbbb-cccc-1111-222222222222'
```

Once the application is restored, the output shows the application ID and the deleted date and time as empty, indicating that the application has been restored.
```Output
Id                                   DeletedDateTime
--                                   ---------------
aaaaaaaa-bbbb-cccc-1111-222222222222
```

You can also restore the application in one step if you know its display name, using pipelining:

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All' 
Get-EntraDeletedApplication -Filter "displayName eq 'TestApp1'" | Restore-EntraDeletedDirectoryObject
```

## Restore users

To restore deleted users, you need at least the [User Administrator](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#user-administrator) role.

After a user is deleted, their account remains in a suspended state for 30 days, during which it can be fully restored. Once this 30-day period ends, the account is permanently deleted, and management of soft-deleted users is no longer possible.

### Step 1: Find deleted users

To restore a soft-deleted user with Microsoft Entra PowerShell, use the [Get-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra/get-entradeleteddirectoryobject) cmdlet to find the deleted user's ID.

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraDeletedDirectoryObject -DirectoryObjectId '00aa00aa-bb11-cc22-dd33-44ee44ee44ee'
```

### Step 2: Restore soft-deleted users

Once you have the deleted user's ID,  use the [Restore-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra/restore-entradeleteddirectoryobject) cmdlet to restore the user.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Restore-EntraDeletedDirectoryObject -Id '00aa00aa-bb11-cc22-dd33-44ee44ee44ee' 
```

The result shows the user ID and the deleted date and time as empty, indicating that the user has been restored.
```Output
Id                                   DeletedDateTime
--                                   ---------------
00aa00aa-bb11-cc22-dd33-44ee44ee44ee
```

If you already know the user's ID, you can restore it in one step using pipelining:

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Get-EntraDeletedDirectoryObject -Id '00aa00aa-bb11-cc22-dd33-44ee44ee44ee' | Restore-EntraDeletedDirectoryObject
```

> [!NOTE]
> When a user is restored, any licenses assigned at the time of deletion are also restored, even if none are available. If you're consuming more licenses than you purchased, your organization could be temporarily out of compliance for license usage.

## Related content

For more examples visit the following articles:

- [Get-EntraDeletedGroup](/powershell/module/microsoft.entra/get-entradeletedgroup?)
- [Get-EntraDeletedApplication](/powershell/module/microsoft.entra/get-entradeletedapplication)
- [Get-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra/get-entradeleteddirectoryobject?)
- [Restore-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra/restore-entradeleteddirectoryobject)
