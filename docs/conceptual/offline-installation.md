---
title: "Install Microsoft Entra PowerShell offline"
description: "Learn how to install the Microsoft Entra PowerShell module in offline environments using nupkg files and a local gallery."

author: msewaweru
manager: mwongerapk
ms.topic: how-to
ms.date: 11/04/2024
ms.author: mewaweru
ms.reviewer: kemunga

#customer intent: As an IT admin, I want to learn how to install Microsoft Entra PowerShell modules in an offline environment so that I can manage Microsoft Entra resources without internet connectivity.
---

In environments with restricted internet access, you might need to install Microsoft Entra PowerShell modules offline. This article explains how to set up and install the modules using downloaded package files and a local repository.

Offline installation is useful in scenarios such as:

- Air-gapped networks with no internet connectivity
- Organizations with strict security policies that restrict internet access
- Environments where direct PowerShell Gallery access is not available

## Prerequisites

Before you begin, ensure you have:

- **PowerShell 5.1 or higher** (PowerShell 7+ recommended)
- **Administrative privileges** on the target machine
- **Access to download location** with internet connectivity to download the required files
- **Signed nupkg files** from the Microsoft Entra PowerShell releases

## Overview of the offline installation process

The offline installation process involves these main steps:

1. Install Microsoft Graph PowerShell dependencies
2. Set up a local PowerShell repository
3. Download and place nupkg files in the local repository
4. Install Microsoft Entra modules from the local repository

## Step 1: Install Microsoft Graph PowerShell dependencies

Microsoft Entra PowerShell modules depend on specific Microsoft Graph PowerShell modules. These dependencies are automatically installed when installing from the PowerShell Gallery, but in offline scenarios, you need to install them manually.

> [!IMPORTANT]
> You must install these dependencies on a machine with internet access first, or obtain the dependency modules through your organization's approved software distribution method.

Run the following script to install the required Microsoft Graph PowerShell dependencies:

```powershell
# Define the required Graph modules version
$graphModulesVersion = "2.25.0"

# List of required Graph modules
$graphModules = @(
    "Microsoft.Graph.DirectoryObjects",
    "Microsoft.Graph.Users",
    "Microsoft.Graph.Users.Actions",
    "Microsoft.Graph.Groups",
    "Microsoft.Graph.Identity.DirectoryManagement",
    "Microsoft.Graph.Identity.Governance",
    "Microsoft.Graph.Identity.SignIns",
    "Microsoft.Graph.Applications",
    "Microsoft.Graph.Reports"
)

# Install each module
foreach ($moduleName in $graphModules) {
    Write-Host "Installing Module $($moduleName)" -ForegroundColor Green
    Install-Module $moduleName -Scope CurrentUser -RequiredVersion $graphModulesVersion -Force -AllowClobber -Verbose
}
```

## Step 2: Set up a local PowerShell repository

Create a local PowerShell repository where you'll store the Microsoft Entra PowerShell module packages.

```powershell
# Define local gallery settings
$localGallery = '__LocalGallery__'
$galleryPath = 'C:\LocalPowerShellGallery'

# Create the gallery directory if it doesn't exist
if (-not(Test-Path $galleryPath)) {
    Write-Host "Creating local gallery directory: $galleryPath" -ForegroundColor Yellow
    $null = New-Item -Path $galleryPath -ItemType Directory
}

# Register the local repository
Write-Host "Registering local PowerShell repository: $localGallery" -ForegroundColor Green
$null = Register-PSRepository -Name $localGallery -SourceLocation $galleryPath -ScriptSourceLocation $galleryPath -InstallationPolicy Trusted
```

Verify that the local repository was created successfully:

```powershell
# Display all registered repositories
Get-PSRepository
```

You should see output similar to:

```output
Name                      InstallationPolicy   SourceLocation
----                      ------------------   --------------
PSGallery                 Untrusted            https://www.powershellgallery.com/api/v2
__LocalGallery__          Trusted              C:\LocalPowerShellGallery
```

## Step 3: Download and place nupkg files

### Download nupkg files

1. Navigate to the [Microsoft Entra PowerShell releases page](https://github.com/microsoftgraph/entra-powershell/releases) on GitHub.

2. Choose the version you want to install (for example, [v1.0.11](https://github.com/microsoftgraph/entra-powershell/releases/tag/v1.0.11)).

3. In the **Assets** section, download the required nupkg files based on your needs:

   **For v1.0 modules only:**
   - `Microsoft.Entra.1.0.11.nupkg`
   - `Microsoft.Entra.Applications.1.0.11.nupkg`
   - `Microsoft.Entra.Authentication.1.0.11.nupkg`
   - `Microsoft.Entra.CertificateBasedAuthentication.1.0.11.nupkg`
   - `Microsoft.Entra.DirectoryManagement.1.0.11.nupkg`
   - `Microsoft.Entra.Governance.1.0.11.nupkg`
   - `Microsoft.Entra.Groups.1.0.11.nupkg`
   - `Microsoft.Entra.Reports.1.0.11.nupkg`
   - `Microsoft.Entra.SignIns.1.0.11.nupkg`
   - `Microsoft.Entra.Users.1.0.11.nupkg`

   **For Beta modules:**
   Download the corresponding `.Beta.` nupkg files if you need Beta functionality.

### Place files in local repository

Copy all downloaded nupkg files to your local gallery folder:

```powershell
# Copy nupkg files to the local gallery
# Replace 'C:\Downloads' with the actual path where you downloaded the files
$downloadPath = 'C:\Downloads'
$nupkgFiles = Get-ChildItem -Path $downloadPath -Filter "Microsoft.Entra*.nupkg"

foreach ($file in $nupkgFiles) {
    Write-Host "Copying $($file.Name) to local gallery" -ForegroundColor Cyan
    Copy-Item -Path $file.FullName -Destination $galleryPath -Force
}
```

## Step 4: Install Microsoft Entra modules

### Install individual modules

You can install modules individually based on your specific needs:

```powershell
# Install a specific module
Install-Module -Name 'Microsoft.Entra.Authentication' -Repository $localGallery -AllowClobber -Verbose
```

### Install all modules

To install all available Microsoft Entra modules, use this script:

```powershell
# Define the modules to install
$entraModules = @(
    "Microsoft.Entra.Authentication",
    "Microsoft.Entra.Applications", 
    "Microsoft.Entra.DirectoryManagement",
    "Microsoft.Entra.Groups",
    "Microsoft.Entra.Governance",
    "Microsoft.Entra.SignIns",
    "Microsoft.Entra.Users",
    "Microsoft.Entra.Reports",
    "Microsoft.Entra.CertificateBasedAuthentication"
)

# Install each module from the local gallery
foreach ($moduleName in $entraModules) {
    Write-Host "[Local Gallery] Installing: $moduleName" -ForegroundColor Green
    Install-Module -Name $moduleName -Repository $localGallery -AllowClobber -Verbose
}
```

### Install the root module (optional)

After installing the dependent modules, you can optionally install the root module:

```powershell
Install-Module -Name 'Microsoft.Entra' -Repository $localGallery -AllowClobber -Verbose
```

## Step 5: Verify installation

Verify that the modules were installed successfully:

```powershell
# Display all installed Microsoft Entra modules
Get-InstalledModule Microsoft.Entra.*
```

You should see output similar to:

```output
Version      Name                                            Repository           Description
-------      ----                                            ----------           -----------
1.0.11       Microsoft.Entra.Applications                    __LocalGallery__     Microsoft Entra PowerShell
1.0.11       Microsoft.Entra.Authentication                  __LocalGallery__     Microsoft Entra PowerShell
1.0.11       Microsoft.Entra.CertificateBasedAuthentication  __LocalGallery__     Microsoft Entra PowerShell
1.0.11       Microsoft.Entra.DirectoryManagement             __LocalGallery__     Microsoft Entra PowerShell
1.0.11       Microsoft.Entra.Governance                      __LocalGallery__     Microsoft Entra PowerShell
1.0.11       Microsoft.Entra.Groups                          __LocalGallery__     Microsoft Entra PowerShell
1.0.11       Microsoft.Entra.Reports                         __LocalGallery__     Microsoft Entra PowerShell
1.0.11       Microsoft.Entra.SignIns                         __LocalGallery__     Microsoft Entra PowerShell
1.0.11       Microsoft.Entra.Users                           __LocalGallery__     Microsoft Entra PowerShell
```

## Testing the installation

Test that the modules work correctly by connecting to Microsoft Entra:

```powershell
# Import the authentication module
Import-Module Microsoft.Entra.Authentication

# Connect to Microsoft Entra (this will require internet connectivity for authentication)
Connect-Entra

# Test with a simple command
Get-EntraContext
```

## Cleanup (optional)

### Unregister the local repository

If you no longer need the local repository, you can unregister it:

```powershell
# Unregister the local repository
Unregister-PSRepository -Name $localGallery
Write-Host "Local repository '$localGallery' has been unregistered" -ForegroundColor Yellow
```

### Remove local gallery folder

To completely remove the local gallery:

```powershell
# Remove the local gallery folder and its contents
if (Test-Path $galleryPath) {
    Remove-Item -Path $galleryPath -Recurse -Force
    Write-Host "Local gallery folder removed: $galleryPath" -ForegroundColor Yellow
}
```

## Troubleshooting

### Common issues and solutions

| Issue | Cause | Solution |
|-------|--------|----------|
| "Module not found in repository" | nupkg files not copied to local gallery | Verify files are in the correct gallery path |
| "Dependencies not installed" | Graph PowerShell modules missing | Install required Graph modules first |
| "Access denied" | Insufficient permissions | Run PowerShell as Administrator |
| "Repository not trusted" | Local repository not marked as trusted | Use `-Force` parameter or set installation policy to Trusted |

### Verify local repository contents

To see what packages are available in your local repository:

```powershell
# List all available packages in the local repository
Find-Module -Repository $localGallery
```

### Check module dependencies

To understand what dependencies a module requires:

```powershell
# Get module dependencies
Find-Module -Name "Microsoft.Entra.Users" -Repository $localGallery | Select-Object -ExpandProperty Dependencies
```

## Security considerations

- **Verify package integrity**: Ensure the nupkg files are from official Microsoft releases
- **Use trusted sources**: Only download packages from the official GitHub releases page
- **Network security**: Even in offline environments, authentication to Microsoft Entra requires network connectivity
- **Permissions**: Use the principle of least privilege when setting up local repositories

## Next steps

- [Navigate the Microsoft Entra PowerShell module](navigate-entraps.md)
- [Authentication scenarios](authentication-scenarios.md)
- [Troubleshoot common errors](troubleshooting.md)
- [Best practices for Microsoft Entra PowerShell](entra-powershell-best-practices.md)