---
title: "Manage user licenses using Microsoft Entra PowerShell"
description: "Learn how to manage Microsoft Entra user licenses using Microsoft Entra PowerShell."

author: msewaweru
manager: mwongerapk
ms.topic: how-to
ms.date: 04/30/2025
ms.author: eunicewaweru
ms.reviewer: stevemutungi

#customer intent: As an admin, I want to manage the assignment of Entra licenses to users using the Microsoft Entra PowerShell.
---

# Manage user licenses using Microsoft Entra PowerShell

This article shows you how to use Microsoft Entra PowerShell to manage user licenses in your organization. You learn how to:

- Review and audit license assignments
- Assign licenses to individual and multiple users
- Remove licenses from users
- Manage inactive user licenses

Microsoft Entra services require licenses for access. Using PowerShell, you can efficiently manage these licenses across your tenant to optimize costs and ensure appropriate access for your users.

## Prerequisites

To complete this guide, ensure you have the necessary prerequisites:

1. Install the Microsoft Entra PowerShell module. Follow our [installation guide](installation.md).
2. Sign in as a user with the [License Administrator](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#license-administrator) role. You need `User.ReadWrite.All` and `Organization.Read.All` permissions. Run this command to set them:

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All','Organization.Read.All'
    ```

3. Make sure your users have a location assigned. To find users without a `UsageLocation`, run:

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    $users = Get-EntraUser | Where-Object { $_.UsageLocation -eq $null -and $_.UserType -eq 'Member' }
    $users | Select-Object Id, DisplayName, UserPrincipalName, UsageLocation
    ```

    To set a user's location, run:

     ```powershell
     Set-EntraUser -UserId 'GjeEdla@Contoso.com' -UsageLocation 'US'
     ```

## Review available Microsoft Entra license plans and usage

To see your available license plans, run the `Get-EntraSubscribedSku` cmdlet. You need the `Organization.Read.All` permission.

To check your current licensing plans, available licenses, and consumption status, run:

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All','Organization.Read.All'
Get-EntraSubscribedSku | Select-Object -Property Sku*, ConsumedUnits -ExpandProperty PrepaidUnits
```

```Output
Enabled              : 5
LockedOut            : 0
Suspended            : 0
Warning              : 0
AdditionalProperties :
SkuId                : efccb6f7-5641-4e0e-bd10-b4976e1bf68e
SkuPartNumber        : EMS
ConsumedUnits        : 3
```

The output shows important license information:

- `SkuPartNumber`: The unique identifier of your license plan (for example, 'EMS' for Enterprise Mobility + Security)
- `Enabled`: Total number of purchased licenses available for this plan
- `ConsumedUnits`: Number of licenses currently assigned to users
- `LockedOut`, `Suspended`, `Warning`: Status indicators for license health monitoring

### Find and audit users with specific licenses

To find all users who have a particular license assigned, use this two-step process:

1. Get the SKU ID for the target license plan
2. Filter your user list to find those with matching licenses

```powershell
Connect-Entra -Scopes 'Organization.Read.All'

# Get the SKU ID for EMSPREMIUM license plan
$skuId = (Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'EMSPREMIUM' }).SkuId

# Find users who have this license
$usersWithLicense = Get-EntraUser -All | Where-Object {
    $_.AssignedLicenses -and 
    ($_.AssignedLicenses.SkuId -contains $skuId)
}

# Display the results
$usersWithLicense | Select-Object DisplayName, UserPrincipalName, AccountEnabled |
    Format-Table -AutoSize
```

## Assign licenses to users

Before assigning licenses to a user, you want to confirm the licenses that are already assigned to the user.

### View licenses assigned to a user

To view the licenses assigned to a user, run the following command:

```powershell
Connect-Entra -Scopes 'User.Read.All'
$userLicenses = Get-EntraUserLicenseDetail -UserId 'GjeEdla@Contoso.com'
$userLicenses
```

```Output
Id                                          SkuId                                SkuPartNumber
--                                          -----                                -------------
IR173R7-BkGrv95BU2ETAjchYPkDIntEn_9Bs24Izl0 f9602137-2203-447b-9fff-41b36e08ce5d Microsoft_Entra_Suite
IR173R7-BkGrv95BU2ETAk8SXrDMx6BFpqqM94yUaWg b05e124f-c7cc-45a0-a6aa-8cf78c946968 EMSPREMIUM
```

To view all the active service plans in the license assigned to the user, run the following command:

```powershell
$userLicenses.ServicePlans | Where-Object { $_.ProvisioningStatus -eq 'Success' } | Select-Object ServicePlanName, ProvisioningStatus
```

```Output
ServicePlanName                        ProvisioningStatus
---------------                        ------------------
Verifiable_Credentials_Service_Request Success
AAD_PREMIUM_P2                         Success
Entra_Premium_Private_Access           Success
Entra_Premium_Internet_Access          Success
Entra_Identity_Governance              Success
M365_AUDIT_PLATFORM                    Success
```

### Assign a license to a user

To assign a license to a user, use the `Set-EntraUserLicense` cmdlet. The `Set-EntraUserLicense` cmdlet assigns licenses to a user by adding or removing licenses from the user's license assignment.

```powershell
# Connect to Entra
Connect-Entra -Scopes 'User.ReadWrite.All'

# Get user details
$user = Get-EntraUser -UserId 'AljosaH@Contoso.com'

# Define the license plan to assign to the user
$license = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$license.SkuId = (Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'AAD_PREMIUM_P2' }).SkuId

$licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$licenses.AddLicenses = $license

# Assign the license to the user
Set-EntraUserLicense -UserId $user.Id -AssignedLicenses $licenses
```

To confirm that the license is assigned to the user, run:

```powershell
Get-EntraUserLicenseDetail -UserId 'AljosaH@Contoso.com'
```

### Assign more than one license to a user

To assign more than one license to a user, create an array of `AssignedLicense` objects and add them to the `AssignedLicenses` object.

The following PowerShell script demonstrates how to assign multiple licenses to a user in Microsoft Entra ID. In this example, the user is assigned the `AAD_PREMIUM_P2` and `EMS` license plans.

```powershell

# Connect to Entra
Connect-Entra -Scopes 'Organization.ReadWrite.All'

# Retrieve the SkuId for the desired license plans
$skuId1 = (Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'AAD_PREMIUM_P2' }).SkuId
$skuId2 = (Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'EMS' }).SkuId

# Get the user to assign the licenses to
$user = Get-EntraUser -UserId 'AljosaH@Contoso.com'

# Create license assignment objects
$license1 = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$license1.SkuId = $skuId1

$license2 = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$license2.SkuId = $skuId2

$licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$licenses.AddLicenses = $license1, $license2

# Assign the licenses to the user
Set-EntraUserLicense -UserId $user.Id -AssignedLicenses $licenses
```

### Assign a license to a user by copying license from another user

You want to assign the same licenses from one user to another. You first retrieve the license details from the existing user, then assign those licenses to the new user.

In this example, you loop through all licenses assigned to the existing user and assign them to the target user.

```powershell
# Connect to Entra
Connect-Entra -Scopes 'User.ReadWrite.All'

# Define the source and target users
$licensedUser = Get-EntraUser -UserId 'AljosaH@Contoso.com'
$targetUser = Get-EntraUser -UserId 'PalameeC@Contoso.com' 

# Retrieve the source user and their licenses
$sourceUserLicenses = $licensedUser.AssignedLicenses

# Create license assignment objects for each license and assign them to the target user
$licensesToAssign = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses 
foreach ($license in $sourceUserLicenses) {
    $assignedLicense = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
    $assignedLicense.SkuId = $license.SkuId
    $licensesToAssign.AddLicenses= $assignedLicense
    Set-EntraUserLicense -UserId $targetUser.Id -AssignedLicenses $licensesToAssign
}
```

### Bulk assign multiple licenses for multiple users at the same time

The following PowerShell script demonstrates how to bulk assign multiple licenses to multiple users simultaneously in Microsoft Entra ID. You can specify the list of users to assign licenses as shown in the script or imports the user names from a CSV file. Importing from a csv file is useful for efficiently managing license assignments for large groups of users.

```powershell
# Connect to Entra
Connect-Entra -Scopes 'Organization.ReadWrite.All'

# Retrieve the SkuId for the desired license plans
$skuId1 = (Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'AAD_PREMIUM_P2' }).SkuId
$skuId2 = (Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'EMS' }).SkuId

# Define the user to whom the licenses will be assigned
$users = ('AljosaH@Contoso.com','PalameeC@Contoso.com')

# You can, alternatively, import users from a csv file. For this example, the CSV should have a column named 'user'
$users = Import-Csv -Path "C:\path\to\your\users.csv" | Select-Object -ExpandProperty user

# Create license assignment objects
$license1 = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$license1.SkuId = $skuId1

$license2 = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$license2.SkuId = $skuId2

$licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$licenses.AddLicenses = $license1, $license2

# Assign the licenses to each user
foreach ($user in $users) {
 Set-EntraUserLicense -UserId $user -AssignedLicenses $licenses
}
```

## List inactive users with active licenses

Regularly auditing and managing licenses for inactive users in a Microsoft Entra tenant helps with cost management, security, compliance, and efficiency. To list inactive users with active licenses, run this command:

```powershell
Connect-Entra -Scopes 'User.Read.All'
$disabledUsersWithLicenses = Get-EntraUser -Filter "accountEnabled eq false" -All | Where-Object {
    $_.AssignedLicenses -ne $null -and $_.AssignedLicenses.Count -gt 0
}
$disabledUsersWithLicenses | Select-Object Id, DisplayName, UserPrincipalName, AccountEnabled | Format-Table -AutoSize
```

## Remove licenses assigned to a user

To remove a license assigned to a user, follow these steps:

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
# Get user details
$user = Get-EntraUser -UserId 'AljosaH@Contoso.com'

# Get the license assigned to the user
$skuId = (Get-EntraUserLicenseDetail -UserId $user.Id).SkuId

# Define the license object
$licensesToRemove = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$licensesToRemove.RemoveLicenses = $skuId

# Remove the assigned license
Set-EntraUserLicense -UserId $user.Id -AssignedLicenses $licensesToRemove
```

## Related content

- [Manage users](manage-user.md)
- [Manage groups](manage-groups.md)
