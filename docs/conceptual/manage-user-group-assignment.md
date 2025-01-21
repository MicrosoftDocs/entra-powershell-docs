---  
title: "Manage user and group assignments"
description: "This article shows how to report user and group assignments to service principals and unassign users and groups using Microsoft Entra PowerShell."  
  
author: omondiatieno
manager: CelesteDG  
  
ms.service: entra
ms.topic: how-to  
ms.date: 01/21/2024  
ms.author: jomondi    
ms.reviewer: stevemutungi  
  
#customer intent: As an IT admin, I want to learn how to report and remove user and group assignments to service principals using Microsoft Entra PowerShell, so that I can track access and manage permissions efficiently.  
---  
  
# Manage user and group assignments
  
Enterprise applications in Microsoft Entra ID represent the service principals that allow users and groups to access various resources. You might need to export user and group assignments to perform audits, ensure compliance with security policies, manage user access efficiently, and identify any unauthorized access or potential security risks within the organization.
  
Using Microsoft Entra PowerShell, you can retrieve and report on the assignments of users and groups to enterprise applications. This feature enables you to manage access effectively and ensure that only authorized users have the necessary permissions.
  
## Prerequisites  
  
To report assignments of users and groups to enterprise apps with Microsoft Entra PowerShell, you need:  
  
- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free][create-account].
- One of the following roles: [Application Administrator][app-admin] or [Cloud Application Administrator][cloud-app-admin].
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Entra PowerShell module][installation] guide to install the module.

## Export user and group assignments to all service principals

The following example shows how to use Microsoft Entra PowerShell to report user and group assignments to enterprise applications.

1. Connect to Microsoft Entra ID with the necessary permissions and sign in with at least a [Cloud Application Administrator][cloud-app-admin] role.

    ```powershell
    Connect-Entra -Scopes 'Directory.Read.All', 'Application.Read.All'
    ```

1. Run the following script to export all user and group assignments to service principals to a CSV file. The script performs the following actions:

    - **Data Retrieval**:
      - Fetches all user and group assignments associated with each service principal.
      - Utilizes directory APIs or CLI commands to gather comprehensive assignment details.
    - **Parses the retrieved data to extract relevant information such as**:
      - User Names: Identifies individual users assigned to service principals.
      - Group Names: Identifies groups that have assignments to service principals.
      - Service Principal Details: Includes IDs, names, and roles associated with each service principal.
    - **Exporting to CSV**:
      - Organizes the extracted data into a structured format.
      - Writes the organized data into a CSV file, making it easy to view, share, or further analyze the assignments.

   ```powershell
   # Get all service principals.
   $servicePrincipals = Get-EntraServicePrincipal -All  

   # Initialize an array to hold the results.
    $results = @()  
   
   #Loop through each service principal.
    foreach ($sp in $servicePrincipals) {  
        # Get assigned users and groups  
        $assignedUsers = Get-EntraServicePrincipalAppRoleAssignedTo -ServicePrincipalId $sp.Id |   
                        Where-Object { $_.PrincipalType -eq 'User' } |   
                        Select-Object -ExpandProperty PrincipalId  
    
        $assignedGroups = Get-EntraServicePrincipalAppRoleAssignedTo -ServicePrincipalId $sp.Id |   
                        Where-Object { $_.PrincipalType -eq 'Group' } |   
                        Select-Object -ExpandProperty PrincipalId  
    
        # Resolve user and group names  
        $userNames = $assignedUsers | ForEach-Object { (Get-EntraUser -UserId $_).DisplayName }  
        $groupNames = $assignedGroups | ForEach-Object { (Get-EntraGroup -GroupId $_).DisplayName }  
    
        # Only add to results if there are assigned users or groups
        if ($userNames.Count -gt 0 -or $groupNames.Count -gt 0) {
            # Create a result object  
            $result = [PSCustomObject]@{  
                ServicePrincipalName = $sp.DisplayName  
                AssignedUsers        = ($userNames -join "; ")  
                AssignedGroups       = ($groupNames -join "; ")  
            }  
    
            # Add the result to the results array  
            $results += $result  
        }  
    }  
    
    # Check if results array is not empty before exporting
    if ($results.Count -gt 0) { 
    
    # Define CSV export parameters. Replace the path with your desired location.
    $csvParams = @{  
        Path = "C:\Users\$env:USERNAME\Downloads\ServicePrincipalAssignments.csv"  
        NoTypeInformation = $true  
    }  
    
    # Export the results to a CSV file
    $results | Export-Csv @csvParams
    } else {
        Write-Host "No service principals found or no data to export."
    }
    ```

This script retrieves all service principals in your Microsoft Entra tenant and exports the user and group assignments to a CSV file. The CSV file contains the service principal name, assigned users, and assigned groups.

## Unassign users and groups from a service principal

By unassigning specific users and groups, you can ensure that only authorized personnel have the necessary permissions. Unassigning unwanted users and groups reduces the risk of unauthorized access and enhancing overall system integrity.

The following example shows how to use Microsoft Entra PowerShell to unassign specific users and groups from a service principal.

1. Connect to Microsoft Entra ID with the necessary permissions and sign in with at least a [Cloud Application Administrator][cloud-app-admin] role.

    ```powershell  
    Connect-Entra -Scopes 'Application.Read.All'  
    ```

1. Get all service principals and display their IDs.

    ```powershell  
    $servicePrincipals = Get-EntraServicePrincipal -All  
    $servicePrincipals | Select-Object DisplayName, Id  
    ```

    This command retrieves all service principals in your Microsoft Entra tenant and displays their display names and IDs.

    ```Output
    DisplayName                                Id
    -----------                                --
    Test-app1                                  aaaaaaaa-1111-2222-3333-bbbbbbbbbbbb
    Test-app2                                  bbbbbbbb-2222-3333-4444-cccccccccccc
    Test-app3                                  cccccccc-3333-4444-5555-dddddddddddd
    ```

    Record the ID of the service principal from which you want to unassign users or groups.

1. Get the principal IDs of the users and groups assigned to the service principal using the [Get-EntraServicePrincipalAppRoleAssignedTo][get-service-principal-app-role-assignto] cmdlet.

    ```powershell
    Connect-Entra -Scopes 'Application.Read.All'
    Get-EntraServicePrincipalAppRoleAssignedTo -ServicePrincipalId "aaaaaaaa-1111-2222-3333-bbbbbbbbbbbb" -All |Select-Object Id, AppRoleId, PrincipalDisplayName, PrincipalId, PrincipalType, ResourceDisplayName | Format-Table
    ```

   This command retrieves all users and groups assigned to the specified service principal and displays their details. The Id column represents the unique ID of the assignment. Record the Id of the assignment you want to remove.

    ```Output
    Id                                          AppRoleId                            PrincipalDisplayName     PrincipalId                          PrincipalType ResourceDisplayName
    --                                          ---------                            --------------------     -----------                          ------------- -------------------
    A1bC2dE3fH4iJ5kL6mN7oP8qR9sT0uV1wX2yZ3c4vB  00000000-0000-0000-0000-000000000000 testUser1                dddddddd-5555-6666-7777-eeeeeeeeeeee User          Test-app1
    B2cD3eF4gH5iJ6kL7mN8oP9qR0sT1uV2wX3yZ4c5v6  00000000-0000-0000-0000-000000000000 testUser2                ffffffff-6666-7777-8888-ffffffffffff User          Test-app1
    C3dE4fG5hH6iJ7kL8mN9oP0qR1sT2uV3wX4yZ5c6v7  00000000-0000-0000-0000-000000000000 testGroup1               gggggggg-7777-8888-9999-gggggggggggg Group         Test-app1
    ```

1. Remove the user or group assignment using the [Remove-EntraServicePrincipalAppRoleAssignment][remove-service-principal-app-role-assignment] cmdlet.

    ```powershell
    Connect-Entra -Scopes 'AppRoleAssignment.ReadWrite.All'
    $servicePrincipal = Get-EntraServicePrincipal -ServicePrincipalId 'aaaaaaaa-1111-2222-3333-bbbbbbbbbbbb'
    Remove-EntraServicePrincipalAppRoleAssignment -ServicePrincipalId $servicePrincipal.Id  -AppRoleAssignmentId 'B2cD3eF4gH5iJ6kL7mN8oP9qR0sT1uV2wX3yZ4c5v6'
    ```

    This command removes the specified app role assignment from the service principal.

## Unassign all users and groups from a service principal

The following example demonstrates how to use Microsoft Entra PowerShell to unassign all users and groups from a service principal.

1. Connect to Microsoft Entra with the necessary permissions.

    ```powershell  
    Connect-Entra -Scopes 'AppRoleAssignment.ReadWrite.All'
    $servicePrincipal = Get-EntraServicePrincipal -ServicePrincipalId '31f1d894-0a2b-4901-b30c-b61a0e87acfe'
    # Remove all app role assignments from the service principal
    $assignments = Get-EntraServicePrincipalAppRoleAssignedTo -ServicePrincipalId $servicePrincipal.Id
    foreach ($assignment in $assignments) {
        Remove-EntraServicePrincipalAppRoleAssignment -ServicePrincipalId $servicePrincipal.Id -AppRoleAssignmentId $assignment.Id
    }
    ```

   This example unassigns all users and groups from the specified service principal in your Microsoft Entra tenant.

## Related content

- [Manage users][manage-user.md]
- [Manage apps][manage-apps]

<!-- link references -->

[installation]: installation.md
[create-account]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F
[app-admin]: /entra/identity/role-based-access-control/permissions-reference#application-administrator
[cloud-app-admin]: /entra/identity/role-based-access-control/permissions-reference#cloud-application-administrator
[manage-user.md]: manage-user.md
[manage-apps]: manage-apps.md
[get-service-principal-app-role-assignto]: /powershell/module/microsoft.graph.entra/get-entraserviceprincipalapproleassignedto
[remove-service-principal-app-role-assignment]: /powershell/module/microsoft.graph.entra/Remove-EntraServicePrincipalAppRoleAssignment
