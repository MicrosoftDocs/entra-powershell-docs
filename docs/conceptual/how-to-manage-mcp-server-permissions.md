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

In this article, you learn how to grant and revoke delegated permissions for MCP clients to access the Microsoft MCP Server for Enterprise using Microsoft Entra PowerShell. This enables you to control which AI tools can access enterprise resources on behalf of users in your organization.

## Prerequisites

To successfully complete the steps in this article, you need:

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Microsoft Entra PowerShell is installed. To install the module, follow the [Install the Microsoft Entra PowerShell][install] guide.
- To manage Microsoft MCP Server for Enterprise permissions, you need one of the following roles:
  - [Cloud Application Administrator][cloud-application-administrator]
  - [Application Administrator][application-administrator]
  - [Privileged Role Administrator][privileged-role-administrator]

In this article we assume that the predefined MCP clients are setup in your tenant. For this how-to, we use Visual Studio Code MCP client.

## Common scenarios

### Scenario 1: Grant and revoke Microsoft MCP Server for Enterprise permissions to a predefined MCP client

To grant Microsoft MCP Server for Enterprise permissions to a client, you need the following infomation:

1. **ApplicationName**: Name of the predefined MCP client. For this article we use `VisualStudioCode`.
2. **Scopes**: A list of space-separated MCP Server for Enterprise claim values, for example, `MCP.Device.Read.All` `MCP.User.Read.All`. This parameter is only required when you want to specify the permissions. Without it, all permissions are granted.

#### Step 1: Grant all available permissions to an MCP client

First, connect to Microsoft Entra with the required scopes:

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
> This output is trancated for readability.

#### Step 2: Revoke specific scopes from the MCP client

To revoke specific scopes from Visual Studio Code, you provide the comma-separated claim values in the `Scopes` parameter. The command returns the updated OAuth2PermissionGrant object with the remaining permissions.

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

#### Step 3: Revoke all permissions from an MCP client

To revoke all Microsoft MCP Server for Enterprise permissions from Visual Studio Code, run the following command. When all permissions are revoked, the OAuth2PermissionGrant object is deleted.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'

Revoke-EntraBetaMcpServerPermission -ApplicationName 'VisualStudioCode'
```

```Output
✓ All permissions revoked from Visual Studio Code
```

#### Step 4: Grant specific scopes to Visual Studio Code

Before adding new scope to the client, check what permissions are currently granted:

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'

$sp = Get-EntraServicePrincipal -Filter "displayName eq 'Visual Studio Code'"
$currentGrant = Get-EntraServicePrincipalOAuth2PermissionGrant -ServicePrincipalId $sp.Id | 
    Where-Object { $_.ResourceId -eq (Get-EntraServicePrincipal -Filter "displayName eq 'Microsoft MCP Server for Enterprise'").Id }

Write-Host "Current scopes: $($currentGrant.Scope)"
```

To add more scopes to Visual Studo Code, run the following command:

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

### Scenario 2: Grant and revoke Microsoft MCP Server for Enterprise permissions to a custom MCP client

Your organization has developed a custom AI tool and wants to register it as an MCP client with specific permissions.

#### Step 1: Create the application and service principal

If your custom application isn't registered yet:

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'

# Register the application
$app = New-EntraApplication -DisplayName 'Custom MCP Client'

# Create service principal
$sp = New-EntraServicePrincipal -AppId $app.AppId

Write-Host "Custom client registered with Service Principal ID: $($sp.Id)"
```

#### Step 2: Grant all available permissions to a custom MCP client

When working with custom MCP clients, you need the following information:

1. **ApplicationId**: Client ID of the custom MCP client.
2. **Scopes**: A list of space-separated MCP Server for Enterprise claim values, for example, `MCP.Device.Read.All` `MCP.User.Read.All`. This parameter is only required when you want to specify the permissions. Without it, all permissions are granted.

To grant all available permissions, run the following command.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'
$customCClientId = '00001111-aaaa-2222-bbbb-3333cccc4444'
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

#### Step 3: Revoke specific scopes from the custom MCP client

To revoke specific scopes from CustomMCPClient, you provide the comma-separated claim values in the `Scopes` parameter. The command returns the updated OAuth2PermissionGrant object with the remaining permissions.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'

$customCClientId = '00001111-aaaa-2222-bbbb-3333cccc4444'

$result = Revoke-EntraBetaMCPServerPermission -ApplicationId $customCClientId -Scopes 'MCP.AccessReview.Read.All', 'MCP.AdministrativeUnit.Read.All', 'MCP.Application.Read.All'

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

#### Step 2: Revoke all permissions from a custom MCP client

To revoke all Microsoft MCP Server for Enterprise permissions from CustomMCPClient, run the following command. When all permissions are revoked, the OAuth2PermissionGrant is deleted.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'
$customCClientId = '00001111-aaaa-2222-bbbb-3333cccc4444'
Revoke-EntraBetaMcpServerPermission -ApplicationId $customCClientId
```

```Output
✓ All permissions revoked from CustomMCPClient
```

#### Step 4: Grant specific scope to a custom MCP client

In command adds the specified scopes to the MCP client and preserves the existing scopes. This is called the additive mode.

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All', 'Directory.Read.All', 'DelegatedPermissionGrant.ReadWrite.All'
$customCClientId = '00001111-aaaa-2222-bbbb-3333cccc4444'
$newScopes = @('MCP.AccessReview.Read.All', 'MCP.AdministrativeUnit.Read.All', 'MCP.Application.Read.All')
$grant = Grant-EntraBetaMCPServerPermission -ApplicationId $customCClientId -Scopes $newScopes
```

```output
Operating on MCP client: CustomMCPClient
Adding specific scopes (preserving existing grant): MCP.AccessReview.Read.All, MCP.AdministrativeUnit.Read.All, MCP.Application.Read.All

✓ Successfully granted permissions to CustomMCPClient
```

### Scenario 3: Audit MCP client permissions across your tenant

As a security administrator, you need to audit which MCP clients have access to the Microsoft MCP Server for Enterprise and what permissions they have.

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
        GrantId       = $_.Id
        Scopes        = $_.Scope
        }
}

$report | Format-Table -AutoSize
```

```Output
ClientName                 GrantId                                     Scopes
----------                 -------                                     ------
Visual Studio Code         TEZ5OozUKUi0FwZGa6PjXKewRj-irCxMhwgvfef_ERE MCP.AccessReview.Read.All MCP.AdministrativeUnit.Read.All MCP.Application.Read.All MCP.RoleEligibilitySchedule.Read.Directory MCP.RoleManagement.Read.Directory
M365 MCP Client for Claude GtqAPzCWxU2yO9mR8Vef4aewRj-irCxMhwgvfef_ERE MCP.User.Read.All
Eun-MCPtest                eyAtrfTC6kGTYJjsEnjImqewRj-irCxMhwgvfef_ERE MCP.AuditLog.Read.All MCP.AuthenticationContext.Read.All MCP.Device.Read.All MCP.DirectoryRecommendations.Read.All MCP.Domain.Read.All MCP.EntitlementManagement.Read.All MCP.GroupMember.Read.All MCP.HealthMo…
```

## Related content

- [Manage apps][manage-apps]
- [Grant and revoke API permissions][grant-revoke-api]
- [OAuth2PermissionGrant resource type](https://learn.microsoft.com/graph/api/resources/oauth2permissiongrant)

<!-- links -->
[install]: installation.md
[manage-apps]: manage-apps.md
[grant-revoke-api]: how-to-grant-revoke-api-permissions.md
[best-practices]: entra-powershell-best-practices.md
[privileged-role-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#privileged-role-administrator
[application-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#application-administrator
[cloud-application-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#cloud-application-administrator
