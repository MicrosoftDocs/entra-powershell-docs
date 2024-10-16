---
title: "Manage licenses with Microsoft Entra PowerShell"
description: "Learn how to manage Microsoft Entra licenses with the Microsoft Entra PowerShell."

author: msewaweru
manager: CelesteDG
ms.service: entra-powershell
ms.topic: how-to
ms.date: 10/03/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi

#customer intent: As an admin, I want to manage the assignment of Entra licenses to users using the Microsoft Entra PowerShell.
---

# Manage user licenses with Microsoft Entra PowerShell

Most Microsoft Entra services require a license for access, and only users with active licenses can use these services. Licenses are assigned per tenant and can't be transferred to other tenants. You can manage licenses for your organization using Microsoft Entra PowerShell.

This guide covers how to view, assign, and remove user licenses in your tenant.

## Prerequisites

To complete this guide, ensure you have the necessary prerequisites:

1. The Microsoft Entra PowerShell module is installed. Follow the [installation guide](installation.md) if needed.
1. Run Microsoft Entra PowerShell as a user with the [License Administrator](/entra/identity/role-based-access-control/permissions-reference#license-administrator) role. This guide requires `User.ReadWrite.All` and `Organization.Read.All` permissions. To set them, run:

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All','Organization.Read.All'
```

1. Users to assign licenses are created in your tenant and assigned a location. To find user accounts that don't have a `UsageLocation`, run this command:

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
$users = Get-EntraUser | Where-Object { $_.UsageLocation -eq $null -and $_.UserType -eq 'Member' }
$users | Select-Object Id, DisplayName, UserPrincipalName, UsageLocation
```

## Review available license plans

Use the `Get-EntraSubscribedSku` cmdlet to view the available license plans in your tenant. Reading subscription license plans requires the `Organization.Read.All` permission scope.

To view summary information about your current licensing plans and the available licenses for each plan, run this command:

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

- `SkuPartNumber`: The name for the license plan.
- `Enabled`: Number of licenses that you purchased for a specific licensing plan.
- `ConsumedUnits`: Number of licenses assigned to users from a specific licensing plan.

### Get users assigned to a license

To get all the users assigned to a specific license, use the `Get-EntraUser` cmdlet with the `AssignedLicenses` parameter. The `AssignedLicenses` parameter filters users based on the licenses assigned to them.

```powershell
Connect-Entra -Scopes 'Organization.Read.All'
$skuId = (Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'EMSPREMIUM' }).SkuId
$usersWithLicense = Get-EntraUser -All | Where-Object {$_.AssignedLicenses -and ($_.AssignedLicenses.SkuId -contains $skuId)}
$usersWithLicense | Select-Object Id, DisplayName, UserPrincipalName, AccountEnabled, UserType | Format-Table -AutoSize
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
$License.SkuId = (Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'AAD_PREMIUM_P2' }).SkuId

$licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$licenses.AddLicenses = $license

# Assign the license to the user
Set-EntraUserLicense -ObjectId $user.Id-AssignedLicenses $licenses
```

To confirm that the license is assigned to the user, run:

```powershell
Get-EntraUserLicenseDetail -UserId 'AljosaH@Contoso.com'
```

### Assign a license to a user with some disabled plans

The following PowerShell script demonstrates how to assign a license to a user in Microsoft Entra ID while disabling specific service plans. This approach can be useful when you want to assign a license but exclude certain features.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'

# Get user details
$user = Get-EntraUser -UserId 'AljosaH@Contoso.com'


# Retrieve the SkuId for the desired license plan
$skuId = (Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'AAD_PREMIUM_P2' }).SkuId

# Create a license assignment object with some plans disabled
$licenseOptions = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$licenseOptions.SkuId =  $skuId
$licenseOptions.DisabledPlans = @('EXCHANGE_S_FOUNDATION', 'MFA_PREMIUM')

$licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$licenses.AddLicenses = $licenseOptions

# Assign the license to the user
Set-EntraUserLicense -ObjectId $user.ObjectId -AssignedLicenses $licenses
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
Set-EntraUserLicense -ObjectId $user.ObjectId -AssignedLicenses $licenses
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
    Set-EntraUserLicense -ObjectId $user.ObjectId -AssignedLicenses $licensesToAssign
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
foreach ($user in $users$users) {
 Set-EntraUserLicense -ObjectId $user -AssignedLicenses $licenses
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
$skuId = (Get-EntraUserLicenseDetail -UserId AljosaH@Contoso.com).SkuId

# Define the license object
$licensesToRemove = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$licensesToRemove.RemoveLicenses = $skuId

# Remove the assigned license
Set-EntraUserLicense -ObjectId 'AljosaH@Contoso.com' -AssignedLicenses $licensesToRemove
```


