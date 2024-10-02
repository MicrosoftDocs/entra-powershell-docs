---
title: Manage roles with Microsoft Entra PowerShell
description: Learn to assign roles to users using Microsoft Entra PowerShell, with guidance on both standard role assignments and those involving Privileged Identity Management (PIM).

author: csmulligan
manager: CelesteDG
ms.topic: how-to
ms.date: 09/13/2024
ms.author: cmulligan
ms.reviewer: stevemutungi

#Customer intent: As an IT admin managing roles and users in Microsoft Entra ID, I want to learn how to assign a role to a user with Microsoft Entra PowerShell.
---

# Manage roles

A role in Microsoft Entra is a set of permissions. Roles control access to resources such as users, groups, and applications. In this article, you learn how to use Microsoft Entra PowerShell to manage roles.


## Prerequisites

To manage roles with Microsoft Entra PowerShell, you need:

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Grant yourself the least privileged delegated permission indicated for the operation.
- Microsoft Entra PowerShell module installed. Follow the [Install Microsoft Entra PowerShell module](installation.md) guide to install the module.

## Find role definitions

A role definition is a collection of permissions that can be performed, such as read, write, and delete. It's typically called a role. Microsoft Entra ID has over 60 built-in roles or you can create your own custom roles. If you ever wondered "What these roles really do?", you can see a detailed list of permissions for each of the roles.

To get all  the role definitions, run the following [Get-EntraDirectoryRoleDefinition](/powershell/module/microsoft.graph.entra/get-entradirectoryroledefinition) command with at least the [Directory Readers](/entra/identity/role-based-access-control/permissions-reference#directory-readers) role.

```powershell
Connect-Entra -Scopes 'RoleManagement.Read.Directory','EntitlementManagement.Read.All'
Get-EntraDirectoryRoleDefinition
```

```Output
DisplayName                                   Id                                   TemplateId                           Description
-----------                                   --                                   ----------                           -----------
Guest User                                    10dae51f-b6af-4016-8d66-8c2a99b929b3 10dae51f-b6af-4016-8d66-8c2a99b929b3 Default role for guest users. Can read a limited set of directory information.
Restricted Guest User                         2af84b1e-32c8-42b7-82bc-daa82404023b 2af84b1e-32c8-42b7-82bc-daa82404023b Restricted role for guest users. Can read a limited set of directory information.
```

## Find role assignments

This section describes how to list roles you have assigned in Microsoft Entra ID. To get all the role assignments, run the [Get-EntraDirectoryRoleAssignment](/powershell/module/microsoft.graph.entra/get-entradirectoryroleassignment) command with at least the [Directory Readers](/entra/identity/role-based-access-control/permissions-reference#directory-readers) role.

```powershell
Connect-Entra -Scopes 'RoleManagement.Read.Directory','EntitlementManagement.Read.All'
Get-EntraDirectoryRoleAssignment -All 
```

```Output
Id                                      PrincipalId                           RoleDefinitionId                    DirectoryScopeId AppScopeId
--                                      -----------                           ----------------                    ---------------- ----------
00001111-aaaa-2222-bbbb-3333cccc4444          aaaaaaaa-bbbb-cccc-1111-222222222222  a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1  /                
11112222-bbbb-3333-cccc-4444dddd5555          bbbbbbbb-cccc-dddd-2222-333333333333  a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1  /                
22223333-cccc-4444-dddd-5555eeee6666          cccccccc-dddd-eeee-3333-444444444444  a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1  /                
33334444-dddd-5555-eeee-6666ffff7777          dddddddd-eeee-ffff-4444-555555555555  a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1  /                
44445555-eeee-6666-ffff-7777aaaa8888          eeeeeeee-ffff-aaaa-5555-666666666666  a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1  /                 
```

The `PrincipalId` specifies the account the role is assigned to, and the `RoleDefinitionId` specifies the role assigned to the account.

## Assign roles

To grant access to users in Microsoft Entra ID, assign Microsoft Entra roles. This section explains how to assign Microsoft Entra roles to users and groups. You need to have at least the [Privileged Role Administrator](/entra/identity/role-based-access-control/permissions-reference#privileged-role-administrator) role to complete the following tasks.

### Assign roles to users

1. First get the user you want to assign a role to, using the `Get-EntraUser` command.

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUser -ObjectId 'markus@contoso.onmicrosoft.com'
```

The `-ObjectId` Specifies the ID as a user principal name (UPN) or ObjectId.

```Output
DisplayName Id                                   Mail                                 UserPrincipalName
----------- --                                   ----                                 -----------------
Markus Long bbbbbbbb-1111-2222-3333-cccccccccccc markus@contoso.com                   markus@contoso.onmicrosoft.com
```

1. Use the `Get-EntraDirectoryRoleDefinition` command to get the role ID (`RoleDefinitionId`) you want to assign.

```powershell
Connect-Entra -Scopes 'RoleManagement.Read.Directory','EntitlementManagement.Read.All'
Get-EntraDirectoryRoleDefinition
```

1. Use the `New-EntraDirectoryRoleAssignment` command to assign the role.

```powershell
Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory','EntitlementManagement.ReadWrite.All'
$params = @{
    RoleDefinitionId = 'a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1'
    PrincipalId = 'bbbbbbbb-1111-2222-3333-cccccccccccc'
    DirectoryScopeId = '/'
 }

New-EntraDirectoryRoleAssignment @params
```

```Output
Id                                            PrincipalId                          RoleDefinitionId                     DirectoryScopeId AppScopeId
--                                            -----------                          ----------------                     ---------------- ----------
A1bC2dE3fH4iJ5kL6mN7oP8qR9sT0u aaaaaaaa-bbbb-cccc-1111-222222222222 a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1 /
```

This command creates a new role assignment in Microsoft Entra ID.

- The `-RoleDefinitionId` parameter specifies the ID of the role definition that you want to assign. Role definitions describe the permissions that are granted to users or groups by the role. This is the Identifier of the `unifiedRoleDefinition` the assignment is for.

- The `-PrincipalId` parameter specifies the ID of the principal (user, group, or service principal) to whom the role is being assigned.

- The`-DirectoryScopeId` parameter specifies the scope of the directory over which the role assignment is effective. The '/' value typically represents the root scope, meaning the role assignment is applicable across the entire directory.

<!--Do we have a cmdlet similar to New-MgRoleManagementDirectoryRoleEligibilityScheduleRequest to assign the role as eligible? For PIM?  https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/manage-roles-portal -->

### Assign roles to groups

To simplify role management, you can assign Microsoft Entra roles to a group instead of individuals. This way, you can manage role assignments for multiple users at once.

1. Create a role-assignable group using the `IsAssignableToRole` parameter. This parameter is set to `True` to indicate that the group can be assigned to a role.

```powershell
Connect-Entra -Scopes 'Group.ReadWrite.All'
$params = @{
    DisplayName = 'HelpDesk admin group2'
    Description = 'Group assignable to role'
    MailEnabled = $False
    MailNickname = 'helpDeskAdminGroup'
    SecurityEnabled = $True
    IsAssignableToRole = $True
}

New-EntraGroup @params
```

```Output
DisplayName           Id                                   MailNickname       Description              GroupTypes
-----------           --                                   ------------       -----------              ----------
HelpDesk admin group2 vvvvvvvv-8888-9999-0000-jjjjjjjjjjjj helpDeskAdminGroup Group assignable to role {}
```

1. Get the role ID (`RoleDefinitionId`) you want to assign using the `Get-EntraDirectoryRoleDefinition` command.

```powershell
Connect-Entra -Scopes 'RoleManagement.Read.Directory','EntitlementManagement.Read.All'
Get-EntraDirectoryRoleDefinition
```

1. Create a role assignment using the `New-EntraDirectoryRoleAssignment` command where the `PrincipalId` is the group ID.

```powershell
Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory','EntitlementManagement.ReadWrite.All'
$params = @{
    RoleDefinitionId = 'a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1'
    PrincipalId = 'vvvvvvvv-8888-9999-0000-jjjjjjjjjjjj'
    DirectoryScopeId = '/'
 }

New-EntraDirectoryRoleAssignment @params
```

## Create a custom role

This section explains how to create new custom roles in Microsoft Entra ID with Microsoft Entra PowerShell. You need to have at least the [Privileged Role Administrator](/entra/identity/role-based-access-control/permissions-reference#privileged-role-administrator) role to complete the following task.

To create a new role, use the `New-EntraDirectoryRoleDefinition` cmdlet. 

- The `RolePermissions` parameter specifies the permissions for the role definition.
- The `IsEnabled` parameter specifies whether the role definition is enabled.
- The `DisplayName` parameter specifies the display name for the role definition.

```powershell
Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory'
$RolePermissions = New-object Microsoft.Open.MSGraph.Model.RolePermission
$RolePermissions.AllowedResourceActions =  @("microsoft.directory/applications/basic/read")

$params = @{
   RolePermissions = $RolePermissions
   IsEnabled = $false
   DisplayName = 'MyRoleDefinition'
}

New-EntraDirectoryRoleDefinition @params
```

```Output

DisplayName      Id                                   TemplateId                           Description IsBuiltIn IsEnabled
-----------      --                                   ----------                           ----------- --------- ---------
MyRoleDefinition a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1 f5f5f5f5-aaaa-bbbb-cccc-d6d6d6d6d6d6             False     False

```

To find more specification options when creating a custom role, go to the [New-EntraDirectoryRoleDefinition](/powershell/module/microsoft.graph.entra/new-entradirectoryroledefinition?view=entra-powershell#example-1-creates-a-new-role-definition) article.

Once you have created the role, you can assign it to [users or groups](/powershell/entra-powershell/manage-roles#assign-roles).

## Clean up resources

This section explains how to delete roles in Microsoft Entra ID with Microsoft Entra PowerShell. You need to have at least the [Privileged Role Administrator](/entra/identity/role-based-access-control/permissions-reference#privileged-role-administrator) role to complete the following tasks.

### Remove role assignments

Use the `Remove-EntraDirectoryRoleAssignment` command to remove a role assignment. If you need to find the role assignment ID, referred in the `-Id` parameter, run the `Get-EntraDirectoryRoleAssignment` command first.

```powershell
Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory','EntitlementManagement.ReadWrite.All'
Remove-EntraDirectoryRoleAssignment -Id 'Aa1Bb~2Cc3.-Dd4Ee5Ff6Gg7Hh8Ii9_Jj0Kk1Ll2'
```

This example removes the specified role assignment from Microsoft Entra ID.

### Remove roles

You can't delete built-in roles and this feature requires a Microsoft Entra ID P1 or P2 license. Use the `Remove-EntraDirectoryRoleDefinition` command to delete a custom role. The `DisplayName` parameter refers to the custom role's display name.

```powershell
Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory'
$DirectoryRoleDefinition = Get-EntraDirectoryRoleDefinition -Filter "DisplayName eq 'Guest Inviter'"
Remove-EntraDirectoryRoleDefinition -Id $DirectoryRoleDefinition.ObjectId
```

## Related content

See the full list of Microsoft Entra PowerShell cmdlets for role management [here](/powershell/module/microsoft.graph.entra/?view=entra-powershell#role-management).
