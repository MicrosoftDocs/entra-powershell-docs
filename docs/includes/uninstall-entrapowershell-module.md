### [v1.0](#tab/v1)

```powershell
Uninstall-Module -Name Microsoft.Entra -AllVersions -Force
```

To uninstall a specific submodule, such as `Users`, run:

```powershell
Uninstall-Module -Name Microsoft.Entra.Users -AllVersions -Force
```

To uninstall all the submodules, run:

```powershell
$InstalledSubModules = Get-InstalledModule -Name Microsoft.Entra.* |
Where-Object { $_.Name -notmatch "Beta" }
foreach ($module in $InstalledSubModules) {
    Write-Host "Checking for submodule: $($module.Name)" -ForegroundColor Yellow -BackgroundColor DarkBlue
    Uninstall-Module -Name $module.Name -Force -ErrorAction Stop
    Write-Host "Successfully uninstalled submodule: $($module.Name)" -ForegroundColor Green
}
```

#### [Beta](#tab/Beta)

```powershell
Uninstall-Module -Name Microsoft.Entra.Beta -AllVersions -Force
```

To uninstall a specific submodule, such as `Users`, run:

```powershell
Uninstall-Module -Name Microsoft.Entra.Beta.Users -AllVersions -Force
```

To uninstall all the submodules, run:

```powershell
$InstalledSubModules = Get-InstalledModule -Name Microsoft.Entra.Beta.*
foreach ($module in $InstalledSubModules) {
    Write-Host "Checking for submodule: $($module.Name)" -ForegroundColor Yellow -BackgroundColor DarkBlue
    Uninstall-Module -Name $module.Name -Force -ErrorAction Stop
    Write-Host "Successfully uninstalled submodule: $($module.Name)" -ForegroundColor Green
}
```

---
