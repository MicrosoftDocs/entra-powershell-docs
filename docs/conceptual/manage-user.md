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

    ```output
    ageGroup                        :
    onPremisesLastSyncDateTime      :
    creationType                    :
    imAddresses                     : {}
    preferredLanguage               :
    mail                            :
    securityIdentifier              : S-1-12-1-2222222222-3333333333-4444444444-5555555555
    identities                      : {@{signInType=userPrincipalName; issuer=contoso.com; issuerAssignedId=NewUser@contoso.com}}
    consentProvidedForMinor         :
    onPremisesUserPrincipalName     :
    assignedLicenses                : {}
    ```

1. Delete a user.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    Remove-EntraUser -ObjectId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
    ```

### List a user's group memberships

1. List a user’s group memberships.

    ```powershell
    Connect-Entra -Scopes 'User.Read.All'
    Get-EntraUserMembership -ObjectId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
    ```

    ```output
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
    Connect-Entra -Scopes 'User.All'
    Get-EntraUserManager -ObjectId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
    ```

    ```output
    ageGroup                        :
    onPremisesLastSyncDateTime      :
    creationType                    :
    imAddresses                     : {UserManager@contoso.com}
    preferredLanguage               :
    mail                            : UserManager@contoso.com
    securityIdentifier              : S-1-12-1-2222222222-3333333333-4444444444-5555555555
    identities                      : {@{signInType=userPrincipalName; issuer=contoso.com; issuerAssignedId=UserManager@contoso.com}}
    consentProvidedForMinor         :
    onPremisesUserPrincipalName     :
    ```

1. List the users who report to a specific user.

    ```powershell
    Connect-Entra -Scopes 'User.Read.All'
    Get-EntraUserDirectReport -ObjectId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
    ```

    ```output
    ageGroup                        :
    onPremisesLastSyncDateTime      :
    creationType                    :
    imAddresses                     : {User@contoso.com}
    preferredLanguage               :
    mail                            : User@contoso.com
    securityIdentifier              : S-1-12-1-2222222222-3333333333-4444444444-5555555555
                                      S-1-12-1-3333333333-4444444444-5555555555-6666666666
    identities                      : {@{signInType=userPrincipalName; issuer=contoso.com; issuerAssignedId=User@contoso.com}}
    consentProvidedForMinor         :
    onPremisesUserPrincipalName     :
    assignedLicenses                : {@{disabledPlans=System.Object[]; skuId=0a0a0a0a-1111-bbbb-2222-3c3c3c3c3c3c}, @{disabledPlans=System.Object[]; skuId=1b1b1b1b-2222-cccc-3333-4d4d4d4d4d4d},
                                    @{disabledPlans=System.Object[]; skuId=2c2c2c2c-3333-dddd-4444-5e5e5e5e5e5e}}
    ```

1. Assign a manager to a user.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    $params = @{
        ObjectId = 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
        RefObjectId = 'bbbbbbbb-1111-2222-3333-cccccccccccc'
    }

    Set-EntraUserManager @params
    ```

   - `-ObjectId` - specifies the unique identifier (ID) of the user who have their manager set or updated.

   - `-RefObjectId` - specifies the unique ID of the user who is to be set as the manager.

### Upload or retrieve a photo for the user

1. Upload a photo for a user.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    $photoParams = @{
        ObjectId = 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
        FilePath = 'D:\UserThumbnailPhoto.jpg'
    }
    
    Set-EntraUserThumbnailPhoto @photoParams
    ```

    This example sets the thumbnail photo of the user specified with the ObjectId parameter to the image specified with the FilePath parameter.

1. Retrieve a user’s photo.

    ```powershell
    Connect-Entra -Scopes 'ProfilePhoto.Read.All'
    Get-EntraUserThumbnailPhoto -ObjectId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
    ```

    This example demonstrates how to retrieve the thumbnail photo of a user that is specified through the value of the ObjectId parameter.

### Grant users administrative roles in your organization

Grant a user an administrative role.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All', 'RoleManagement.ReadWrite.Directory'
$roleMemberParams = @{
    ObjectId = 'cccccccc-2222-3333-4444-dddddddddddd'
    RefObjectId = 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
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
    Get-EntraUserLicenseDetail -ObjectId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
    ```

    ```output
    Id                                          SkuId                                SkuPartNumber
    --                                          -----                                -------------
    ouL7hgqFM0GkdqXrzahI4u7E6wa1G91HgSARMkvFTgY 06ebc4ee-1bb5-47dd-8120-11324bc54e06 SPE_E5
    ```

1. Assign a license to a user based on a template user.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All', 'Organization.Read.All','AuditLog.Read.all'
    $User = Get-EntraUser -ObjectId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'  
    $License = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicense 
    $License.SkuId = (Get-EntraSubscribedSku | Where SkuPartNumber -eq 'FLOW_FREE').SkuId
    $Licenses = New-Object -TypeName Microsoft.Open.AzureAD.Model.AssignedLicenses 
    $Licenses.AddLicenses = $License 
    Set-EntraUserLicense -ObjectId $User.ObjectId -AssignedLicenses $Licenses
    ```

    This example shows how to assign a `FLOW_FREE` license to a user with ObjectId `aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb`.

## Next steps

- [Manage groups][tutorial-groups]
- [Manage apps][manage-apps]

<!-- link references -->

[installation]: installation.md
[tutorial-groups]: manage-groups.md
[create-acount]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F
[manage-apps]: manage-apps.md
