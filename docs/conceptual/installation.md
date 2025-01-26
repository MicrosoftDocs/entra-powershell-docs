---
title: "Install Microsoft Entra PowerShell"
description: "Learn how to install the Microsoft Entra PowerShell module."

author: omondiatieno
manager: CelesteDG
ms.topic: how-to
ms.date: 01/23/2025
ms.author: jomondi
ms.reviewer: stevemutungi
zone_pivot_groups: entra-powershell-install-win-linux-macos
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json


#customer intent: As an IT admin, I want to learn how to install Microsoft Entra PowerShell module so that I can manage Microsoft Entra resources through PowerShell.
---

# Install the Microsoft Entra PowerShell module

> [!IMPORTANT]
> Microsoft Entra PowerShell cmdlets are currently in preview and might change. We recommend using these cmdlets for testing and development purposes only, and not in production applications at this time.

The Microsoft Entra PowerShell module is available in two modules, which can be installed independently. Each of these modules comprises of submodules that can be installed separately. The two modules are:

- **Microsoft.Entra** - the general availability or `v1.0` version of Microsoft Entra PowerShell. It points to Microsoft Graph v1.0 and Microsoft Graph PowerShell SDK v1.0 resources.
- **Microsoft.Entra.Beta** - the `Beta` version of Microsoft Entra PowerShell. It points to Microsoft Graph Beta and Microsoft Graph PowerShell SDK Beta resources.

A supported version of
[PowerShell version 7 or higher](/powershell/scripting/install/installing-powershell-on-windows) is
the recommended version of PowerShell for use with the Microsoft Entra PowerShell module on all platforms
including Windows, Linux, and macOS.

:::zone pivot="windows"

## Install the Microsoft Entra PowerShell module on Windows

The recommended installation method and PowerShell version for the module:

- Install from the [PowerShell Gallery][posh-gallery]
- Use with PowerShell version 5.1+ or version 7+.

## Prerequisites on Windows

- Run the following command from PowerShell to determine your PowerShell version:

  ```powershell
  $PSVersionTable.PSVersion
  ```

- Determine if you have the module installed:

  ```powershell
  Get-Module -Name Microsoft.Entra -ListAvailable
  ```

# [PowerShell 7](#tab/powershell)

- Install a supported version of
  [PowerShell version 7 or higher][install-windows]

# [Windows PowerShell](#tab/windowspowershell)

- Update to
   [Windows PowerShell 5.1][posh-5.1]
- Install [.NET Framework 4.7.2 or later](/dotnet/framework/install)
- Update PowerShellGet

   To update PowerShellGet, launch Windows PowerShell 5.1 elevated as an administrator and run the following command:

   ```powershell
   Install-Module -Name PowerShellGet -Force -AllowClobber
   ```

---

- Set the PowerShell execution policy to remote signed or less restrictive

  - Check the PowerShell execution policy:

    ```powershell
    Get-ExecutionPolicy -List
    ```

  - Set the PowerShell execution policy to remote signed:

    ```powershell
    Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
    ```

  For more information about execution policies, see
  [about_Execution_Policies][execution-policies].

## Installation

When installing the module, you can choose to install the entire module or a specific submodule. The following examples show how to install the entire module for both `v1.0` and `Beta`.

Use the [Install-Module][install-module] cmdlet to install the module:

# [v1.0](#tab/v1)

```powershell
  Install-Module -Name Microsoft.Entra -Repository PSGallery -Scope CurrentUser -Force -AllowClobber
```
  
Optionally, you can change the scope of the installation using the **Scope** parameter. This operation requires admin permissions.
  
```powershell
Install-Module -Name Microsoft.Entra -Repository PSGallery -Scope AllUsers -Force -AllowClobber
```

To install the `Beta` module, run the following command.

```powershell
Install-Module -Name Microsoft.Entra.Beta -Repository PSGallery -Scope CurrentUser -Force -AllowClobber
```

# [Beta](#tab/Beta)

```powershell
Install-Module -Name Microsoft.Entra -Repository PSGallery -Scope CurrentUser -Force -AllowClobber
```

Optionally, you can change the scope of the installation using the **Scope** parameter. This operation requires admin permissions.

```powershell
Install-Module -Name Microsoft.Entra -Repository PSGallery -Scope AllUsers -Force -AllowClobber
```

To install the `Beta` module, run the following command.

```powershell
Install-Module -Name Microsoft.Entra.Beta -Repository PSGallery -Scope CurrentUser -Force -AllowClobber
```

> [!TIP]
> In PowerShell 5.1, you might see the error: "Function {cmdlet-name} cannot be created because function capacity 4096 has been exceeded." To fix this error, increase the function limit by running the following command, then try importing the module again.
> ```powershell
> $MaximumFunctionCount = 32768
> ```

---

```powershell
Install-Module -Name Microsoft.Entra -Repository PSGallery -Scope CurrentUser -Force -AllowClobber
```

Optionally, you can change the scope of the installation using the **Scope** parameter. This operation requires admin permissions.

```powershell
Install-Module -Name Microsoft.Entra -Repository PSGallery -Scope AllUsers -Force -AllowClobber
```

To install the `Beta` module, run the following command.

```powershell
Install-Module -Name Microsoft.Entra.Beta -Repository PSGallery -Scope CurrentUser -Force -AllowClobber
```

> [!TIP]
> In PowerShell 5.1, you might see the error: "Function {cmdlet-name} cannot be created because function capacity 4096 has been exceeded." To fix this error, increase the function limit by running the following command, then try importing the module again.
>```powershell
>$MaximumFunctionCount = 32768
>```

### Install specific submodules

Installing specific modules is ideal for automation scenarios such as using Azure Functions and Azure Automation. 

To find all available modules under `Microsoft.Entra` from the PowerShell Gallery, run the following command:
 
```PowerShell
Find-Module -Name "Microsoft.Entra*" -Repository PSGallery
```
 
This command lists all modules that start with `Microsoft.Entra` available in the PowerShell Gallery.

For example, to install the `Users` module, run the following command:

```powershell
Install-Module -Name Microsoft.Entra.Users -Repository PSGallery -Force 
```

:::zone-end

:::zone pivot="linux"

## Install Microsoft Entra PowerShell on Linux

This article explains how to install the module on Linux.

## Prerequisites on Linux

- Install a supported version of [PowerShell version 7 or higher](/powershell/scripting/install/installing-powershell-on-linux)

- Install [Microsoft Graph PowerShell SDK module dependencies](troubleshooting.md#missing-dependencies) if not installed.

## Installation on Linux

When installing the module, you can choose to install the entire module or a specific submodule. The following example shows how to install the entire module.

Open the Terminal or other shell host application and run `pwsh` to start PowerShell.

Use the [Install-Module](/powershell/module/powershellget/install-module) cmdlet to install the module:

```powershell
Install-Module -Name Microsoft.Entra -Repository PSGallery -Force
```

### Install specific submodules

Installing specific modules is ideal for automation scenarios such as using Azure Functions and Azure Automation. 

To find all available modules under `Microsoft.Entra` from the PowerShell Gallery, run the following command:
 
```PowerShell
Find-Module -Name "Microsoft.Entra*" -Repository PSGallery
```
 
This command lists all modules that start with `Microsoft.Entra` available in the PowerShell Gallery.

For example, to install the `Users` module, run the following command:

```powershell
Install-Module -Name Microsoft.Entra.Users -Repository PSGallery -Force 
```

:::zone-end

:::zone pivot="macos"

## Install Microsoft Entra PowerShell on macOS

This article explains how to install the module from
[the PowerShell Gallery](/powershell/scripting/gallery/overview) on macOS.

## Prerequisites on macOS

- Install a supported version of
  [PowerShell version 7 or higher](/powershell/scripting/install/installing-powershell-on-macos)

## Installation on macOS

When installing the module, you can choose to install the entire module or a specific submodule. The following example shows how to install the entire module.

Open the Terminal or other shell host application and run `pwsh` to start PowerShell.

Use the [Install-Module](/powershell/module/powershellget/install-module) cmdlet to install the Microsoft Entra
PowerShell module:

```powershell
Install-Module -Name Microsoft.Entra -Repository PSGallery -Force
```

### Install specific submodules

Installing specific modules is ideal for automation scenarios such as using Azure Functions and Azure Automation. 

To find all available modules under `Microsoft.Entra` from the PowerShell Gallery, run the following command:
 
```PowerShell
Find-Module -Name "Microsoft.Entra*" -Repository PSGallery
```

This command lists all modules that start with `Microsoft.Entra` available in the PowerShell Gallery.

For example, to install the `Users` module, run the following command:

```powershell
Install-Module -Name Microsoft.Entra.Users -Repository PSGallery -Force 
```

:::zone-end

### Verify installation

After the installation is completed, you can verify the installed version with the following command.

```powershell
Get-InstalledModule -Name Microsoft.Entra
```

To verify the installed submodules and their versions, run:

```powershell
Get-InstalledModule
```

The version in the output should match the latest version published on the PowerShell Gallery. Now you're ready to use the module.

### Troubleshoot installation issues

| Error             | Cause                     | Workaround                      |
|-------------------|---------------------------|---------------------------------|
| Install-Module: A parameter can't be found that matches parameter name AllowPrerelease. | You're using an older version of Install-Module.  | To upgrade, follow this [guide](troubleshooting.md#installation-issues). The issue applies to Windows platform only.  |
| Dependent module 'module-name' isn't installed on this computer. To use the current module 'Microsoft.Entra,' ensure that its dependent module 'module-name' is installed. | Microsoft Entra PowerShell dependencies aren't installed  | To install, use [this script](troubleshooting.md#missing-dependencies) |
| Cmdlets already exist on the system |        | Add `-AllowClobber` parameter: `Install-Module -Name Microsoft.Entra -Repository PSGallery -Force -AllowClobber`  |
| The following commands are already available on this system: 'Enable-EntraAzureADAlias,Get-EntraUnsupportedCommand,Test-EntraScript' | There's a conflict when either `Beta` or `v1.0` is already installed  | To resolve the issue, [uninstall](installation.md#uninstall-the-module) the offending module version.  |

For solutions to other common installation and other general issues, see [Troubleshoot module installation problems][troubleshooting-guide].

### Sign in

To start managing your Microsoft Entra resources with the Microsoft Entra PowerShell module, launch a PowerShell session and run [Connect-Entra][Connect-Entra] to sign in to Microsoft Entra ID:

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUser -Filter "userPrincipalName eq 'SawyerM@contoso.com'"
```

Use your Microsoft Entra sign-in credentials to log into the sign-in window that opens.

You need to repeat this step for every new PowerShell session you start.

For more information on other authentication scenarios, see [more authentication][auth-methods] scenarios.

## Update the module

Use [Update-Module][update-module] to update to the latest version of the Microsoft Entra PowerShell.

```powershell
Update-Module -Name Microsoft.Entra
```

Updating the Microsoft Entra PowerShell module using `Update-Module` doesn't remove old versions of the module from your system.

## Uninstall the module

To remove the module, run the command:

```powershell
Uninstall-Module -Name Microsoft.Entra -AllVersions
```

To remove the `Beta` module, run the command:

```powershell
Uninstall-Module -Name Microsoft.Entra.Beta -AllVersions
```

## Next steps

- To learn more about navigating the Microsoft Entra PowerShell module, see the [Navigate the module][navigate-the-module] article.

[navigate-the-module]: navigate-entraps.md
[auth-methods]: authentication-scenarios.md
[troubleshooting-guide]: troubleshooting.md
[update-module]: /powershell/module/powershellget/update-module
[execution-policies]: /powershell/module/microsoft.powershell.core/about/about_execution_policies
[install-module]: /powershell/module/powershellget/install-module
[posh-5.1]: /powershell/scripting/windows-powershell/install/installing-windows-powershell#upgrading-existing-windows-powershell
[install-windows]: /powershell/scripting/install/installing-powershell-on-windows
[posh-gallery]: https://www.powershellgallery.com/packages/Microsoft.Entra
[Connect-Entra]: /powershell/module/microsoft.entra/connect-entra
