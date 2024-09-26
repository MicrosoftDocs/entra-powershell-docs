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
1. Users to assign licenses to are created in your tenant and assigned a location.

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

## Assign licenses to users and groups

Before assigning licenses to a user, you want to confirm the licenses that are already assigned to the user.

To view the licenses assigned to a user, run the following command:

```powershell
Connect-Entra -Scopes 'User.Read.All'
$userLicenses = Get-EntraUserLicenseDetail -ObjectId 'GjeEdla@MicrosoftLearnSecurityDocs.onmicrosoft.com'
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
Connect-Entra -Scopes 'User.ReadWrite.All'
# Define the user's object ID
$User = Get-EntraUser -ObjectId 'AljosaH@MicrosoftLearnSecurityDocs.onmicrosoft.com'

# Define the license plan to assign to the user
$license = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense
$License.SkuId = (Get-EntraSubscribedSku | Where SkuPartNumber -eq 'AAD_PREMIUM_P2').SkuId

$Licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$Licenses.AddLicenses = $license

# Assign the license to the user
Set-EntraUserLicense -ObjectId $User.ObjectId -AssignedLicenses $Licenses
```

To confirm that the license has been assigned to the user, run:

```powershell
Get-EntraUserLicenseDetail -ObjectId 'AljosaH@MicrosoftLearnSecurityDocs.onmicrosoft.com'
```

To confirm the service plans assigned to the user, run:

```powershell
(Get-EntraUserLicenseDetail -ObjectId 'AljosaH@MicrosoftLearnSecurityDocs.onmicrosoft.com').ServicePlans
```

### Assign a license to a user with some disabled plans
### Assign more than one license to a user
### Assign a license to a user with some disabled plans
### Assign a license to a user by copying license from another user
### Bulk assign multiple licenses for multiple users at the same time

### Remove an assigned user's License

To remove a license assigned to a user, follow the steps below:

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
# Define the user's object ID
$User = Get-EntraUser -ObjectId 'AljosaH@MicrosoftLearnSecurityDocs.onmicrosoft.com'

# Get the license assigned to the user
$SkuId = (Get-EntraUserLicenseDetail -ObjectId AljosaH@MicrosoftLearnSecurityDocs.onmicrosoft.com).SkuId

#Define the license object
$LicensestoRemove = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$LicensestoRemove.RemoveLicenses = $SkuId

#Remove the assigned license
Set-EntraUserLicense -ObjectId 'AljosaH@MicrosoftLearnSecurityDocs.onmicrosoft.com' -AssignedLicenses $LicensestoRemove
```

