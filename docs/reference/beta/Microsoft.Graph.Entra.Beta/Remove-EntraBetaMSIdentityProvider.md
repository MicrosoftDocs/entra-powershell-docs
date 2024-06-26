---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# Remove-EntraBetaMSIdentityProvider

## SYNOPSIS
This cmdlet is used to delete an identity provider in the directory.

## SYNTAX

```
Remove-EntraBetaMSIdentityProvider -Id <String> [<CommonParameters>]
```

## DESCRIPTION
This cmdlet is used to delete an identity provider that has been configured in the directory.
The identity provider will be permanently deleted.

## EXAMPLES

### Example 1
```
PS C:\> Remove-EntraBetaMSIdentityProvider -Id LinkedIn-OAUTH
```

This example removes the specified identity provider.

## PARAMETERS

### -Id
The unique identifier for an identity provider.

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

### System.String
## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
