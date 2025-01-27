### [v1.0](#tab/v1)

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraUser -Filter "userPrincipalName eq 'SawyerM@contoso.com'"
```

#### [Beta](#tab/Beta)

```powershell
Connect-Entra -Scopes 'User.Read.All'
Get-EntraBetaUser -Filter "userPrincipalName eq 'SawyerM@contoso.com'"
```

---
