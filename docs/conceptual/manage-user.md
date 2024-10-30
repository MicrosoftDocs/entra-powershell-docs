---
title: "Manage users with Microsoft Entra PowerShell"
description: "Learn how to use app-only authentication to enable non-interactive scenarios with the Microsoft Entra PowerShell SDK."

author: omondiatieno
manager: CelesteDG
ms.service: entra
ms.topic: how-to
ms.date: 06/26/2024
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

### Create and delete users

1. Create a new user using the `UserPrincipalName` parameter.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    $PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile
    $PasswordProfile.Password = '<Strong-Password>'

    $userParams = @{
        DisplayName = 'New User'
        PasswordProfile = $PasswordProfile
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

1. Delete a user.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    Remove-EntraUser -ObjectId 'SawyerM@contoso.com'
    ```

### Retrieve a User's Sign-In Activity

1. Retrieve the SignInActivity of a specific user.

    ```powershell
    Connect-Entra -Scopes 'User.Read.All','AuditLog.Read.All'
    Get-EntraUser -ObjectId 'SawyerM@contoso.com' -Property 'SignInActivity' | Select-Object -ExpandProperty 'SignInActivity'
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
    Get-EntraUserMembership -ObjectId 'SawyerM@contoso.com'
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
    Get-EntraUserManager -ObjectId 'SawyerM@contoso.com'
    ```

    ```Output
     Id                                   DeletedDateTime
    --                                   ---------------
    eeeeeeee-4444-5555-6666-ffffffffffff
    ```

1. List the users who report to a specific user.

    ```powershell
    Connect-Entra -Scopes 'User.Read.All'
    Get-EntraUserDirectReport -ObjectId 'SawyerM@contoso.com'
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
         ObjectId = 'SawyerM@contoso.com'
         RefObjectId = $manager.ObjectId
    }
    
    Set-EntraUserManager @params
    ```

   - `-ObjectId` - specifies the ID (as a UserPrincipalName or ObjectId) of a user in Microsoft Entra ID.

   - `-RefObjectId` - specifies the ID (as a UserPrincipalName or ObjectId) of the Microsoft Entra ID object to assign as a manager.

### Upload or retrieve a photo for the user

1. Upload a photo for a user.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    $photoParams = @{
        ObjectId = 'SawyerM@contoso.com'
        FilePath = 'D:\UserThumbnailPhoto.jpg'
    }
    
    Set-EntraUserThumbnailPhoto @photoParams
    ```

    This example sets the thumbnail photo of the user specified with the ObjectId parameter to the image specified with the FilePath parameter.

1. Retrieve a user’s photo.

    ```powershell
    Connect-Entra -Scopes 'ProfilePhoto.Read.All'
    Get-EntraUserThumbnailPhoto -ObjectId 'SawyerM@contoso.com'
    ```

    This example demonstrates how to retrieve the thumbnail photo of a user that is specified through the value of the ObjectId parameter.

### Grant users administrative roles in your organization

Grant a user an administrative role.

   ```powershell
   Connect-Entra -Scopes 'User.ReadWrite.All', 'RoleManagement.ReadWrite.Directory'
   $directoryRole = Get-EntraDirectoryRole -Filter "DisplayName eq 'Helpdesk Administrator'"
   $user = Get-EntraUser -Filter "UserPrincipalName eq 'SawyerM@contoso.com'"
   $roleMemberParams = @{
        ObjectId = $directoryRole.ObjectId
        RefObjectId = $user.ObjectId
   }

   Add-EntraDirectoryRoleMember @roleMemberParams
```

   This command adds a user to a Microsoft Entra role. To retrieve roles, use the command [Get-EntraDirectoryRole](/powershell/module/microsoft.graph.entra/get-entradirectoryrole).

- `-ObjectId` - specifies the unique identifier (ObjectId) of the directory role to which you want to add a member.

- `-RefObjectId` - specifies the unique identifier (ObjectId) of the user, group, or service principal that you want to add as a member of the specified directory role.

## Work with user licenses

1. Get details of a user's licenses.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    Get-EntraUserLicenseDetail -ObjectId 'SawyerM@contoso.com'
    ```

    ```Output
    Id                                          SkuId                                SkuPartNumber
    --                                          -----                                -------------
    ouL7hgqFM0GkdqXrzahI4u7E6wa1G91HgSARMkvFTgY 06ebc4ee-1bb5-47dd-8120-11324bc54e06 SPE_E5
    ```

1. Assign a license to a user based on a template user.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All', 'Organization.Read.All'
    $User = Get-EntraUser -ObjectId 'SawyerM@contoso.com'  
    $License = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense 
    $License.SkuId = (Get-EntraSubscribedSku | Where SkuPartNumber -eq 'FLOW_FREE').SkuId
    $Licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses 
    $Licenses.AddLicenses = $License 
    Set-EntraUserLicense -ObjectId $User.ObjectId -AssignedLicenses $Licenses
    ```

    This example shows how to assign a `FLOW_FREE` license to a user with ObjectId `SawyerM@contoso.com`.

## Next steps

- [Manage groups][tutorial-groups]
- [Manage apps][manage-apps]

<!-- link references -->

[installation]: installation.md
[tutorial-groups]: manage-groups.md
[create-acount]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F
[manage-apps]: manage-apps.md
