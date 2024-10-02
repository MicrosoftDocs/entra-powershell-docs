---
title: "Create a custom application"
description: "Learn how to create a custom application that you can use to authenticate to Microsoft Entra PowerShell."

ms.topic: how-to
ms.date: 06/26/2024
author: omondiatieno
manager: CelesteDG
ms.author: jomondi
ms.reviewer: stevemutungi
#customer intent: As an IT admin, I want to create and configure a custom application in the Microsoft Entra ID so that I can manage permissions and access to Microsoft Entra resources securely.
---

# Create a custom application

## Prerequisites

To create a custom application and grant it permissions, you need:

- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free][entraid-account].
- One of the following roles: Cloud Application Administrator, or Application Administrator.
- Required scopes (PowerShell): `AppRoleAssignment.ReadWrite.All`, `Application.ReadWrite.All`, `User.Read.All`, `Group.Read.All`, `DelegatedPermissionGrant.ReadWrite.All`

## Create an application in the Microsoft Entra admin center

To create custom applications for connecting to Microsoft Entra ID using Microsoft Entra PowerShell, follow the steps in the following section. Use the custom application to isolate and limit the permissions granted for a Microsoft Entra resource.

### [Microsoft Entra PowerShell](#tab/entrapowershell)

```powershell
# Connect to Entra with required scopes
Connect-Entra -Scopes 'AppRoleAssignment.ReadWrite.All', 'Application.ReadWrite.All', 'User.Read.All', 'Group.Read.All', 'DelegatedPermissionGrant.ReadWrite.All', 'AuditLog.Read.All'

# Define application name and redirect URI
$AppName = "Entra PowerShell Five"
$RedirectUri = "http://localhost"

# Define Application permission and Graph API ID
$ApplicationPermission = 'Group.Read.All'
$GraphApiId = '00000003-0000-0000-c000-000000000000'

# Get a user and a group
$User = Get-EntraUser -SearchString 'Adele'
$Group = Get-EntraGroup -Search 'Sales and Marketing'

# Create a new application
$AppParams = @{
    DisplayName            = $AppName
    PublicClient           = @{ RedirectUris = $RedirectUri }
    IsFallbackPublicClient = $false
}
$App = New-EntraApplication @AppParams

# Create a service principal for the application
$ServicePrincipalParams = @{
    AppId = $App.AppId
}
$ServicePrincipal = New-EntraServicePrincipal @ServicePrincipalParams

# Assign users and groups to the application
$UserAppRoleAssignmentParams = @{
    ObjectId    = $User.ObjectId
    PrincipalId = $User.ObjectId
    ResourceId  = $ServicePrincipal.ObjectId
    Id          = [Guid]::Empty
}
New-EntraUserAppRoleAssignment @UserAppRoleAssignmentParams

$GroupAppRoleAssignmentParams = @{
    ObjectId    = $Group.ObjectId
    PrincipalId = $Group.ObjectId
    ResourceId  = $ServicePrincipal.ObjectId
    Id          = [Guid]::Empty
}
New-EntraGroupAppRoleAssignment @GroupAppRoleAssignmentParams
```

### [Microsoft Entra Admin Center](#tab/admincenter)

1. Sign in to the [Microsoft Entra admin center][entra-admin-portal] as at least a [Cloud Application Administrator][cloud-app-admin].
1. Browse to **Identity** > **Applications** > **App registrations** and then select > **New Registration**.
1. Enter a name for your application, for example *Microsoft Entra PowerShell App*.
1. For **Supported account types**, select **Accounts in this organization directory**.
1. For **Redirect URI** select:
        - **Public client/native** from the drop-down
        - **URI value**: `http://localhost`
1. Select **Register**.
To manage the resources that your application gets access to in your tenant, locate the application's service principal in the **Enterprise applications** pane.

1. Browse to **Identity** > **Applications** > **Enterprise applications** > **All applications** and select the application you created.
1. Under **Manage**, select **Properties** and set **Assignment required?** to **Yes**.
1. Select **Save**.
1. Under **Manage**, select **Users and groups**.
1. Select **Add user/group** and add the users and groups permitted to use this application.
1. Once you add all the users and groups, select **Assign**.

>[!NOTE]
> In the app's **Overview** section, copy the Application (client ID) and Directory (tenant) ID. You use the values when connecting to Microsoft Entra ID.

---

## Assign API permissions to the custom application

You need to set up Microsoft Graph permissions for the new application to connect to Microsoft Entra ID and manage Microsoft Entra resources.

### [Microsoft Entra Admin Center](#tab/ui)

1. Browse to **Identity** > **Applications** > **App Registrations** > **All applications** and select the application you created.
1. Under **API permissions**, select **Add a permission** > Select Microsoft APIs > Microsoft Graph.
1. Choose the type of permissions you require, either delegated or application permissions.
    - If you need to sign in to the app to manage your resources in Microsoft Entra ID, select **Delegated permissions**.
    - If you want the app to access Microsoft Entra resources on its own without user interaction, select **Application permissions**
1. Search for the required permission for example, `User.Read.All`.
1. Select **Grant admin consent for TenantName**. Select **Yes**. Ensure the status shows a green checkmark.

### [Delegated permissions](#tab/delegated)

```powershell
# Get Graph service principal
$GraphServicePrincipal = Get-EntraServicePrincipal -Filter "AppId eq '$GraphApiId'"

# Create resource access object
$ResourceAccess = New-Object Microsoft.Open.MSGraph.Model.ResourceAccess
$ResourceAccess.Id = ((Get-EntraServicePrincipal -ObjectId $GraphServicePrincipal.ObjectId).Oauth2PermissionScopes | Where-Object { $_.Value -eq $DelegatedPermission }).Id
$ResourceAccess.Type = 'Scope'

# Create required resource access object
$RequiredResourceAccess = New-Object Microsoft.Open.MSGraph.Model.RequiredResourceAccess
$RequiredResourceAccess.ResourceAppId = $GraphApiId
$RequiredResourceAccess.ResourceAccess = $ResourceAccess

# Set application required resource access
$SetAppParams = @{
    ObjectId               = $App.ObjectId
    RequiredResourceAccess = $RequiredResourceAccess
}
Set-EntraApplication @SetAppParams

# Set service principal parameters
$ServicePrincipalUpdateParams = @{
    ObjectId                  = $ServicePrincipal.ObjectId
    AppRoleAssignmentRequired = $true
}
Set-EntraServicePrincipal @ServicePrincipalUpdateParams

# Grant OAuth2 permission
$PermissionGrantParams = @{
    ClientId    = $ServicePrincipal.Id
    ConsentType = 'AllPrincipals'
    ResourceId  = $GraphServicePrincipal.Id
    Scope       = $DelegatedPermission
}
New-EntraOauth2PermissionGrant @PermissionGrantParams
```

See the [sample script](https://github.com/microsoftgraph/entra-powershell/tree/main/samples) for creating a custom application with delegated permissions.

### [Application permissions](#tab/application)

```powershell
# Get Graph service principal
$GraphServicePrincipal = Get-EntraServicePrincipal -Filter "AppId eq '$GraphApiId'"

# Create resource access object
$ResourceAccess = New-Object Microsoft.Open.MSGraph.Model.ResourceAccess
$ResourceAccess.Id = ((Get-EntraServicePrincipal -ObjectId $GraphServicePrincipal.ObjectId).AppRoles | Where-Object { $_.Value -eq $ApplicationPermission}).Id
$ResourceAccess.Type = 'Scope'

# Create required resource access object
$RequiredResourceAccess = New-Object Microsoft.Open.MSGraph.Model.RequiredResourceAccess
$RequiredResourceAccess.ResourceAppId = $GraphApiId
$RequiredResourceAccess.ResourceAccess = $ResourceAccess

# Set application required resource access
$SetAppParams = @{
    ObjectId               = $App.ObjectId
    RequiredResourceAccess = $RequiredResourceAccess
}
Set-EntraApplication @SetAppParams

# Set service principal parameters
$ServicePrincipalUpdateParams = @{
    ObjectId                  = $ServicePrincipal.ObjectId
    AppRoleAssignmentRequired = $true
}
Set-EntraServicePrincipal @ServicePrincipalUpdateParams

# Get application role ID
$AppRoleId = ($GraphServicePrincipal.AppRoles | Where-Object { $_.Value -eq $ApplicationPermission }).Id

$AppRoleAssignmentParams = @{
    ObjectId    = $ServicePrincipal.Id
    ResourceId  = $GraphServicePrincipal.Id
    Id          = $AppRoleId
    PrincipalId = $ServicePrincipal.Id
}

New-EntraServiceAppRoleAssignment @AppRoleAssignmentParams
```

See the [sample script](https://github.com/microsoftgraph/entra-powershell/tree/main/samples) for creating a custom application with application permissions.

---

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
