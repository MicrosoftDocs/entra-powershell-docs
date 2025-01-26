### [v1.0](#tab/v1)

```powershell
Install-Module -Name Microsoft.Entra -Repository PSGallery -Scope CurrentUser -Force -AllowClobber
```
  
Optionally, you can change the scope of the installation using the **Scope** parameter. This operation requires admin permissions.
  
```powershell
Install-Module -Name Microsoft.Entra -Repository PSGallery -Scope AllUsers -Force -AllowClobber
```

#### [Beta](#tab/Beta)

```powershell
Install-Module -Name Microsoft.Entra.Beta -Repository PSGallery -Scope CurrentUser -Force -AllowClobber
```

Optionally, you can change the scope of the installation using the **Scope** parameter. This operation requires admin permissions.

```powershell
Install-Module -Name Microsoft.Entra.Beta -Repository PSGallery -Scope AllUsers -Force -AllowClobber
```

---
