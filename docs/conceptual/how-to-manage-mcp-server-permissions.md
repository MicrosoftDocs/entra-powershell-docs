---
title: Manage Microsoft MCP Server for Enterprise permissions
description: Learn how to grant and revoke Microsoft MCP Server for Enterprise permissions to MCP clients using Microsoft Entra PowerShell.

ms.topic: how-to
ms.date: 11/13/2024
author: msewaweru
manager: mwongerapk
ms.author: eunicewaweru
ms.reviewer: lucaspol, meferna

#Customer intent: As an IT admin, I want to learn how to manage Microsoft MCP Server for Enterprise permissions for MCP clients using Microsoft Entra PowerShell so that I can control access to enterprise resources through Model Context Protocol.
---

# Manage Microsoft MCP Server for Enterprise permissions

The Model Context Protocol (MCP) enables AI assistants and development tools to securely access enterprise resources through Microsoft Entra ID. The Microsoft MCP Server for Enterprise provides a bridge between MCP clients (such as Visual Studio Code, Visual Studio, ChatGPT, and Claude Desktop) and your organization's Microsoft 365 data.

The Microsoft MCP Server for Enterprise exposes delegated permissions (OAuth2 scopes) that control what enterprise resources MCP clients can access on behalf of users. When you grant permissions to an MCP client, an OAuth2 permission grant is created in Microsoft Entra ID and the MCP client can only access resources within the scopes it's granted.

In this article, you learn how to grant and revoke delegated permissions for MCP clients to access the Microsoft MCP Server for Enterprise using Microsoft Entra PowerShell. This process enables you to control which AI tools can access enterprise resources on behalf of users in your organization.

## Prerequisites

To successfully complete the steps in this article, you need:

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Microsoft Entra PowerShell installed. To install the module, follow the [Install the Microsoft Entra PowerShell][install] guide.
- One of the following roles to manage Microsoft MCP Server for Enterprise permissions:
  - [Cloud Application Administrator][cloud-application-administrator]
  - [Application Administrator][application-administrator]
  - [Privileged Role Administrator][privileged-role-administrator]


## Common scenarios

### Scenario 1: Grant and revoke Microsoft MCP Server for Enterprise permissions to a predefined MCP client

When you run the `Grant-EntraBetaMCPServerPermission` cmdlet, the system automatically provisions the predefined MCP client specified in your command. The predefined clients are VisualStudioCode,VisualStudio,ChatGPT and Claude.

To grant Microsoft MCP Server for Enterprise permissions to a client, provide the following:

1. **ApplicationName** — The display name of a predefined MCP client. In this article use `VisualStudioCode` and pass it as `-ApplicationName 'VisualStudioCode'` when calling the cmdlet.  
2. **Scopes** — One or more MCP Server for Enterprise claim values (for example, `MCP.Device.Read.All`, `MCP.User.Read.All`). Include this parameter only when you want to grant or revoke specific permissions; omit it to grant or revoke all available permissions.

#### Step 1: Grant all available permissions to an MCP client

To grant all available permissions to an MCP client, run `Grant-EntraBetaMCPServerPermission` and specify the client.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'

$grant = Grant-EntraBetaMcpServerPermission -ApplicationName 'VisualStudioCode'

$grant.Scope split ' ' | ForEach-Object {
    [pscustomobject]@{ Scope = $_ }
} | Format-Table
```

```output

Operating on MCP client: Visual Studio Code
Granting all available scopes: MCP.AccessReview.Read.All, MCP.AdministrativeUnit.Read.All

✓ Successfully granted permissions to Visual Studio Code

Scope
-----
MCP.AccessReview.Read.All
MCP.AdministrativeUnit.Read.All
MCP.Application.Read.All
MCP.AuditLog.Read.All
MCP.AuthenticationContext.Read.All
MCP.Device.Read.All
MCP.DirectoryRecommendations.Read.All
MCP.Domain.Read.All
MCP.EntitlementManagement.Read.All
```

> [!NOTE]
> This output is truncated for readability.

#### Step 2: Grant specific scopes to Visual Studio Code

Before adding new scopes, review the client's current OAuth2 permission grant to see which scopes are already assigned—this helps avoid duplicates and unintended access. Use the commands below to inspect the current scopes.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'

$sp = Get-EntraServicePrincipal -Filter "displayName eq 'Visual Studio Code'"

$currentGrant = Get-EntraServicePrincipalOAuth2PermissionGrant -ServicePrincipalId $sp.Id | 
    Where-Object { $_.ResourceId -eq (Get-EntraServicePrincipal -Filter "displayName eq 'Microsoft MCP Server for Enterprise'").Id }

Write-Host "Current scopes: $($currentGrant.Scope)"
```

To add additional scopes to the Visual Studio Code MCP client while preserving the currently granted scopes, run the following command. This approach is called the additive mode.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'
$newScopes = @('MCP.AccessReview.Read.All', 'MCP.AdministrativeUnit.Read.All', 'MCP.Application.Read.All')
$grant = Grant-EntraBetaMCPServerPermission -ApplicationName 'VisualStudioCode' -Scopes $newScopes
```

```output
Operating on MCP client: Visual Studio Code
Adding specific scopes (preserving existing grant): MCP.AccessReview.Read.All, MCP.AdministrativeUnit.Read.All, MCP.Application.Read.All

✓ Successfully granted permissions to Visual Studio Code
```

#### Step 3: Revoke specific scopes from the MCP client

To revoke specific scopes from Visual Studio Code, provide the comma-separated claim values to the `-Scopes` parameter of `Revoke-EntraBetaMCPServerPermission`. The cmdlet updates the existing OAuth2PermissionGrant and returns the grant object showing the remaining scopes.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'
$result = Revoke-EntraBetaMCPServerPermission -ApplicationName 'VisualStudioCode' -Scopes 'MCP.AccessReview.Read.All', 'MCP.AdministrativeUnit.Read.All', 'MCP.Application.Read.All'

$result.Scope split ' ' | ForEach-Object {
    [pscustomobject]@{ Scope = $_ }
} | Format-Table
```

```output
✓ Permissions partially revoked from Visual Studio Code

Scope
-----
MCP.AuditLog.Read.All
MCP.AuthenticationContext.Read.All
MCP.Device.Read.All
MCP.DirectoryRecommendations.Read.All
MCP.Domain.Read.All
MCP.EntitlementManagement.Read.All
MCP.GroupMember.Read.All
```

#### Step 4: Revoke all permissions from an MCP client

Run the following command to revoke all Microsoft MCP Server for Enterprise permissions for Visual Studio Code. Revoking all permissions deletes the corresponding OAuth2PermissionGrant object for that service principal.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'

Revoke-EntraBetaMcpServerPermission -ApplicationName 'VisualStudioCode'
```

```Output
✓ All permissions revoked from Visual Studio Code
```

### Scenario 2: Grant and revoke Microsoft MCP Server for Enterprise permissions to a custom MCP client

Your organization developed a custom AI tool and wants to register it as an MCP client with specific permissions.

#### Step 1: Create the application and service principal

If you haven't registered your custom application yet, register it and create a service principal by running the following commands:

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'

# Register the application
$app = New-EntraApplication -DisplayName 'Custom MCP Client'

# Create service principal
$sp = New-EntraServicePrincipal -AppId $app.AppId

Write-Host "Custom client registered with Service Principal ID: $($sp.Id)"
```

#### Step 2: Grant all available permissions to a custom MCP client

When working with custom MCP clients, provide the following information:

1. **ApplicationId**: The application's client (App) ID — a GUID assigned when the app was registered. Use this value with the -ApplicationId parameter (not the service principal object ID).
2. **Scopes**: A comma-separated list of MCP Server for Enterprise claim values (for example, `MCP.Device.Read.All`, `MCP.User.Read.All`). Include this parameter only when you want to grant or revoke specific permissions; if you omit it, the cmdlet grants or revokes all available permissions.

To grant all available permissions, run the following command.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'
$customCClientId = (Get-EntraApplication -Filter "displayName eq 'Custom MCP Client'").AppId
$grant = Grant-EntraBetaMcpServerPermission -ApplicationId $customCClientId

$grant.Scope split ' ' | ForEach-Object {
    [pscustomobject]@{ Scope = $_ }
} | Format-Table
```

```output

Operating on MCP client: CustomMCPClient
Granting all available scopes: MCP.AccessReview.Read.All, MCP.AdministrativeUnit.Read.All

✓ Successfully granted permissions to CustomMCPClient
Scope
-----
MCP.AccessReview.Read.All
MCP.AdministrativeUnit.Read.All
MCP.Application.Read.All
MCP.AuditLog.Read.All
MCP.AuthenticationContext.Read.All
MCP.Device.Read.All
MCP.DirectoryRecommendations.Read.All
MCP.Domain.Read.All
MCP.EntitlementManagement.Read.All

```

> [!NOTE]
> Output is shortened for readability.

#### Step 3: Grant specific scope to a custom MCP client

The command adds the specified scopes to the MCP client and preserves the existing scopes. This approach is called the additive mode.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'
$customCClientId = (Get-EntraApplication -Filter "displayName eq 'Custom MCP Client'").AppId
$newScopes = @('MCP.AccessReview.Read.All', 'MCP.AdministrativeUnit.Read.All', 'MCP.Application.Read.All')
$grant = Grant-EntraBetaMCPServerPermission -ApplicationId $customCClientId -Scopes $newScopes
```

```output
Operating on MCP client: CustomMCPClient
Adding specific scopes (preserving existing grant): MCP.AccessReview.Read.All, MCP.AdministrativeUnit.Read.All, MCP.Application.Read.All

✓ Successfully granted permissions to CustomMCPClient
```

#### Step 4: Revoke specific scopes from the custom MCP client

To revoke specific scopes from Custom MCP Client, provide the comma-separated claim values in the `Scopes` parameter. The command returns the updated OAuth2PermissionGrant object with the remaining permissions.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'

$customCClientId = (Get-EntraApplication -Filter "displayName eq 'Custom MCP Client'").AppId
$removeScopes = @('MCP.AccessReview.Read.All', 'MCP.AdministrativeUnit.Read.All', 'MCP.Application.Read.All')
$result = Revoke-EntraBetaMCPServerPermission -ApplicationId $customCClientId -Scopes $removeScopes

$result.Scope split ' ' | ForEach-Object {
    [pscustomobject]@{ Scope = $_ }
} | Format-Table
```

```output
✓ Permissions partially revoked from CustomMCPClient

Scope
-----
MCP.AuditLog.Read.All
MCP.AuthenticationContext.Read.All
MCP.Device.Read.All
MCP.DirectoryRecommendations.Read.All
MCP.Domain.Read.All
MCP.EntitlementManagement.Read.All
MCP.GroupMember.Read.All
```

#### Step 5: Revoke all permissions from a custom MCP client

To revoke all Microsoft MCP Server for Enterprise permissions from a custom MCP client, run the following command. Revoking all permissions deletes the OAuth2PermissionGrant for that application, preventing the client from accessing MCP-protected resources on behalf of users.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'
$customCClientId = (Get-EntraApplication -Filter "displayName eq 'Custom MCP Client'").AppId
Revoke-EntraBetaMcpServerPermission -ApplicationId $customCClientId
```

```Output
✓ All permissions revoked from CustomMCPClient
```

### Scenario 3: Audit MCP client permissions across your tenant

As a security administrator, audit which MCP clients can access the Microsoft MCP Server for Enterprise and the specific delegated permissions granted to each client. Use the following script to generate a tenant-wide report.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'

# Get the MCP Server service principal
$mcpServer = Get-EntraServicePrincipal -Filter "displayName eq 'Microsoft MCP Server for Enterprise'"

# Get all OAuth2 permission grants where MCP Server is the resource
$allGrants = Get-EntraOAuth2PermissionGrant -All | Where-Object { $_.ResourceId -eq $mcpServer.Id }

# Create a report
$report = $allGrants | ForEach-Object {
    $clientSp = Get-EntraServicePrincipal -ServicePrincipalId $_.ClientId
    [PSCustomObject]@{
        ClientName    = $clientSp.DisplayName
        Scopes        = $_.Scope
        }
}

$report | Format-List
```

```Output
ClientName : Visual Studio Code
Scopes     : MCP.AccessReview.Read.All MCP.AdministrativeUnit.Read.All MCP.Application.Read.All MCP.RoleEligibilitySchedule.Read.Directory MCP.RoleManagement.Read.Directory

ClientName : M365 MCP Client for Claude
Scopes     : MCP.User.Read.All

ClientName : Custom MCP Client
Scopes     : MCP.AuditLog.Read.All MCP.AuthenticationContext.Read.All MCP.Device.Read.All MCP.DirectoryRecommendations.Read.All MCP.Domain.Read.All MCP.EntitlementManagement.Read.All MCP.GroupMember.Read.All MCP.HealthMonitoringAlert.Read.All MCP.IdentityRiskEvent.Read.All
             MCP.IdentityRiskyServicePrincipal.Read.All MCP.IdentityRiskyUser.Read.All MCP.LicenseAssignment.Read.All MCP.LifecycleWorkflows-CustomExt.Read.All MCP.LifecycleWorkflows-Reports.Read.All MCP.LifecycleWorkflows-Workflow.Read.All
```

## Related content

- [Manage apps][manage-apps]
- [Grant and revoke API permissions][grant-revoke-api]
- [OAuth2PermissionGrant resource type](/graph/api/resources/oauth2permissiongrant)

<!-- links -->
[install]: installation.md
[manage-apps]: manage-apps.md
[grant-revoke-api]: how-to-grant-revoke-api-permissions.md
[best-practices]: entra-powershell-best-practices.md
[privileged-role-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#privileged-role-administrator
[application-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#application-administrator
[cloud-application-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#cloud-application-administrator
