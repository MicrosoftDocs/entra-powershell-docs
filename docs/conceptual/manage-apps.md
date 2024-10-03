---
title: Manage apps
description: Learn how to register, configure, and update apps in Microsoft Entra PowerShell.

author: csmulligan
manager: CelesteDG
ms.topic: how-to
ms.date: 10/02/2024
ms.author: cmulligan
ms.reviewer: stevemutungi

#Customer intent: As an IT admin managing apps in Microsoft Entra ID, I want to learn how to manage apps in Microsoft Entra PowerShell so that I can automate app management tasks.
---

# Manage apps

Your app needs to be registered in Microsoft Entra ID before the Microsoft identity platform can authorize it to access data stored in Microsoft Entra or Microsoft 365 tenants. This condition applies to apps that you develop yourself, that your tenant owns, or that you access through an active subscription.

Many settings for apps are recorded as objects that can be accessed, updated, or deleted using Microsoft Entra PowerShell. In this article, you learn how to use Microsoft Entra PowerShell to manage app and service principal objects.

## Prerequisites

To manage apps with Microsoft Entra PowerShell, you need:

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Grant yourself the least privileged delegated permission indicated for the operation.
- Microsoft Entra PowerShell module installed. Follow the [Install Microsoft Entra PowerShell module](installation.md) guide to install the module.

## Register an application

The following request creates an app by specifying only the required `displayName` property.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
New-EntraApplication -DisplayName 'My new application'
```

```Output

DisplayName        Id                                   AppId                                SignInAudience PublisherDomain
-----------        --                                   -----                                -------------- -----------
My new application aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb bbbbbbbb-1111-2222-3333-cccccccccccc MyOrg
```

The application is assigned an ID that's unique for apps in the tenant, and an appId that's globally unique in the Microsoft Entra ecosystem.

## Create a service principal for an application

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$MyApp=(Get-EntraApplication -Filter "DisplayName eq 'My new application'")
New-EntraServicePrincipal  -AppId $MyApp.AppId 
```

```Output
DisplayName Id       AppId                                SignInAudience                       ServicePrincipalType
----------- --       -----                                --------------                       --------------------
My new application   bbbbbbbb-1111-2222-3333-cccccccccccc 00001111-aaaa-2222-bbbb-3333cccc4444 MyOrg Application
```

## Configure basic properties for your app

You can configure multiple properties for your app. The following example shows how to update the display name of an application.

```powershell
Set-EntraApplication -ObjectId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb' -DisplayName 'New Name'
```

The following example shows how to update the sign out url of an application:

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$appParams = @{
    ObjectId = 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
    LogoutUrl = 'https://contoso.com/Security/ADFS.aspx/logout'
}

Set-EntraApplication @appParams
```

For more information, see [Set-EntraApplication][set-entraapplication].

## Limit app sign-in to only assigned identities

Limiting app sign-ins to only assigned identities using Microsoft Entra PowerShell ensures that only authorized users can access your applications, thereby enhancing security and control.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$servicePrincipalParams = @{
    ObjectId = 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
    AppRoleAssignmentRequired = $True
}

Set-EntraServicePrincipal @servicePrincipalParams
```

## Assign permissions to an app

While you can assign permissions to an app through the Microsoft Entra admin center, you also assign permissions through Microsoft Entra PowerShell by updating the `requiredResourceAccess` property of the app object. You must pass in both existing and new permissions. Passing in only new permissions overwrites and removes the existing permissions that haven't yet been consented to.

Assigning permissions doesn't automatically grant them to the app. You must still grant admin consent using the Microsoft Entra admin center. 

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$RequiredResourceAccess = @(
  @{resourceAppId = '00000003-0000-0000-c000-000000000000'
      resourceAccess = @(
           @{
                 id = 'c79f8feb-a9db-4090-85f9-90d820caa0eb'
                 type = 'Scope'
             }
         @{
                id = '9a5d68dd-52b0-4cc2-bd40-abcf44ac3a30'
                type = 'Role'
           } )})
 Set-EntraApplication -ObjectId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb' -RequiredResourceAccess $RequiredResourceAccess 
```

## Manage owners

### Retrieve the owner of a service principal

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$ServicePrincipalId = (Get-EntraServicePrincipal -Top 1).ObjectId
Get-EntraServicePrincipalOwner -ObjectId $ServicePrincipalId
```

### Assign an owner to a service principal

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$ServicePrincipalId = (Get-EntraServicePrincipal -Top 1).ObjectId
$OwnerId = (Get-EntraUser -Top 1).ObjectId

$params = @{
    ObjectId = $ServicePrincipalId
    RefObjectId = $OwnerId
}

Add-EntraServicePrincipalOwner @params
```

This example shows how to add an owner to a service principal.

- `-ObjectId` - specifies the unique identifier (ObjectId) of the service principal to which you want to add an owner.

- `-RefObjectId` - specifies the unique identifier (ObjectId) of the user or group that you want to add as an owner of the specified service principal.

### Get a list of all applications without user assignment

To get a list of all applications that don't require user assignment, use the following command.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
Get-EntraServicePrincipal -All | Where-Object {$_.appRoleAssignmentRequired -ne 'True'}
```

```Output
DisplayName                          Id                                     AppId                                  SignInAudience       ServicePrincipalType
-----------------------------------  -----------------------------------    ---------------------------------      -----------------    ------------------
Microsoft password reset service     00aa00aa-bb11-cc22-dd33-44ee44ee44ee   93625bc8-bfe2-437a-97e0-3d0060024faa   AzureADMultipleOrgs  Application
Microsoft.Azure.SyncFabric           11bb11bb-cc22-dd33-ee44-55ff55ff55ff   00000014-0000-0000-c000-000000000000   AzureADMultipleOrgs  Application
Azure Security Insights              22cc22cc-dd33-ee44-ff55-66aa66aa66aa   98785600-1bb7-4fb9-b9fa-19afe2c8a360   AzureADMultipleOrgs  Application
```

## Related content

- [Manage users](manage-user.md)
- [Manage groups][manage-groups]

<!-- link references -->

[manage-groups]: manage-groups.md
[set-entraapplication]: /powershell/module/microsoft.graph.entra/set-entraapplication
