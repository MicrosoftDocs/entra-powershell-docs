---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# Remove-EntraBetaMSServicePrincipalDelegatedPermissionClassification

## SYNOPSIS
Remove delegated permission classification.

## SYNTAX

```
Remove-EntraBetaMSServicePrincipalDelegatedPermissionClassification -ServicePrincipalId <String> -Id <String>
 [<CommonParameters>]
```

## DESCRIPTION
The Remove-EntraBetaMSServicePrincipalDelegatedPermissionClassification cmdlet deletes the given delegated permission classification by Id from service principal.

## EXAMPLES

### Example 1: Remove a delegated permission classifications
```
PS C:\> Remove-EntraBetaMSServicePrincipalDelegatedPermissionClassification -ServicePrincipalId "95f56359-0165-4f80-bffb-c89d06cf2c6f" -Id "5XBeIKarUkypdm0tRsSAQwE"
```

This command delete the delegated permission classification by Id from the service principal.

## PARAMETERS

### -ServicePrincipalId
The unique identifier of a service principal object in Azure Active Directory.

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

### -Id
The unique identifier of a delegated permission classification object id.

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
