---
title: "Manage licenses with Microsoft Entra PowerShell"
description: "Learn how to manage Microsoft Entra licenses with the Microsoft Entra PowerShell."

author: msewaweru
manager: CelesteDG
ms.service: entra-powershell
ms.topic: how-to
ms.date: 09/24/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi

#customer intent: As an admin, I want to manage the assignment of Entra licenses using the Microsoft Entra PowerShell.
---

# Manage licenses with Microsoft Entra PowerShell

Most Microsoft Entra services require a license to access. Only users with active licenses can access and use the licensed Microsoft Entra services. Licenses are applied per tenant and can't be transferred to other tenants. You can use the Microsoft Entra PowerShell to manage licenses for your organization.

In this how-to guide,  you assign and remove licenses for users and groups in your tenant.

## Prerequisites

To successfully complete this guide, make sure you have the required prerequisites:

1. Microsoft Entra PowerShell module is installed. Follow the [Install the Microsoft Entra PowerShell module](installation.md) guide to install the module.  
1. Microsoft Entra PowerShell using a `License Administrator` with the appropriate permissions. For this how-to guide, the `User.ReadWrite.All` and `Organization.Read.All` delegated permissions are required. To set the permissions in Microsoft Entra PowerShell, run;

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    ```

    Select **Consent on behalf of your organization** before accepting in the sign-in dialog box.

1. Users to assign licenses are created in your tenant and assigned a location.

## Review available license plans

Use the `Get-EntraSubscribedSku` cmdlet to view the available license plans in your tenant. Reading subscription license plans requires the `Organization.Read.All` permission scope.

To view summary information about your current licensing plans and the available licenses for each plan, run this command:

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All','Organization.Read.All'
Get-EntraSubscribedSku | Select -Property Sku*, ConsumedUnits -ExpandProperty PrepaidUnits
```

```Output
Enabled              : 51
LockedOut            : 0
Suspended            : 0
Warning              : 0
AdditionalProperties :
SkuId                : b05e124f-c7cc-45a0-a6aa-8cf78c946968
SkuPartNumber        : EMSPREMIUM
ConsumedUnits        : 51

Enabled              : 1
LockedOut            : 0
Suspended            : 0
Warning              : 0
AdditionalProperties :
SkuId                : 84a661c4-e949-4bd2-a560-ed7766fcaf2b
SkuPartNumber        : AAD_PREMIUM_P2
ConsumedUnits        : 0
```

- `SkuPartNumber`: The name for the license plan.
- `Enabled`: Number of licenses that you purchased for a specific licensing plan.
- `ConsumedUnits`: Number of licenses assigned to users from a specific licensing plan.

## Get users assigned to a license

To get all the users assigned to a specific license, use the `Get-EntraUser` cmdlet with the `AssignedLicenses` parameter. The `AssignedLicenses` parameter filters users based on the licenses assigned to them.

```powershell
Connect-Entra -Scopes 'Organization.Read.All'
$skuId = (Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'EMSPREMIUM' }).SkuId

$usersWithLicense = Get-EntraUser -All | Where-Object {
    $_.AssignedLicenses -and ($_.AssignedLicenses.SkuId -contains $skuId)
}
$usersWithLicense | Select-Object Id, DisplayName, UserPrincipalName, AccountEnabled, UserType | Format-Table -AutoSize
```

## Assign licenses to users

Before assigning licenses to a user, you want to confirm the licenses that are already assigned to the user.

To view the licenses assigned to a user, run the following command:

```powershell
Connect-Entra -Scopes 'User.Read.All'
$userLicenses = Get-EntraUserLicenseDetail -ObjectId 'GjeEdla@Contoso.com'
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
$userLicenses.ServicePlans | Where-Object { $_.ProvisioningStatus -eq 'Success' } | Select ServicePlanName, ProvisioningStatus
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

# Define the user's object ID
$User = Get-EntraUser -ObjectId 'AljosaH@Contoso.com'

# Define the license plan to assign to the user
$license = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$License.SkuId = (Get-EntraSubscribedSku | Where SkuPartNumber -eq 'AAD_PREMIUM_P2').SkuId

$Licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$Licenses.AddLicenses = $license

# Assign the license to the user
Set-EntraUserLicense -ObjectId $User.ObjectId -AssignedLicenses $Licenses
```

To confirm that the license is assigned to the user, run:

```powershell
Get-EntraUserLicenseDetail -ObjectId 'AljosaH@Contoso.com'
```

To confirm the service plans assigned to the user, run:

```powershell
(Get-EntraUserLicenseDetail -ObjectId 'AljosaH@Contoso.com').ServicePlans
```

### Assign a license to a user with some disabled plans

The following PowerShell script demonstrates how to assign a license to a user in Microsoft Entra ID while disabling specific service plans. This approach can be useful when you want to assign a license but exclude certain features.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'

# Define the user's object ID
$User = Get-EntraUser -ObjectId 'AljosaH@Contoso.com'


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

The following PowerShell script demonstrates how to assign multiple licenses to a user in Entra. In this example, the user is assigned the `EMSPREMIUM` and `O365_BUSINESS` license plans.

```powershell

# Connect to Entra
Connect-Entra -Scopes 'Organization.ReadWrite.All'

# Retrieve the SkuId for the desired license plans
$skuId1 = (Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'EMSPREMIUM' }).SkuId
$skuId2 = (Get-EntraSubscribedSku | Where-Object { $_.SkuPartNumber -eq 'O365_BUSINESS' }).SkuId

# Define the user to whom the licenses will be assigned
$User = Get-EntraUser -ObjectId 'AljosaH@Contoso.com'

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
### Bulk assign multiple licenses for multiple users at the same time

### Remove an assigned user's License

To remove a license assigned to a user, follow these steps:

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
# Define the user's object ID
$User = Get-EntraUser -ObjectId 'AljosaH@Contoso.com'

# Get the license assigned to the user
$SkuId = (Get-EntraUserLicenseDetail -ObjectId AljosaH@Contoso.com).SkuId

#Define the license object
$licensesToRemove = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$licensesToRemove.RemoveLicenses = $SkuId

#Remove the assigned license
Set-EntraUserLicense -ObjectId 'AljosaH@Contoso.com' -AssignedLicenses $licensesToRemove
```

### List inactive users with active licenses

Regularly auditing and managing licenses for inactive users in a Microsoft Entra tenant is a best practice that helps in cost management, security, compliance, resource optimization, and operational efficiency. To list inactive users with active licenses, run the following command:

```powershell
Connect-Entra -Scopes 'User.Read.All'
$disabledUsersWithLicenses = Get-EntraUser -Filter "accountEnabled eq false" -All | Where-Object {
    $_.AssignedLicenses -ne $null -and $_.AssignedLicenses.Count -gt 0
}
$disabledUsersWithLicenses | Select-Object Id, DisplayName, UserPrincipalName, AccountEnabled | Format-Table -AutoSize
```
