---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# Remove-EntraBetaUserAppRoleAssignment

## SYNOPSIS
Removes a user application role assignment.

## SYNTAX

```
Remove-EntraBetaUserAppRoleAssignment -ObjectId <String> -AppRoleAssignmentId <String>
 [<CommonParameters>]
```

## DESCRIPTION
The Remove-EntraBetaUserAppRoleAssignment cmdlet removes a user application role assignment in Azure Active Directory (AD).

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -AppRoleAssignmentId
Specifies the ID of an application role assignment.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```



### -ObjectId
Specifies the ID (as a UPN or ObjectId) of a user in Azure AD.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-EntraBetaUserAppRoleAssignment]()

[New-EntraBetaUserAppRoleAssignment]()

