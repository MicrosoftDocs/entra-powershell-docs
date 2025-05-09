---
title: "Manage Per-User MFA Settings in Microsoft Entra"
description: "Learn how to configure Per-User MFA settings, report on MFA states, and reset authentication methods using Microsoft Entra tools"

author: msewaweru
manager: CelesteDG
ms.topic: how-to
ms.date: 05/09/2025
ms.author: eunicewaweru
ms.reviewer: stevemutungi

#customer intent: 1. As an IT admin, I want to report on Per-User MFA states so that I can monitor and manage user authentication settings effectively.
---

# Manage Per-User MFA Settings in Microsoft Entra

This guide provides detailed instructions for managing Per-User Multi-Factor Authentication (MFA) settings in Microsoft Entra. While Conditional Access Policies and Security Defaults are the preferred methods for enforcing MFA, Per-User MFA remains a critical feature for specific scenarios. Historically, administrators relied on the MSOnline PowerShell module to manage and report on Per-User MFA settings. However, with the planned retirement of MSOnline PowerShell in April 2025, these capabilities are now available through Microsoft Graph APIs and the Microsoft Graph and Microsoft Entra PowerShell modules.

This document covers:

- Reporting on Per-User MFA State using Microsoft Graph and Entra PowerShell.
- Configuring Per-User MFA settings and authentication methods.
- Leveraging batching for improved performance when managing large user sets.

By following this guide, administrators can transition from legacy tools to modern APIs and PowerShell modules, ensuring continued support for Per-User MFA management.

Microsoft Entra enables three mechanisms to enforce MFA for users:

- Conditional Access Policy: A feature in Microsoft Entra that allows administrators to enforce access controls based on specific conditions. [Learn more about Conditional Access Policies](https://learn.microsoft.com/en-us/azure/active-directory/conditional-access/overview).

- Security Defaults: A set of basic identity security mechanisms enabled by default to protect organizations. [Learn more about Security Defaults](https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/concept-fundamentals-security-defaults).

- Per-User MFA: A method to enforce MFA on a per-user basis. [Learn more about Per-User MFA](https://learn.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-userstates).

While the CA Policy and Security Defaults methods are generally preferred, managing and reporting on Per-User MFA settings was a commonly-used capability in the retiring MSOnline PowerShell module.
Per-User MFA settings and state are available in Microsoft Graph APIs and the Microsoft Entra PowerShell modules.

## Microsoft Graph APIs and cmdlets:

The relevant Microsoft Graph APIs and equivalent cmdlets. The API reference documentation linked in the left-hand column also describes least-priv and required permissions for the corresponding operations. 


|Graph API|Microsoft Entra PowerShell|
|-----|------|
|/authentication/requirements|Get-EntraBetaUserAuthenticationRequirement, Update-MgBetaUserAuthenticationRequirement |
|/authentication/methods|Get-EntraBetaUserAuthenticationMethod|


## Reporting on Per-User MFA state

There are two methods to report on MFA state for all users or a subset of users. The `UserRegistrationDetails` report is a performant way to show MFA status for all users in a tenant. This API and corresponding cmdlets are the equivalent of this report in the Microsoft Entra Admin Center: https://learn.microsoft.com/en-us/entra/identity/authentication/howto-authentication-methods-activity#user-registration-details. The `isMfaCapable` property of this report will return true if the user is enabled for MFA (using one of the three mechanisms available) and has at least 1 MFA authentication method enabled. While the `isMfaCapable` property is a valid way to report on MFA state for users, it is not the exact equivalent of StrongAuthenticationRequirements in Get-MsoLUser, which distinguishes between disabled, enabled, and enforced states.
For Per-User MFA state in specific, the `PerUserMFAState` property of the /user/<id>/authentication/requirements API is the exact equivalent of the strongAuthenticationRequirments property in the Get-MsolUser cmdlet. 
To report on this setting for all users or a list of users in PowerShell, you can enumerate users and then request the authentication requirements setting per user.  For example:
 
Microsoft Entra PowerShell:

```powershell
#Get PerUserMFA State for all users
Connect-Entra  -scope 'User.Read.All,UserAuthenticationMethod.Read.All'
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

## Filtering

If you want to enumerate Per-User MFA state for a subset of users, you can use the `-filter` and `-top` parameters of [Get-EntraUser](/powershell/module/entra/get-entra).

## Batching for improved performance

Microsoft Graph supports JSON-batching for API requests, allowing a client to send up to 20 individual requests in a single API request. These batched requests are performed by the service, and then all results returned in a single response. This can reduce the round-trip latency for API operations 20:1 if you are requesting authentication requirements or methods for a large number of users. 
This example script enumerates all users in a tenant, and then requests authentication/requirements for each user. The authentication/requirements requests are batched into groups of 20 and sent to the $batch Microsoft Graph API:

Microsoft Entra PowerShell
```powershell
#Get PerUserMFA State for all users, batched requests
Connect-Entra  -scope 'User.Read.All,UserAuthenticationMethod.Read.All'
$users = Get-EntraUser -All -Select Id, UserPrincipalName, DisplayName
Write-Output "Amount of requests within `"fetchAll`": $($users.Length)"

#Construct hashtable of user metadata 
$usersReport = @{}
$users | ForEach-Object {
    $userObj= New-Object -TypeName PSObject
    $userObj | Add-Member -Name 'Id' -MemberType NoteProperty -Value $_.id
    $userObj | Add-Member -Name 'DisplayName' -MemberType NoteProperty -Value $_.DisplayName
    $userObj | Add-Member -Name 'UserPrincipalName' -MemberType NoteProperty -Value $_.UserPrincipalName
    #$userObj | Add-Member -Name 'PerUserMFAState' -MemberType NoteProperty -Value ""
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

## Managing Per-User MFA settings

1. Configuring Per-User MFA setting:

Update the MFA Status of a user: `Update-EntraBetaUserAuthenticationRequirement`
1. Configuring authentication methods:

API Reference: Manage users' authentication methods using Microsoft Graph" - Microsoft Graph | Microsoft LearnUpdate-EntraUserAuthenticationMethod

1. Reset user password:
Reset a user's password, represented by a password authentication method object using `Reset-MgUserAuthenticationMethodPassword`.

1. Reset Strong Authentication Method: 
Resets the strong authentication method using the User Principal Name (UPN) using `Reset-EntraStrongAuthenticationMethodByUpn`


