---
title: Offboard users with Microsoft Entra PowerShell
description: "Learn to offboard users seamlessly by invalidating sessions, resetting passwords, and removing device ownership."
author: omondiatieno
manager: mwongerapk
ms.topic: how-to
ms.date: 04/29/2025
ms.author: jomondi
ms.reviewer: stevemutungi

#customer intent: As an IT admin, I want to learn how to effectively manage users in my organization using Microsoft Entra PowerShell, so that I can perform tasks such as creating users, retrieving user sign-in activity, managing user's group memberships and roles, and off-boarding users efficiently.

---
# Offboard users with Microsoft Entra PowerShell

Microsoft Entra PowerShell offers IT administrators a powerful and streamlined way to offboard users securely. This article describes how to terminate active sessions and tokens. It also shows how to disable user accounts and devices, reset passwords, remove device ownership, and manage deleted user records. By following these steps, you can ensure that departing users lose access to company resources immediately, helping maintain organizational security and compliance.

These actions help standardize offboarding, minimize risk, and simplify user lifecycle management.

## Invalidate active sessions and tokens

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
Revoke-EntraUserAllRefreshToken -UserId 'SawyerM@contoso.com'
```

Revoking authentication tokens invalidates them, thus preventing reaccess through cached logins or remembered sessions.

## Disable a user

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
Set-EntraUser -UserId 'SawyerM@contoso.com' -AccountEnabled $false
```

Disabling the account instantly blocks the user from accessing company resources, applications, and data.

## Reset a user's password

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
$securePassword = ConvertTo-SecureString 'Some-strong-random-password' -AsPlainText -Force
Set-EntraUserPassword -ObjectId 'SawyerM@contoso.com' -Password $securePassword
```

Resetting the user's password ensures they can't use their old credentials to access company resources before their account is disabled or deleted. This process prevents unauthorized access and potential misuse of the account.

## Remove device ownership

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
$device = Get-EntraDevice -Filter "DisplayName eq 'Sawyer Laptop'"
$owner = Get-EntraDeviceRegisteredOwner -DeviceId $device.Id
Remove-EntraDeviceRegisteredOwner -DeviceId $device.Id -OwnerId $owner.Id
```

Removing device ownership during offboarding prevents unauthorized access and ensures security compliance.

## Disable a user's device

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All', 'Device.ReadWrite.All'
$device = Get-EntraDevice -Filter "DisplayName eq 'Woodgrove Desktop'"
Set-EntraDevice -DeviceObjectId $device.ObjectId -AccountEnabled $false
```

Disabling a user's device helps safeguard the organization's security, data, and resources.

## Remove a user account

```powershell
Connect-Entra -Scopes 'Directory.AccessAsUser.All'
Remove-EntraUser -UserId 'SawyerM@contoso.com'
```

>[!Note]
> You can reclaim the user's assigned software and service licenses. See [Manage user license][manage-licenses] for details.

## Manage deleted users

1. List recently deleted users.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    Get-EntraDeletedUser -All | Select-Object Id, UserPrincipalName, DisplayName, AccountEnabled, DeletedDateTime, DeletionAgeInDays, UserType | Format-Table -AutoSize
    ```

    The output lists deleted users.

    ```Output
    Id                                   UserPrincipalName                              DisplayName   AccountEnabled DeletedDateTime       DeletionAgeInDays UserType
    --                                   -----------------                              -----------   -------------- ---------------       ----------------- --------
    dddddddd-3333-4444-5555-eeeeeeeeeeee {id}AveryS@contoso.com                         Avery Smith   False          2/12/2025 1:15:34 PM  3                 Member
    ```

1. Retrieve deleted users sorted by deletion date.

    ```powershell
    Connect-Entra -Scopes 'User.ReadWrite.All'
    Get-EntraDeletedUser -All | Sort-Object -Property deletedDateTime -Descending
    ```

## Related content

- [Manage user licenses][manage-licenses]
- [Manage groups][tutorial-groups]
- [Onboard a user][manage-user]

<!-- link references -->

[tutorial-groups]: manage-groups.md
[manage-licenses]: how-to-manage-user-licenses.md
[manage-user]: manage-user.md
