---
title: "Grant and revoke API permissions to managed identities"
description: "Learn how to grant and revoke Microsoft Graph API permissions for system-assigned and user-assigned managed identities using Microsoft Entra PowerShell."

ms.topic: how-to
ms.date: 05/25/2026
author: msewaweru
manager: mwongerapk
ms.author: eunicewaweru
ms.reviewer: stevemutungi

#Customer intent: As an administrator, I want to grant and revoke API permissions to managed identities using Microsoft Entra PowerShell so that my Azure resources can securely access Microsoft Graph APIs without managing credentials.
---

# Grant and revoke API permissions to managed identities

Managed identities provide an automatically managed identity in Microsoft Entra ID for applications to use when connecting to resources that support Microsoft Entra authentication. You can grant API permissions directly to a managed identity's service principal, eliminating the need to store credentials in code or configuration files.

In this article, you learn how to grant and revoke Microsoft Graph API permissions for both system-assigned and user-assigned managed identities using Microsoft Entra PowerShell.

## Prerequisites

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Install the [Microsoft Entra PowerShell][install] module.
- An Azure resource with either a system-assigned or user-assigned managed identity enabled.
- To grant API permissions to managed identities, you need one of the following roles:
  - [Privileged Role Administrator][privileged-role-administrator] (required when granting permissions to Microsoft Graph or other Microsoft first-party applications)
  - [Application Administrator][application-administrator]
  - [Cloud Application Administrator][cloud-application-administrator]

## Grant API permissions to a managed identity

Follow these steps to grant Microsoft Graph API permissions to your managed identity.

1. **Connect to Microsoft Entra**

   To grant API permissions to managed identities, connect with the `Application.ReadWrite.All` and `AppRoleAssignment.ReadWrite.All` scopes:

   ```powershell
   Connect-Entra -Scopes "Application.ReadWrite.All", "AppRoleAssignment.ReadWrite.All"
   ```

   > [!CAUTION]
   > The `AppRoleAssignment.ReadWrite.All` permission allows an app or service to manage permission grants and elevate privileges for any app, user, or group in your organization. Only grant this permission to trusted administrators.

1. **Identify the managed identity service principal**

   Find the service principal that represents your managed identity in Microsoft Entra ID.

   For system-assigned managed identities, use the Azure resource name:

   ```powershell
   $managedIdentityName = "MyAzureVM"
   $managedIdentitySP = Get-EntraServicePrincipal -Filter "displayName eq '$managedIdentityName' and servicePrincipalType eq 'ManagedIdentity'"

   if (-not $managedIdentitySP) {
       Write-Error "Managed identity service principal '$managedIdentityName' not found." -ErrorAction Stop
   }

   Write-Host "Found managed identity service principal:"
   Write-Host "Display Name: $($managedIdentitySP.DisplayName)"
   Write-Host "Object ID: $($managedIdentitySP.Id)"
   ```

   > [!NOTE]
   > If the filter returns multiple results (for example, when multiple managed identities share the same display name), use the object ID to identify the correct service principal: `Get-EntraServicePrincipal -ServicePrincipalId '<object-id>'`.

   For user-assigned managed identities, use the managed identity name:

   ```powershell
   $userAssignedMIName = "MyUserAssignedMI"
   $managedIdentitySP = Get-EntraServicePrincipal -Filter "displayName eq '$userAssignedMIName' and servicePrincipalType eq 'ManagedIdentity'"

   if (-not $managedIdentitySP) {
       Write-Error "Managed identity service principal '$userAssignedMIName' not found." -ErrorAction Stop
   }
   ```

1. **Get the Microsoft Graph service principal**

   Retrieve the Microsoft Graph service principal:

   ```powershell
   $graphServicePrincipal = Get-EntraServicePrincipal -Filter "appId eq '00000003-0000-0000-c000-000000000000'"
   ```

1. **Identify the required API permissions**

   Find the specific Microsoft Graph permissions your managed identity requires:

   ```powershell
   $appRole = $graphServicePrincipal.AppRoles | Where-Object { $_.Value -eq "User.Read.All" }
   ```

1. **Grant API permissions to the managed identity**

   Grant the API permission to your managed identity:

   ```powershell
   $params = @{
       ServicePrincipalId = $managedIdentitySP.Id
       PrincipalId = $managedIdentitySP.Id
       ResourceId = $graphServicePrincipal.Id
       AppRoleId = $appRole.Id
   }

   $appRoleAssignment = New-EntraServicePrincipalAppRoleAssignment @params
   ```

1. **Verify the granted permissions**

   Confirm that the permissions have been successfully granted:

   ```powershell
   $assignments = Get-EntraServicePrincipalAppRoleAssignment -ServicePrincipalId $managedIdentitySP.Id
   Write-Host "Current app role assignments for $($managedIdentitySP.DisplayName):"
   foreach ($assignment in $assignments) {
       $resource = Get-EntraServicePrincipal -ServicePrincipalId $assignment.ResourceId
       $assignedRole = $resource.AppRoles | Where-Object { $_.Id -eq $assignment.AppRoleId }
       Write-Host "- Resource: $($resource.DisplayName)"
       Write-Host "  Permission: $($assignedRole.Value)"
   }
   ```

## Revoke API permissions from a managed identity

Follow these steps to revoke Microsoft Graph API permissions from your managed identity.

1. **Identify the permission to remove**

   Find the specific app role assignment to revoke:

   ```powershell
   $assignmentToRemove = Get-EntraServicePrincipalAppRoleAssignment -ServicePrincipalId $managedIdentitySP.Id |
       Where-Object { $_.AppRoleId -eq $appRole.Id -and $_.ResourceId -eq $graphServicePrincipal.Id }
   ```

1. **Remove the app role assignment**

   Delete the app role assignment using its ID:

   ```powershell
   if ($assignmentToRemove) {
       Remove-EntraServicePrincipalAppRoleAssignment -ServicePrincipalId $managedIdentitySP.Id -AppRoleAssignmentId $assignmentToRemove.Id
       Write-Host "Successfully removed permission: $($appRole.Value)"
   }
   ```

1. **Verify the permission was removed**

   Confirm that no assignments remain for the revoked permission:

   ```powershell
   $remainingAssignments = Get-EntraServicePrincipalAppRoleAssignment -ServicePrincipalId $managedIdentitySP.Id
   if ($remainingAssignments) {
       Write-Host "Remaining permissions for $($managedIdentitySP.DisplayName):"
       foreach ($assignment in $remainingAssignments) {
           $resource = Get-EntraServicePrincipal -ServicePrincipalId $assignment.ResourceId
           $assignedRole = $resource.AppRoles | Where-Object { $_.Id -eq $assignment.AppRoleId }
           Write-Host "- $($assignedRole.Value) on $($resource.DisplayName)"
       }
   } else {
       Write-Host "No app role assignments remain for $($managedIdentitySP.DisplayName)."
   }
   ```

## Related content

- [Authenticate with app-only access][app-only-access-auth]
- [Grant and revoke API permissions][grant-revoke-api-permissions]
- [Create a custom application][create-custom-application]
- [What are managed identities for Azure resources?][managed-identities-overview]

<!-- link references -->
[install]: installation.md
[privileged-role-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#privileged-role-administrator
[application-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#application-administrator
[cloud-application-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#cloud-application-administrator
[app-only-access-auth]: app-only-access-auth.md
[grant-revoke-api-permissions]: how-to-grant-revoke-api-permissions.md
[create-custom-application]: create-custom-application.md
[managed-identities-overview]: /entra/identity/managed-identities-azure-resources/overview?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json
