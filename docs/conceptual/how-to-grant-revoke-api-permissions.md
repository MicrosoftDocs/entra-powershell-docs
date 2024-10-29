---
title: "Grant and revoke API permissions programmatically"
description: "Learn how to programmatically grant and revoke delegated and application API permissions for an app using Microsoft Entra PowerShell to. This method is an alternative to interactive admin consent."

ms.topic: how-to
ms.date: 10/17/2024
author: msewaweru
manager: CelesteDG
ms.author: eunicewaweru
ms.reviewer: stevemutungi

zone_pivot_groups: entra-powershell-grant-api-permissions
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json

#Customer intent: As a developer, I want to learn how to grant and revoke API permissions for an app using Microsoft Entra PowerShel, and bypass the interactive consent prompt available on the Microsoft Entra Admin center.
---

# Grant or revoke API permissions programmatically

When you grant API permissions to a client app in Microsoft Entra ID, the permission grants are recorded as objects that can be accessed, updated, or deleted like other objects. Using Microsoft Entra PowerShell cmdlets to directly create permission grants is a programmatic alternative to [interactive consent][interactive-consent]. This can be useful for automation scenarios, bulk management, or other custom operations in your organization.

<!-- start the grant-application-permissions zone -->
::: zone pivot="grant-application-permissions"

In this article, you learn how to grant app roles that are exposed by an API to an app. App roles, also called application permissions, or direct access permissions, allow an app to call an API with its own identity.

>[!Caution]
>Be Careful! Permissions created programmatically are not subject to review or confirmation. They take effect immediately.

## Prerequisites

To successfully complete this guide, make sure you have the required prerequisites:

1. A working Microsoft Entra tenant.
1. Microsoft Entra PowerShell is installed. To install the module, follow the [Install the Microsoft Entra PowerShell][install] guide .
1. Microsoft Entra PowerShell using a **Privileged Role Administrator** in the tenant and the appropriate permissions. For this guide, the `Application.Read.All` and `AppRoleAssignment.ReadWrite.All` delegated permissions are required. To set the permissions in Microsoft Entra PowerShell, run:

    ```powershell
    Connect-Entra -Scopes "Application.ReadWrite.All", "AppRoleAssignment.ReadWrite.All"
    ```

>[!Caution]
>The `AppRoleAssignment.ReadWrite.All` permission allows an app or a service to manage permission grants and elevate privileges for any app, user, or group in your organization. Only appropriate users should access apps that have been granted this permission.

## Step 1: Get the app roles of the resource service principal

Before you can grant app roles, you must first identify the app roles to grant and the resource service principal that exposes the app roles. App roles are defined in the `appRoles` object of a service principal.

In this article, you use the `Microsoft Graph` service principal in the tenant as your resource service principal.

```powershell
Get-EntraServicePrincipal -Filter "displayName eq 'Microsoft Graph'" -Property AppRoles | Select -ExpandProperty appRoles |fl
```

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

>[!NOTE]
>The output has been truncated for readability.

## Step 2: Create a client service principal

The first step in granting consent is to [create the service principal for the app that you grant permissions][new-entraserviceprincipal]. To do so, you need the `AppId` of your application.

### Register an application with Microsoft Entra ID

If the application isn't available, register an application with Microsoft Entra ID.

```powershell
New-EntraApplication -DisplayName 'My application' | 
  Format-List Id, DisplayName, AppId, SignInAudience, PublisherDomain
```

```Output
Id              : aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb
DisplayName     : My application
AppId           : 00001111-aaaa-2222-bbbb-3333cccc4444
SignInAudience  : AzureADandPersonalMicrosoftAccount
PublisherDomain : Contoso.com
```

### Create a service principal for the application

```powershell
New-EntraServicePrincipal -AppId '00001111-aaaa-2222-bbbb-3333cccc4444' | 
  Format-List Id, DisplayName, AppId, SignInAudience
```

```Output
Id             : bbbbbbbb-1111-2222-3333-cccccccccccc
DisplayName    : My application
AppId          : 00001111-aaaa-2222-bbbb-3333cccc4444
SignInAudience : AzureADandPersonalMicrosoftAccount
```

## Step 3: Assign an app role to the client service principal

In this step, you assign an app role exposed by your resource app to the service principal we created in step 2. To create an app role assignment, you need the following information:

1. **ObjectId** - ObjectId of a client service principal to which you're assigning the app role. This is the service principal we created in step 2.
1. **PrincipalId** - ObjectId of a client service principal to which you're assigning the app role. This is the service principal we created in step 2.
1. **ResourceId** - Object ID of the service principal representing the resource app in your tenant.
1. **Id** - ID of the app role to be assigned, defined on the service principal representing the resource.

```powershell
$clientServicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'My application'" 
$resourceServicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'Microsoft Graph'"
$appRole = $resourceServicePrincipal.AppRoles | Where-Object { $_.Value -eq "User.ReadBasic.All" }

New-EntraServicePrincipalAppRoleAssignment -ObjectId $clientServicePrincipal.Id -PrincipalId $clientServicePrincipal.Id -Id -ResourceId $resourceServicePrincipal.Id   | 
  Format-List Id, AppRoleId, CreatedDateTime, PrincipalDisplayName, PrincipalId, PrincipalType, ResourceDisplayName
```

```Output
Id                   : 2vV4mvpNrUuK2v42MReF-KqcgqHiq0xGiI38Nr6KfP4
AppRoleId            : 97235f07-e226-4f63-ace3-39588e11d3a1
CreatedDateTime      : 10/29/2024 7:58:42 AM
PrincipalDisplayName : My application
PrincipalId          : bbbbbbbb-1111-2222-3333-cccccccccccc
PrincipalType        : ServicePrincipal
ResourceDisplayName  : Microsoft Graph
```

To check the app roles assigned to the client service principal, run:

```powershell
Get-EntraServicePrincipalAppRoleAssigned -ServicePrincipalId $clientServicePrincipal.Id
```

## Step 4: Revoke an app role assignment from a client service principal

To revoke the app roles assigned in step 3, run:

```powershell
Remove-EntraServicePrincipalAppRoleAssignment -ServicePrincipalId $clientServicePrincipal.Id -AppRoleAssignmentId '2vV4mvpNrUuK2v42MReF-KqcgqHiq0xGiI38Nr6KfP4'
```

::: zone-end

<!-- end the grant-application-permissions zone -->
<!-- start the grant-delegated-permissions zone -->
::: zone pivot="grant-delegated-permissions"

In this article, you learn how to grant and revoke delegated permissions that are exposed by an API to an app. Delegated permissions, also called scopes or OAuth2 permissions, allow an app to call an API on behalf of a signed-in user.

## Prerequisites

To successfully complete this tutorial, make sure you have the required prerequisites:

1. A working Microsoft Entra tenant.
1. Microsoft Entra PowerShell SDK is installed. Follow the [Install the Microsoft Entra PowerShell SDK](installation.md) guide to install the SDK.
1. Microsoft Entra PowerShell using a Privileged Role Administrator, Application Administrator, or a Cloud Application Administrator in the tenant and the appropriate permissions. For this tutorial, the `Application.Read.All` and `DelegatedPermissionGrant.ReadWrite.All` delegated permissions are required. To set the permissions in Microsoft Entra PowerShell, run:

    ```powershell
    Connect-Entra -Scopes "Application.ReadWrite.All", "DelegatedPermissionGrant.ReadWrite.All"
    ```

>[!Caution]
>The `DelegatedPermissionGrant.ReadWrite.All` permission allows an app or a service to manage permission grants and elevate privileges for any app, user, or group in your organization. Only appropriate users should access apps that have been granted this permission.

## Step 1: Get the delegated permissions of the resource service principal

Before you can grant delegated permissions, you must first identify the delegated permissions to grant and the resource service principal that exposes the delegated permissions. Delegated permissions are defined in the `oauth2PermissionScopes` object of a service principal.

In this article, you'll use the `Microsoft Graph` service principal in the tenant as your resource service principal.

```powershell
Get-EntraServicePrincipal -Filter "displayName eq 'Microsoft Graph'" -Property Oauth2PermissionScopes | Select -ExpandProperty Oauth2PermissionScopes | fl 
```

```Output
AdminConsentDescription : Allows the app to read and write the full set of profile properties, reports, and managers of other users in your organization, on behalf of the signed-in user.
AdminConsentDisplayName : Read and write all users' full profiles
Id                      : 204e0828-b5ca-4ad8-b9f3-f32a958e7cc4
IsEnabled               : True
Origin                  :
Type                    : Admin
UserConsentDescription  : Allows the app to read and write the full set of profile properties, reports, and managers of other users in your organization, on your behalf.
UserConsentDisplayName  : Read and write all users' full profiles
Value                   : User.ReadWrite.All
AdditionalProperties    : {}

AdminConsentDescription : Allows the app to list groups, and to read their properties and all group memberships on behalf of the signed-in user.  Also allows the app to read calendar, conversations, files,
                          and other group content for all groups the signed-in user can access.
AdminConsentDisplayName : Read all groups
Id                      : 5f8c59db-677d-491f-a6b8-5f174b11ec1d
IsEnabled               : True
Origin                  :
Type                    : Admin
UserConsentDescription  : Allows the app to list groups, and to read their properties and all group memberships on your behalf.  Also allows the app to read calendar, conversations, files, and other group
                          content for all groups you can access.
UserConsentDisplayName  : Read all groups
Value                   : Group.Read.All
AdditionalProperties    : {}
```

>[!NOTE]
>The output has been truncated for readability.

## Step 2: Create a client service principal

The first step in granting consent is to  [create the service principal][new-entraserviceprincipal]. To do so, you'll need the `AppId` of your application.

<a name='register-an-application-with-azure-ad'></a>

### Register an application with Microsoft Entra ID

If the application isn't available, register an application with Microsoft Entra ID.

```powershell
New-EntraApplication -DisplayName 'My application' | 
  Format-List Id, DisplayName, AppId, SignInAudience, PublisherDomain
```

```Output
Id              : aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb
DisplayName     : My application
AppId           : 00001111-aaaa-2222-bbbb-3333cccc4444
SignInAudience  : AzureADandPersonalMicrosoftAccount
PublisherDomain : Contoso.com
```

### Create a service principal for the application

```powershell
New-EntraServicePrincipal -AppId '05210c44-437f-4a40-bd38-b5b4eaf251ef' | 
  Format-List Id, DisplayName, AppId, SignInAudience
```

```Output
Id             : bbbbbbbb-1111-2222-3333-cccccccccccc
DisplayName    : My application
AppId          : 00001111-aaaa-2222-bbbb-3333cccc4444
SignInAudience : AzureADMyOrg
```

## Step 3: Grant delegated permissions to the client enterprise application

To create a delegated permission grant, you'll need the following information:

1. **ClientId** - object ID of the client service principal to be authorized to act on behalf of the user. In this case, the service principal we created in step 2.
1. **ConsentType** - `AllPrincipals` to authorize all users in the tenant or `Principal` for a single user.
1. **PrincipalId** - `Null` for *AllPrincipals* consents or ID of the user for *Principal* consents.
1. **ResourceId** - object ID of the service principal representing the resource app in the tenant.
1. **Scope** - space-delimited list of permission claim values, for example `User.Read.All`.

In this example, the object ID of the resource service principal is `2cab1707-656d-40cc-8522-3178a184e03d`. You'll grant the `Group.Read.All` scope to the service principal and grant consent on behalf of all users in the tenant.

```powershell
$params = @{
  "ClientId" = "22c1770d-30df-49e7-a763-f39d2ef9b369"
  "ConsentType" = "AllPrincipals"
  "ResourceId" = "2cab1707-656d-40cc-8522-3178a184e03d"
  "Scope" = "Group.Read.All"
}

New-EntraOauth2PermissionGrant -BodyParameter $params | 
  Format-List Id, ClientId, ConsentType, ExpiryTime, PrincipalId, ResourceId, Scope
```

```Output
Id          : DXfBIt8w50mnY_OdLvmzadDQeqbRp9tKjNm83QyGbTw
ClientId    : 22c1770d-30df-49e7-a763-f39d2ef9b369
ConsentType : AllPrincipals
PrincipalId :
ResourceId  : a67ad0d0-a7d1-4adb-8cd9-bcdd0c866d3c
Scope       : Group.Read.All
```
To confirm the delegated permissions assigned to the service principal on behalf of the user, you run the following command.

```powershell
Get-EntraOauth2PermissionGrant -Filter "clientId eq '22c1770d-30df-49e7-a763-f39d2ef9b369' and consentType eq 'AllPrincipals'"
```

```Output
ClientId             : 22c1770d-30df-49e7-a763-f39d2ef9b369
ConsentType          : AllPrincipals
Id                   : DXfBIt8w50mnY_OdLvmzadDQeqbRp9tKjNm83QyGbTw
PrincipalId          :
ResourceId           : 2cab1707-656d-40cc-8522-3178a184e03d
Scope                : Group.Read.All User.Read.All
AdditionalProperties : {}
```

### Step 4: Grant more delegated permissions to the enterprise application

You can add more permissions to an existing oauth2PermissionGrant object.

To add the `User.Read.All` scope to the oauthPermissionGrant object, run:

```powershell
$params = @{
  Scope = "Group.Read.All User.Read.All "
  }

Update-EntraOauth2PermissionGrant -OAuth2PermissionGrantId 'DXfBIt8w50mnY_OdLvmzadDQeqbRp9tKjNm83QyGbTw' -BodyParameter $params
```

### Step 5: Revoke delegated permissions granted to an enterprise application

If a service principal has been granted multiple delegated permission grants, you can choose to revoke either specific grants or all grants.

- To revoke one or more grants, update  oauthPermissionGrant object and specify only the delegated permissions to retain in the **scope** parameter. For example, to revoke the `User.read.All` permission, run:

```powershell
$params = @{
  Scope = "Group.Read.All"
  }

Update-EntraOauth2PermissionGrant -OAuth2PermissionGrantId 'DXfBIt8w50mnY_OdLvmzadDQeqbRp9tKjNm83QyGbTw' -BodyParameter $params
```

- To revoke all grants, use `Remove-EntraOauth2PermissionGrant`.

```powershell
Remove-EntraOauth2PermissionGrant -OAuth2PermissionGrantId 'DXfBIt8w50mnY_OdLvmzadDQeqbRp9tKjNm83QyGbTw'
```

When a delegated permission grant is deleted, the access it granted is revoked. Existing access tokens will continue to be valid for their lifetime, but new access tokens won't be granted for the delegated permissions identified in the deleted oAuth2PermissionGrant.

::: zone-end
<!-- end the grant-delegated-permissions zone -->

<!-- links -->
[interactive-consent]: /azure/active-directory/manage-apps/consent-and-permissions-overview
[install]: installation.md
[new-entraserviceprincipal]: (/powershell/module/microsoft.graph.entra/new-entraserviceprincipal)