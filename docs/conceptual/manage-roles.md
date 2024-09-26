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

A role is a collection of permissions. Microsoft Entra roles control access to Microsoft Entra resources such as users, groups, and applications. This article describes how to manage Microsoft Entra roles using the Microsoft Entra PowerShell module.

## Prerequisites

<!--The sections are based on the how-tos in the https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/ . -->

## Setup



## List role definitons

A role definition is a collection of permissions that can be performed, such as read, write, and delete. It's typically just called a role. Microsoft Entra ID has over 60 built-in roles or you can create your own custom roles. If you ever wondered "What the do these roles really do?", you can see a detailed list of permissions for each of the roles.

Follow these steps to list Microsoft Entra roles using PowerShell.

1. Open a PowerShell window. If necessary, use [Install-Module](/powershell/module/powershellget/install-module) to install Microsoft Graph PowerShell. For more information, see [Prerequisites to use PowerShell or Graph Explorer](prerequisites.md).

    ```powershell
    Install-Module Microsoft.Graph -Scope CurrentUser
    ```

2. In a PowerShell window, use [Connect-MgGraph](/powershell/microsoftgraph/authentication-commands#using-connect-mggraph) to sign in to your tenant.

    ```powershell
    Connect-MgGraph -Scopes "RoleManagement.Read.All"
    ```

3. Use [Get-MgRoleManagementDirectoryRoleDefinition](/powershell/module/microsoft.graph.identity.governance/get-mgrolemanagementdirectoryroledefinition) to get all roles.

    ```powershell
    Get-MgRoleManagementDirectoryRoleDefinition
    ```

4. To view the list of permissions of a role, use the following cmdlet.

    ```powershell
    # Do this avoid truncation of the list of permissions
    $FormatEnumerationLimit = -1
    
    (Get-MgRoleManagementDirectoryRoleDefinition -Filter "displayName eq 'Conditional Access Administrator'").RolePermissions | Format-list
    ```

## List role assignments 

This article describes how to list roles you have assigned in Microsoft Entra ID. This section describes viewing assignments of a role with organization-wide scope. This article uses the [Microsoft Graph PowerShell](/powershell/microsoftgraph/overview) module. To view single-application scope assignments using PowerShell, you can use the cmdlets in [Assign custom roles with PowerShell](custom-assign-powershell.md).

Use the [Get-MgRoleManagementDirectoryRoleDefinition](/powershell/module/microsoft.graph.identity.governance/get-mgrolemanagementdirectoryroledefinition) and [Get-MgRoleManagementDirectoryRoleAssignment](/powershell/module/microsoft.graph.identity.governance/get-mgrolemanagementdirectoryroleassignment) commands to list role assignments.

The following example shows how to list the role assignments for the [Groups Administrator](permissions-reference.md#groups-administrator) role.

```powershell
# Fetch list of all directory roles with template ID
Get-MgRoleManagementDirectoryRoleDefinition

# Fetch a specific directory role by ID
$role = Get-MgRoleManagementDirectoryRoleDefinition -UnifiedRoleDefinitionId fdd7a751-b60b-444a-984c-02652fe8fa1c

# Fetch membership for a role
Get-MgRoleManagementDirectoryRoleAssignment -Filter "roleDefinitionId eq '$($role.Id)'"
```

```Example
Id                                            PrincipalId                          RoleDefinitionId                     DirectoryScopeId AppScop
                                                                                                                                         eId
--                                            -----------                          ----------------                     ---------------- -------
lAPpYvVpN0KRkAEhdxReEH2Fs3EjKm1BvSKkcYVN2to-1 aaaaaaaa-bbbb-cccc-1111-222222222222 62e90394-69f5-4237-9190-012177145e10 /
lAPpYvVpN0KRkAEhdxReEMdXLf2tIs1ClhpzQPsutrQ-1 bbbbbbbb-cccc-dddd-2222-333333333333 62e90394-69f5-4237-9190-012177145e10 /
```

The following example shows how to list all active role assignments across all roles, including built-in and custom roles (currently in Preview).

```powershell
$roles = Get-MgRoleManagementDirectoryRoleDefinition
foreach ($role in $roles)
{
  Get-MgRoleManagementDirectoryRoleAssignment -Filter "roleDefinitionId eq '$($role.Id)'"
}
```

```Example
Id                                            PrincipalId                          RoleDefinitionId                     DirectoryScopeId AppScop
                                                                                                                                         eId
--                                            -----------                          ----------------                     ---------------- -------
lAPpYvVpN0KRkAEhdxReEH2Fs3EjKm1BvSKkcYVN2to-1 aaaaaaaa-bbbb-cccc-1111-222222222222 62e90394-69f5-4237-9190-012177145e10 /
lAPpYvVpN0KRkAEhdxReEMdXLf2tIs1ClhpzQPsutrQ-1 bbbbbbbb-cccc-dddd-2222-333333333333 62e90394-69f5-4237-9190-012177145e10 /
4-PYiFWPHkqVOpuYmLiHa3ibEcXLJYtFq5x3Kkj2TkA-1 cccccccc-dddd-eeee-3333-444444444444 88d8e3e3-8f55-4a1e-953a-9b9898b8876b /
4-PYiFWPHkqVOpuYmLiHa2hXf3b8iY5KsVFjHNXFN4c-1 dddddddd-eeee-ffff-4444-555555555555 88d8e3e3-8f55-4a1e-953a-9b9898b8876b /
BSub0kaAukSHWB4mGC_PModww03rMgNOkpK77ePhDnI-1 eeeeeeee-ffff-aaaa-5555-666666666666 d29b2b05-8046-44ba-8758-1e26182fcf32 /
BSub0kaAukSHWB4mGC_PMgzOWSgXj8FHusA4iaaTyaI-1 ffffffff-aaaa-bbbb-6666-777777777777 d29b2b05-8046-44ba-8758-1e26182fcf32 /
```

### List Microsoft Entra role assignments for a user

A role can be assigned to a user directly or transitively via a group. This article describes how to list the Microsoft Entra roles assigned to a user

Follow these steps to list Microsoft Entra roles assigned to a user using PowerShell.

1. Install Microsoft.Graph module using [Install-module](/powershell/azure/active-directory/install-adv2).
  
    ```powershell
    Install-module -name Microsoft.Graph
    ```

3. In a PowerShell window, Use [Connect-MgGraph](/powershell/microsoftgraph/get-started) to sign into and use Microsoft Graph PowerShell cmdlets.
  
      ```powershell
      Connect-MgGraph
      ```

4. Use the [List transitiveRoleAssignments](/graph/api/rbacapplication-list-transitiveroleassignments) API to get roles assigned directly and transitively to a user.

      ```powershell
      $response = $null
      $uri = "https://graph.microsoft.com/beta/roleManagement/directory/transitiveRoleAssignments?`$count=true&`$filter=principalId eq 'aaaaaaaa-bbbb-cccc-1111-222222222222'"
      $method = 'GET'
      $headers = @{'ConsistencyLevel' = 'eventual'}
      
      $response = (Invoke-MgGraphRequest -Uri $uri -Headers $headers -Method $method -Body $null).value
      ```

### View roles assigned to a group in Microsoft Entra ID

### Get object ID of the group

```powershell
Get-MgGroup -Filter "DisplayName eq 'Contoso_Helpdesk_Administrators'"
```

### View role assignment to a group

```powershell
Get-MgRoleManagementDirectoryRoleAssignment -Filter "PrincipalId eq '<object id of group>'" 
```

## Assign roles

To grant access to users in Microsoft Entra ID, you assign Microsoft Entra roles. A role is a collection of permissions. This article describes how to assign Microsoft Entra roles using the Microsoft Entra admin center and PowerShell.

### Assign Microsoft Entra roles to users

### Setup
Sure, here is the YAML code translated to Markdown:

### Setup

1. Open a PowerShell window and use *An external link was removed to protect your privacy.* to import the Microsoft Graph PowerShell module. For more information, see *An external link was removed to protect your privacy.*.

    ```powershell
    Import-Module -Name Microsoft.Graph.Identity.Governance -Force
    ```

2. In a PowerShell window, use *An external link was removed to protect your privacy.* to sign in to your tenant.

    ```powershell
    Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory"
    ```

3. Use *An external link was removed to protect your privacy.* to get the user you want to assign a role to.

    ```powershell
    $user = Get-MgUser -Filter "userPrincipalName eq 'johndoe@contoso.com'"
    ```

### Assign a role

1. Use *An external link was removed to protect your privacy.* to get the role you want to assign.

    ```powershell
    $roledefinition = Get-MgRoleManagementDirectoryRoleDefinition -Filter "DisplayName eq 'Billing Administrator'"
    ```

2. Use *An external link was removed to protect your privacy.* to assign the role.

    ```powershell
    $roleassignment = New-MgRoleManagementDirectoryRoleAssignment -DirectoryScopeId '/' -RoleDefinitionId $roledefinition.Id -PrincipalId $user.Id
    ```

### Assign a role as eligible using PIM

If PIM is enabled, you have additional capabilities, such as making a user eligible for a role assignment or defining the start and end time for a role assignment. These capabilities use a different set of PowerShell commands. For more information about using PowerShell and PIM, see *An external link was removed to protect your privacy.*.

Steps:

- Use *An external link was removed to protect your privacy.* to get the role you want to assign.

    ```powershell
    $roledefinition = Get-MgRoleManagementDirectoryRoleDefinition -Filter "DisplayName eq 'Billing Administrator'"
    ```

- Use the following command to create a hash table to store all the necessary attributes required to assign the role to the user. The Principal ID will be the user ID to which you want to assign the role. In this example, the assignment will be valid only for **10 hours**.

    ```powershell
    $params = @{
      "PrincipalId" = "aaaaaaaa-bbbb-cccc-1111-222222222222"
      "RoleDefinitionId" = "b0f54661-2d74-4c50-afa3-1ec803f12efe"
      "Justification" = "Add eligible assignment"
      "DirectoryScopeId" = "/"
      "Action" = "AdminAssign"
      "ScheduleInfo" = @{
        "StartDateTime" = Get-Date
        "Expiration" = @{
          "Type" = "AfterDuration"
          "Duration" = "PT10H"
          }
        }
      }
    ```

- Use *An external link was removed to protect your privacy.* to assign the role as eligible. Once the role has been assigned, it will reflect in the Microsoft Entra admin center under **Identity governance** > **Privileged Identity Management** > **Microsoft Entra roles** > **Assignments** > **Eligible Assignments** section.

    ```powershell
    New-MgRoleManagementDirectoryRoleEligibilityScheduleRequest -BodyParameter $params | Format-List Id, Status, Action, AppScopeId, DirectoryScopeId, RoleDefinitionId, IsValidationOnly, Justification, PrincipalId, CompletedDateTime, CreatedDateTime
    ```

### Assign Microsoft Entra roles to groups

To simplify role management, you can assign Microsoft Entra roles to a group instead of individuals. 

#### Create a role-assignable group

Use the [New-AzureADMSGroup](/powershell/module/azuread/new-azureadmsgroup?branch=main) command to create a role-assignable group.

```powershell
$group = New-AzureADMSGroup -DisplayName "Contoso_Helpdesk_Administrators" -Description "This group is assigned to Helpdesk Administrator built-in role in Azure AD." -MailEnabled $false -SecurityEnabled $true -MailNickName "contosohelpdeskadministrators" -IsAssignableToRole $true 
```

#### Get the role definition you want to assign

Use the [Get-AzureADMSRoleDefinition](/powershell/module/azuread/get-azureadmsroledefinition?branch=main) command to get a role definition.

```powershell
$roleDefinition = Get-AzureADMSRoleDefinition -Filter "displayName eq 'Helpdesk Administrator'" 
```

#### Create a role assignment

Use the [New-AzureADMSRoleAssignment](/powershell/module/azuread/new-azureadmsroleassignment?branch=main) command to assign the role.

```powershell
$roleAssignment = New-AzureADMSRoleAssignment -DirectoryScopeId '/' -RoleDefinitionId $roleDefinition.Id -PrincipalId $group.Id 
```

## Remove role assignments from a group

### Create a group that can be assigned to role

```powershell
$group = New-MgGroup -DisplayName "Contoso_Helpdesk_Administrators" `
   -Description "This group is assigned to Helpdesk Administrator built-in role in Microsoft Entra ID." `
   -MailNickname "contosohelpdeskadministrators" -IsAssignableToRole:$true `
   -MailEnabled:$true -SecurityEnabled:$true
```

### Get the role definition you want to assign the group to

```powershell
$roleDefinition = Get-MgRoleManagementDirectoryRoleDefinition -Filter "displayName eq 'Helpdesk Administrator'"
```

### Create a role assignment

```powershell
$Params = @{
   "directoryScopeId" = "/" 
   "principalId" = $group.Id
   "roleDefinitionId" = $roleDefinition.Id
}
$roleAssignment = New-MgRoleManagementDirectoryRoleAssignment -BodyParameter $Params
```

### Remove the role assignment

```powershell
Remove-MgRoleManagementDirectoryRoleAssignment -UnifiedRoleAssignmentId $roleAssignment.Id
```

## Create a custom role 

**Prompt [Try this prompt in Copilot for Microsoft 365](https://www.microsoft365.com/chat/entity1-d870f6cd-4aa5-4d42-9626-ab690c041429/eyJpZCI6IlZYTmxjbFl4ZkdoMGRIQnpPaTh2YzNWaWMzUnlZWFJsTFdsdWRDNXZabVpwWTJVdVkyOXRMM3hQU1VRNlpXSmtZekpoWW1VdE9HVmlNUzAwTURCaExUZ3dOR1l0WWpBek56QmpPVEkxTVdSa2ZHVmxabU0wTTJVM0xXRm1OV1V0TkdaalppMWhOamd4TFdSak1EQXlaV1poWldVMk5Id3lNREkwTFRBNUxUSTJWREE1T2pRd09qSTFMakl6T0RBeU56VmEiLCJzY2VuYXJpbyI6InNoYXJlTGluayIsInByb3BlcnRpZXMiOnsicHJvbXB0U291cmNlIjoidXNlciIsImNsaWNrVGltZXN0YW1wIjoiMjAyNC0wOS0yNlQwOTo0MDoyNS4yNDJaIn0sInZlcnNpb24iOjEuMX0)**
translate this yml code to markdown: ### Sign in Use the [Connect-MgGraph](/powershell/module/microsoft.graph.authentication/connect-mggraph) command to sign in to your tenant. code: | ``` PowerShell Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory" ``` ### Create the custom role Create a new role using the following PowerShell script: ``` PowerShell # Basic role information $displayName = "Application Support Administrator" $description = "Can manage basic aspects of application registrations." $templateId = (New-Guid).Guid # Set of permissions to grant $allowedResourceAction = @( "microsoft.directory/applications/basic/update", "microsoft.directory/applications/credentials/update" ) $rolePermissions = @(@{AllowedResourceActions= $allowedResourceAction}) # Create new custom admin role $customAdmin = New-MgRoleManagementDirectoryRoleDefinition -RolePermissions $rolePermissions -DisplayName $displayName -IsEnabled -Description $description -TemplateId $templateId ``` ### Assign the custom role using PowerShell Assign the role using the below PowerShell script: ``` PowerShell # Get the user and role definition you want to link $user = Get-MgUser -Filter "userPrincipalName eq 'user@contoso.com'" $roleDefinition = Get-MgRoleManagementDirectoryRoleDefinition -Filter "DisplayName eq 'Application Support Administrator'" # Get app registration and construct resource scope for assignment. $appRegistration = Get-MgApplication -Filter "Displayname eq 'MyApp1'" $resourceScope = '/' + $appRegistration.objectId # Create a scoped role assignment $roleAssignment = New-MgRoleManagementDirectoryRoleAssignment -DirectoryScopeId $resourcescope -RoleDefinitionId $roledefinition.Id -PrincipalId $user.Id ```
**Response**
Sure, here is the YAML code translated to Markdown:

### Sign in

Use the *An external link was removed to protect your privacy.* command to sign in to your tenant.

```PowerShell
Connect-MgGraph -Scopes "RoleManagement.ReadWrite.Directory"
```

### Create the custom role

Create a new role using the following PowerShell script:

```PowerShell
# Basic role information
$displayName = "Application Support Administrator"
$description = "Can manage basic aspects of application registrations."
$templateId = (New-Guid).Guid

# Set of permissions to grant
$allowedResourceAction =
@(
    "microsoft.directory/applications/basic/update",
    "microsoft.directory/applications/credentials/update"
)
$rolePermissions = @(@{AllowedResourceActions= $allowedResourceAction})

# Create new custom admin role
$customAdmin = New-MgRoleManagementDirectoryRoleDefinition -RolePermissions $rolePermissions -DisplayName $displayName -IsEnabled -Description $description -TemplateId $templateId
```

### Assign the custom role using PowerShell

Assign the role using the below PowerShell script:

```PowerShell
# Get the user and role definition you want to link
$user = Get-MgUser -Filter "userPrincipalName eq 'user@contoso.com'"
$roleDefinition = Get-MgRoleManagementDirectoryRoleDefinition -Filter "DisplayName eq 'Application Support Administrator'"

# Get app registration and construct resource scope for assignment.
$appRegistration = Get-MgApplication -Filter "Displayname eq 'MyApp1'"
$resourceScope = '/' + $appRegistration.objectId

# Create a scoped role assignment
$roleAssignment = New-MgRoleManagementDirectoryRoleAssignment -DirectoryScopeId $resourcescope -RoleDefinitionId $roledefinition.Id -PrincipalId $user.Id
```

## Clean up resources


## Related content


<!--Notes for myself:
https://learn.microsoft.com/en-us/entra/identity/role-based-access-control/manage-roles-portal#powershell



To grant access to users in Microsoft Entra ID, you assign Microsoft Entra roles. A role is a collection of permissions. This article describes how to assign Microsoft Entra roles using the Microsoft Entra PowerShell.

## Setup


Connect-Entra -Scopes 'User.Read.All'
Get-EntraUser -ObjectId '0fc9516e-a386-49c5-b798-1bd678150390'
Get-EntraDirectoryRoleDefinition



## Assign a role
Get-EntraDirectoryRoleDefinition

Get-EntraDirectoryRoleDefinition -Id '10dae51f-b6af-4016-8d66-8c2a99b929b3'

Couldn't test it in the BAMI tenant: 

Connect-Entra -Scopes 'RoleManagement.ReadWrite.Directory','EntitlementManagement.ReadWrite.All'
$params = @{
    RoleDefinitionId = '10dae51f-b6af-4016-8d66-8c2a99b929b3'
    PrincipalId = '0fc9516e-a386-49c5-b798-1bd678150390'
    DirectoryScopeId = '/'
 }

New-EntraDirectoryRoleAssignment @params

## Assign a role as eligible using PIM

If PIM is enabled, you have additional capabilities, such as making a user eligible for a role assignment or defining the start and end time for a role assignment. These capabilities use a different set of PowerShell commands. For more information about using PowerShell and PIM, see PowerShell for Microsoft Entra roles in Privileged Identity Management.



Get-EntraDirectoryRoleDefinition -Id '10dae51f-b6af-4016-8d66-8c2a99b929b3'

EligibilityScheduleRequest  ?? Do we have something similar in EntraPS?




To list all the roles that are assigned to a specified user, use Get-EntraDirectoryRoleAssignment
https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.entra/get-entradirectoryroleassignment?view=entra-powershell

Get-EntraDirectoryRoleAssignment -Filter "principalId eq '0fc9516e-a386-49c5-b798-1bd678150390'"


Get-EntraDirectoryRoleDefinition
https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.entra/get-entradirectoryroledefinition?view=entra-powershell

Set-EntraDirectoryRoleDefinition
https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.entra/set-entradirectoryroledefinition?view=entra-powershell

 -->