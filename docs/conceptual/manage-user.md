---
title: Manage users with Microsoft Entra PowerShell
description: 'This article provides IT admins with instructions on how to use Microsoft Entra PowerShell for user management tasks. Learn more to streamline your processes.'
author: omondiatieno
manager: mwongerapk
ms.topic: how-to
ms.date: 04/15/2025
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
- At least the [Cloud Application Administrator][cloud-app-admin] role.
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Entra PowerShell module][installation] guide to install the module.

You can access a user's information and manage their data on their behalf or as an app with its own identity.

## Onboard a user

To onboard a user, you create a new user account in Microsoft Entra ID. This process involves setting up the user's profile, including their display name, email address, and password.

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

### Bulk create users

To create multiple users in bulk, you can use a CSV file. The CSV file should contain the necessary user attributes, such as `DisplayName`, `UserPrincipalName`, and `PasswordProfile`.

```powershell
# Connect to Microsoft Entra PowerShell
Connect-Entra -Scopes 'User.ReadWrite.All'

# Create a new Password Profile for the new users. We'll be using the same password for all new users in this example
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
$PasswordProfile.Password = '<Your-Password>'

# Import the csv file. You will need to specify the path and file name of the CSV file in this cmdlet
$NewUsers = import-csv -Path '<path-to-your-csv-file>'

# Loop through all new users in the file to create them in Microsoft Entra ID
ForEach ($user in $NewUsers) {
    # Create a new user in Microsoft Entra ID
    New-EntraUser -UserPrincipalName $user.'EmailAddress' -DisplayName $user.'DisplayName' -GivenName $user.'FirstName' -Surname $user.'LastName' -Department $user.'Department' -MailNickname $user.'MailNickname' -AccountEnabled $true -PasswordProfile $passwordProfile
    }
```

| FirstName | LastName | DisplayName | EmailAddress       | Department | MailNickName |
|-----------|----------|-------------|--------------------|------------|--------------|
| Adele     | Vance    | Adele Vance | adelev@contoso.com | Marketing  | adelev       |

The output displays details of the newly created users.

```Output
DisplayName Id                                   Mail UserPrincipalName
----------- --                                   ---- -----------------
Adele Vance aaaaaaaa-1111-2222-3333-bbbbbbbbbbbb      adelev@contoso.com
```

### Update a user's password

1. To update a user's password by administrator, use this command:

    ```powershell
    Connect-Entra -Scopes 'Directory.AccessAsUser.All'
    $newPassword = '<strong-password>'
    $securePassword = ConvertTo-SecureString $newPassword -AsPlainText -Force
    Set-EntraUserPasswordProfile -UserId 'SawyerM@contoso.com' -Password $securePassword
    ```

1. To update the password for the signed-in user (self-serve), use this command:

    ```powershell
    Connect-Entra -Scopes 'Directory.AccessAsUser.All'
    $currentPassword = ConvertTo-SecureString '<strong-password>' -AsPlainText -Force
    $newPassword = ConvertTo-SecureString '<strong-password>' -AsPlainText -Force
    Set-EntraSignedInUserPassword -CurrentPassword $currentPassword -NewPassword $newPassword
    ```

    This command allows users to change their own passwords without admin privileges.

### Upload or retrieve a photo for the user

1. Upload a photo for a user.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    Set-EntraUserThumbnailPhoto -UserId 'SawyerM@contoso.com' -FilePath 'D:\UserThumbnailPhoto.jpg'
    ```

    This example sets the thumbnail photo of the user specified with the UserId parameter to the image specified with the FilePath parameter.

1. Retrieve a user’s photo.

    ```powershell
    Connect-Entra -Scopes 'ProfilePhoto.Read.All'
    Get-EntraUserThumbnailPhoto -UserId 'SawyerM@contoso.com'
    ```

    This example demonstrates how to retrieve the thumbnail photo of a user that is specified through the value of the `UserId` parameter.

## Grant users administrative roles in your organization

Granting users administrative roles in your organization allows them to perform specific tasks and manage resources. You can assign users to roles such as Group Administrator, User Administrator, or other custom roles.

To learn how to assign roles to users using Microsoft Entra PowerShell, see [Assign roles to users](manage-roles.md#assign-roles-to-users).

## Search users

You can search for users in your organization using various attributes such as `displayName`, `mailNickname`, `userPrincipalName`, `department` and `jobTitle`. The following example shows how to search for a user by `userPrincipalName`

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUser -Filter "userPrincipalName eq 'SawyerM@contoso.com'"
```

The output shows user details based on a `userPrincipalName` search.

```Output
DisplayName      Id                                   Mail                 UserPrincipalName     
-----------      --                                   ----                 -----------------     
Sawyer Miller   aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb SawyerM@contoso.com  SawyerM@contoso.com   
```

## Audit users by certain criteria

You can audit users by certain criteria, such as sign-in activity, and group memberships. This feature helps you track user activity and manage their access to resources.

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

### Download all users' sign-in activity

The following example retrieves all licensed user accounts and their last successful sign-in activity. It exports the data to a CSV file for further analysis.

```powershell
# Connect to Microsoft Entra PowerShell  

Connect-Entra -Scopes 'User.Read.All','AuditLog.Read.All','Directory.Read.All'

try {
     Get-EntraUser -All -Property Id, UserPrincipalName, DisplayName, SignInActivity -ErrorAction Stop |
         Select-Object `
             Id, `
             UserPrincipalName, `
             DisplayName, `
             @{ Name = 'LastSignInDateTime';           Expression = { $_.SignInActivity.LastSignInDateTime } }, `
             @{ Name = 'LastSuccessfulSignInDateTime'; Expression = { $_.SignInActivity.LastSuccessfulSignInDateTime } } |
         Export-Csv -Path 'C:\temp\lastSignIns.csv' -NoTypeInformation -Encoding UTF8 -ErrorAction Stop

     Write-Host "Sign-in activity exported successfully to lastSignIns.csv"
 }
 catch {
     Write-Error "Failed to retrieve or export data: $_"
 }
```

This example retrieves both the last sign-in and last successful sign-in dates for all users in your organization. The data is then exported to a CSV file named `lastSignIns.csv` in the `C:\temp` directory.

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

Use these commands to list the entities a user belongs to:

- [Get-EntraUserAdministrativeUnit](/powershell/module/microsoft.entra/get-entrauseradministrativeunit) - to retrieve a list of administrative units to which a user belongs.
- [Get-EntraUserGroup](/powershell/module/microsoft.entra/get-entrausergroup) - to retrieve a list of groups a user belongs to.
- [Get-EntraUserRole](/powershell/module/microsoft.entra/get-entrauserrole) - to retrieve a list of directory roles assigned to a user.

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

1. List the users who report to a specific user.

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

1. Assign a manager to a user.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    Set-EntraUserManager -UserId 'SawyerM@contoso.com' -ManagerId 'AdeleV@contoso.com'
    ```

    - `-UserId` - specifies the ID (as a UserPrincipalName or User ObjectId) of a user in Microsoft Entra ID.
    - `-ManagerId` - specifies the ID as a UserPrincipalName or User ObjectId) of the Microsoft Entra ID object to assign as a manager.

### List users without managers

This example lists users without a manager, helping to identify orphaned accounts, service accounts, or misconfigured profiles for cleanup.

```Powershell
Connect-Entra -Scopes 'User.Read.All'
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

### List disabled users

The following example generates a list of disabled accounts.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Get-EntraUser -Filter "accountEnabled eq false" | Select-Object DisplayName, Id, Mail, UserPrincipalName
```

The output lists disabled users.

```Output
DisplayName    Id                                   Mail userPrincipalName
-----------    --                                   ---- -----------------
Sawyer Miller  hhhhhhhh-7777-8888-9999-iiiiiiiiiiii      SawyerM@contoso.com
Kez Michael    eeeeeeee-4444-5555-6666-ffffffffffff      KezM@contoso.com
```

## Related content

- [Manage user licenses][manage-licenses]
- [Manage groups][tutorial-groups]
- [Manage devices][manage-devices]

<!-- link references -->

[installation]: installation.md
[cloud-app-admin]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#user-administrator
[tutorial-groups]: manage-groups.md
[create-acount]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F
[manage-licenses]: how-to-manage-user-licenses.md
[manage-devices]: manage-devices.md
