---
title: Manage guest accounts using Microsoft Entra PowerShell
description: 'Manage guest accounts with Microsoft Entra PowerShell. Learn how to invite, view, and disable guest users, ensuring your organization stays secure.'
author: omondiatieno
manager: CelesteDG
ms.service: entra
ms.topic: how-to
ms.date: 04/15/2025
ms.author: jomondi
ms.reviewer: stevemutungi

#customer intent: As an IT admin, I want to effectively manage guest user accounts in Microsoft Entra using Microsoft Entra PowerShell so that I can maintain the security and integrity of my organization's data.
---

# Manage guest accounts using Microsoft Entra PowerShell

Guest accounts in Microsoft Entra let external users access specific resources like files, teams, or sites without being full members of your organization. These accounts are typically used for collaboration with partners, contractors, or clients who need temporary access to your organization's resources.

Managing guest accounts effectively is crucial for maintaining the security and integrity of your organization's data. As an admin, you need to ensure that guest accounts are only given the necessary permissions and access to perform their intended tasks. Regularly reviewing and auditing these accounts is also important to identify any inactive or expired accounts that should be removed. This exercise not only helps to reduce potential security risks but also ensures efficient use of your organization's resources. By managing guest accounts well, you can provide a secure and productive environment for external collaboration.

## Prerequisites

To manage guest users with Microsoft Entra PowerShell, you need:

- A Microsoft Entra user account. If you don't already have one, you can [Create an account for free][create-acount].
- One of the following roles:
  - [User Administrator][user-admin]
  - [Guest Inviter][guest-inviter]
  - [External Identity Provider Administrator][-external-identity-provider-admin]
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Entra PowerShell module][installation] guide to install the module.

You can access a user's information and manage their data on their behalf or as an app with its own identity.

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

The following output shows the details of the invited guest user.

```Output
Id                                   InviteRedeemUrl
--                                   ---------------                                                      
aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb https://login.microsoftonline.com/redeem?rd=https%3a%2f%2finvitation…
bbbbbbbb-1111-2222-3333-cccccccccccc https://login.microsoftonline.com/redeem?rd=https%3a%2f%2finvitation…
cccccccc-2222-3333-4444-dddddddddddd https://login.microsoftonline.com/redeem?rd=https%3a%2f%2finvitation…
```

## View and export guest user accounts

To view and export guest users:

Connect to Microsoft Entra with at least a [Guest Inviter][guest-inviter] role.

```powershell
Connect-Entra -Scopes 'User.Read.All'

# Define the current date.
$now = Get-Date  

# Initialize an array to store the report data.
$report = @()  

# Retrieve all guest user accounts.
$guestUsers = Get-EntraUser -Filter "userType eq 'Guest'" -All -Property "displayName", "mail", "createdDateTime"

#view the guest users
$guestUsers

```

The script  retrieves all guest user accounts from Microsoft Entra ID with their display names, email addresses, and creation dates, and then displays the list of those guest users.

```Output
DisplayName   Id   Mail                            UserPrincipalName
-----------   --   ----                            -----------------
externaluser1      externaluser1@externaldomain1.com
externaluser2      externaluser2@externaldomain2.com
externaluser3      externaluser3@externaldomain3.com
```

## Reset guest user redemption status

In Microsoft Entra ID, resetting the redemption status of a guest user is necessary when you want to allow the user to redeem their invitation again. This can be helpful if the user has not completed the redemption process or if their status needs to be reset for any reason. Below is a PowerShell script that demonstrates how to reset the redemption status for a guest user by sending them a new invitation.

First identify the guest user and send a new invitation: This resets the redemption status by inviting the guest user again.

```powershell
# Define the email of the guest user
$userEmail = 'guestUser@contoso.com'

# Get the user by email
$user = Get-MgUser -Filter "mail eq '$userEmail'"

Connect-Entra -Scopes 'User.Invite.All'
# Send a new invitation to reset redemption status
New-MgInvitation -InvitedUserEmailAddress $user.Mail `
                  -InviteRedirectUrl "https://contoso.com" `
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

# Define the user ID of the guest account to disable.
$guestUserId = '<guestUserId> for example, myuser#EXT#@contoso.com or user Object Id'
  
# Disable the guest user account.
Set-EntraUser -UserId $guestUserId -AccountEnabled $false
```

### Disable all guest user accounts

Run the following cmdlet to disable all guest user accounts.

```powershell
Connect-Entra -Scopes 'User.ReadWrite.All'

# Retrieve all guest user accounts.
$guestUsers = Get-EntraUser | Where-Object { $_.UserType -eq 'Guest' }

foreach ($guest in $guestUsers) {
    # Disable the guest user account
    Set-EntraUser -UserId $guest.Id -AccountEnabled $false
}
```

## View and export expired guest user accounts

To view and export expired guest user accounts:

1. Expand the previous example to retrieve guest users and check each one for expiration. In this example, we assume that guest accounts expire 90 days after creation.

    ```powershell  
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

```powershell  
Connect-Entra -Scopes "User.ReadWrite.All"

# Define the current date.
$now = Get-Date  

# Retrieve all guest users.
$guestUsers = Get-EntraUser -Filter "userType eq 'Guest'" -All

```

Check each guest user for expiration. In this example, we assume that guest accounts expire 90 days after creation.

```powershell

>[!NOTE]
>This script removes all guest users whose accounts are expired. This action is irreversible and should be used with caution. Always ensure you have a backup or a recovery plan in place before removing user accounts.

```powershell
foreach ($guest in $guestUsers) {
    # Calculate the expiration date based on the creation date
    $guestExpirationDate = $guest.CreatedDateTime.AddDays(90)
    
    # Check if the account is expired
    if ($guestExpirationDate -lt $now) {
        # Check if the guest user ID is not null or empty
        if (![string]::IsNullOrEmpty($guest.Id)) {
            # Delete the expired guest account
            Remove-EntraUser -UserId $guest.Id
        } else {
            Write-Output "Guest user ID is null or empty for user: $($guest.DisplayName)"
        }
    }
}
```

<!-- link references -->

[installation]: installation.md
[create-acount]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F
[user-admin]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#user-administrator
[-external-identity-provider-admin]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#external-identity-provider-administrator
[guest-inviter]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#guest-inviter
