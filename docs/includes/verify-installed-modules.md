### [v1.0](#tab/v1)

```powershell
Get-InstalledModule -Name Microsoft.Entra* |
Where-Object { $_.Name -notmatch "Beta" }
```

To verify the installed submodules and their versions, run:

```powershell
Get-InstalledModule -Name Microsoft.Entra.* |
Where-Object { $_.Name -notmatch "Beta" }
```

To verify if a specific submodule for example, `Users` is installed, run:

```powershell
Get-InstalledModule -Name Microsoft.Entra.Users
```

The output version should match the [latest version](https://aka.ms/entra/ps/gallery) on the PowerShell Gallery. You're now ready to use the module.

#### [Beta](#tab/Beta)

```powershell
Get-InstalledModule -Name Microsoft.Entra.Beta*
```

To verify the installed submodules and their versions, run:

```powershell
Get-InstalledModule -Name Microsoft.Entra.Beta.*
```

To verify if a specific submodule for example, `Users` is installed, run:

```powershell
Get-InstalledModule -Name Microsoft.Entra.Beta.Users
```

The output version should match the [latest version](https://www.powershellgallery.com/packages/Microsoft.Entra.Beta) on the PowerShell Gallery. You're now ready to use the module.

---
