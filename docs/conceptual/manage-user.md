---
title: "Manage users with Microsoft Entra PowerShell"
description: "Learn how to use app-only authentication to enable non-interactive scenarios with the Microsoft Entra PowerShell SDK."

author: omondiatieno
manager: CelesteDG
ms.service: entra
ms.topic: how-to
ms.date: 10/05/2024
ms.author: jomondi
ms.reviewer: stevemutungi

#customer intent: As a developer, I want to authenticate with Microsoft Entra using app-only access, so that I can perform non-interactive operations, such as listing users and groups, using the Microsoft Entra PowerShell SDK.
---

# Manage users with Microsoft Entra PowerShell

Users are the representation of a Microsoft Entra work or school user account or a personal Microsoft account in Microsoft Entra ID. The user resource in Microsoft Entra PowerShell is the representation of a user, and includes relationships and resources that are relevant to the user.

The user resource provides a straightforward way for you to access and manipulate user resources without having to perform extra calls, look up specific authentication information, and directly issue queries against other Microsoft Entra PowerShell objects.

## Prerequisites

To manage users with Microsoft Entra PowerShell, you need:

- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free][create-acount].
- One of the following roles: [User Administrator](/entra/identity/role-based-access-control/permissions-reference#user-administrator), or [Group Administrator](/entra/identity/role-based-access-control/permissions-reference#groups-administrator).
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Entra PowerShell module][installation] guide to install the module.

You can access a user's information and manage their data on their behalf or as an app with its own identity.

## Manage users in your organization

To manage users, you can perform the following common user management tasks:

### Create users

The following example creates a new user using the `UserPrincipalName` parameter.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
$passwordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$passwordProfile.Password = '<Strong-Password>'
$userParams = @{
    DisplayName = 'New User'
    PasswordProfile = $passwordProfile
    UserPrincipalName = 'NewUser@contoso.com'
    AccountEnabled = $true
    MailNickName = 'NewUser'
}
New-EntraUser @userParams
```

```Output
DisplayName    Id                                   Mail UserPrincipalName
-----------    --                                   ---- -----------------
New User aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb      NewUser@contoso.com
```

### Retrieve a user's sign-in activity

The following example shows how to retrieve the sign-in activity of a specific user.

```powershell
Connect-Entra -Scopes 'User.Read.All','AuditLog.Read.All'
Get-EntraUser -UserId 'SawyerM@contoso.com' -Property 'SignInActivity' | Select-Object -ExpandProperty 'SignInActivity'
```

```Output
lastSignInDateTime                : 07/09/2024 09:15:41
lastNonInteractiveSignInDateTime  : 07/09/2024 07:15:41
lastSuccessfulSignInRequestId     : bbbbbbbb-1111-2222-3333-aaaaaaaaaaaa
lastNonInteractiveSignInRequestId : 00001111-aaaa-2222-bbbb-3333cccc4444
lastSignInRequestId               : bbbbbbbb-1111-2222-3333-aaaaaaaaaaaa
lastSuccessfulSignInDateTime      : 07/09/2024 09:15:41
```

### List a user's group memberships

1. List a user’s group memberships.

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUserMembership -UserId 'SawyerM@contoso.com'
```

```Output
Id                                   DeletedDateTime
--                                   ---------------
eeeeeeee-4444-5555-6666-ffffffffffff
ffffffff-5555-6666-7777-gggggggggggg
gggggggg-6666-7777-8888-hhhhhhhhhhhh
hhhhhhhh-7777-8888-9999-iiiiiiiiiiii
```

### Get a user's manager, direct reports and assign a manager to a user

1. Get a user's manager.

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUserManager -UserId 'SawyerM@contoso.com'
```

```Output
    Id                                   DeletedDateTime
--                                   ---------------
eeeeeeee-4444-5555-6666-ffffffffffff
```

1. List the users who report to a specific user.

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUserDirectReport -UserId 'SawyerM@contoso.com'
```

```Output
    Id                                   DeletedDateTime
--                                   ---------------
eeeeeeee-4444-5555-6666-ffffffffffff
```

1. Assign a manager to a user.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
$manager = Get-EntraUser -Filter "UserPrincipalName eq 'AdeleV@contoso.com'"
$params = @{
        UserId = 'SawyerM@contoso.com'
        RefObjectId = $manager.Id
}
Set-EntraUserManager @params
```

- `-UserId` - specifies the ID (as a UserPrincipalName or User ObjectId) of a user in Microsoft Entra ID.
- `-RefObjectId` - specifies the ID as a UserPrincipalName or User ObjectId) of the Microsoft Entra ID object to assign as a manager.

## List inactive users

1. The following example generates a list of disabled accounts.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Get-EntraUser -Filter "accountEnabled eq false" | Select-Object DisplayName, Id, Mail, UserPrincipalName
```

```Output
DisplayName    Id                                   Mail userPrincipalName
-----------    --                                   ---- -----------------
Sawyer Miller hhhhhhhh-7777-8888-9999-iiiiiiiiiiii      SawyerM@contoso.com
Kez Michael   eeeeeeee-4444-5555-6666-ffffffffffff      KezM@contoso.com
```

### Upload or retrieve a photo for the user

1. Upload a photo for a user.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
$photoParams = @{
    UserId = 'SawyerM@contoso.com'
    FilePath = 'D:\UserThumbnailPhoto.jpg'
}
Set-EntraUserThumbnailPhoto @photoParams
```

This example sets the thumbnail photo of the user specified with the UserId parameter to the image specified with the FilePath parameter.

1. Retrieve a user’s photo.

```powershell
Connect-Entra -Scopes 'ProfilePhoto.Read.All'
Get-EntraUserThumbnailPhoto -UserId 'SawyerM@contoso.com'
```

This example demonstrates how to retrieve the thumbnail photo of a user that is specified through the value of the UserId parameter.

### Grant users administrative roles in your organization

The following example shows how to grant a user an administrative role.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All', 'RoleManagement.ReadWrite.Directory'
$directoryRole = Get-EntraDirectoryRole -Filter "DisplayName eq 'Helpdesk Administrator'"
$user = Get-EntraUser -Filter "UserPrincipalName eq 'SawyerM@contoso.com'"
$roleMemberParams = @{
        DirectoryRoleId = $directoryRole.Id
        RefObjectId = $user.Id
}
Add-EntraDirectoryRoleMember @roleMemberParams
```

This command adds a user to a Microsoft Entra role. To retrieve roles, use the command [Get-EntraDirectoryRole](/powershell/module/microsoft.graph.entra/get-entradirectoryrole).

- `-DirectoryRoleId` - specifies the unique identifier (ObjectId) of the directory role to which you want to add a member.
- `-RefObjectId` - specifies the unique identifier (ObjectId) of the user, group, or service principal that you want to add as a member of the specified directory role.

## Manage user licenses

1. Get details of a user's licenses.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Get-EntraUserLicenseDetail -UserId 'SawyerM@contoso.com'
```

```Output
Id                                          SkuId                                SkuPartNumber
--                                          -----                                -------------
ouL7hgqFM0GkdqXrzahI4u7E6wa1G91HgSARMkvFTgY 06ebc4ee-1bb5-47dd-8120-11324bc54e06 SPE_E5
```

1. Assign a license to a user based on a template user.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All', 'Organization.Read.All'
$user = Get-EntraUser -UserId 'SawyerM@contoso.com'  
$license = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense 
$license.SkuId = (Get-EntraSubscribedSku | Where SkuPartNumber -eq 'FLOW_FREE').SkuId
$licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses 
$licenses.AddLicenses = $license 
Set-EntraUserLicense -ObjectId $user.Id -AssignedLicenses $licenses
```

The following example shows how to assign a `FLOW_FREE` license to a user with ObjectId `SawyerM@contoso.com`.

1. Remove a license from a user.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All', 'Organization.Read.All'
$userPrincipalName = 'SawyerM@contoso.com'
$user = Get-EntraUser -UserId $userPrincipalName
$skuId = (Get-EntraUserLicenseDetail -UserId $UserPrincipalName).SkuId
$licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses
$licenses.RemoveLicenses = $skuId
Set-EntraUserLicense -ObjectId $user.Id -AssignedLicenses $licenses
```

```Output
Name                           Value
----                           -----
preferredLanguage
givenName
@odata.context                 https://graph.microsoft.com/v1.0/$metadata#users/$entity
id                             hhhhhhhh-7777-8888-9999-iiiiiiiiiiii
mail                           SawyerM@contoso.com
userPrincipalName              SawyerM@contoso.com
jobTitle
displayName                    Sawyer Miller
officeLocation
surname
mobilePhone
businessPhones                 {}
```

This example shows how to remove a license from a user.

## Offboard a user

1. Invalidate active sessions and tokens.

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
Revoke-EntraUserAllRefreshToken -UserId 'SawyerM@contoso.com'
```

Revoking authentication tokens invalidates them, thus preventing reaccess through cached logins or remembered sessions.

1. Disable a user.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Set-EntraUser -UserId 'SawyerM@contoso.com' -AccountEnabled $false
```

Disabling the account instantly blocks the user from accessing company resources, applications, and data.

1. Reset a user's password.

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
$securePassword = ConvertTo-SecureString 'Some-strong-random-password' -AsPlainText -Force
Set-EntraUserPassword -ObjectId 'SawyerM@contoso.com' -Password $securePassword
```

Resetting the user's password ensures they can't use their old credentials to access company resources before their account is disabled or deleted. This prevents unauthorized access and potential misuse of the account.

1. Disable a user's device.

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
$device = Get-EntraDevice -Filter "DisplayName eq 'Sawyer Laptop'"
$owner = Get-EntraDeviceRegisteredOwner -DeviceId $device.Id
Remove-EntraDeviceRegisteredOwner -DeviceId $device.Id -OwnerId $owner.Id
```

Disabling a user's device helps safeguard the organization's security, data, and resources.

1. Remove a user account.

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
Remove-EntraUser -UserId 'SawyerM@contoso.com'
```

> [!Note]
> You can also reclaim any licenses for software and services that were assigned to the user.

## Next steps

- [Manage groups][tutorial-groups]
- [Manage apps][manage-apps]

<!-- link references -->

[installation]: installation.md
[tutorial-groups]: manage-groups.md
[create-acount]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F
[manage-apps]: manage-apps.md
