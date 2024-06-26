---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# Remove-EntraBetaServicePrincipalPolicy

## SYNOPSIS

## SYNTAX

```
Remove-EntraBetaServicePrincipalPolicy -Id <String> -PolicyId <String> [<CommonParameters>]
```

## DESCRIPTION

## EXAMPLES

### Example 1: Remove a service principal policy
```
PS C:\>Remove-EntraBetaApplicationPolicy -ObjectId <object id of application> -PolicyId <object id of policy>
```

This command removes a service principal policy.

## PARAMETERS



### -PolicyId
Specifies the object ID of a policy.

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
{{Fill Id Description}}

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

[Add-EntraBetaServicePrincipalPolicy]()

[Get-EntraBetaServicePrincipalPolicy]()

