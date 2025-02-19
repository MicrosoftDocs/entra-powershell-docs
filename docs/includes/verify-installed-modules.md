### [v1.0](#tab/v1)

```powershell
Get-InstalledModule -Name Microsoft.Entra.* |
Where-Object { $_.Name -notmatch "Beta" } | Format-Table Name, Version, InstalledLocation -AutoSize
```

This command shows the installed Microsoft Entra PowerShell module, its version, and installation location. The output version should match the [latest version](https://www.powershellgallery.com/packages/Microsoft.Entra) on the PowerShell Gallery. You're now ready to use the module.

```Output
Name                                Version InstalledLocation
----                                ------- -----------------
Microsoft.Entra                     1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra\1.0.1
Microsoft.Entra.Applications        1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Applications\1.0.1
Microsoft.Entra.Authentication      1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Authentication\1.0.1
Microsoft.Entra.DirectoryManagement 1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.DirectoryManagement\1.0.1
Microsoft.Entra.Governance          1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Governance\1.0.1
Microsoft.Entra.Groups              1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Groups\1.0.1
Microsoft.Entra.Reports             1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Reports\1.0.1
Microsoft.Entra.SignIns             1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.SignIns\1.0.1
Microsoft.Entra.Users               1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Users\1.0.1
```

To verify if a specific submodule for example, `Users` is installed, run:

```powershell
Get-InstalledModule -Name Microsoft.Entra.Users
```

The output version should match the [latest version](https://www.powershellgallery.com/packages/Microsoft.Entra.Users) on the PowerShell Gallery.

```Output
Version              Name                                Repository           Description
-------              ----                                ----------           -----------
1.0.1                Microsoft.Entra.Users               PSGallery            Microsoft Entra PowerShell
```

#### [Beta](#tab/Beta)

```powershell
Get-InstalledModule -Name Microsoft.Entra.Beta*
```

This command shows the installed Microsoft Entra PowerShell module, its version, and installation location. The output version should match the [latest version](https://www.powershellgallery.com/packages/Microsoft.Entra.Beta) on the PowerShell Gallery. You're now ready to use the module.

```Output
Name                                Version InstalledLocation
----                                ------- -----------------
Microsoft.Entra.Beta                    1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Beta\1.0.1
MicrosoftEntra.Beta.Applications        1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Beta.Applications\1.0.1
MicrosoftEntra.Beta.Authentication      1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Beta.Authentication\1.0.1
MicrosoftEntra.Beta.DirectoryManagement 1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Beta.DirectoryManagement\1.0.1
MicrosoftEntra.Beta.Governance          1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Beta.Governance\1.0.1
MicrosoftEntra.Beta.Groups              1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Beta.Groups\1.0.1
MicrosoftEntra.Beta.Reports             1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Beta.Reports\1.0.1
MicrosoftEntra.Beta.SignIns             1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Beta.SignIns\1.0.1
MicrosoftEntra.Beta.Users               1.0.1   <PowerShell-Path>\PowerShell\Modules\Microsoft.Entra.Beta.Users\1.0.1
```

To verify if a specific submodule for example, `Users` is installed, run:

```powershell
Get-InstalledModule -Name Microsoft.Entra.Beta.Users
```

The output version should match the [latest version](https://www.powershellgallery.com/packages/Microsoft.Entra.Beta.Users) on the PowerShell Gallery.

```Output
Version              Name                                Repository           Description
-------              ----                                ----------           -----------
1.0.1                Microsoft.Entra.Beta.Users          PSGallery            Microsoft Entra PowerShell
```
