---
title: Troubleshoot the Microsoft Entra PowerShell module
description: Learn how to fix common errors in Microsoft Entra PowerShell.

ms.topic: troubleshooting
ms.date: 06/26/2024
author: csmulligan
manager: CelesteDG
ms.author: cmulligan

#Customer intent: As a Microsoft Entra PowerShell user, I want to troubleshoot and fix common errors, so that I can ensure the smooth operation of my scripts and commands.

---
# Troubleshoot the Microsoft Entra PowerShell module

This article explains how to determine, diagnose, and fix issues that you might encounter when using Microsoft Entra PowerShell.

Before troubleshooting any errors, ensure that you’re running the most recent version of the Microsoft Entra PowerShell. To check the version of your installed module, run:

```powershell
Get-InstalledModule -Name Microsoft.Graph.Entra
```

The version of the Microsoft.Graph.Entra module should be the most recent compared to the latest release in the [PowerShell Gallery](https://aka.ms/EntraPSGallery). If your installed module isn’t up to date, update it by running:

```powershell
Update-Module -Name Microsoft.Graph.Entra -AllowPrerelease
```

## Installation issues

During installation, you can encounter some errors:

### AllowPrerelease parameter can't be found

**Error**: “Install-Module: A parameter can't be found that matches parameter name `AllowPrerelease`.”

This means that you're using an older version of Install-Module. Here’s how to upgrade:

```powershell
## Update Nuget Package and PowerShellGet Module 

Install-PackageProvider NuGet -Scope CurrentUser -Force 

Install-Module PowerShellGet -Scope CurrentUser -Force -AllowClobber 

## Remove old modules from existing session 

Remove-Module PowerShellGet,PackageManagement -Force -ErrorAction Ignore 

## Import updated module 

Import-Module PowerShellGet -MinimumVersion 2.0 -Force 

Import-PackageProvider PowerShellGet -MinimumVersion 2.0 -Force 
```

### Function capacity 4096 has been exceeded for this scope

In PowerShell 5.1, you might encounter the error: Function {cmdlet-name} cannot be created because function capacity 4096 has been exceeded for this scope. To resolve this, increase the function limit by running: $MaximumFunctionCount = 32768, then try importing the module again.

```powershell
$MaximumFunctionCount = 32768
```

### Commands already available in the module

**Error**: `The following commands are already available on this system:'Enable-EntraAzureADAlias,Get-EntraUnsupportedCommand,Test-EntraScript'`.

This means that there's a conflict when either `beta` or `v1.0` is already installed.

**Workaround**: [Uninstall](installation.md#uninstall-the-module) the problematic module version, launch a new PowerShell window, and install the desired one.

### Missing dependencies

**Error**: `Dependent module '<module-name>' isn't installed on this computer. To use the current module 'Microsoft.Graph.Entra', ensure that its dependent module '<module-name>' is installed.`

It means that Microsoft Entra PowerShell dependencies aren't installed. To install, use:

[!INCLUDE [dependencies](../includes/install-entra-powershell-dependencies.md)]

## Authentication issues

Failure to authenticate or receive tokens can result in a **401 Unauthorized** response. This error can occur for several reasons.

**Workaround**: Ensure that you're using the correct credentials and have sufficient permissions. Check that your app registrations (if applicable) are configured correctly with the necessary API permissions in Microsoft Entra ID.

## Cmdlet not recognized

PowerShell doesn't recognize the cmdlet that you're trying to run.

**Workaround**:  Ensure the Microsoft Entra PowerShell module is installed correctly using:

```powershell
Get-Module -Name Microsoft.Graph.Entra -ListAvailable
```

If the module isn't listed, install it using:

```powershell
Install-Module -Name Microsoft.Graph.Entra -AllowPrerelease -Repository PSGallery -Force
```

## Version conflicts

You might encounter errors indicating multiple versions of the module are installed, such as the message "Assembly with the same name is already loaded."

**Workaround**: To resolve the error, uninstall all conflicting versions of the module and then install the latest version:

```powershell
Install-Module <Module-Name> -Required Version x.x
```

## Permission errors

Receiving errors related to insufficient permissions when attempting to execute commands or scripts.

**Workaround**: Ensure that you have the necessary permissions to perform the operation. You may need to adjust permissions in the Microsoft Entra admin center. <!-- Check this statement: You can also use `New-EntraServicePrincipalAppRoleAssignment` to assign app roles. -->

## Module update issues

You might run into issues when trying to update the Microsoft Entra PowerShell module.

**Workaround**: Use the snippet to install the latest version. If there are errors, try [uninstalling](installation.md#uninstall-the-module) and then reinstalling the module.

```powershell
Install-Module -Name Microsoft.Graph.Entra -AllowPrerelease -Repository PSGallery -Force
```

## Performance issues

Your scripts or commands might be running slowly or not completing as expected.

**Workaround**: Consider refining your queries to fetch only necessary data, using filters and selecting specific properties. Increase timeouts if necessary.

## Handling errors

You might receive errors from the Microsoft Entra PowerShell module that are hard to understand or manage.

**Workaround**: Use `$Error[0].Exception | Format-List -Force` to get detailed error information. The information can help in understanding the API response and troubleshooting further. <!--Is this script correct?-->

## Proxy blocks connection

If you get errors from `Install-Module` that the PowerShell Gallery is unreachable, you may be behind a proxy. Different operating systems and network environment have different requirements for configuring a system-wide proxy. Contact your system administrator for your proxy settings and how to configure them for your environment.

PowerShell itself may not be configured to use this proxy automatically. With PowerShell 5.1 and later, configure the PowerShell session to use a proxy using the following commands:

```powershell
$webClient = New-Object -TypeName System.Net.WebClient
$webClient.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
```

If your operating system credentials are configured correctly, this configuration routes PowerShell
requests through the proxy. To have this setting persist between sessions, add the commands to your
PowerShell profile.

To install the package, your proxy needs to allow HTTPS connections to [www.powershellgallery.com](https://www.powershellgallery.com).

## Other issues

If you experience a product issue with Microsoft Entra PowerShell not listed in this article or require
further assistance, [file an issue on GitHub](https://github.com/microsoftgraph/entra-powershell/issues).
