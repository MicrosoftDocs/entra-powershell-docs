### [v1.0](#tab/v1)

```powershell
Get-InstalledModule -Name Microsoft.Entra* |
Where-Object { $_.Name -notmatch "Beta" }
```

To verify the installed submodules and their versions, run:

```powershell
Get-InstalledModule -Name Microsoft.Entra* |
Where-Object { $_.Name -notmatch "Beta" }
```

The version in the output should match the [latest version](https://aka.ms/entra/ps/gallery) published on the PowerShell Gallery. Now you're ready to use the module.

To verify if a specific submodule e.g. `Users` is installed, run:

```powershell
Get-InstalledModule -Name Microsoft.Entra.Users
```

#### [Beta](#tab/Beta)

```powershell
Get-InstalledModule -Name Microsoft.Entra.Beta*
```

To verify the installed submodules and their versions, run:

```powershell
Get-InstalledModule -Name Microsoft.Entra.Beta.*
```

The version in the output should match the [latest version](https://www.powershellgallery.com/packages/Microsoft.Entra.Beta) published on the PowerShell Gallery. Now you're ready to use the module.

To verify if a specific submodule e.g. `Users` is installed, run:

```powershell
Get-InstalledModule -Name Microsoft.Entra.Beta.Users
```

---
