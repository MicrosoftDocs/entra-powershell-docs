---
title: Recover deleted data
description: Learn how to restore soft-deleted users, groups, and apps with Microsoft Entra PowerShell. Learn cmdlets, steps, and pipelining solutions for one-step data recovery.
ms.topic: how-to
ms.date: 02/18/2025
author: csmulligan
manager: CelesteDG
ms.author: cmulligan
ms.reviewer: stevemutungi

#Customer intent: As an IT admin I want to learn how to recover deleted data in Microsoft Entra PowerShell so that I can restore deleted objects in my organization.
---

# Recover deleted data with Microsoft Entra PowerShell

If you accidentally delete data from your directory, you can recover it using Microsoft Entra PowerShell. You can restore deleted objects, such as applications, groups, service principals, administrative units, or user objects, within 30 days of deletion. After 30 days, the data is permanently deleted and can't be recovered.

This article explains how to find and recover deleted data using Microsoft Entra PowerShell.

## Prerequisites

To recover deleted data with Microsoft Entra PowerShell, you need:

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Microsoft Entra PowerShell module installed. Follow the [Install Microsoft Entra PowerShell module](installation.md) guide to install the module.
- One of the following roles: 
  - [Groups Administrator][groups-administrator] to restore deleted groups
  - [User Administrator][user-administrator] to restore deleted users
  - [Privileged Role Administrator][privileged-role-administrator] to restore role-assignable groups and deleted administrative units
  - To restore deleted applications or service principals:
     - [Application Administrator][application-administrator]
     - [Cloud Application Administrator][cloud-application-administrator]
     - [Hybrid Identity Administrator][hybrid-identity-administrator]

## Restore groups

The following steps will guide you through restoring deleted groups.

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

After identifying the group to restore, use the [Restore-EntraDeletedDirectoryObject][restore-entradeleteddirectoryobject] cmdlet with the `-Id` parameter to specify the object ID of the deleted group.

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All' 
$group = Get-EntraDeletedGroup -Filter "displayName eq 'test21'"
Restore-EntraDeletedDirectoryObject -Id $group.Id
```

The output shows the group ID and the deleted date and time as empty, indicating that the group is restored.

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

The following steps will guide you through restoring deleted applications.

Applications have two objects: the application registration and the service principal. For more information on the differences between the registration and the service principal, see [Apps and service principals in Microsoft Entra ID](/entra/identity-platform/app-objects-and-service-principals).
When you delete an application, the application registration by default enters the soft-deleted state.

### Step 1: Find deleted applications

To restore a soft-deleted application, you can use the [Get-EntraDeletedApplication][get-entradeletedapplication] cmdlet first, to get the deleted application's details.

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

After identifying the app to restore, use the [Restore-EntraDeletedDirectoryObject][restore-entradeleteddirectoryobject] cmdlet with the `-Id` parameter to specify the service principal ID. Restoring an application doesn’t automatically restore its service principal—you need to run this cmdlet separately to restore the deleted service principal.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All' 
Restore-EntraDeletedDirectoryObject -Id 'aaaaaaaa-bbbb-cccc-1111-222222222222'
```

Once the application is restored, the output shows the application ID and the deleted date and time as empty, indicating that the application is restored.

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

## Restore service principals

The following steps will guide you through restoring service principals.

### Step 1: Find deleted service principals

To restore a soft-deleted service principal, you can use the [Get-EntraDeletedServicePrincipal][get-entradeletedserviceprincipal] cmdlet first, to get the deleted service principal's details.

```powershell
Connect-Entra -Scopes 'Application.Read.All'
Get-EntraDeletedServicePrincipal -All
```

In the returned list, you can see the display name, ID, service principal ID, sign-in audience, and publisher domain of the deleted service principals.

```Output
DisplayName           Id                                   AppId                                SignInAudience ServicePrincipalType
-----------           --                                   -----                                -------------- --------------------
Contoso Fieldglass    bbbbbbbb-cccc-dddd-2222-333333333333 00001111-aaaa-2222-bbbb-3333cccc4444 AzureADMyOrg   Application
Contoso Application   cccccccc-dddd-eeee-3333-444444444444 11112222-bbbb-3333-cccc-4444dddd5555                Application
```

To get the deleted service principal by display name, use the following command:

```powershell
Connect-Entra -Scopes 'Application.Read.All'
Get-EntraDeletedServicePrincipal -Filter "displayName eq 'Contoso Fieldglass'"
```

In the result, you can see the same details as in the previous example.

```Output
DisplayName           Id                                   AppId                                SignInAudience ServicePrincipalType
-----------           --                                   -----                                -------------- --------------------
Contoso Fieldglass    bbbbbbbb-cccc-dddd-2222-333333333333 00001111-aaaa-2222-bbbb-3333cccc4444 AzureADMyOrg   Application
```

### Step 2: Restore soft-deleted service principals

After identifying the service principal to restore, use the [Restore-EntraDeletedDirectoryObject][restore-entradeleteddirectoryobject] cmdlet with the `-Id` parameter to specify the service principal ID.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All' 
Restore-EntraDeletedDirectoryObject -Id 'aaaaaaaa-bbbb-cccc-1111-222222222222'
```

Once the service principal is restored, the output shows the service principal ID and the deleted date and time as empty, indicating that the service principal is restored.

```Output
Id                                   DeletedDateTime
--                                   ---------------
aaaaaaaa-bbbb-cccc-1111-222222222222
```

You can also restore the service principal in one step if you know its display name, using pipelining:

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All' 
Get-EntraDeletedServicePrincipal -Filter "displayName eq 'Contoso Fieldglass'" | Restore-EntraDeletedDirectoryObject
```

## Restore users

The following steps will guide you through restoring deleted users. After a user is deleted, their account remains in a suspended state for 30 days, during which it can be fully restored. Once this 30-day period ends, the account is permanently deleted, and management of soft-deleted users is no longer possible.

### Step 1: Find deleted users

To restore a soft-deleted user with Microsoft Entra PowerShell, use the [Get-EntraDeletedUser][get-entradeleteduser] cmdlet to find the deleted user's ID.

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraDeletedUser -Filter "displayName eq 'Avery Smith'"
```

### Step 2: Restore soft-deleted users

Once you have the deleted user's ID,  use the [Restore-EntraDeletedDirectoryObject][restore-entradeleteddirectoryobject] cmdlet to restore the user.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Restore-EntraDeletedDirectoryObject -Id '00aa00aa-bb11-cc22-dd33-44ee44ee44ee' 
```

The result shows the user ID and the deleted date and time as empty, indicating that the user is restored.

```Output
Id                                   DeletedDateTime
--                                   ---------------
00aa00aa-bb11-cc22-dd33-44ee44ee44ee
```

If you already know the user's ID, you can restore it in one step using pipelining:

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Get-EntraDeletedUser -Filter "displayName eq 'Avery Smith'" | Restore-EntraDeletedDirectoryObject
```

> [!NOTE]
> When a user is restored, any licenses assigned at the time of deletion are also restored, even if none are available. If you're consuming more licenses than you purchased, your organization could be temporarily out of compliance for license usage.

## Restore administrative units

The following steps will guide you through restoring administrative units.

### Step 1: Find deleted administrative units

To restore a soft-deleted administrative unit, you can use the [Get-EntraDeletedAdministrativeUnit][get-entradeletedadministrativeunit] cmdlet first, to get the deleted administrative unit's details.

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.Read.All'
Get-EntraDeletedAdministrativeUnit -All | Format-List
```

The list shows the display name, ID, administrative unit ID, sign-in audience, and publisher domain of deleted administrative units.

```Output
DeletionAgeInDays             : 5
DeletedDateTime               : 2/12/2025 12:40:52 PM
Description                   : Pacific Administrative Unit
DisplayName                   : Pacific Administrative Unit
Extensions                    :
Id                            : bbbbbbbb-cccc-dddd-2222-333333333333
IsMemberManagementRestricted  :
Members                       :
MembershipRule                : (user.country -eq "Australia")
MembershipRuleProcessingState : On
MembershipType                : Dynamic
ScopedRoleMembers             :
Visibility                    : HiddenMembership
AdditionalProperties          : {}
```

To get the deleted administrative unit by display name, use the following command:

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.Read.All'
Get-EntraDeletedAdministrativeUnit -Filter "displayName eq 'Pacific Administrative Unit'"
```

In the result, you can see the same details as in the previous example.

```Output
DeletionAgeInDays             : 5
DeletedDateTime               : 2/12/2025 12:40:52 PM
Description                   : Pacific Administrative Unit
DisplayName                   : Pacific Administrative Unit
Extensions                    :
Id                            : bbbbbbbb-cccc-dddd-2222-333333333333
IsMemberManagementRestricted  :
Members                       :
MembershipRule                : (user.country -eq "Australia")
MembershipRuleProcessingState : On
MembershipType                : Dynamic
ScopedRoleMembers             :
Visibility                    : HiddenMembership
AdditionalProperties          : {}
```

### Step 2: Restore soft-deleted administrative units

After identifying the administrative unit to restore, use the [Restore-EntraDeletedDirectoryObject][restore-entradeleteddirectoryobject] cmdlet with the `-Id` parameter to specify the administrative unit ID.

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.ReadWrite.All'
Restore-EntraDeletedDirectoryObject -Id 'aaaaaaaa-bbbb-cccc-1111-222222222222'
```

Once the administrative unit is restored, the output shows the administrative unit ID and the deleted date and time as empty, indicating that the administrative unit is restored.

```Output
Id                                   DeletedDateTime
--                                   ---------------
aaaaaaaa-bbbb-cccc-1111-222222222222
```

You can also restore the administrative unit in one step if you know its display name, using pipelining:

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.ReadWrite.All'
Get-EntraDeletedAdministrativeUnit -Filter "displayName eq 'Pacific Administrative Unit'" | Restore-EntraDeletedDirectoryObject
```

## Related content

For more examples visit the following articles:

- [Get-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra/get-entradeleteddirectoryobject)
- [Restore-EntraDeletedDirectoryObject][restore-entradeleteddirectoryobject]

<!-- Link definitions -->

[restore-entradeleteddirectoryobject]: /powershell/module/microsoft.entra/restore-entradeleteddirectoryobject
[get-entradeletedapplication]: /powershell/module/microsoft.entra/get-entradeletedapplication
[get-entradeletedserviceprincipal]: /powershell/module/microsoft.entra/get-entradeletedserviceprincipal
[get-entradeleteduser]: /powershell/module/microsoft.entra/get-entradeleteduser
[get-entradeletedadministrativeunit]: /powershell/module/microsoft.entra/get-entradeletedadministrativeunit
[application-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=%2Fpowershell%2Fentra-powershell%2Ftoc.json&bc=%2Fpowershell%2Fentra-powershell%2Fbreadcrumb%2Ftoc.json#application-administrator
[cloud-application-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=%2Fpowershell%2Fentra-powershell%2Ftoc.json&bc=%2Fpowershell%2Fentra-powershell%2Fbreadcrumb%2Ftoc.json#cloud-application-administrator
[hybrid-identity-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=%2Fpowershell%2Fentra-powershell%2Ftoc.json&bc=%2Fpowershell%2Fentra-powershell%2Fbreadcrumb%2Ftoc.json#hybrid-identity-administrator
[user-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=%2Fpowershell%2Fentra-powershell%2Ftoc.json&bc=%2Fpowershell%2Fentra-powershell%2Fbreadcrumb%2Ftoc.json#user-administrator
[groups-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=%2Fpowershell%2Fentra-powershell%2Ftoc.json&bc=%2Fpowershell%2Fentra-powershell%2Fbreadcrumb%2Ftoc.json#groups-administrator
[privileged-role-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=%2Fpowershell%2Fentra-powershell%2Ftoc.json&bc=%2Fpowershell%2Fentra-powershell%2Fbreadcrumb%2Ftoc.json#privileged-role-administrator
