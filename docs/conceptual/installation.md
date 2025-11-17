---
title: "Install Microsoft Entra PowerShell"
description: "Learn how to install the Microsoft Entra PowerShell module."

author: omondiatieno
manager: mwongerapk
ms.topic: how-to
ms.date: 02/09/2025
ms.author: jomondi
ms.reviewer: stevemutungi
zone_pivot_groups: entra-powershell-install-win-linux-macos
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json


#customer intent: As an IT admin, I want to learn how to install Microsoft Entra PowerShell module so that I can manage Microsoft Entra resources through PowerShell.
---

# Install Microsoft Entra PowerShell

Installing the module helps IT professionals efficiently manage Microsoft Entra resources. It ensures seamless integration and functionality across various platforms, enhancing their ability to automate and streamline administrative tasks.

In this article, you learn how to install, verify, update, and troubleshoot the Microsoft Entra PowerShell module across the different operating systems.

The Microsoft Entra PowerShell module is split into two modules, each with submodules that can be installed separately. The two main modules are:

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
- Use with Windows PowerShell 5.1+ or PowerShell 7+.

## Prerequisites on Windows

- Run the following command from PowerShell to determine your PowerShell version:

  ```powershell
  $PSVersionTable.PSVersion
  ```

- Determine if you have the module installed:

  ```powershell
  Get-Module -Name Microsoft.Entra -ListAvailable
  ```

[!INCLUDE [dependencies](../includes/powershell-prerequisites.md)]

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

Use the [Install-Module][install-module] cmdlet to install the module.

[!INCLUDE [dependencies](../includes/installation-entrapowershell-all.md)]

### Install specific submodules

Installing specific modules is ideal for automation scenarios such as using Azure Functions and Azure Automation.

[!INCLUDE [dependencies](../includes/install-specific-submodules.md)]

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

[!INCLUDE [dependencies](../includes/installation-entrapowershell-all.md)]

### Install specific submodules on Linux

Installing specific modules is ideal for automation scenarios such as using Azure Functions and Azure Automation.

[!INCLUDE [dependencies](../includes/install-specific-submodules.md)]

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

[!INCLUDE [dependencies](../includes/installation-entrapowershell-all.md)]

### Install specific submodules on macOS

Installing specific modules is ideal for automation scenarios such as using Azure Functions and Azure Automation.

[!INCLUDE [dependencies](../includes/install-specific-submodules.md)]

:::zone-end

### Verify installed module version and location

After the installation is completed, you can verify the installed submodules, their version, and location with the following command.

[!INCLUDE [dependencies](../includes/verify-installed-modules.md)]

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

[!INCLUDE [dependencies](../includes/sign-in.md)]

Use your Microsoft Entra sign-in credentials to log into the sign-in window that opens.

You need to repeat this step for every new PowerShell session you start.

For more information on other authentication scenarios, see [more authentication scenarios][auth-methods].

## Update the module

If the module is installed, follow these steps to update it.

First, verify the module version and location using the guidance in the [verify installation](#verify-installed-module-version-and-location) section of this article.

### Update to the latest version

Use [Update-Module][update-module] to update to the latest version of the Microsoft Entra PowerShell.

[!INCLUDE [dependencies](../includes/update-entrapowershell-module.md)]

Updating the Microsoft Entra PowerShell module using `Update-Module` doesn't remove old versions of the module from your system.

## Uninstall the module

To remove the module, run the command:

[!INCLUDE [dependencies](../includes/uninstall-entrapowershell-module.md)]

## Next steps

- To learn more about navigating the Microsoft Entra PowerShell module, see the [Navigate the module][navigate-the-module] article.

[navigate-the-module]: navigate-entraps.md
[auth-methods]: authentication-scenarios.md
[troubleshooting-guide]: troubleshooting.md
[update-module]: /powershell/module/powershellget/update-module
[execution-policies]: /powershell/module/microsoft.powershell.core/about/about_execution_policies
[install-module]: /powershell/module/powershellget/install-module
[posh-gallery]: https://www.powershellgallery.com/packages/Microsoft.Entra
[Connect-Entra]: /powershell/module/microsoft.entra.authentication/connect-entra
