---
title: Manage administrative units
description: Learn how to manage administrative units for more granular delegation of permissions in Microsoft Entra ID using Microsoft Entra PowerShell.
ms.topic: how-to

ms.date: 06/11/2025
author: csmulligan
manager: dougeby
ms.author: cmulligan

#Customer intent: As an IT admin managing administrative units in Microsoft Entra ID, I want to learn how .....
---
# Manage administrative units

Managing administrative units in Microsoft Entra ID enables IT administrators to delegate permissions more granularly within an organization. Administrative units serve as containers for users, groups, or devices, facilitating role-based access control for specific organizational segments. For an overview of administrative units in Microsoft Entra ID, see [Administrative units](/entra/identity/role-based-access-control/administrative-units).

This article walks you through using Microsoft Entra PowerShell to manage administrative units effectively, with scripts that come together to form a complete demo. By following this guide, you'll learn how to:

- Create administrative units.
- Add members to administrative units
- Assign roles administrative units.
- Clean up the administrative units.

## Prerequisites

- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free][create-account].
- At least the [Privileged Role Administrator][application-administrator] role. 
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Entra PowerShell module][installation] guide to install the module.

## Create administrative units

To create an administrative unit in Microsoft Entra ID you have to use the `New-EntraAdministrativeUnit` cmdlet. Administrative units can be used to delegate permissions for users, groups, and devices within a specific organizational segment.

To create administrative unit, run:

```powershell
    Connect-Entra -Scopes 'AdministrativeUnit.ReadWrite.All'
New-EntraAdministrativeUnit -DisplayName 'Pacific Administrative Unit' -Description 'Administrative Unit for Pacific region'    
```

```Output
DeletedDateTime Id                                   Description DisplayName IsMemberManagementRestricted Visibility
--------------- --                                   ----------- ----------- ---------------------------- ----------
                bbbbbbbb-1111-2222-3333-cccccccccccc Pacific Administrative Unit     test111     False
```

This example demonstrates how to create an administrative unit.

- `-DisplayName` parameter specifies the display name for the Administrative unit object.
- `-Description` parameter specifies a description for the Administrative unit object.

## Add members to administrative units

You can add users, groups, or devices as members of an administrative unit using the `Add-EntraAdministrativeUnitMember` cmdlet. This cmdlet allows you to specify the administrative unit and the member you want to add.

The following example demonstrates adding a user as an administrative unit member. Use `Get-EntraAdministrativeUnit` to find the administrative unit ID and `Get-EntraUser` to find the user ID.

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.ReadWrite.All'
$administrativeUnit = Get-EntraAdministrativeUnit -Filter "DisplayName eq '<administrativeunit-display-name>'"
$user = Get-EntraUser -UserId 'SawyerM@contoso.com'
Add-EntraAdministrativeUnitMember -AdministrativeUnitId $administrativeUnit.Id -MemberId $user.Id
```
<!--- This script doesn;t run for me: Add-EntraAdministrativeUnitMember: A parameter cannot be found that matches parameter name 'MemberId'. This works:
Add-EntraAdministrativeUnitMember -RefObjectId '78dcd7f1-344f-4dfe-84d3-1a99f8b365d0' -AdministrativeUnitId '8d4e6cc9-0073-4799-a94b-6b1711c87633'
It works only with user ID though, RefObjectId doesn;t work with goupId--->

- `AdministrativeUnitId` parameter specifies the ID of an administrative unit.
- `MemberId` parameter specifies the ID of the user, group or device you want to add as a member of the administrative unit.

## Assign roles administrative units

To assign scoped role membership to an administrative unit, you can use the `Add-EntraScopedRoleMembership` cmdlet. The following example shows how to add a user to the specified role within the specified administrative unit.

```powershell
Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory'
$user = Get-EntraUser -UserId 'SawyerM@contoso.com'
$role = Get-EntraDirectoryRole -Filter "DisplayName eq 'Helpdesk Administrator'" 
$administrativeUnit = Get-EntraAdministrativeUnit -Filter "DisplayName eq 'Pacific Administrative Unit'"
$roleMember = New-Object -TypeName Microsoft.Open.MSGraph.Model.MsRoleMemberInfo
$roleMember.Id = $user.Id
Add-EntraScopedRoleMembership -AdministrativeUnitId $administrativeUnit.Id -RoleObjectId $role.Id -RoleMemberInfo $roleMember
```

```Output
Id                                                                AdministrativeUnitId                 RoleId
--                                                                --------------------                 ------
dddddddddddd-bbbb-aaaa-bbbb-cccccccccccc aaaaaaaa-bbbb-aaaa-bbbb-cccccccccccc bbbbbbbb-1111-2222-3333-cccccccccccc
```

- `-AdministrativeUnitId` Parameter specifies the ID of an administrative unit.
- `-RoleObjectId` Parameter specifies the ID of a directory role.
- `-RoleMemberInfo` Parameter specifies a RoleMemberInfo object.

## Update administrative units

To update an existing administrative unit, you can use the `Set-EntraAdministrativeUnit` cmdlet. This cmdlet allows you to modify properties such as display name and description.

To update the display name an administrative unit, run:

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.ReadWrite.All'
$administrativeUnit = Get-EntraAdministrativeUnit -Filter "DisplayName eq 'Pacific Administrative Unit'"
Set-EntraAdministrativeUnit -AdministrativeUnitId $administrativeUnit.Id -DisplayName 'Pacific Admin Unit' -Description 'Pacific Admin Unit Description' -MembershipType 'Assigned'
```

- `-AdministrativeUnitId` parameter specifies the ID of an administrative unit.
- `-DisplayName` parameter specifies the display name for the administrative unit.
- `-Description` parameter specifies the description for the administrative unit.

## Clean up administrative units

To remove a scoped role membership from Microsoft Entra ID run the following `Remove-EntraScopedRoleMembership` cmdlet. To get the administrative unit Id you can use the command `Get-EntraAdministrativeUnit`.

```powershell
Connect-Entra -Scopes 'RoleManagement.Read.Directory'
$role = Get-EntraDirectoryRole -Filter "DisplayName eq 'Helpdesk Administrator'" 
$administrativeUnit = Get-EntraAdministrativeUnit -Filter "DisplayName eq 'Pacific Administrative Unit'"
$roleMembership = Get-EntraScopedRoleMembership -AdministrativeUnitId $administrativeUnit.Id | Where-Object {$_.RoleId -eq $role.Id}
Remove-EntraScopedRoleMembership -AdministrativeUnitId $administrativeUnit.Id -ScopedRoleMembershipId $roleMembership.Id
```

- `-AdministrativeUnitId` parameter specifies the ID of an administrative unit.
- `-ScopedRoleMembershipId` parameter specifies the ID of the scoped role membership to remove. To obtain the details of a scoped role membership, you can use the `Get-EntraScopedRoleMembership` command.

To remove an administrative unit member from Microsoft Entra ID run the following `Remove-EntraAdministrativeUnitMember` cmdlet.

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.Read.All'
$administrativeUnit = Get-EntraAdministrativeUnit -Filter "DisplayName eq 'Pacific Administrative Unit'"
$adminUnitMember = Get-EntraAdministrativeUnitMember -AdministrativeUnitId $administrativeUnit.Id | Select-Object Id, DisplayName,'@odata.type' | Where-Object {$_.DisplayName -eq 'Saywer Miller'}
Remove-EntraAdministrativeUnitMember -AdministrativeUnitId $administrativeUnit.Id -MemberId $adminUnitMember.Id
```

- `-AdministrativeUnitId` parameter specifies the ID of an administrative unit.
- `-MemberId` parameter specifies the ID of the administrative unit member.

To remove administrative unit from Microsoft Entra ID run the following `Remove-EntraAdministrativeUnit` cmdlet. 

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.ReadWrite.All'
$administrativeUnit = Get-EntraAdministrativeUnit -Filter "DisplayName eq '<administrative-unit-display-name>'"
Remove-EntraAdministrativeUnit -AdministrativeUnitId $administrativeUnit.Id
```

## Related content

- [Administrative units][administrative-units]

<!-- Link definitions -->

[administrative-units]: /powershell/module/microsoft.entra/?view=entra-powershell#administrative-units
[application-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=%2Fpowershell%2Fentra-powershell%2Ftoc.json&bc=%2Fpowershell%2Fentra-powershell%2Fbreadcrumb%2Ftoc.json#privileged-role-administrator
[installation]: installation.md
[create-acount]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F







