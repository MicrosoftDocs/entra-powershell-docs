---
title: "Create a custom application"
description: "Learn how to create a custom application that you can use to authenticate to Microsoft Entra PowerShell."

ms.topic: how-to
ms.date: 06/26/2024
author: omondiatieno
manager: CelesteDG
ms.author: jomondi
ms.reviewer: stevemutungi
zone_pivot_groups: entra-powershell-create-custom-app
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json
#customer intent: As an IT admin, I want to create and configure a custom application in the Microsoft Entra ID so that I can manage permissions and access to Microsoft Entra resources securely.
---

# Create a custom application

:::zone pivot="powershell"

## Prerequisites

To create a custom application and grant it permissions, you need:

- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free][entraid-account].
- One of the following roles: Cloud Application Administrator, or Application Administrator.
- Required scopes (PowerShell): `AppRoleAssignment.ReadWrite.All`, `Application.ReadWrite.All`, `User.Read.All`, `Group.Read.All`, `DelegatedPermissionGrant.ReadWrite.All`

### Create an application using PowerShell

Use the custom application to isolate and limit the permissions granted for a Microsoft Entra resource.

```powershell
# Connect to Entra with required scopes
Connect-Entra -Scopes 'Application.ReadWrite.All'

# Define application name and redirect URI
$appName = 'Entra PowerShell Helpdesk App'
$redirectUri = 'http://localhost'

# Create a new application
$appParams = @{
    DisplayName            = $appName
    PublicClient           = @{ RedirectUris = $redirectUri }
    IsFallbackPublicClient = $false
}
$app = New-EntraApplication @appParams

# Create a service principal for the application
$servicePrincipalParams = @{
    AppId = $app.AppId
}
$servicePrincipal = New-EntraServicePrincipal @servicePrincipalParams
```

### Enable assignment required feature

```powershell
# Set service principal parameters
$servicePrincipalUpdateParams = @{
    ObjectId                  = $servicePrincipal.ObjectId
    AppRoleAssignmentRequired = $true
}
Set-EntraServicePrincipal @servicePrincipalUpdateParams
```

### Assign users and groups

```powershell
# Get a user and a group
$user = Get-EntraUser -UserId 'AdeleV@contoso.com'
$group = Get-EntraGroup -Search 'Sales and Marketing'

# Assign users and groups to the application
$userAppRoleAssignmentParams = @{
    ObjectId    = $user.ObjectId
    PrincipalId = $user.ObjectId
    ResourceId  = $servicePrincipal.ObjectId
    Id          = [Guid]::Empty
}
New-EntraUserAppRoleAssignment @userAppRoleAssignmentParams

$groupAppRoleAssignmentParams = @{
    ObjectId    = $group.ObjectId
    PrincipalId = $group.ObjectId
    ResourceId  = $servicePrincipal.ObjectId
    Id          = [Guid]::Empty
}
New-EntraGroupAppRoleAssignment @groupAppRoleAssignmentParams
```

### Define required resources and permissions

#### [Delegated permissions](#tab/delegated)

```powershell
# Get Graph service principal
$graphApiId = '00000003-0000-0000-c000-000000000000'
$graphServicePrincipal = Get-EntraServicePrincipal -Filter "AppId eq '$graphApiId'"
$delegatedPermission = 'User.Read.All'
$app = Get-EntraServicePrincipal -Filter "DisplayName eq 'Entra PowerShell Helpdesk App'"

# Create resource access object
$resourceAccess = New-Object Microsoft.Open.MSGraph.Model.ResourceAccess
$resourceAccess.Id = ((Get-EntraServicePrincipal -ObjectId $graphServicePrincipal.ObjectId).Oauth2PermissionScopes | Where-Object { $_.Value -eq $delegatedPermission }).Id
$resourceAccess.Type = 'Scope'

# Create required resource access object
$requiredResourceAccess = New-Object Microsoft.Open.MSGraph.Model.RequiredResourceAccess
$requiredResourceAccess.ResourceAppId = $graphApiId
$requiredResourceAccess.ResourceAccess = $resourceAccess

# Set application required resource access
$setAppParams = @{
    ObjectId               = $app.ObjectId
    RequiredResourceAccess = $requiredResourceAccess
}
Set-EntraApplication @setAppParams
```

#### [Application permissions](#tab/application)

```powershell
# Get Graph service principal
$applicationPermission = 'Group.Read.All'
$graphApiId = '00000003-0000-0000-c000-000000000000'
$graphServicePrincipal = Get-EntraServicePrincipal -Filter "AppId eq '$graphApiId'"
$app = Get-EntraServicePrincipal -Filter "DisplayName eq 'Entra PowerShell Helpdesk App'"

# Create resource access object
$resourceAccess = New-Object Microsoft.Open.MSGraph.Model.ResourceAccess
$resourceAccess.Id = ((Get-EntraServicePrincipal -ObjectId $graphServicePrincipal.ObjectId).AppRoles | Where-Object { $_.Value -eq $applicationPermission}).Id
$resourceAccess.Type = 'Scope'

# Create required resource access object
$requiredResourceAccess = New-Object Microsoft.Open.MSGraph.Model.RequiredResourceAccess
$requiredResourceAccess.ResourceAppId = $graphApiId
$requiredResourceAccess.ResourceAccess = $resourceAccess

# Set application required resource access
$setAppParams = @{
    ObjectId               = $app.ObjectId
    RequiredResourceAccess = $requiredResourceAccess
}
Set-EntraApplication @setAppParams
```

---

### Assign API permissions to the custom application

You can assign either delegated permissions or application permissions to the application.

#### [Delegated permissions](#tab/delegated)

```powershell
$delegatedPermission = 'User.Read.All'
$graphApiId = '00000003-0000-0000-c000-000000000000'
$servicePrincipal = Get-EntraServicePrincipal -Filter "DisplayName eq 'Entra PowerShell Helpdesk App'"
$graphServicePrincipal = Get-EntraServicePrincipal -Filter "AppId eq '$graphApiId'"

# Grant OAuth2 permission
$permissionGrantParams = @{
    ClientId    = $servicePrincipal.Id
    ConsentType = 'AllPrincipals'
    ResourceId  = $graphServicePrincipal.Id
    Scope       = $delegatedPermission
}
New-EntraOauth2PermissionGrant @permissionGrantParams
```

#### [Application permissions](#tab/application)

```powershell
$applicationPermission = 'Group.Read.All'
$graphApiId = '00000003-0000-0000-c000-000000000000'
$graphServicePrincipal = Get-EntraServicePrincipal -Filter "AppId eq '$graphApiId'"
$servicePrincipal = Get-EntraServicePrincipal -Filter "DisplayName eq 'Entra PowerShell Helpdesk App'"

# Get application role ID
$appRoleId = ($graphServicePrincipal.AppRoles | Where-Object { $_.Value -eq $applicationPermission }).Id

$appRoleAssignmentParams = @{
    ObjectId    = $servicePrincipal.Id
    ResourceId  = $graphServicePrincipal.Id
    Id          = $appRoleId
    PrincipalId = $servicePrincipal.Id
}
New-EntraServiceAppRoleAssignment @appRoleAssignmentParams
```

---

#### Resources

Download and run the complete script:

- Use the [create-custom-app-with-delegated-permissions](https://github.com/microsoftgraph/entra-powershell/blob/main/samples/create-custom-app-with-delegated-permissions.ps1) sample script to create a custom app with delegated permissions.
- Use the [create-custom-app-with-application-permissions](https://github.com/microsoftgraph/entra-powershell/blob/main/samples/create-custom-app-with-application-permissions.ps1) sample script to create a custom app with application permissions.

:::zone-end

:::zone pivot="ui"

## Prerequisites

To create a custom application and grant it permissions, you need:

- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free][entraid-account].
- One of the following roles: Cloud Application Administrator, or Application Administrator.

## Create an application in the Microsoft Entra admin center

To create custom applications for connecting to Microsoft Entra ID using Microsoft Entra PowerShell, follow the steps in the following section. Use the custom application to isolate and limit the permissions granted for a Microsoft Entra resource.

1. Sign in to the [Microsoft Entra admin center][entra-admin-portal] as at least a [Cloud Application Administrator][cloud-app-admin].
1. Browse to **Identity** > **Applications** > **App registrations** and then select **New Registration**.
1. Enter a name for your application, for example *Entra PowerShell Five*.
1. For **Supported account types**, select **Accounts in this organization directory**.
1. For **Redirect URI** select:
        - **Public client/native** from the drop-down
        - **URI value**: `http://localhost`
1. Select **Register**.

>[!NOTE]
> In the app's **Overview** section, copy the Application (client ID) and Directory (tenant) ID. You use the values when connecting to Microsoft Entra ID.

### Enable Assignment required feature

To manage the resources that your application gets access to in your tenant, locate the application's service principal in the **Enterprise applications** pane.

1. Browse to **Identity** > **Applications** > **Enterprise applications** > **All applications** and select the application you created.
1. Under **Manage**, select **Properties** and set **Assignment required?** to **Yes**.
1. Select **Save**.

### Assign users and groups

1. Under **Manage**, select **Users and groups**.
1. Select **Add user/group** and add the users and groups permitted to use this application.
1. Once you add all the users and groups, select **Assign**.

### Assign API permissions to the custom application

You need to set up Microsoft Graph permissions for the new application to connect to Microsoft Entra ID and manage Microsoft Entra resources.

1. Browse to **Identity** > **Applications** > **App Registrations** > **All applications** and select the application you created.
1. Under **API permissions**, select **Add a permission** > select Microsoft APIs > Microsoft Graph.
1. Choose the type of permissions you require, either delegated or application permissions.
    - If you need to sign in to the app to manage your resources in Microsoft Entra ID, select **Delegated permissions**.
    - If you want the app to access Microsoft Entra resources on its own without user interaction, select **Application permissions**
1. Search for the required permission, for example, `User.Read.All`.
1. Select **Grant admin consent for TenantName**. Select **Yes**. Ensure the status shows a green checkmark.

:::zone-end

## Sign-in using the new app

You can now use the newly created app by connecting with:

```powershell
Connect-Entra -ClientId <Your_APPLICATION_Id_Here> -TenantId <Your_TENANT_Id_Here>
```

For more connection options, see the [Connect-Entra][connect-entra-command] command details.

<!-- link references -->
[entra-admin-portal]: https://entra.microsoft.com/
[cloud-app-admin]: /entra/identity/role-based-access-control/permissions-reference#cloud-application-administrator
[connect-entra-command]: /powershell/module/microsoft.graph.entra/connect-entra
[entraid-account]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F
