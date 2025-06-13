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

Managing administrative units in Microsoft Entra ID lets IT admins delegate permissions more granularly in an organization. Administrative units are containers for users, groups, or devices, and help with role-based access control for specific organizational segments. For an overview of administrative units in Microsoft Entra ID, see [Administrative units](/entra/identity/role-based-access-control/administrative-units).

This article shows you how to use Microsoft Entra PowerShell to manage administrative units with scripts that form a complete demo. By following this guide, you learn how to: 

- Create administrative units 
- Assign roles to administrative units 
- Add members to administrative units
- Update properties of administrative units
- Clean up the resources

## Prerequisites

- A Microsoft Entra user account. If you don't have one, [create an account for free][create-account].
- At least the [Privileged Role Administrator][application-administrator] role. 
- Microsoft Entra PowerShell module. Follow the [Install the Microsoft Entra PowerShell module][installation] guide to install the module.

## Create administrative units

Create an administrative unit in Microsoft Entra ID by using the `New-EntraAdministrativeUnit` cmdlet. Administrative units let you delegate permissions for users, groups, and devices within a specific organizational segment.

To create an administrative unit, run:

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.ReadWrite.All'
New-EntraAdministrativeUnit -DisplayName 'Pacific Administrative Unit' -Description 'Administrative Unit for Pacific region'    
```

```Output
DeletedDateTime Id                                   Description DisplayName IsMemberManagementRestricted Visibility
--------------- --                                   ----------- ----------- ---------------------------- ----------
                bbbbbbbb-1111-2222-3333-cccccccccccc Pacific Administrative Unit     test111     False
```

## Assign roles to administrative units

Assign scoped role membership to an administrative unit by using the `Add-EntraScopedRoleMembership` cmdlet. The following example shows how to add a user to a role in an administrative unit.

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

## Add members to administrative units

Add users, groups, or devices to an administrative unit with the `Add-EntraAdministrativeUnitMember` cmdlet. This cmdlet lets you specify the administrative unit and the member to add.

The following example shows how to add a user as an administrative unit member. Use `Get-EntraAdministrativeUnit` to find the administrative unit ID and `Get-EntraUser` to find the user ID. The `MemberId` parameter specifies the ID of the user, group, or device to add as a member of the administrative unit.

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.ReadWrite.All'
$administrativeUnit = Get-EntraAdministrativeUnit -Filter "DisplayName eq '<administrativeunit-display-name>'"
$user = Get-EntraUser -UserId 'SawyerM@contoso.com'
Add-EntraAdministrativeUnitMember -AdministrativeUnitId $administrativeUnit.Id -MemberId $user.Id
```
<!--- This script doesn't run for me: Add-EntraAdministrativeUnitMember: A parameter cannot be found that matches parameter name 'MemberId'. This works:
Add-EntraAdministrativeUnitMember -RefObjectId '78dcd7f1-344f-4dfe-84d3-1a99f8b365d0' -AdministrativeUnitId '8d4e6cc9-0073-4799-a94b-6b1711c87633'
It works only with user ID though, RefObjectId doesn't work with goupId--->

## Update properties of administrative units

Update an existing administrative unit with the `Set-EntraAdministrativeUnit` cmdlet. Use this cmdlet to change properties like display name and description.

To update the display name of an administrative unit, run:

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.ReadWrite.All'
$administrativeUnit = Get-EntraAdministrativeUnit -Filter "DisplayName eq 'Pacific Administrative Unit'"
Set-EntraAdministrativeUnit -AdministrativeUnitId $administrativeUnit.Id -DisplayName 'Pacific Admin Unit' -Description 'Pacific Admin Unit Description' -MembershipType 'Assigned'
```

## Clean up resources

Remove a scoped role membership from Microsoft Entra ID by running the `Remove-EntraScopedRoleMembership` cmdlet. Get the administrative unit ID with the `Get-EntraAdministrativeUnit` command. Get details of a scoped role membership for the `ScopedRoleMembershipId` parameter with the `Get-EntraScopedRoleMembership` command.

```powershell
Connect-Entra -Scopes 'RoleManagement.Read.Directory'
$role = Get-EntraDirectoryRole -Filter "DisplayName eq 'Helpdesk Administrator'" 
$administrativeUnit = Get-EntraAdministrativeUnit -Filter "DisplayName eq 'Pacific Administrative Unit'"
$roleMembership = Get-EntraScopedRoleMembership -AdministrativeUnitId $administrativeUnit.Id | Where-Object {$_.RoleId -eq $role.Id}
Remove-EntraScopedRoleMembership -AdministrativeUnitId $administrativeUnit.Id -ScopedRoleMembershipId $roleMembership.Id
```

Remove an administrative unit member from Microsoft Entra ID by running the `Remove-EntraAdministrativeUnitMember` cmdlet.

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.Read.All'
$administrativeUnit = Get-EntraAdministrativeUnit -Filter "DisplayName eq 'Pacific Administrative Unit'"
$adminUnitMember = Get-EntraAdministrativeUnitMember -AdministrativeUnitId $administrativeUnit.Id | Select-Object Id, DisplayName,'@odata.type' | Where-Object {$_.DisplayName -eq 'Saywer Miller'}
Remove-EntraAdministrativeUnitMember -AdministrativeUnitId $administrativeUnit.Id -MemberId $adminUnitMember.Id
```

Remove an administrative unit from Microsoft Entra ID by running the `Remove-EntraAdministrativeUnit` cmdlet.

```powershell
Connect-Entra -Scopes 'AdministrativeUnit.ReadWrite.All'
$administrativeUnit = Get-EntraAdministrativeUnit -Filter "DisplayName eq '<administrative-unit-display-name>'"
Remove-EntraAdministrativeUnit -AdministrativeUnitId $administrativeUnit.Id
```

## Related content

- [Administrative units][administrative-units]

<!-- Link definitions -->

[administrative-units]: https://learn.microsoft.com/en-us/powershell/module/microsoft.entra/?view=entra-powershell#administrative-units
[application-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=%2Fpowershell%2Fentra-powershell%2Ftoc.json&bc=%2Fpowershell%2Fentra-powershell%2Fbreadcrumb%2Ftoc.json#privileged-role-administrator
[installation]: installation.md
[create-acount]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F







