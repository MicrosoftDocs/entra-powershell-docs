---
title: Manage guest accounts using Microsoft Entra PowerShell
description: 'Manage guest accounts with Microsoft Entra PowerShell. Learn how to invite, view, and disable guest users, ensuring your organization stays secure.'
author: omondiatieno
manager: mwongerapk
ms.topic: how-to
ms.date: 06/04/2025
ms.author: jomondi
ms.reviewer: stevemutungi

#customer intent: As an IT admin, I want to effectively manage guest user accounts in Microsoft Entra ID using Microsoft Entra PowerShell so that I can maintain the security and integrity of my organization's data.
---

# Manage guest accounts using Microsoft Entra PowerShell

Guest accounts in Microsoft Entra ID let external users access specific resources like files, teams, or sites without being full members of your organization. These accounts are typically used for collaboration with partners, contractors, or clients who need temporary access to your organization's resources.

Managing guest accounts effectively is crucial for maintaining the security and integrity of your organization's data. As an admin, you need to ensure that guest accounts are only given the necessary permissions and access to perform their intended tasks. Regularly reviewing and auditing these accounts is also important to identify any inactive or expired accounts that should be removed. This exercise not only helps to reduce potential security risks but also ensures efficient use of your organization's resources. By managing guest accounts well, you can provide a secure and productive environment for external collaboration.

## Prerequisites

To manage guest users with Microsoft Entra PowerShell, you need:

- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free][create-acount].
- One of the following roles:
  - [User Administrator][user-admin]
  - [Guest Inviter][guest-inviter]
  - [External Identity Provider Administrator][-external-identity-provider-admin]
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Entra PowerShell module][installation] guide to install the module.

## Invite guest user accounts

You can invite guest users to your organization using Microsoft Entra PowerShell. This process allows external users to access specific resources in your organization without being full members. You can invite a single guest user or bulk invite multiple guest users at once.

### Invite a single guest user account

To invite a single guest user to your organization with at least a [Guest Inviter][guest-inviter] role.

```powershell
# Connect to Microsoft Entra
Connect-Entra -Scopes 'User.Invite.All'

#Invite the guest user
New-EntraInvitation `
    -InvitedUserEmailAddress 'guestUser@contoso.com' `
    -InviteRedirectUrl 'https://contoso.com' `
    -SendInvitationMessage $true `
    -InvitedUserDisplayName 'Guest User'
```

This script sends an invitation to a guest user with the email address `guestUser@contoso.com`, directing them to `https://contoso.com` upon acceptance. The following output shows the details of the invited guest user.

```Output
Id                                   InviteRedeemUrl
--                                   ---------------                                           
aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb https://login.microsoftonline.com/redeem?rd=https%3a%2f%2finvitation…
```

### Bulk invite guest user accounts

To bulk invite guest users to your organization:

1. Prepare the CSV file

    In Microsoft Excel, create a CSV file with the list of invitee user names and email addresses. Make sure to include the **Name** and **Email** column headings.

    For example, create a worksheet in the following format:

    | Name         | Email                |  
    |--------------|----------------------|  
    | Reed Smith   | rsmith@contoso.com   |  
    | Hayden Cook  | hcook@fabricam.com   |  
    | Isabel Garcia| igarcia@contoso.com  |

Save the file as `C:\BulkInvite\Invitations.csv` or any location of your choice.

If you don't have Excel, you can create a CSV file in any text editor, such as Notepad. Separate each value with a comma, and each row with a new line.

Connect to Microsoft Entra with at least a [Guest Inviter][guest-inviter] role.

```powershell
Connect-Entra -Scopes 'User.Invite.All'

# Import the CSV file containing the invitations.
$invitations = Import-Csv -Path "c:\bulkinvite\invitations.csv"

# Define the message to be sent to the invited users.
$messageBody = "Hello. You are invited to the Contoso organization."

# Iterate over each invitation in the CSV file.
foreach ($invitation in $invitations) {
    # Define the invitation parameters
    $invitationParams = @{
        InvitedUserEmailAddress = $invitation.Email  # Ensure this matches your CSV column name
        InviteRedirectUrl       = "https://contoso.com"
        SendInvitationMessage   = $true
        InvitedUserMessageInfo  = @{
            CustomizedMessageBody = $messageBody
        }
    }

    # Create a new invitation using the defined parameters
    New-EntraInvitation @invitationParams
}

```

This script imports a list of invitations from a CSV file. It defines a custom message for the invited users, and then iterates through each invitation to send an invitation to each user with their email address.

The following output shows the details of the invited guest users.

```Output
Id                                   InviteRedeemUrl
--                                   ---------------                                                      
aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb https://login.microsoftonline.com/redeem?rd=https%3a%2f%2finvitation…
bbbbbbbb-1111-2222-3333-cccccccccccc https://login.microsoftonline.com/redeem?rd=https%3a%2f%2finvitation…
```

## View and export guest user accounts

To view and export guest users:

Connect to Microsoft Entra with at least a [Guest Inviter][guest-inviter] role.

```powershell
Connect-Entra -Scopes 'User.Read.All'
 

# Retrieve all guest user accounts.
Get-EntraUser -Filter "userType eq 'Guest'" -All -Property "displayName", "mail", "createdDateTime", "AccountEnabled" | Select-Object "displayName", "mail", "createdDateTime", "AccountEnabled"
```

The script  retrieves all guest user accounts from Microsoft Entra ID with their display names, email addresses, and creation dates, and then displays the list of those guest users.

```Output
DisplayName   Id   Mail                               createdDateTime      AccountEnabled
-----------   --   ----                               ---------------      --------------
externaluser1      externaluser1@externaldomain1.com  13/09/2024 18:37:33  True
externaluser2      externaluser2@externaldomain2.com  15/02/2024 15:05:31  True
```

## Manage guest user sponsorship

In Microsoft Entra ID, guest sponsorship allows you to designate specific users or groups as sponsors for guest users, giving them the ability to manage the guest user's access and permissions. This feature is useful for organizations that want to control and monitor the access of external users.

To manage guest user sponsorship, you can assign, view and remove a sponsor from a guest user. You need at least a [User Administrator][user-admin] role to perform these actions.

### Assign a sponsor to a guest user

The following example shows how to assign a sponsor to a guest user in Microsoft Entra ID. You can use the `New-EntraUserSponsor` cmdlet to assign a sponsor to a specified guest user.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'

$sponsor = Get-EntraUser -UserId 'SponsorEmail@contoso.com'
Set-EntraUserSponsor -UserId 'guestuser@contoso.com' -Type User -SponsorIds $sponsor.Id
```

This example assigns a sponsor to a guest user in Microsoft Entra ID. The `UserId` parameter specifies the guest user, and the `SponsorId` parameter specifies the sponsor.

### View a guest user's sponsors

The following example shows how to view a guest user's sponsors in Microsoft Entra ID. You can use the `Get-EntraUserSponsor` cmdlet to retrieve the sponsors of a specified guest user.

```powershell
Connect-Entra -Scopes 'User.Read.All'

Get-EntraUserSponsor -UserId 'guestuser@contoso.com' -All | Select-Object Id, DisplayName, '@odata.type', CreatedDateTime | Format-Table -AutoSize
```

This example retrieves the sponsors of a guest user in Microsoft Entra ID. The `UserId` parameter specifies the guest user.

```Output
id                                   displayName          @odata.type           createdDateTime
--                                   -----------      -----------           ---------------
aaaaaaaa-1111-2222-3333-bbbbbbbbbbbb GuestUser Sponsor 1  #microsoft.graph.user 5/6/2025 11:29:26 PM
bbbbbbbb-1111-2222-3333-bbbbbbbbbbbb GuestUser Sponsor 2  #microsoft.graph.user 5/6/2025 11:29:27 PM
```

### Remove a sponsor from a guest user

The following example shows how to remove a sponsor from a guest user in Microsoft Entra ID. You can use the `Remove-EntraUserSponsor` cmdlet to remove a sponsor from a specified guest user.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'

$sponsor = Get-EntraUserSponsor -UserId 'SawyerM@contoso.com' | Where-Object { $_.displayName -eq 'Adele Vance (Fabrikam)' }
Remove-EntraUserSponsor -UserId 'SawyerM@Contoso.com' -SponsorId $sponsor.Id
```

This example removes a sponsor from a guest user in Microsoft Entra ID. The `UserId` parameter specifies the guest user, and the `SponsorId` parameter specifies the sponsor to be removed.

## Reset guest user redemption status

In Microsoft Entra ID, resetting the redemption status of a guest user is necessary when you want to allow the user to redeem their invitation again. This feature is helpful if the user doesn't complete the redemption process or if their status needs to be reset for any reason. The following example demonstrates how to reset the redemption status for a guest user by sending them a new invitation.

First identify the guest user and send a new invitation: This resets the redemption status by inviting the guest user again.

```powershell
Connect-Entra -Scopes 'User.Invite.All'

$user = Get-MgUser -Filter "startsWith(mail, 'johndoe@gmail.com')"
New-MgInvitation `
    -InvitedUserEmailAddress $user.Mail `
    -InviteRedirectUrl "https://myapps.contoso.com" `
    -ResetRedemption `
    -SendInvitationMessage `
    -InvitedUser $user
```

## Disable guest user accounts

The following examples show how to disable guest user accounts in Microsoft Entra ID. You can disable a single guest account or disable all guest accounts based on your requirements.

### Disable a single guest user account

To disable a single guest user account:

Connect to Microsoft Entra with at least a [User Administrator][user-admin] role:

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'
  
# Disable the guest user account.
Get-EntraUser -Filter "userType eq 'Guest' and mail eq 'guestUser@contoso.com'" | Set-EntraUser -AccountEnabled $false
```

### Disable all guest user accounts

Run the following cmdlet to disable all guest user accounts.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'

# Disable the guest user account
Get-EntraUser | Where-Object { $_.UserType -eq 'Guest' } | Set-EntraUser -AccountEnabled $false
```

## View and export expired guest user accounts

To view and export expired guest user accounts:

1. Expand the previous example to retrieve guest users and check each one for expiration. In this example, we assume that guest accounts expire 90 days after creation.

    ```powershell
    $report = @() 
    $now = Get-Date  
    # Retrieve all guest users.
    $guestUsers = Get-EntraUser -Filter "userType eq 'Guest'" -All

    foreach ($guest in $guestUsers) {
        # Calculate the expiration date based on the creation date
        $guestExpirationDate = $guest.CreatedDateTime.AddDays(90)
        
        # Check if the account is expired
        if ($guestExpirationDate -lt $now) {
            # Add expired guest account details to the report
            $report += [PSCustomObject]@{
                Id          = $guest.Id
                Name        = $guest.DisplayName
                Mail        = $guest.Mail
                Expiration  = $guestExpirationDate
                CreatedDate = $guest.CreatedDateTime
            }
        }
    }
    ```

1. Export the report to a CSV file.

    ```powershell  
       $report | Export-Csv -Path "ExpiredGuestAccounts.csv" -NoTypeInformation  
    ```

## Remove expired guest user accounts

Connect to Microsoft Entra with at least a [User Administrator][user-admin] role:

In this example, we assume that guest accounts expire 90 days after creation.

>[!NOTE]
>This script removes all guest users whose accounts are expired. This action is irreversible and should be used with caution. Always ensure you have a backup or a recovery plan in place before removing user accounts.

```powershell
Connect-Entra -Scopes "User.ReadWrite.All"

$age = (Get-Date).AddDays(-90).ToString("yyyy-MM-ddTHH:mm:ssZ") 
Get-EntraUser -Filter "userType eq 'Guest' and createdDateTime le $age" -All | Remove-EntraUser
```

<!-- link references -->

[installation]: installation.md
[create-acount]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F
[user-admin]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#user-administrator
[-external-identity-provider-admin]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#external-identity-provider-administrator
[guest-inviter]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#guest-inviter
