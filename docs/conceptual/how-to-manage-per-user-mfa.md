---
title: Manage Per-User MFA Settings in Microsoft Entra ID
description: Learn how to configure Per-User MFA settings, report on MFA states, and reset authentication methods using Microsoft Entra tools.

author: msewaweru
manager: mwongerapk
ms.topic: how-to
ms.date: 06/03/2025
ms.author: eunicewaweru

#customer intent: 1. As an IT admin, I want to report on Per-User MFA states so that I can monitor and manage user authentication settings effectively.
---

# Manage per-user MFA settings in Microsoft Entra ID

Multi-Factor Authentication (MFA) is a key security feature that helps protect user accounts from unauthorized access. While Conditional Access and Security Defaults are the recommended methods for enforcing MFA in Microsoft Entra ID, there are scenarios where managing MFA settings on a per-user basis is necessary. For example, use per-user settings when some users have unique security needs, access sensitive information that requires extra protection, or when you're gradually rolling out MFA. This article explains how to report on and manage per-user MFA states using Microsoft Entra PowerShell, including how to view current MFA status, update user settings, and optimize reporting for large environments. Follow these steps to help ensure your organization’s identities remain secure and compliant.

## Prerequisites

To successfully complete the steps in this article, you need:

- A Microsoft Entra user account. If you don't already have one, you can [create an account for free](https://azure.microsoft.com/free/?WT.mc_id=A261C142F).
- Microsoft Entra PowerShell is installed. To install the module, follow the [Install the Microsoft Entra PowerShell][install] guide.
- To use Microsoft Entra PowerShell, you need one of the following roles:
  - [Authentication Policy Administrator][authentication-policy-administrator]
  - [Global Reader][global-reader]

## Report on per-user MFA state

There are two methods to report on MFA state for all users or a subset of users.

The `Get-EntraAuthenticationMethodUserRegistrationDetailReport` report is a performant way to show MFA status for all users in a tenant. The `isMfaCapable` property of this report will return true if the user is enabled for MFA and has at least one MFA authentication method enabled. While the `isMfaCapable` property is a valid way to report on MFA state for users, it's not the exact equivalent of `StrongAuthenticationRequirements` in `Get-MsolUser`, which distinguishes between *disabled*, *enabled*, and *enforced* states.

For per-user MFA state , the `PerUserMFAState` property is the exact equivalent of the `strongAuthenticationRequirements`.

To report on this setting for all users or a list of users in PowerShell, you enumerate users and then request the authentication requirements setting per user.

```powershell
#Get PerUserMFA State for all users
Connect-Entra -Scopes 'User.Read.All', 'UserAuthenticationMethod.Read.All', 'Policy.Read.All'
$users = Get-EntraUser -All -Select Id, UserPrincipalName, DisplayName
Write-Output "Amount of requests within `"fetchAll`": $($users.Length)"
$usersReport = @()
$users | ForEach-Object {
    $userObj= New-Object -TypeName PSObject
    $userObj | Add-Member -Name 'Id' -MemberType NoteProperty -Value $_.id
    $userObj | Add-Member -Name 'DisplayName' -MemberType NoteProperty -Value $_.DisplayName
    $userObj | Add-Member -Name 'UserPrincipalName' -MemberType NoteProperty -Value $_.UserPrincipalName
    $userObj | Add-Member -Name 'PerUserMFAState' -MemberType NoteProperty -Value (Get-EntraBetaUserAuthenticationRequirement -UserId $_.id).PerUserMFAState
    $usersReport += $userObj
}
$usersReport | ft
```

```output
Id                                   DisplayName          UserPrincipalName                      PerUserMFAState
--                                   -----------          -----------------                      ---------------
aaaaaaaa-bbbb-cccc-1111-222222222222 Amari Rivera         AmaRive@Contoso.com                    enabled
bbbbbbbb-1111-2222-3333-cccccccccccc Avery Howard         AveHowa@Contoso.com                    enforced
cccccccc-2222-3333-4444-dddddddddddd Adrian King          AdrKin@Contoso.com                     disabled
dddddddd-3333-4444-5555-eeeeeeeeeeee Dakota Sanchez       DakSan@Contoso.com                     disabled
```

To enumerate per-user MFA state for a subset of users, you can use the `-Filter` and `-Top` parameters of [Get-EntraUser](/powershell/module/microsoft.entra/get-entrauser).

## Apply batch requests for improved performance

Microsoft Graph supports JSON-batching for API requests, allowing a client to send up to 20 individual requests in a single API request. These batched requests are performed by the service, and then all results returned in a single response. This can reduce the round-trip latency for API operations if you are requesting authentication requirements or methods for a large number of users.
This example script enumerates all users in a tenant, and then requests authentication requirements for each user. The authentication requirements requests are batched into groups of 20 and sent to the `$batch` Microsoft Graph API:

```powershell
#Get PerUserMFA State for all users, batched requests
Connect-Entra -Scopes 'User.Read.All', 'UserAuthenticationMethod.Read.All', 'Policy.Read.All'

$users = Get-EntraUser -All -Select Id, UserPrincipalName, DisplayName

Write-Output "Amount of requests within `"fetchAll`": $($users.Length)"

#Construct hashtable for user metadata 
$usersReport = @{}
$users | ForEach-Object {
    $userObj= New-Object -TypeName PSObject
    $userObj | Add-Member -Name 'Id' -MemberType NoteProperty -Value $_.id
    $userObj | Add-Member -Name 'DisplayName' -MemberType NoteProperty -Value $_.DisplayName
    $userObj | Add-Member -Name 'UserPrincipalName' -MemberType NoteProperty -Value $_.UserPrincipalName
    $usersReport[$_.id]= $userObj
}
#Request authentication requirements in batches of 20 users 
for($i=0;$i -lt $usersReport.count;$i+=20){
    $batch = @{}
    $batch['requests'] = ($users[$i..($i+19)] | select @{n='id';e={$_.id}},@{n='method';e={'GET'}},`
    @{n='url';e={"/users/$($_.id)/authentication/requirements"}})
    $request = Invoke-mggraphrequest -Method POST -URI "https://graph.microsoft.com/beta/`$batch" -body ($batch | convertto-json) -OutputType PSObject
    $request.responses| foreach{
        $userObj = $usersReport[$_.id]
        $userObj | Add-Member -Name 'PerUserMFAState' -MemberType NoteProperty -Value $_.body.perUserMFAState
    }
}
$usersReport
```

## Manage per-user MFA settings

To update the MFA Status of a user, use [Update-EntraBetaUserAuthenticationRequirement][update-entrabetaUserauthenticationrequirement].

```powershell
Connect-Entra -Scopes 'Policy.ReadWrite.AuthenticationMethod'
Update-EntraBetaUserAuthenticationRequirement -UserId '<user@contoso.com>' -PerUserMfaState 'enabled'
```

## Related content

- API reference: [Configuring authentication methods][configure-authentication-methods]
- Reset strong authentication method using [Reset-EntraStrongAuthenticationMethodByUpn][reset-entrastrongauthenticationaethodbyupn]

<!-- links -->
[authentication-policy-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#authentication-policy-administrator
[global-reader]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#global-reader
[update-entrabetaUserauthenticationrequirement]: /powershell/module/microsoft.entra.beta/update-entrabetauserauthenticationrequirement
[configure-authentication-methods]: /graph/authenticationmethods-get-started
[reset-entrastrongauthenticationaethodbyupn]: /powershell/module/microsoft.entra/reset-entrastrongauthenticationmethodbyupn