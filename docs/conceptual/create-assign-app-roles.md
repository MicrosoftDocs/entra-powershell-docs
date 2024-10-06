---
title: Assign app Roles to a service principal
description: Learn how to assign application permissions to a service principal in Microsoft Entra PowerShell.
author: omondiatieno
manager: CelesteDG
ms.topic: how-to
ms.date: 10/05/2024
ms.author: jomondi
ms.reviewer: stevemutungi

#Customer intent: As an IT admin managing server principal permissions in Microsoft Entra ID, I want to learn how to assign new permissions in Microsoft Entra PowerShell so that I can automate application consent.
---

# Assign app roles to a service principal

Application permissions in Microsoft Graph, also known as app roles, are assigned to service principals. These app roles enable the application to access data independently, without a signed-in user. This capability is useful for implementing automation with Microsoft Entra PowerShell.

## Prerequisites

To assign app roles to a service principal, you need:

- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free][entra-id-account].
- A [Privileged Role Administrator][privileged-role-admin] role.
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Graph PowerShell module][install] guide to install the module.

## Scenario description

You're an IT admin at Contoso, and your manager has tasked you with producing a daily report of all role activations in Privileged Identity Management, to be delivered via email. You decide to use Microsoft Entra PowerShell and Azure Automation to automate this task.

In this article, you learn how to connect to Microsoft Entra PowerShell in a delegated context and assign application permissions to a service principal to support your automation scenario. This process enables you to streamline the permission assignment, saving time and reducing the potential for errors.

## Connect to Microsoft Entra PowerShell

To connect to Microsoft Entra PowerShell with the necessary least privileged permissions, run the following command. Sign in with at least a **Privileged Role Administrator** role.

```powershell
Connect-Entra -Scopes 'AppRoleAssignment.ReadWrite.All', 'Application.Read.All'
```

When prompted to **Consent on behalf of your organization** select **Accept**.

## Assign permissions to a service principal

If you haven't created a service principal for your scenario, see [Create a custom application][custom-app].

> [!CAUTION]
> When assigning app roles to an application, follow the principle of least privilege. Only request roles necessary for your application's functionality. Over-assigning roles can increase security risks if the application is compromised. Additionally, assigning roles programmatically takes effect immediately, so exercise caution to ensure only appropriate roles are assigned. Always ensure the roles are justified to minimize potential vulnerabilities. For more information on the principle of least privilege, see [Least privilege][least-privilege].

Use the following example to assign the `User.Read.All` permission to your service principal:

```powershell
# Get service principal
$servicePrincipal = Get-EntraServicePrincipal -Filter "DisplayName eq 'Contos App 1'"

$filterParams = @{
    Filter = "AppId eq '00000003-0000-0000-c000-000000000000'"
}

# Get Graph App
$graphApp = Get-EntraServicePrincipal @filterParams

# Get App Role
$appRole = $graphApp.AppRoles | Where-Object { $_.Value -eq 'User.Read.All' }

# Assign the permission
$params = @{
    PrincipalId = $servicePrincipal.Id
    ResourceId  = $graphApp.Id
    Id          = $appRole.Id
    ObjectId    = $servicePrincipal.Id
}
New-EntraServiceAppRoleAssignment @params | Format-List
```

```Output
ObjectId             : Aa11Ba22Cc33Dd44Ee55Ff66Aa77Bb88Cc99Dd00Ee1                   
AppRoleId            : df021288-bdef-4463-88db-98f22de89214
CreatedDateTime      : 7/24/2024 12:11:32 PM
DeletedDateTime      :
Id                   : AAa11Ba22Cc33Dd44Ee55Ff66Aa77Bb88Cc99Dd00Ee1 
PrincipalDisplayName : Contos App 1
PrincipalId          : aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb
PrincipalType        : ServicePrincipal
ResourceDisplayName  : Microsoft Graph
ResourceId           : bbbbbbbb-1111-2222-3333-cccccccccccc
AdditionalProperties : {[@odata.context,
                       https://graph.microsoft.com/v1.0/$metadata#servicePrincipals('aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb')/appRoleAssignments/$entity]}
```

## Assign multiple permissions

```powershell
# Define your required permissions
$getPermissions = 'Application.Read.All', 'User.Read.All'

# Get service principal
$servicePrincipal = Get-EntraServicePrincipal -Filter "DisplayName eq 'My Service Principal'"

# Get Graph App Id
$graphAppFilterParams = @{
    Filter = "AppId eq '00000003-0000-0000-c000-000000000000'"
}
$graphApp = (Get-EntraServicePrincipal @graphAppFilterParams)

# Get App Roles
$graphAppRoles = $graphApp.AppRoles | Where-Object { $_.Value -in $getPermissions }

# Assign the permission to App
foreach ($appRole in $graphAppRoles) {
    $params = @{
        PrincipalId = $servicePrincipal.Id
        ResourceId  = $graphApp.Id
        Id          = $appRole.Id
        ObjectId    = $servicePrincipal.Id
    }
    
    New-EntraServiceAppRoleAssignment @params | Format-List
}
```

```Output
ObjectId             : OPjyvJFY2EiTO8q3lAe1O2fUYYvw-GlIn-RvMs-7Jrs
                       Bb22Cc33Dd44Ee55Ff66Aa77Bb88-9999-0000-1111
AppRoleId            : b0afded3-3588-46d8-8b3d-9842eff778da
CreatedDateTime      : 7/24/2024 12:53:59 PM
DeletedDateTime      :
Id                   : Bb22Cc33Dd44Ee55Ff66Aa77Bb88-9999-0000-1111
PrincipalDisplayName : Contos App 1
PrincipalId          : aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb
PrincipalType        : ServicePrincipal
ResourceDisplayName  : Microsoft Graph
ResourceId           : bbbbbbbb-1111-2222-3333-cccccccccccc
AdditionalProperties : {[@odata.context,
                       https://graph.microsoft.com/v1.0/$metadata#servicePrincipals('aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb')/appRoleAssignments/$entity]}


ObjectId             : Aa11Ba22Cc33Dd44Ee55Ff66Aa77Bb88Cc99Dd00Ee1 
AppRoleId            : df021288-bdef-4463-88db-98f22de89214
CreatedDateTime      : 7/24/2024 12:54:00 PM
DeletedDateTime      :
Id                   : Aa11Ba22Cc33Dd44Ee55Ff66Aa77Bb88Cc99Dd00Ee1 
PrincipalDisplayName : Contos App 1
PrincipalId          : aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb
PrincipalType        : ServicePrincipal
ResourceDisplayName  : Microsoft Graph
ResourceId           : bbbbbbbb-1111-2222-3333-cccccccccccc
AdditionalProperties : {[@odata.context,
                       https://graph.microsoft.com/v1.0/$metadata#servicePrincipals('aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb')/appRoleAssignments/$entity]}
 
```

Refer to the [Microsoft Graph permissions reference](/graph/permissions-reference) to help you select the appropriate permission for your application.

## Contributors

*Microsoft maintains this article. The following contributors originally wrote it.*

Principal author:

- [Daniel Bradley](https://www.linkedin.com/in/danielbradley2/) | Microsoft MVP

[privileged-role-admin]: /entra/identity/role-based-access-control/permissions-reference#cloud-application-administrator
[least-privilege]: /entra/identity-platform/secure-least-privileged-access
[install]: installation.md
[entra-id-account]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F
[custom-app]: create-custom-application.md
