---
title: Assign App Roles
description: Learn how to assign application permissions to a service principcal in Microsoft Entra PowerShell.

author: Daniel Bradley
manager: 
ms.topic: how-to
ms.date: 06/27/2024
ms.author: Daniel Bradley
ms.reviewer: stevemutungi

#Customer intent: As an IT admin managing server principal permissions in Microsoft Entra ID, I want to learn how to assign new permissions in Microsoft Entra PowerShell so that I can automate application consent.
---

# Tutorial: Assign permissions to a service principal with Microsoft Entra PowerShell

Application permissions in Microsoft Graph that are assigned to service principals are also known as App Roles. App Roles allow the application to access data on its own, without a signed in user. This is useful for implementing automation when using Microsoft Entra PowerShell. 

In this tutorial, you’ll learn how to connect to Microsoft Entra PowerShell in the delegated context and assign the User.Read.All application permission to an existing service principal to support an automation scenario.

## Permissions

The following table highlights the available permissions for assigning app roles to service principals using Microsoft Graph.

| Permission type | Least privileged permissions | Higher privileged permissions |
| --- | --- | --- |
| Delegated (work or school account) | AppRoleAssignment.ReadWrite.All and Application.Read.All | AppRoleAssignment.ReadWrite.All and Directory.Read.All |
| Delegated (personal Microsoft account) | Not supported. | Not supported. |
| Application | AppRoleAssignment.ReadWrite.All and Application.Read.All | AppRoleAssignment.ReadWrite.All and Directory.Read.All |

In this tutorial, you will use the following least-privileged permissions in the delegated context:
- AppRoleAssignment.ReadWrite.All
- Application.Read.All

As this is a delegated scenario, you will need to grant consent to the above permissions using the interactive consent experience and with a **Global Administrator** or **Privileged Role Administrator** user. Once consent has been granted, any of the following Microsoft Entra roles can be assigned to the calling user:
- Directory Synchronization Accounts
- Directory Writer
- Hybrid Identity Administrator
- Identity Governance Administrator
- Privileged Role Administrator
- User Administrator
- Application Administrator
- Cloud Application Administrator

## Connect to Microsoft Entra PowerShell

To connect to Microsoft Entra PowerShell with the necessary permissions, run;

```powershell
Connect-Entra -Scopes AppRoleAssignment.ReadWrite.All, Application.Read.All
```

When prompted to, select **Consent on behalf of your organisation** and click **Accept**.

## Assign permissions to a service principal

If you haven't get created a service principal for your scenario, see [Create a service principal for an application](manage-apps.md#create-a-service-principal-for-an-application).
Use the below example to assign the User.Read.All permission to your service principal:

```powershell
#Get service principal
$sp = Get-EntraServicePrincipal -Filter "DisplayName eq 'My Service Principal'"

#Get Graph App Id
$graphid = (Get-EntraServicePrincipal -Filter "AppId eq '00000003-0000-0000-c000-000000000000'").id

#Get permission Id
$permission = (Get-MgServicePrincipal -Filter "AppId eq '00000003-0000-0000-c000-000000000000'").approles | `
Where {$_.Value -eq ‘User.Read.All’}

#Assign the permission
New-EntraServiceAppRoleAssignment -PrincipalId $sp.id -ResourceId $graphid -Id $permissions.id -ObjectId $sp.id
```

## Assign mulitple permissions

```powershell
#Define your required permissions
$GetPermissions = "User.Read.All", "AuditLog.Read.All"

#Get service principal
$sp = Get-EntraServicePrincipal -Filter "DisplayName eq 'My Service Principal'"

#Get Graph App Id
$graphid = (Get-EntraServicePrincipal -Filter "AppId eq '00000003-0000-0000-c000-000000000000'").id

#Get permission Id
$permissions = (Get-MgServicePrincipal -Filter "AppId eq '00000003-0000-0000-c000-000000000000'").approles | `
Where {$_.Value -in $GetPermissions}

#Assign the permission
Foreach ($perm in $permissions){
    New-EntraServiceAppRoleAssignment -PrincipalId $sp.id -ResourceId $graphid -Id $perm.id -ObjectId $sp.id
}
```

Use the [Microsoft Graph permissions reference](https://learn.microsoft.com/en-us/graph/permissions-reference) for guidance on selecting the correct permission for your application.

## Contributors

*This article is maintained by Microsoft. It was originally written by the following contributors.*

Principal author:

 * [Daniel Bradley](https://www.linkedin.com/in/danielbradley2/) | Microsoft MVP
