---
title: Manage roles
description: Learn how to find, assign, scope, and clean up Microsoft Entra roles for users, groups, and service principals using Microsoft Entra PowerShell.

author: csmulligan
manager: mwongerapk
ms.topic: how-to
ms.date: 05/28/2026
ms.author: cmulligan
ms.reviewer: stevemutungi
ms.custom: msecd-doc-authoring-1012
ai-usage: ai-assisted

#Customer intent: As an IT admin managing roles and users in Microsoft Entra ID, I want to learn how to assign a role to a user, group, or service principal with Microsoft Entra PowerShell so that I can grant each identity only the permissions it needs.
---

# Manage roles

In this article, you learn how to manage roles using Microsoft Entra PowerShell. A role in Microsoft Entra defines permissions that control access to resources like users, groups, and applications. You assign roles to users, groups, or service principals to grant the permissions they need to perform specific tasks. You can also scope each assignment to the entire directory, an administrative unit, or a specific application registration so that the role only applies where it's needed.

## Prerequisites

To manage roles with Microsoft Entra PowerShell, you need:

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/pricing/purchase-options/azure-account?cid=msft_learn).
- The following role is used to find role definitions and assignments: [Directory Readers][directory-readers] 
- The [Privileged Role Administrator][privileged-role-administrator] role is used to create, assign, and remove roles.
- Microsoft Entra PowerShell module installed. Follow the [Install Microsoft Entra PowerShell module](installation.md) guide to install the module.

## Find role definitions

A role definition is a collection of permissions that can be performed, such as read, write, and delete. It's typically called a role. Microsoft Entra ID has over 60 built-in roles and you can create your own custom roles. To understand what each role does, you can view a detailed list of its permissions.

To get all  the role definitions, run the following [Get-EntraDirectoryRoleDefinition](/powershell/module/microsoft.entra.governance/get-entradirectoryroledefinition) command with at least the [Directory Readers](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#directory-readers) role.

```powershell
Connect-Entra -Scopes 'RoleManagement.Read.Directory'
Get-EntraDirectoryRoleDefinition
```

```Output
DisplayName                                   Id                                   TemplateId                           Description
-----------                                   --                                   ----------                           -----------
Guest User                                    10dae51f-b6af-4016-8d66-8c2a99b929b3 10dae51f-b6af-4016-8d66-8c2a99b929b3 Default role for guest users. Can read a limited set of directory information.
Restricted Guest User                         2af84b1e-32c8-42b7-82bc-daa82404023b 2af84b1e-32c8-42b7-82bc-daa82404023b Restricted role for guest users. Can read a limited set of directory information.
```

## Find role assignments

This section describes how to list roles you have assigned in Microsoft Entra ID. To get all the role assignments, run the [Get-EntraDirectoryRoleAssignment](/powershell/module/microsoft.entra.governance/get-entradirectoryroleassignment) command with at least the [Directory Readers](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#directory-readers) role.

```powershell
Connect-Entra -Scopes 'RoleManagement.Read.Directory'
Get-EntraDirectoryRoleAssignment -All 
```

```Output
Id                                            PrincipalId                           RoleDefinitionId                      DirectoryScopeId AppScopeId
--                                            -----------                           ----------------                      ---------------- ----------
00001111-aaaa-2222-bbbb-3333cccc4444          aaaaaaaa-bbbb-cccc-1111-222222222222  a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1  /                
11112222-bbbb-3333-cccc-4444dddd5555          bbbbbbbb-cccc-dddd-2222-333333333333  a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1  /                
22223333-cccc-4444-dddd-5555eeee6666          cccccccc-dddd-eeee-3333-444444444444  a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1  /                
33334444-dddd-5555-eeee-6666ffff7777          dddddddd-eeee-ffff-4444-555555555555  a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1  /                
44445555-eeee-6666-ffff-7777aaaa8888          eeeeeeee-ffff-aaaa-5555-666666666666  a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1  /                 
```

The `PrincipalId` specifies the account the role is assigned to, and the `RoleDefinitionId` specifies the role assigned to the account.

### Find role assignments for a specific user

To audit the roles assigned to a specific user, filter the role assignments by the user's object ID.

```powershell
Connect-Entra -Scopes 'RoleManagement.Read.Directory', 'User.Read.All'
$user = Get-EntraUser -UserId 'markus@contoso.com'
Get-EntraDirectoryRoleAssignment -All | Where-Object { $_.PrincipalId -eq $user.Id }
```

```Output
Id                                   PrincipalId                          RoleDefinitionId                     DirectoryScopeId AppScopeId
--                                   -----------                          ----------------                     ---------------- ----------
00001111-aaaa-2222-bbbb-3333cccc4444 bbbbbbbb-1111-2222-3333-cccccccccccc a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1 /
```

The output shows role assignment IDs, but not the role display names. To resolve role names from each `RoleDefinitionId`, pipe the assignments through `Get-EntraDirectoryRoleDefinition`.

```powershell
$assignments = Get-EntraDirectoryRoleAssignment -All | Where-Object { $_.PrincipalId -eq $user.Id }
foreach ($assignment in $assignments) {
    $roleDef = Get-EntraDirectoryRoleDefinition -UnifiedRoleDefinitionId $assignment.RoleDefinitionId
    [PSCustomObject]@{
        RoleName = $roleDef.DisplayName
        Scope    = $assignment.DirectoryScopeId
    }
}
```

```Output
RoleName               Scope
--------               -----
Helpdesk Administrator /
User Administrator     /administrativeUnits/aaaaaaaa-bbbb-cccc-1111-222222222222
```

## Assign roles

To grant access to users in Microsoft Entra ID, assign Microsoft Entra roles. This section explains how to assign Microsoft Entra roles to users and groups. You need to have at least the [Privileged Role Administrator](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#privileged-role-administrator) role to complete the following tasks.

### Assign roles to users

1. Use [Get-EntraUser](/powershell/module/microsoft.entra.users/get-entrauser) to retrieve the user for role assignment.

    ```powershell
    Connect-Entra -Scopes 'User.Read.All'
    $user = Get-EntraUser -UserId 'markus@contoso.com'
    ```

    The `-UserId` Specifies the ID as a user principal name (UPN) or ObjectId.

    ```Output
    DisplayName Id                                   Mail                                 UserPrincipalName
    ----------- --                                   ----                                 -----------------
    Markus Long bbbbbbbb-1111-2222-3333-cccccccccccc markus@contoso.com                   markus@contoso.onmicrosoft.com
    ```

1. Use the `Get-EntraDirectoryRoleDefinition` command to get the role ID (`RoleDefinitionId`) you want to assign.

    ```powershell
    Connect-Entra -Scopes 'RoleManagement.Read.Directory', 'EntitlementManagement.Read.All'
    $directoryRole = Get-EntraDirectoryRoleDefinition -Filter "DisplayName eq 'Helpdesk Administrator'"
    ```

1. Use the `New-EntraDirectoryRoleAssignment` command to assign the role.

    ```powershell
    Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory'
    New-EntraDirectoryRoleAssignment -RoleDefinitionId $directoryRole.Id -PrincipalId $user.Id -DirectoryScopeId '/'
    ```

    ```Output
    Id                                       PrincipalId                          RoleDefinitionId                     DirectoryScopeId AppScopeId
    --                                       -----------                          ----------------                     ---------------- ----------
    00001111-aaaa-2222-bbbb-3333cccc4444     aaaaaaaa-bbbb-cccc-1111-222222222222 a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1 /
    ```

This command creates a new role assignment in Microsoft Entra ID.

- The `-RoleDefinitionId` parameter specifies the ID of the role definition that you want to assign. Role definitions describe the permissions that are granted to users or groups by the role. This is the identifier of the `unifiedRoleDefinition` the assignment is for.

- The `-PrincipalId` parameter specifies the ID of the principal (user, group, or service principal) to whom the role is being assigned.

- The`-DirectoryScopeId` parameter specifies the scope of the directory over which the role assignment is effective. The `/` value typically represents the root scope, meaning the role assignment is applicable across the entire directory.

> [!NOTE]
> The steps in this section create a permanent (active) role assignment. To grant a user time-bound or just-in-time access through Privileged Identity Management (PIM), see [Microsoft Entra PowerShell cmdlets for Privileged Identity Management](/powershell/module/microsoft.entra.governance).

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
    $group = New-EntraGroup @params
    ```

    ```Output
    DisplayName           Id                                   MailNickname       Description              GroupTypes
    -----------           --                                   ------------       -----------              ----------
    HelpDesk admin group2 vvvvvvvv-8888-9999-0000-jjjjjjjjjjjj helpDeskAdminGroup Group assignable to role {}
    ```

1. Get the role ID (`RoleDefinitionId`) you want to assign using the `Get-EntraDirectoryRoleDefinition` command.

    ```powershell
    Connect-Entra -Scopes 'RoleManagement.Read.Directory'
    $directoryRole = Get-EntraDirectoryRoleDefinition -Filter "DisplayName eq 'Helpdesk Administrator'"
    ```

1. Create a role assignment using the `New-EntraDirectoryRoleAssignment` command where the `PrincipalId` is the group ID.

    ```powershell
    Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory'
    New-EntraDirectoryRoleAssignment -RoleDefinitionId $directoryRole.Id -PrincipalId $group.Id -DirectoryScopeId '/'
    ```

### Assign roles to service principals

You can assign Microsoft Entra roles to a service principal, including a managed identity, so that an application can perform directory tasks on its own behalf without a signed-in user.

1. Use [Get-EntraServicePrincipal](/powershell/module/microsoft.entra.applications/get-entraserviceprincipal) to retrieve the service principal.

    ```powershell
    Connect-Entra -Scopes 'Application.Read.All'
    $servicePrincipal = Get-EntraServicePrincipal -Filter "DisplayName eq 'My Application'"
    ```

    ```Output
    DisplayName    Id                                   AppId                                SignInAudience ServicePrincipalType
    -----------    --                                   -----                                -------------- --------------------
    My Application cccccccc-dddd-eeee-3333-444444444444 44445555-eeee-6666-ffff-7777aaaa8888 AzureADMyOrg   Application
    ```

1. Get the role ID you want to assign.

    ```powershell
    Connect-Entra -Scopes 'RoleManagement.Read.Directory'
    $directoryRole = Get-EntraDirectoryRoleDefinition -Filter "DisplayName eq 'Directory Readers'"
    ```

1. Assign the role to the service principal.

    ```powershell
    Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory'
    New-EntraDirectoryRoleAssignment -RoleDefinitionId $directoryRole.Id -PrincipalId $servicePrincipal.Id -DirectoryScopeId '/'
    ```

    ```Output
    Id                                       PrincipalId                          RoleDefinitionId                     DirectoryScopeId AppScopeId
    --                                       -----------                          ----------------                     ---------------- ----------
    A1bC2dE3fH4iJ5kL6mN7oP8qR9sT0u          cccccccc-dddd-eeee-3333-444444444444 a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1 /
    ```

### Assign roles with administrative unit scope

You can restrict a role assignment to a specific administrative unit instead of the entire directory. The role's permissions then apply only to the users, groups, or devices that belong to that administrative unit, which helps you follow the principle of least privilege. To learn more about administrative units, see [Administrative units in Microsoft Entra ID](/entra/identity/role-based-access-control/administrative-units).

1. Retrieve the principal (user, group, or service principal) and the administrative unit.

    ```powershell
    Connect-Entra -Scopes 'User.Read.All', 'AdministrativeUnit.Read.All'
    $user = Get-EntraUser -UserId 'markus@contoso.com'
    $adminUnit = Get-EntraAdministrativeUnit -Filter "DisplayName eq 'Seattle Admin Unit'"
    ```

1. Get the role definition.

    ```powershell
    Connect-Entra -Scopes 'RoleManagement.Read.Directory'
    $directoryRole = Get-EntraDirectoryRoleDefinition -Filter "DisplayName eq 'User Administrator'"
    ```

1. Assign the role with the administrative unit scope.

    ```powershell
    Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory'
    $directoryScopeId = '/administrativeUnits/' + $adminUnit.Id
    New-EntraDirectoryRoleAssignment -RoleDefinitionId $directoryRole.Id -PrincipalId $user.Id -DirectoryScopeId $directoryScopeId
    ```

    ```Output
    Id                                       PrincipalId                          RoleDefinitionId                     DirectoryScopeId                                          AppScopeId
    --                                       -----------                          ----------------                     ----------------                                          ----------
    A1bC2dE3fH4iJ5kL6mN7oP8qR9sT0u          bbbbbbbb-1111-2222-3333-cccccccccccc a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1 /administrativeUnits/aaaaaaaa-bbbb-cccc-1111-222222222222
    ```

The user now has the *User Administrator* role only within the specified administrative unit.

### Assign roles with application scope

You can scope a role assignment to a single application registration so that the principal can manage only that application. Use this scope when, for example, you want a developer to manage their own app registration without granting them tenant-wide *Application Administrator* permissions.

1. Retrieve the user and the application registration.

    ```powershell
    Connect-Entra -Scopes 'User.Read.All', 'Application.Read.All'
    $user = Get-EntraUser -UserId 'markus@contoso.com'
    $application = Get-EntraApplication -Filter "DisplayName eq 'My Web App'"
    ```

1. Get the role definition.

    ```powershell
    Connect-Entra -Scopes 'RoleManagement.Read.Directory'
    $directoryRole = Get-EntraDirectoryRoleDefinition -Filter "DisplayName eq 'Application Administrator'"
    ```

1. Assign the role scoped to the application.

    ```powershell
    Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory'
    $directoryScopeId = '/' + $application.Id
    New-EntraDirectoryRoleAssignment -RoleDefinitionId $directoryRole.Id -PrincipalId $user.Id -DirectoryScopeId $directoryScopeId
    ```

    ```Output
    Id                                       PrincipalId                          RoleDefinitionId                     DirectoryScopeId                      AppScopeId
    --                                       -----------                          ----------------                     ----------------                      ----------
    A1bC2dE3fH4iJ5kL6mN7oP8qR9sT0u          bbbbbbbb-1111-2222-3333-cccccccccccc a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1 /dddddddd-eeee-ffff-4444-555555555555
    ```

The user now has the *Application Administrator* role only for the specified application registration.

> [!NOTE]
> The two scope formats have different semantics. A scope of `/{id}` (used for application scope) means the principal can manage *that object itself*. A scope of `/administrativeUnits/{id}` means the principal can manage the *members* of the administrative unit (based on the assigned role), not the administrative unit itself. For more information, see [Assign Microsoft Entra roles at different scopes](/entra/identity/role-based-access-control/assign-roles-different-scopes).

## Create a custom role

This section explains how to create new custom roles in Microsoft Entra ID with Microsoft Entra PowerShell. You need to have at least the [Privileged Role Administrator](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#privileged-role-administrator) role to complete the following task.

To create a new role, use the `New-EntraDirectoryRoleDefinition` cmdlet. 

- The `RolePermissions` parameter specifies the permissions for the role definition.
- The `IsEnabled` parameter specifies whether the role definition is enabled.
- The `DisplayName` parameter specifies the display name for the role definition.

```powershell
Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory'
$rolePermissions = New-object Microsoft.Open.MSGraph.Model.RolePermission
$rolePermissions.AllowedResourceActions =  @("microsoft.directory/applications/basic/read")
New-EntraDirectoryRoleDefinition -RolePermissions $rolePermissions -IsEnabled $true -DisplayName 'Custom Application Read'
```

```Output

DisplayName             Id                                   TemplateId                           Description IsBuiltIn IsEnabled
-----------             --                                   ----------                           ----------- --------- ---------
Custom Application Read a0a0a0a0-bbbb-cccc-dddd-e1e1e1e1e1e1 f5f5f5f5-aaaa-bbbb-cccc-d6d6d6d6d6d6             False     True

```

To find more specification options when creating a custom role, go to the [New-EntraDirectoryRoleDefinition](/powershell/module/microsoft.entra.governance/new-entradirectoryroledefinition) article.

Once you have created the role, you can assign it to [users or groups](#assign-roles).

## Clean up resources

This section explains how to delete roles in Microsoft Entra ID with Microsoft Entra PowerShell. You need to have at least the [Privileged Role Administrator](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#privileged-role-administrator) role to complete the following tasks.

### Remove role assignments

Use the `Remove-EntraDirectoryRoleAssignment` command to remove a role assignment. If you need to find the role assignment ID, referred in the `-Id` parameter, run the `Get-EntraDirectoryRoleAssignment` command first.

```powershell
Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory'
$group = Get-EntraGroup -Filter "DisplayName eq 'HelpDesk admin group2'"
$directoryRole = Get-EntraDirectoryRoleDefinition -Filter "DisplayName eq 'Helpdesk Administrator'"
Get-EntraDirectoryRoleAssignment | Where-Object {$_.PrincipalId -eq $group.Id -and $_.RoleDefinitionId -eq $directoryRole.Id} | Remove-EntraDirectoryRoleAssignment
```

This example removes the specified role assignment from Microsoft Entra ID.

### Remove roles

You can't delete built-in roles. Use the `Remove-EntraDirectoryRoleDefinition` command to delete a custom role. The `DisplayName` parameter refers to the custom role's display name.

```powershell
Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory'
Get-EntraDirectoryRoleDefinition -Filter "DisplayName eq 'Custom Application Read'" | Remove-EntraDirectoryRoleDefinition
```

## Related content

- [Microsoft Entra PowerShell cmdlets for role management](/powershell/module/microsoft.entra.governance)
- [Microsoft Entra built-in roles](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json)
- [Administrative units in Microsoft Entra ID](/entra/identity/role-based-access-control/administrative-units)
- [Assign Microsoft Entra roles at different scopes](/entra/identity/role-based-access-control/assign-roles-different-scopes)

<!-- link references -->

[directory-readers]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#directory-readers
[privileged-role-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#privileged-role-administrator
