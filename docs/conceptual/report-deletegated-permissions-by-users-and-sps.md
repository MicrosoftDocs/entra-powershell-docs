---
title: "Report delegated permissions for users and service principals"
description: "Learn how to report and export delegated permissions assigned to users and service principals in Microsoft Entra using PowerShell."

ms.topic: how-to
ms.date: 05/27/2025
author: msewaweru
manager: CelesteDG
ms.author: eunicewaweru

#customer intent: As an admin, I want to list delegated permissions for users and service principals, so that I can review access and maintain security.
---

# View and export delegated permissions for users and service principals

Delegated authentication enables applications to securely access Microsoft Entra resources on behalf of users. By using delegated permissions, administrators can control which applications and users have access to specific resources and actions. This article explains how to use Microsoft Entra PowerShell to report on delegated permissions assigned to users and service principals, helping you maintain security and compliance in your organization.

## Prerequisites  
  
To retrieve all delegated permissions assigned to users and service principals, you need:  
  
- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free][create-account].
- One of the following roles:
  - [Application Administrator][app-admin]
  - [Cloud Application Administrator][cloud-app-admin]
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Entra PowerShell module][installation] guide to install the module.

## List delegated permissions for users and service principals

```powershell
# Define file name for CSV output
$downloadsFolder = [System.Environment]::GetFolderPath('MyDocuments')
$csvOutputFile = Join-Path -Path $downloadsFolder -ChildPath "DelegatedPermissions.csv"

# Scopes to ignore for reporting purposes
[array]$IgnoredScopes = "openid", "profile", "offline_access"

# Create hashtables for client and resource names
$clientIds = @{}
$resourceIds = @{}

# Get all users
$users = Get-EntraUser -Filter "userType eq 'Member'"

$Report = [System.Collections.Generic.List[Object]]::new()

ForEach ($user in $users) {
    $permissions = Get-EntraUserOauth2PermissionGrant -UserId $user.Id -All
    ForEach ($permission in $permissions) {
        $ClientDisplayName = $ClientIds[$Permission.ClientId]
        If ($null -eq $ClientDisplayName) {
            $ClientDisplayName = (Get-EntraServicePrincipal -ServicePrincipalId $Permission.ClientId).displayName
            $ClientIds.Add($Permission.ClientId, $ClientDisplayName)
        }
        $ResourceDisplayName = $ResourceIds[$Permission.ResourceId]
        If ($null -eq $ResourceDisplayName) {
            $ResourceDisplayName = (Get-EntraServicePrincipal -ServicePrincipalId $Permission.ResourceId).displayName
            $ResourceIds.Add($Permission.ResourceId, $ResourceDisplayName)
        }
        [array]$Scopes = $Permission.scope.Split(" ")  
        [array]$FoundScopes = @()
        ForEach ($Scope in $Scopes) {
            If ($Scope -in $IgnoredScopes -or [string]::isNullOrWhiteSpace($Scope)) {
                Continue
            }
            $FoundScopes += $Scope
        }  
        # Generate the report
        $ReportLine = [PSCustomObject][Ordered]@{
            'Consent type'      = $Permission.consentType
            UserPrincipalName   = $User.UserPrincipalName
            Client              = $ClientDisplayName
            Resource            = $ResourceDisplayName
            Scopes              = $FoundScopes -join ", "
            ClientId            = $Permission.ClientId
        }
        $Report.Add($ReportLine)
    }
}
# Get AllPrincipals delegated permissions
[array]$AllPermissions = Get-EntraOauth2PermissionGrant | Where-Object {$_.ConsentType -eq 'AllPrincipals'} 

[int]$i = 0
ForEach ($AllPermission in $AllPermissions) {
    $i++
    $ClientDisplayName = $ClientIds[$AllPermission.ClientId]
    If ($null -eq $ClientDisplayName) {
        $ClientDisplayName = (Get-EntraServicePrincipal -ServicePrincipalId $AllPermission.ClientId).displayName
        $ClientIds.Add($AllPermission.ClientId, $ClientDisplayName)
    }
    $ResourceDisplayName = $ResourceIds[$AllPermission.ResourceId]
    If ($null -eq $ResourceDisplayName) {
        $ResourceDisplayName = (Get-EntraServicePrincipal -ServicePrincipalId $AllPermission.ResourceId).displayName
        $ResourceIds.Add($AllPermission.ResourceId, $ResourceDisplayName)
    }
    [array]$Scopes = $AllPermission.scope.Split(" ")
    [array]$FoundScopes = $null
    ForEach ($Scope in $Scopes) {
        If ($Scope -in $IgnoredScopes -or [string]::isNullOrWhiteSpace($Scope)) {
                Continue
            }
        $FoundScopes += $Scope
        }
     $ReportLine = [PSCustomObject][Ordered]@{
        'Consent type'      = $AllPermission.consentType
        UserPrincipalName   = "All User Accounts"
        Client              = $ClientDisplayName
        Resource            = $ResourceDisplayName
        Scopes              = $FoundScopes -join ", "
        ClientId            = $AllPermission.ClientId
    }
    $Report.Add($ReportLine)    
}  

# Optional parameter to control whether to display the report in Out-GridView
$ShowGridView = $true

if ($ShowGridView) {
    $Report | Out-GridView -Title "Delegated Permissions Report"
}

$Report | Export-Csv -Path $CSVOutputFile -NoTypeInformation -Encoding UTF8
Write-Host ("CSV output file written to {0}" -f $CSVOutputFile)
```

<!-- link references -->

[installation]: installation.md
[create-account]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F
[app-admin]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#application-administrator
[cloud-app-admin]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#cloud-application-administrator
