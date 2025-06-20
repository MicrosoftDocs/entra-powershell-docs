---
title: Run legacy scripts in compatibility mode 
description: Learn how to use the Enable-EntraAzureADAlias command to run existing AzureAD PowerShell scripts in Microsoft Entra PowerShell with minimal modifications.

author: csmulligan
manager: mwongerapk
ms.topic: concept-article
ms.date: 02/09/2025

#Customer intent: As an IT admin, I want to learn how to run my existing scripts from Azure AD PowerShell in Microsoft Entra PowerShell so that I can smoothly transition to using Microsoft Entra PowerShell in my operations.
---
# Run legacy scripts in compatibility mode

In this article, you learn how to run legacy Azure AD PowerShell scripts in Microsoft Entra PowerShell using compatibility mode, enabling seamless script migration with minimal changes. This process enables you to transition smoothly to the new module while maintaining existing automation workflows, ensuring continued efficiency and compliance with updated tools.

Microsoft Entra PowerShell has over _98%_ compatibility with [Azure AD PowerShell][azuread-ps] module. In the compatibility mode, you're able to run your existing Azure AD PowerShell scripts with minimal modifications using Microsoft Entra PowerShell by using the `Enable-EntraAzureADAlias` command. To find Azure AD PowerShell and MSOnline cmdlet equivalents in Microsoft Entra PowerShell, use the [Azure AD PowerShell to Microsoft Entra PowerShell cmdlet map](./azuread-powershell-to-entra-powershell-mapping.md) .

## Use compatibility mode with Enable-EntraAzureADAlias

The `Enable-EntraAzureADAlias` cmdlet enables compatibility mode through aliases. By default, `Enable-EntraAzureADAlias` only enables compatibility aliases for the current Microsoft Entra PowerShell session. For more information, see the [Enable-EntraAzureADAlias][enable-entraazureadalias] reference documentation.

To use Microsoft Entra PowerShell with your existing AzureAD PowerShell scripts, replace the `Connect-AzureAD` command with the three provided lines. These three lines are the beginning of your migrated AzureAD PowerShell script.

```powershell
Import-Module -Name Microsoft.Entra.Applications
Connect-Entra -Scopes 'Application.Read.All' #Replaces Connect-AzureAD for auth
Enable-EntraAzureADAlias #enable aliasing
Get-AzureADApplication -Top 2
```

### Example

In this example, you run a script that exports apps with expiring secrets using Microsoft Entra PowerShell. This example assumes that the Microsoft Entra PowerShell module is already [installed][installation].

The following example script is the original AzureAD PowerShell script.

```powershell
Connect-AzureAD
$applications = Get-AzureADApplication -All $true
$Logs = @()
Write-Host "I would like to see the Applications with the Secrets and Certificates that expire in the next X amount of Days? <<Replace X with the number of days. The answer should be ONLY in Numbers>>" -ForegroundColor Green
$Days = Read-Host

Write-Host "Would you like to see Applications with already expired secrets or certificates as well? <<Answer with [Yes] [No]>>" -ForegroundColor Green
$alreadyExpired = Read-Host

$now = Get-Date

foreach ($app in $applications) {
    $appName = $app.DisplayName
    $appID = $app.objectid
    $applID = $app.AppId
    $appCreds = Get-AzureADApplication -ObjectId $appID | Select-Object -Property PasswordCredentials, KeyCredentials
    $secret = $appCreds.PasswordCredentials
    $cert = $appCreds.KeyCredentials

```

**Note:** This code snippet is shortened for readability. See the [full sample for details](https://github.com/microsoftgraph/entra-powershell/blob/main/samples/export-apps-with-expiring-secrets.ps1).

To use your script with the Microsoft Entra PowerShell module, replace the `Connect-AzureAD` cmdlet with the three lines provided in the snippet. You don’t need to rewrite the entire script.

The following script is the migrated script.

```powershell
Import-Module -Name Microsoft.Entra.Users
Connect-Entra #Replaces Connect-AzureAD for auth
Enable-EntraAzureADAlias #Activate aliasing

$applications = Get-AzureADApplication -All $true
$logs = @()
Write-Host "I would like to see the Applications with the Secrets and Certificates that expire in the next X amount of Days? <<Replace X with the number of days. The answer should be ONLY in Numbers>>" -ForegroundColor Green
$days = Read-Host
Write-Host "Would you like to see Applications with already expired secrets or certificates as well? <<Answer with [Yes] [No]>>" -ForegroundColor Green
$alreadyExpired = Read-Host
$now = Get-Date
foreach ($app in $applications) {
    $appName = $app.DisplayName
    $appID = $app.Objectid
    $applID = $app.AppId
    $appCreds = Get-AzureADApplication -ObjectId $appID | Select-Object -Property PasswordCredentials, KeyCredentials
    $secret = $appCreds.PasswordCredentials
    $cert = $appCreds.KeyCredentials
```

**Note:** This code snippet is shortened for readability. See the [full modified sample for details](https://github.com/microsoftgraph/entra-powershell/blob/main/samples/export-apps-with-expiring-secrets-modified.ps1).

## Test compatibility with Test-EntraScript command

The [Test-EntraScript][testEntrascriptDefinition] cmdlet verifies if a script with Azure AD PowerShell commands works with the Microsoft Entra PowerShell module. If there are compatibility issues, it lists them, including the line number, issue type, incompatible command, and the specific code snippet.

## Known issues

When migrating from the Azure AD PowerShell module to Microsoft Entra PowerShell, you might encounter several known issues.

- Parameter `-Filter` might not work correctly.
- Parameter `-SearchString` might not work correctly.
- Output objects can differ slightly with AzureAD output objects.

## Related content

- [Install the Microsoft Entra PowerShell module][installation]
- [Navigate the Microsoft Entra PowerShell module][quickstart]

<!-- link references -->
[azuread-ps]: /powershell/module/azuread
[installation]: installation.md
[testEntrascriptDefinition]: /powershell/module/microsoft.entra/test-entrascript
[enable-entraazureadalias]: /powershell/module/microsoft.entra/enable-entraazureadalias
[quickstart]: navigate-entraps.md
