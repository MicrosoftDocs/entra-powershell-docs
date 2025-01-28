# [v1.0](#tab/v1)

- Install Microsoft Graph PowerShell SDK `v1.0` dependencies.

```powershell
$RequiredModules = (@'
Microsoft.Graph.DirectoryObjects
Microsoft.Graph.Users
Microsoft.Graph.Users.Actions
Microsoft.Graph.Users.Functions
Microsoft.Graph.Groups
Microsoft.Graph.Identity.DirectoryManagement
Microsoft.Graph.Identity.Governance
Microsoft.Graph.Identity.SignIns
Microsoft.Graph.Applications
'@).Split("`n")

# Check if the pre-requisite modules are installed and install them if needed
foreach ($module in $RequiredModules) {
    Write-Host -ForegroundColor Yellow -BackgroundColor DarkBlue "Checking for $module"
    if (!(Get-Module -Name $module -ListAvailable)) {
        Install-Module -Name $module -Scope CurrentUser
    }
}

<# Attribution: https://github.com/SamErde and https://github.com/alexandair #>
```

# [Beta](#tab/beta)

- Install Microsoft Graph PowerShell SDK `Beta` dependencies.

```powershell
$RequiredModules = (@'
Microsoft.Graph.Beta.Applications
Microsoft.Graph.Beta.Users
Microsoft.Graph.Beta.Users.Actions
Microsoft.Graph.Beta.Users.Functions
Microsoft.Graph.Beta.Groups
Microsoft.Graph.Beta.Identity.DirectoryManagement
Microsoft.Graph.Beta.Identity.Governance
Microsoft.Graph.Beta.Identity.SignIns
Microsoft.Graph.Beta.Reports
'@).Split("`n")
# Check if the pre-requisite modules are installed and install them if needed
foreach ($module in $RequiredModules) {
    Write-Host -ForegroundColor Yellow -BackgroundColor DarkBlue "Checking for $module"
    if (!(Get-Module -Name $module -ListAvailable)) {
        Install-Module -Name $module -Scope CurrentUser
    }
}

<# Attribution: https://github.com/SamErde and https://github.com/alexandair #>
```

# [Both Beta and v1.0](#tab/both)

- Install `Beta` and `v1.0` dependencies.

```powershell
$RequiredModules = (@'
Microsoft.Graph.DirectoryObjects
Microsoft.Graph.Users
Microsoft.Graph.Users.Actions
Microsoft.Graph.Users.Functions
Microsoft.Graph.Groups
Microsoft.Graph.Identity.DirectoryManagement
Microsoft.Graph.Identity.Governance
Microsoft.Graph.Identity.SignIns
Microsoft.Graph.Applications
Microsoft.Graph.Beta.Applications 
Microsoft.Graph.Beta.Users
Microsoft.Graph.Beta.Users.Actions
Microsoft.Graph.Beta.Users.Functions
Microsoft.Graph.Beta.Groups
Microsoft.Graph.Beta.Identity.DirectoryManagement
Microsoft.Graph.Beta.Identity.Governance
Microsoft.Graph.Beta.Identity.SignIns
Microsoft.Graph.Beta.Reports
'@).Split("`n")
# Check if the pre-requisite modules are installed and install them if needed
foreach ($module in $RequiredModules) {
    Write-Host -ForegroundColor Yellow -BackgroundColor DarkBlue "Checking for $module"
    if (!(Get-Module -Name $module -ListAvailable)) {
        Install-Module -Name $module -Scope CurrentUser
    }
}

<# Attribution: https://github.com/SamErde and https://github.com/alexandair #>
```

---
