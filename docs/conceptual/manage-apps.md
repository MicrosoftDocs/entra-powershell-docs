---
title: Manage apps
description: Learn how to register, configure, and update apps in Microsoft Entra PowerShell.

author: csmulligan
manager: mwongerapk
ms.topic: how-to
ms.date: 02/20/2025
ms.author: cmulligan
ms.reviewer: stevemutungi

#Customer intent: As an IT admin managing apps in Microsoft Entra ID, I want to learn how to manage apps in Microsoft Entra PowerShell so that I can automate app management tasks.
---

# Manage apps

An app needs to be registered in Microsoft Entra ID before the Microsoft identity platform can authorize it to access data stored in Microsoft Entra or Microsoft 365 tenants. This condition applies to apps that you develop yourself, that your tenant owns, or that you access through an active subscription.

Many settings for apps are recorded as objects that can be accessed, updated, or deleted using Microsoft Entra PowerShell. These objects include applications, service principals, and app role assignments.

In this article, you learn how to manage app registrations and service principal objects using Microsoft Entra PowerShell. It covers registering applications, configuring properties, assigning permissions, and managing app ownership.

## Prerequisites

To manage apps with Microsoft Entra PowerShell, you need:

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- One of the following roles:
  - [Cloud Application Administrator][cloud-app-admin]
  - [Application Administrator][app-admin]
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
$myApp = Get-EntraApplication -Filter "DisplayName eq 'My new application'"
New-EntraServicePrincipal  -AppId $myApp.AppId -DisplayName 'My new service principal'
```

```Output
DisplayName Id       AppId                                SignInAudience                       ServicePrincipalType
----------- --       -----                                --------------                       --------------------
My new application   bbbbbbbb-1111-2222-3333-cccccccccccc 00001111-aaaa-2222-bbbb-3333cccc4444 MyOrg Application
```

## Configure basic properties for your app

You can configure multiple properties for your app. The following example shows how to update the display name of an application.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$application = Get-EntraApplication -Filter "DisplayName eq 'My new application'"
Set-EntraApplication -ApplicationId $application.Id -DisplayName 'Contoso application'
```

Alternatively, use pipelining to update properties of an application.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
Get-EntraApplication -Filter "DisplayName eq 'My new application'" | Set-EntraApplication -DisplayName 'Contoso application'
```

For more information, see [Set-EntraApplication][set-entraapplication].

## Limit app sign-in to only assigned identities

Limiting app sign-ins to only assigned identities using Microsoft Entra PowerShell ensures that only authorized users can access your applications, enhancing security and control.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$application = Get-EntraApplication -Filter "DisplayName eq 'My new application'"
Set-EntraServicePrincipal -ServicePrincipalId $application.Id -AppRoleAssignmentRequired $true
```

## Assign permissions to an app

You assign permissions to an app through the Microsoft Entra admin center or by using Microsoft Entra PowerShell. In PowerShell, you update the app's `requiredResourceAccess` property, including both existing and new permissions. Passing only new permissions removes any existing ones that aren't consented to.

Assigning permissions doesn't automatically grant them to the app. You must still grant admin consent using the Microsoft Entra admin center.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$application = Get-EntraApplication -Filter "DisplayName eq 'My new application'"
$requiredResourceAccess = @(
    @{resourceAppId    = '00000003-0000-0000-c000-000000000000'
        resourceAccess = @(
            @{
                id   = 'c79f8feb-a9db-4090-85f9-90d820caa0eb'
                type = 'Scope'
            }
            @{
                id   = '9a5d68dd-52b0-4cc2-bd40-abcf44ac3a30'
                type = 'Role'
            } )
    })
Set-EntraApplication -ApplicationId $application.Id -RequiredResourceAccess $requiredResourceAccess 
```

## Manage owners

### Retrieve the owner of a service principal

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$servicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'Helpdesk Application'"
Get-EntraServicePrincipalOwner -ServicePrincipalId $servicePrincipal.Id -All | Select-Object Id, DisplayName, '@odata.type'
```

Alternatively, use pipelining to retrieve the service principal's owner.

```powershell
Get-EntraServicePrincipal -Filter "displayName eq 'Helpdesk Application'" | Get-EntraServicePrincipalOwner | Select-Object Id, DisplayName, '@odata.type'
```

### Assign an owner to a service principal

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Application.ReadWrite.OwnedBy'
$servicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'Helpdesk Application'"
$owner = Get-EntraUser -UserId 'SawyerM@contoso.com'
Add-EntraServicePrincipalOwner -ServicePrincipalId $servicePrincipal.Id -OwnerId $owner.Id
```

This example shows how to add an owner to a service principal.

- `-ServicePrincipalId` - specifies the unique identifier (ObjectId) of the service principal to which you want to add an owner.
- `-OwnerId` - specifies the unique identifier (ObjectId) of the user or group that you want to add as an owner of the specified service principal.

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

## Retrieving objects owned or created by a service principal

### Objects created by a service principal

```powershell
Connect-Entra -Scopes 'Application.Read.All'
$servicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'Helpdesk Application'"
Get-EntraServicePrincipalCreatedObject -ServicePrincipalId $servicePrincipal.Id
```

### Objects owned by a service principal

```powershell
Connect-Entra -Scopes 'Application.Read.All'
$servicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'Helpdesk Application'"
Get-EntraServicePrincipalOwnedObject -ServicePrincipalId $servicePrincipal.Id -All | Select-Object Id, DisplayName, '@odata.type'
```

## Applications with expiring secrets and certificates

### Expiring application secrets or passwords

```powershell
$expirationThreshold = (Get-Date).AddDays(30)
$appsWithExpiringPasswords = Get-EntraApplication -All | Where-Object { $_.PasswordCredentials } | 
ForEach-Object {
    $app = $_
    $app.PasswordCredentials | Where-Object { $_.EndDate -le $expirationThreshold } | 
    ForEach-Object {
        [PSCustomObject]@{
            DisplayName       = $app.DisplayName
            AppId             = $app.AppId
            SecretDisplayName = $_.DisplayName
            KeyId             = $_.KeyId
            ExpiringSecret    = $_.EndDate
        }
    }
}
$appsWithExpiringPasswords | Format-Table DisplayName, AppId, SecretDisplayName, KeyId, ExpiringSecret -AutoSize
```

### Expiring certificates

```powershell
$expirationThreshold = (Get-Date).AddDays(30)
$appsWithExpiringKeys = Get-EntraApplication -All | Where-Object { $_.KeyCredentials } | 
ForEach-Object {
    $app = $_
    $app.KeyCredentials | Where-Object { $_.EndDate -le $expirationThreshold } | 
    ForEach-Object {
        [PSCustomObject]@{
            DisplayName            = $app.DisplayName
            AppId                  = $app.AppId
            CertificateDisplayName = $_.DisplayName
            KeyId                  = $_.KeyId
            ExpiringKeys           = $_.EndDate
        }
    }
}
$appsWithExpiringKeys | Format-Table DisplayName, AppId, CertificateDisplayName, KeyId, ExpiringKeys -AutoSize
```

## Related content

- [Manage users](manage-user.md)
- [Manage groups][manage-groups]

<!-- link references -->

[manage-groups]: manage-groups.md
[set-entraapplication]: /powershell/module/microsoft.entra/set-entraapplication
[cloud-app-admin]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#cloud-application-administrator
[app-admin]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#application-administrator
