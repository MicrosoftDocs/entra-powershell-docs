---
title: Generate a password expiration report using Microsoft Entra PowerShell
description: Learn how to use Microsoft Entra PowerShell to generate a detailed password expiration report for licensed Entra ID users, with CSV output and customization options.
author: omondiatieno
ms.author: jomondi
manager: mwongerapk
ms.date: 06/20/2025
ms.topic: how-to

# Customer intent: As an IT administrator, I want to generate a comprehensive password expiration report for all licensed users in Microsoft Entra ID so that I can proactively manage password policies and ensure security compliance.
---

# Generate a password expiration report using Microsoft Entra PowerShell

This article shows you how to create a comprehensive password expiration report for licensed users in your Microsoft Entra ID tenant using Microsoft Entra PowerShell. The script generates a CSV report with detailed password status information, statistics, and alerts for users with expiring or expired passwords.

## Prerequisites

The scenario outlined in this article assumes that you already have the following items:

- Microsoft Entra PowerShell module installed. Follow the [installation guide][installation-guide] to install the module.
- One of the following roles: [Global Reader][global-reader], [User Administrator][user-administrator], [Authentication Administrator][authentication-administrator], or [Cloud application administrator][cloud-application-admin]
- **Permissions** to your Microsoft Entra tenant:
  - `User.Read.All` - Required to read user profile information
  - `Domain.Read.All` - Required to read domain password policies  
  - `Organization.Read.All` - Required to read organization information
  - `AuditLog.Read.All` - Required to read user sign-in activity (optional)

> [!NOTE]
> Sign-in activity data (`AuditLog.Read.All`) might not be available in all Microsoft Entra PowerShell environments. The script handles this and continues without sign-in data if unavailable.

Before running the script, establish a connection to your Microsoft Entra tenant:

```powershell
Connect-Entra -Scopes "User.Read.All", "Domain.Read.All", "Organization.Read.All", "AuditLog.Read.All"
```

## Understand the password expiration report

The script performs the following operations:

- Retrieves tenant password policy by getting the default domain password validity period  
- Filters for active users with assigned licenses  
- Calculates password expiration dates using the last password change date and policy settings  
- Generates comprehensive reports by creating a CSV output file 
- Provides statistical analysis that averages and trends  
- Highlights urgent cases for passwords expiring within 30 days or already expired  

## Run the password expiration report script

The following script creates a complete password expiration report:

```powershell

$CSVOutputFile = "c:\temp\PasswordExpirationReport-Entra.CSV"

# Check what the tenant password expiration policy is
try {
    $DefaultDomain = Get-EntraDomain | Where-Object {$_.IsDefault -eq $true}
    $PasswordLifetime = $DefaultDomain.PasswordValidityPeriodInDays
    
    If ($PasswordLifetime -eq 2147483647) {
        $TenantPasswordExpirationDisabled = $true
        # adjust the value otherwise the date calculation will fail
        $PasswordLifetime = 20000
    } Else {
        $TenantPasswordExpirationDisabled = $false
    }
} catch {
    $PasswordLifetime = 90
    $TenantPasswordExpirationDisabled = $false
}

# Get organization name
try {
    $OrgName = Get-EntraOrganization | Select-Object -ExpandProperty DisplayName
} catch {
    $OrgName = "Unknown Organization"
}

# Find licensed member accounts
try {
    [Array]$Users = Get-EntraUser -All -Property Id, DisplayName, UserPrincipalName, Country, Department, `
        AssignedLicenses, JobTitle, AccountEnabled, CreatedDateTime, PasswordPolicies, LastPasswordChangeDateTime, `
        UserType, CompanyName | 
        Where-Object { $_.AssignedLicenses.Count -gt 0 -and $_.UserType -eq 'Member' } | 
        Sort-Object DisplayName
} catch {
    throw "Failed to retrieve users: $($_.Exception.Message)"
}

# Extract Information about each user
$Report = [System.Collections.Generic.List[Object]]::new()

ForEach ($User in $Users) {
    $DisabledPasswordExpiry = $false
    $WarningMessage = $null
    $LastSignIn = $null
    $DaysSinceLastSignIn = "N/A"
    
    # Check if the user account password policy disables password expiration
    If ($User.PasswordPolicies -like "*DisablePasswordExpiration*") {
        $DisabledPasswordExpiry = $true
    }
    
    # Handle cases where LastPasswordChangeDateTime might be null
    if ($User.LastPasswordChangeDateTime) {
        # Calculate the password expiry date
        [datetime]$PasswordExpiryDate = $User.LastPasswordChangeDateTime.AddDays($PasswordLifetime)
        # Calculate the number of days to password expiration
        $DaystoExpiration = ($PasswordExpiryDate - (Get-Date)).Days
        $PasswordLastChanged = $User.LastPasswordChangeDateTime | Get-Date -Format 'dd-MMM-yyyy HH:mm:ss'
        $PasswordExpiryFormatted = $PasswordExpiryDate | Get-Date -Format 'dd-MMM-yyyy HH:mm:ss'
    } else {
        # Handle users who have never changed their password
        $DaystoExpiration = "Unknown"
        $PasswordLastChanged = "Never changed"
        $PasswordExpiryFormatted = "Unknown"
    }
    
    # Try to get sign-in activity (this may not be available in all Microsoft Entra PowerShell versions)
    try {
        $SignInActivity = Get-EntraUserSignInActivity -UserId $User.Id -ErrorAction SilentlyContinue
        if ($SignInActivity.LastSignInDateTime) {
            $LastSignIn = $SignInActivity.LastSignInDateTime | Get-Date -Format 'dd-MMM-yyyy HH:mm:ss'
            $DaysSinceLastSignIn = ((Get-Date) - $SignInActivity.LastSignInDateTime).Days
        }
    } catch {
        # Sign-in activity not available - this is common in some Microsoft Entra PowerShell versions
        $LastSignIn = "Not available"
        $DaysSinceLastSignIn = "N/A"
    }
    
    # Generate warning message for passwords expiring soon
    if ($DaystoExpiration -is [int] -and $DaystoExpiration -lt 30 -and $DaystoExpiration -gt 0) {
        $WarningMessage = ("Password expires in {0} days" -f $DaystoExpiration)
    } elseif ($DaystoExpiration -is [int] -and $DaystoExpiration -le 0) {
        $WarningMessage = "Password has expired"
    }
    
    $ReportLine = [PSCustomObject][Ordered]@{
        UserDisplayName                     = $User.DisplayName
        UserPrincipalName                   = $User.UserPrincipalName
        Department                          = $User.Department
        'Job title'                         = $User.JobTitle
        'Last sign in'                      = $LastSignIn
        'Days since sign in'                = $DaysSinceLastSignIn
        'Password last changed'             = $PasswordLastChanged
        PasswordExpiryDate                  = $PasswordExpiryFormatted
        DaysToExpiration                    = $DaystoExpiration
        'Account Password Expiry Disabled'  = $DisabledPasswordExpiry
        'Account enabled'                   = $User.AccountEnabled
        Status                              = $WarningMessage
    }
    $Report.Add($ReportLine)
}

# Export CSV report
$Report | Export-Csv -Path $CSVOutputFile -NoTypeInformation -Encoding UTF8
```

The script generates the following output:

A CSV report with:

- Detailed data for all processed users
- Importable format for further analysis
- Filterable columns for custom reporting

Each user record includes:

- User information - Display name, UPN, department, job title
- Password data - Last change date, expiry date, days to expiration
- Sign-in activity - Last sign-in date and frequency (when available)
- Policy status - Whether password expiration is disabled
- Account status - Whether the account is enabled

## Customize the script

You can modify the script for your specific needs using the following customization options:

| Customization               | Description                                                                    | Code example                                                                                                           |
|-----------------------------|--------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
| Change the warning threshold | Modify the number of days before password expiration to trigger warnings        | ```powershell<br># Set your desired warning threshold (e.g. 14 days)<br>if ($DaystoExpiration -is [int] -and <br>&nbsp;&nbsp;$DaystoExpiration -lt 14 -and $DaystoExpiration -gt 0) {<br>    # …<br>}``` |
| Filter by Department        | Process only users from a specific department                                   | ```powershell<br># Add department filtering<br>[Array]$Users = Get-EntraUser -All -Property … \|<br>&nbsp;&nbsp;Where-Object {<br>&nbsp;&nbsp;&nbsp;&nbsp;$_.AssignedLicenses.Count -gt 0 -and<br>&nbsp;&nbsp;&nbsp;&nbsp;$_.UserType -eq 'Member' -and<br>&nbsp;&nbsp;&nbsp;&nbsp;$_.Department -eq "IT Department"<br>&nbsp;&nbsp;} \|<br>&nbsp;&nbsp;Sort-Object DisplayName``` |
| Change Output Locations     | Modify the file paths where CSV and HTML reports are saved                       | ```powershell<br># Customize output file paths<br>$CSVOutputFile  = "D:\Reports\PasswordReport.CSV"<br>$HtmlReportFile = "D:\Reports\PasswordReport.html"``` |

You can also schedule this script to run regularly to keep your password expiration data up-to-date.

To run this report regularly, consider the following options:

- Create a scheduled task in Windows Task Scheduler
- Use PowerShell scheduled jobs with `Register-ScheduledJob`
- Implement in automation platforms like Azure Automation

## Troubleshoot common issues

Use the following troubleshooting guidance to resolve common issues when running the password expiration report:

| Issue | Description | Solution |
|-------|-------------|----------|
| Permission Denied Errors | Access denied when running the script due to insufficient permissions | Ensure your account has the required roles and permissions. Reconnect with all necessary scopes:<br>`Connect-Entra -Scopes "User.Read.All", "Domain.Read.All", "Organization.Read.All", "AuditLog.Read.All"` |
| Missing Sign-in Data | Sign-in activity data is not available or cannot be retrieved | Sign-in activity may not be available in all environments. The script handles this gracefully and continues without this data. |
| Large Tenant Performance | Script runs slowly or times out when processing large numbers of users | For tenants with many users, consider:<br>- Running during off-peak hours<br>- Implementing progress tracking<br>- Adding error retry logic |

## Related content

- [View and export apps with expiring secrets and certificates][apps-expiring-secrets]
- [Manage users with Microsoft Entra PowerShell][manage-user]

<!-- Link references -->
[global-reader]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#user-administrator#global-reader
[user-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#user-administrator#user-administrator
[authentication-administrator]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#user-administrator#authentication-administrator
[apps-expiring-secrets]: report-apps-with-expiring-secrets-certificates.md
[manage-user]: manage-user.md
