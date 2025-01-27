### [v1.0](#tab/v1)

Run the following command to list all `Microsoft.Entra` GA/v1.0 modules in the PowerShell Gallery:

```PowerShell
Find-Module -Name "Microsoft.Entra*" -Repository PSGallery |
Where-Object { $_.Name -notmatch "beta" }
```

This command lists all Microsoft Entra PowerShell `GA/v1.0` modules in the PowerShell Gallery.

For example, to install the `Users` module, run the following command:

```powershell
Install-Module -Name Microsoft.Entra.Users -Repository PSGallery -Force -AllowClobber
```

#### [Beta](#tab/Beta)

Run the following command to list all `Microsoft.Entra.Beta` Beta modules in the PowerShell Gallery:

```PowerShell
Find-Module -Name "Microsoft.Entra*" -Repository PSGallery |
Where-Object { $_.Name -match "beta" }
```

This command lists all Microsoft Entra PowerShell `Beta` modules in the PowerShell Gallery.

For example, to install the `Users` module, run the following command:

```powershell
Install-Module -Name Microsoft.Entra.Beta.Users -Repository PSGallery -Force -AllowClobber
```

---
