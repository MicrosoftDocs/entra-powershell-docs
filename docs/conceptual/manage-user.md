---
title: "Manage users with Microsoft Entra PowerShell"
description: "This article provides IT admins with instructions on how to use Microsoft Entra PowerShell for user management tasks. It covers creating users, tracking sign-in activity, managing group memberships and roles, handling user photos, and off-boarding procedure."

author: omondiatieno
manager: CelesteDG
ms.service: entra
ms.topic: how-to
ms.date: 01/05/2025
ms.author: jomondi
ms.reviewer: stevemutungi

#customer intent: As an IT admin, I want to learn how to effectively manage users in my organization using Microsoft Entra PowerShell, so that I can perform tasks such as creating users, retrieving user sign-in activity, managing user's group memberships and roles, and off-boarding users efficiently.
---

# Manage users with Microsoft Entra PowerShell

Users are the representation of a Microsoft Entra work or school user account or a personal Microsoft account in Microsoft Entra ID. The user resource in Microsoft Entra PowerShell is the representation of a user, and includes relationships and resources that are relevant to the user.

The user resource provides a straightforward way for you to access and manipulate user resources without having to perform extra calls, look up specific authentication information, and directly issue queries against other Microsoft Entra PowerShell objects.

## Prerequisites

To manage users with Microsoft Entra PowerShell, you need:

- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free][create-acount].
- One of the following roles: [User Administrator](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#user-administrator), or [Group Administrator](/entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#groups-administrator).
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Entra PowerShell module][installation] guide to install the module.

You can access a user's information and manage their data on their behalf or as an app with its own identity.

## Manage users in your organization

To manage users, you can perform the following common user management tasks:

### Create a user

This example creates a new user.

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

The output displays details of the newly created user.

```Output
DisplayName    Id                                     Mail    UserPrincipalName
-----------    --                                     ----    -----------------
New User       aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb           NewUser@contoso.com
```

### Retrieve a user's sign-in activity

The following example shows how to retrieve the sign-in activity of a specific user.

```powershell
Connect-Entra -Scopes 'User.Read.All','AuditLog.Read.All'
Get-EntraUser -UserId 'SawyerM@contoso.com' -Property 'SignInActivity' | 
  Select-Object -Property Id, DisplayName, UserPrincipalName -ExpandProperty 'SignInActivity'
```

The output shows the user's sign-in activity.

```Output
lastNonInteractiveSignInRequestId : bbbbbbbb-1111-2222-3333-aaaaaaaaaaaa
lastSignInRequestId               : cccccccc-2222-3333-4444-dddddddddddd
lastSuccessfulSignInDateTime      : 9/9/2024 1:12:13 PM
lastNonInteractiveSignInDateTime  : 9/9/2024 1:12:13 PM
lastSuccessfulSignInRequestId     : bbbbbbbb-1111-2222-3333-aaaaaaaaaaaa
lastSignInDateTime                : 9/7/2024 9:15:41 AM
id                                : aaaaaaaa-bbbb-cccc-1111-222222222222
displayName                       : Sawyer Miller
userPrincipalName                 : SawyerM@contoso.com
```

### List a user's group memberships

The following example lists the groups that a user is a member of.

```powershell
Connect-Entra -Scopes 'User.Read'
Get-EntraUserMembership -UserId 'SawyerM@contoso.com' |
 Select-Object Id, displayName, createdDateTime, '@odata.type' |
 Format-Table -AutoSize
```

The output shows the user's memberships.

```Output
Id                                   displayName                         createdDateTime      @odata.type
--                                   -----------                         ---------------      -----------
00aa00aa-bb11-cc22-dd33-44ee44ee44ee Contoso                             2024-10-06T08:49:16Z #microsoft.graph.group
22cc22cc-dd33-ee44-ff55-66aa66aa66aa Contoso marketing                   2024-10-07T01:17:28Z #microsoft.graph.group
55ff55ff-aa66-bb77-cc88-99dd99dd99dd Pacific Admin Unit                                       #microsoft.graph.administrativeUnit
```

### Get a user's manager, direct reports and assign a manager to a user

1. Get a user's manager.

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUserManager -UserId 'SawyerM@contoso.com' |
    Select-Object Id, displayName, userPrincipalName, createdDateTime, accountEnabled, userType |
    Format-Table -AutoSize
```

The output shows the user's manager.

```Output
id                                    displayName     userPrincipalName                    createdDateTime           accountEnabled  userType
--                                    -----------     -----------------                    ---------------           --------------  --------
11bb11bb-cc22-dd33-ee44-55ff55ff55ff  Patti Fernandez PattiF@Contoso.com                 10/7/2024 12:32:01 AM      True           Member
```

2. List the users who report to a specific user.

```powershell
Connect-Entra -Scopes 'User.Read','User.Read.All'
Get-EntraUserDirectReport -UserId 'SawyerM@contoso.com' |
    Select-Object Id, displayName, userPrincipalName, createdDateTime, accountEnabled, userType |
    Format-Table -AutoSize
```

The output shows the user's direct report.

```Output
id                                    displayName     userPrincipalName           createdDateTime       accountEnabled  userType
--                                    -----------     -----------------           ---------------       --------------  --------
bbbbbbbb-1111-2222-3333-cccccccccccc  Christie Cline  ChristieC@Contoso.com       10/7/2024 12:32:25 AM  True           Member
aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb  Isaiah Langer   IsaiahL@Contoso.com         10/7/2024 12:33:16 AM  True           Member
```

3. Assign a manager to a user.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Set-EntraUserManager -UserId 'SawyerM@contoso.com' -ManagerId 'AdeleV@contoso.com'
```

- `-UserId` - specifies the ID (as a UserPrincipalName or User ObjectId) of a user in Microsoft Entra ID.
- `-ManagerId` - specifies the ID as a UserPrincipalName or User ObjectId) of the Microsoft Entra ID object to assign as a manager.

## List users without managers

This example lists users without a manager, helping to identify orphaned accounts, service accounts, or misconfigured profiles for cleanup.

```Powershell
$allUsers = Get-EntraUser -All
$usersWithoutManagers = foreach ($user in $allUsers) {
    $manager = Get-EntraUserManager -UserId $user.Id -ErrorAction SilentlyContinue
    if (-not $manager) {
        [PSCustomObject]@{
            Id                = $user.Id
            DisplayName       = $user.DisplayName
            UserPrincipalName = $user.UserPrincipalName
            UserType          = $user.userType
            AccountEnabled    = $user.accountEnabled
            CreatedDateTime   = $user.createdDateTime
        }
    }
}
$usersWithoutManagers | Format-Table Id, DisplayName, UserPrincipalName, CreatedDateTime, UserType, AccountEnabled  -AutoSize
```

The output lists users without managers.

```Output
Id                                   DisplayName         UserPrincipalName                           CreatedDateTime           UserType   AccountEnabled
--                                   -----------         -----------------                           ---------------           --------   --------------
cccccccc-2222-3333-4444-dddddddddddd New User           NewUser@tenant.com                         10/7/2024 2:24:26 PM      Member     True
bbbbbbbb-1111-2222-3333-cccccccccccc Sawyer Miller     SawyerM@contoso.com                        10/7/2024 12:33:36 AM     Member     True
```

## List inactive users

The following example generates a list of disabled accounts.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Get-EntraUser -Filter "accountEnabled eq false" | Select-Object DisplayName, Id, Mail, UserPrincipalName
```

The output lists inactive users.

```Output
DisplayName    Id                                   Mail userPrincipalName
-----------    --                                   ---- -----------------
Sawyer Miller  hhhhhhhh-7777-8888-9999-iiiiiiiiiiii      SawyerM@contoso.com
Kez Michael    eeeeeeee-4444-5555-6666-ffffffffffff      KezM@contoso.com
```

### Upload or retrieve a photo for the user

1. Upload a photo for a user.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Set-EntraUserThumbnailPhoto -UserId 'SawyerM@contoso.com' -FilePath 'D:\UserThumbnailPhoto.jpg'
```

This example sets the thumbnail photo of the user specified with the UserId parameter to the image specified with the FilePath parameter.

2. Retrieve a user’s photo.

```powershell
Connect-Entra -Scopes 'ProfilePhoto.Read.All'
Get-EntraUserThumbnailPhoto -UserId 'SawyerM@contoso.com'
```

This example demonstrates how to retrieve the thumbnail photo of a user that is specified through the value of the `UserId` parameter.

### Grant users administrative roles in your organization

The following example shows how to grant a user an administrative role.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All', 'RoleManagement.ReadWrite.Directory'
$directoryRole = Get-EntraDirectoryRole -Filter "DisplayName eq 'Helpdesk Administrator'"
$user = Get-EntraUser -Filter "UserPrincipalName eq 'SawyerM@contoso.com'"
Add-EntraDirectoryRoleMember -DirectoryRoleId $directoryRole.Id -RefObjectId $user.Id
```

This command adds a user to a Microsoft Entra role. To retrieve roles, use the command [Get-EntraDirectoryRole](/powershell/module/microsoft.entra/get-entradirectoryrole).

- `-DirectoryRoleId` - specifies the unique identifier (ObjectId) of the directory role to which you want to add a member.
- `-RefObjectId` - specifies the unique identifier (ObjectId) of the user, group, or service principal that you want to add as a member of the specified directory role.

## Off-board a user

1. Invalidate active sessions and tokens.

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
Revoke-EntraUserAllRefreshToken -UserId 'SawyerM@contoso.com'
```

Revoking authentication tokens invalidates them, thus preventing reaccess through cached logins or remembered sessions.

2. Disable a user.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Set-EntraUser -UserId 'SawyerM@contoso.com' -AccountEnabled $false
```

Disabling the account instantly blocks the user from accessing company resources, applications, and data.

3. Reset a user's password.

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
$securePassword = ConvertTo-SecureString 'Some-strong-random-password' -AsPlainText -Force
Set-EntraUserPassword -ObjectId 'SawyerM@contoso.com' -Password $securePassword
```

Resetting the user's password ensures they can't use their old credentials to access company resources before their account is disabled or deleted. This process prevents unauthorized access and potential misuse of the account.

4. Disable a user's device.

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
$device = Get-EntraDevice -Filter "DisplayName eq 'Sawyer Laptop'"
$owner = Get-EntraDeviceRegisteredOwner -DeviceId $device.Id
Remove-EntraDeviceRegisteredOwner -DeviceId $device.Id -OwnerId $owner.Id
```

Disabling a user's device helps safeguard the organization's security, data, and resources.

5. Remove a user account.

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
Remove-EntraUser -UserId 'SawyerM@contoso.com'
```

> [!Note]
> You can also reclaim any licenses for software and services that were assigned to the user.

## Related content

- [Manage user licenses][manage-licenses]
- [Manage groups][tutorial-groups]
- [Manage apps][manage-apps]

<!-- link references -->

[installation]: installation.md
[tutorial-groups]: manage-groups.md
[create-acount]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F
[manage-apps]: manage-apps.md
[manage-licenses]: how-to-manage-user-licenses.md
