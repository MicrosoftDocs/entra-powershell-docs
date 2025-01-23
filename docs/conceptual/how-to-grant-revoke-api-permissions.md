---
title: "Grant and revoke API permissions programmatically"
description: "Learn how to programmatically grant and revoke delegated and application API permissions for an app using Microsoft Entra PowerShell to. This method is an alternative to interactive admin consent."

ms.topic: how-to
ms.date: 10/30/2024
author: msewaweru
manager: CelesteDG
ms.author: eunicewaweru
ms.reviewer: stevemutungi

zone_pivot_groups: entra-powershell-grant-api-permissions
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json

#Customer intent: As a developer, I want to learn how to grant and revoke API permissions for an app using Microsoft Entra PowerShel, and bypass the interactive consent prompt available on the Microsoft Entra Admin center.
---

# Grant and revoke API permissions

When you grant API permissions to a client app in Microsoft Entra ID, the permission grants are recorded as objects that can be accessed, updated, or deleted like other objects. Using Microsoft Entra PowerShell cmdlets to directly create permission grants is a programmatic alternative to [interactive consent][interactive-consent] and can be useful for automation scenarios, bulk management, or other custom operations in your organization.

<!-- start the grant-delegated-permissions zone -->
::: zone pivot="grant-delegated-permissions"

In this article, you learn how to grant and revoke delegated permissions that are exposed by an API to an app. Delegated permissions, also called scopes, or OAuth2 permissions, allow an app to call an API on behalf of a signed-in user.

## Prerequisites

To successfully complete this guide, make sure you have the required prerequisites:

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Microsoft Entra PowerShell is installed. To install the module, follow the [Install the Microsoft Entra PowerShell][install] guide.
- To use Microsoft Entra PowerShell, you need a [Privileged Role Administrator][privileged-role-administrator], [Application Administrator][application-administrator], or [Cloud Application Administrator][cloud-application-administrator] role in the tenant with the necessary permissions. For this guide, you need `Application.Read.All` and `DelegatedPermissionGrant.ReadWrite.All` delegated permissions. To grant these permissions in Microsoft Entra PowerShell, run the following command.

  ```powershell
  Connect-Entra -Scopes "Application.ReadWrite.All", "DelegatedPermissionGrant.ReadWrite.All"
  ```

  >[!Caution]
  >The `DelegatedPermissionGrant.ReadWrite.All` permission allows an app or a service to manage permission grants and elevate privileges for any app, user, or group in your organization. Only appropriate users should access apps that are granted this permission.

## Step 1: Get the delegated permissions of the resource service principal

Before you can grant delegated permissions, you first identify the delegated permissions to grant and the resource service principal that exposes the delegated permissions. Delegated permissions are defined in the `oauth2PermissionScopes` object of a service principal.

In this article, you use the `Microsoft Graph` service principal in the tenant as your resource service principal.

```powershell
Get-EntraServicePrincipal -Filter "displayName eq 'Microsoft Graph'" -Property Oauth2PermissionScopes |
  Select-Object -ExpandProperty Oauth2PermissionScopes | Format-List
```

The output is as follows.

```Output
AdminConsentDescription : Allows the app to read a basic set of profile properties of other users in your organization on behalf of the signed-in user. This includes display name, first and last name, email address and photo.
AdminConsentDisplayName : Read all users' basic profiles
Id                      : b340eb25-3456-403f-be2f-af7a0d370277
IsEnabled               : True
Origin                  :
Type                    : User
UserConsentDescription  : Allows the app to read a basic set of profile properties of other users in your organization on your behalf. Includes display name, first and last name, email address and photo.
UserConsentDisplayName  : Read all users' basic profiles
Value                   : User.ReadBasic.All
AdditionalProperties    : {}

AdminConsentDescription : Allows the app to read your profile. It also allows the app to update your profile information on your behalf.
AdminConsentDisplayName : Read and write access to user profile
Id                      : b4e74841-8e56-480b-be8b-910348b18b4c
IsEnabled               : True
Origin                  :
Type                    : User
UserConsentDescription  : Allows the app to read your profile, and discover your group membership, reports and manager. It also allows the app to update your profile information on your behalf.
UserConsentDisplayName  : Read and update your profile
Value                   : User.ReadWrite
AdditionalProperties    : {}
```

**Note:** Output is shortened for readability.

## Step 2: Create a client service principal

The first step in granting consent is to  [create the service principal for the app that you grant permissions][new-entraserviceprincipal]. To do so, you need the `AppId` of your application.

### Register an application with Microsoft Entra ID

If the application isn't available, register an application with Microsoft Entra ID.

```powershell
New-EntraApplication -DisplayName 'My application' | 
  Format-List Id, DisplayName, AppId, SignInAudience, PublisherDomain
```

The output is as follows.

```Output
Id              : aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb
DisplayName     : My application
AppId           : 00001111-aaaa-2222-bbbb-3333cccc4444
SignInAudience  : AzureADandPersonalMicrosoftAccount
PublisherDomain : Contoso.com
```

### Create a service principal for the application

```powershell
$application = Get-EntraApplication -Filter "displayName eq 'My application'"
New-EntraServicePrincipal -AppId $application.AppId |
  Format-List Id, DisplayName, AppId, SignInAudience
```

The output is as follows.

```Output
Id             : bbbbbbbb-1111-2222-3333-cccccccccccc
DisplayName    : My application
AppId          : 00001111-aaaa-2222-bbbb-3333cccc4444
SignInAudience : AzureADandPersonalMicrosoftAccount
```

## Step 3: Grant delegated permissions to the client enterprise application

To create a delegated permission grant, you need the following information:

1. **ClientId** - object ID of the client service principal to be authorized to act on behalf of the user. In this case, the service principal we created in step 2.
1. **ConsentType** - `AllPrincipals` to authorize all users in the tenant or `Principal` for a single user.
1. **ResourceId** - object ID of the service principal representing the resource app in the tenant.
1. **Scope** - space-delimited list of permission claim values, for example `User.ReadWrite`.

```powershell
$scopes = 'User.Read.All, Group.Read.All'
$clientServicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'My application'" 
$resourceServicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'Microsoft Graph'"

$oauthPermissionGrant= New-EntraOauth2PermissionGrant -ClientId $clientServicePrincipal.Id -ConsentType 'AllPrincipals' -ResourceId $resourceServicePrincipal.Id -Scope $scopes

$oauthPermissionGrant | Format-List Id, ClientId, ConsentType, Scope
```

The output is as follows.

```Output
Id          : DXfBIt8w50mnY_OdLvmzadDQeqbRp9tKjNm83QyGbTw
ClientId    : bbbbbbbb-1111-2222-3333-cccccccccccc
ConsentType : AllPrincipals
PrincipalId :
Scope       : Group.Read.All
```

To confirm the delegated permissions assigned to the service principal on behalf of the user, you run the following command.

```powershell
Get-EntraOAuth2PermissionGrant | 
  Where-Object {$_.ClientId -eq $clientServicePrincipal.Id} | Format-List
```

### Step 4: Revoke delegated permissions granted to an enterprise application

To revoke the scopes assigned in step 3, run the following command.

```powershell
$clientServicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'My application'" 
Get-EntraOAuth2PermissionGrant | 
  Where-Object {$_.ClientId -eq $clientServicePrincipal.Id} | 
  Remove-EntraOauth2PermissionGrant
```

When a delegated permission grant is deleted, the access it granted is revoked. Existing access tokens continue to be valid for their lifetime, but new access tokens aren't granted for the delegated permissions identified in the deleted oAuth2PermissionGrant.

::: zone-end
<!-- end the grant-delegated-permissions zone -->
<!-- start the grant-application-permissions zone -->
::: zone pivot="grant-application-permissions"

In this article, you learn how to grant app roles that are exposed by an API to an app. App roles, also called application permissions, or direct access permissions, allow an app to call an API with its own identity.

>[!Caution]
>Be Careful! Permissions created programmatically are not subject to review or confirmation. They take effect immediately.

## Prerequisites

To successfully complete this guide, make sure you have the required prerequisites:

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Microsoft Entra PowerShell is installed. To install the module, follow the [Install the Microsoft Entra PowerShell][install] guide.
- To use Microsoft Entra PowerShell, a [Privileged Role Administrator][privileged-role-administrator] role in the tenant with the necessary permissions is required. For this guide, you need `Application.Read.All` and `AppRoleAssignment.ReadWrite.All` delegated permissions. To set these permissions in Microsoft Entra PowerShell, run the following command.

  ```powershell
  Connect-Entra -Scopes "Application.ReadWrite.All", "AppRoleAssignment.ReadWrite.All"
  ```

  >[!Caution]
  >The `AppRoleAssignment.ReadWrite.All` permission allows an app or a service to manage permission grants and elevate privileges for any app, user, or group in your organization. Only appropriate users should access apps that are granted this permission.

## Step 1: Get the app roles of the resource service principal

Before you can grant app roles, you first identify the app roles to grant and the resource service principal that exposes the app roles. App roles are defined in the `appRoles` object of a service principal.

In this article, you use the `Microsoft Graph` service principal in the tenant as your resource service principal.

```powershell
Get-EntraServicePrincipal -Filter "displayName eq 'Microsoft Graph'" -Property AppRoles |
  Select-Object -ExpandProperty appRoles |Format-List
```

The output is as follows.

```Output
AllowedMemberTypes   : {Application}
Description          : Allows the app to read a basic set of profile properties of other users in your organization without a signed-in user. Includes
                       display name, first and last name, email address, open extensions, and photo.
DisplayName          : Read all users' basic profiles
Id                   : 97235f07-e226-4f63-ace3-39588e11d3a1
IsEnabled            : True
Origin               : Application
Value                : User.ReadBasic.All
AdditionalProperties : {}

AllowedMemberTypes   : {Application}
Description          : Allows the app to read and update user profiles without a signed in user.
DisplayName          : Read and write all users' full profiles
Id                   : 741f803b-c850-494e-b5df-cde7c675a1ca
IsEnabled            : True
Origin               : Application
Value                : User.ReadWrite.All
AdditionalProperties : {}
```

**Note:** Output is shortened for readability.

## Step 2: Create a client service principal

The first step in granting consent is to [create the service principal for the app that you grant permissions][new-entraserviceprincipal]. To do so, you need the `AppId` of your application.

### Register an application with Microsoft Entra ID

If the application isn't available, register an application with Microsoft Entra ID.

```powershell
New-EntraApplication -DisplayName 'My application' | 
  Format-List Id, DisplayName, AppId, SignInAudience, PublisherDomain
```

The output is as follows.

```Output
Id              : aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb
DisplayName     : My application
AppId           : 00001111-aaaa-2222-bbbb-3333cccc4444
SignInAudience  : AzureADandPersonalMicrosoftAccount
PublisherDomain : Contoso.com
```

### Create a service principal for the application

```powershell
$application = Get-EntraApplication -Filter "DisplayName eq 'My application'"
New-EntraServicePrincipal -AppId $application.AppId | 
  Format-List Id, DisplayName, AppId, SignInAudience
```

The output is as follows.

```Output
Id             : bbbbbbbb-1111-2222-3333-cccccccccccc
DisplayName    : My application
AppId          : 00001111-aaaa-2222-bbbb-3333cccc4444
SignInAudience : AzureADandPersonalMicrosoftAccount
```

## Step 3: Assign an app role to the client service principal

In this step, you assign an app role exposed by your resource app to the service principal we created in step 2. To create an app role assignment, you need the following information:

1. **ObjectId** - Object ID of a client service principal to which you're assigning the app role. This object is the service principal we created in step 2.
1. **PrincipalId** - Object ID of a client service principal to which you're assigning the app role. This object is the service principal we created in step 2.
1. **ResourceId** - Object ID of the service principal representing the resource app in your tenant.
1. **Id** - ID of the app role to be assigned, defined on the service principal representing the resource.

```powershell
$permission = "Application.Read.All"
$clientServicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'My application'" 
$resourceServicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'Microsoft Graph'"

$appRole = $resourceServicePrincipal.AppRoles | Where-Object { $_.Value -eq $permission }

$appRoleAssignment = New-EntraServicePrincipalAppRoleAssignment -ObjectId $clientServicePrincipal.Id -PrincipalId $clientServicePrincipal.Id -Id $appRole.Id -ResourceId $resourceServicePrincipal.Id

$appRoleAssignment | Format-List Id, AppRoleId, CreatedDateTime, PrincipalDisplayName, PrincipalId, PrincipalType, ResourceDisplayName
```

The output is as follows.

```Output
Id                   : 2vV4mvpNrUuK2v42MReF-KqcgqHiq0xGiI38Nr6KfP4
AppRoleId            : 97235f07-e226-4f63-ace3-39588e11d3a1
CreatedDateTime      : 10/29/2024 7:58:42 AM
PrincipalDisplayName : My application
PrincipalId          : bbbbbbbb-1111-2222-3333-cccccccccccc
PrincipalType        : ServicePrincipal
ResourceDisplayName  : Microsoft Graph
```

To check the app roles assigned to the client service principal, run the following command.

```powershell
Get-EntraServicePrincipalAppRoleAssignedTo -ServicePrincipalId $clientServicePrincipal.Id
```

### Assign multiple app roles to the client service principal

To assign multiple app roles to the client service principal, you can create multiple app role assignments. For example, to assign the `User.ReadBasic.All` and `User.ReadWrite.All` app roles to the client service principal, run the following command.

```powershell
$permissions = 'Application.Read.All', 'User.Read.All'

$clientServicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'My application'"
$resourceServicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'Microsoft Graph'"

$appRoles = $resourceServicePrincipal.AppRoles | Where-Object { $_.Value -in $permissions }

ForEach ($appRole in $appRoles) {
    New-EntraServicePrincipalAppRoleAssignment -ObjectId $clientServicePrincipal.Id `
        -PrincipalId $clientServicePrincipal.Id -Id $appRole.Id -ResourceId $resourceServicePrincipal.Id
}
```

## Step 4: Revoke an app role assignment from a client service principal

To revoke the app roles assigned in step 3, run the following commands.

```powershell
$permissions = 'Application.Read.All'

$clientServicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'My application'"
$resourceServicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'Microsoft Graph'"

$appRole = $resourceServicePrincipal.AppRoles | Where-Object {$_.Value -eq $permissions}

$roleAssignment = Get-EntraServicePrincipalAppRoleAssignedTo -ServicePrincipalId $clientServicePrincipal.Id | Where-Object {$_.AppRoleId -eq $appRole.Id}

Remove-EntraServicePrincipalAppRoleAssignment -ServicePrincipalId $clientServicePrincipal.Id -AppRoleAssignmentId $roleAssignment.Id
```

## Contributors

- [Daniel Bradley](https://www.linkedin.com/in/danielbradley2/) | Microsoft MVP

::: zone-end

<!-- end the grant-application-permissions zone -->

<!-- links -->
[interactive-consent]: /azure/active-directory/manage-apps/consent-and-permissions-overview
[install]: installation.md
[new-entraserviceprincipal]: /powershell/module/microsoft.entra/new-entraserviceprincipal
[privileged-role-administrator]: /entra/identity/role-based-access-control/permissions-reference#privileged-role-administrator
[application-administrator]: /entra/identity/role-based-access-control/permissions-reference#application-administrator
[cloud-application-administrator]: /entra/identity/role-based-access-control/permissions-reference#cloud-application-administrator