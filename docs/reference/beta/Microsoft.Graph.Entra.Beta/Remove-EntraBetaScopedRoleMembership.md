---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# Remove-EntraBetaScopedRoleMembership

## Synopsis
Removes a scoped role membership.

## Syntax

```
Remove-EntraBetaScopedRoleMembership -ObjectId <String> -ScopedRoleMembershipId <String> [<CommonParameters>]
```

## Description
The Remove-EntraBetaScopedRoleMembership cmdlet removes a scoped role membership from Azure Active Directory (AD).

## Examples

### Example 1
```
Remove-EntraBetaScopedRoleMembership -ObjectId "1026185e-25df-4522-a380-7ab697a7241c" -ScopedRoleMembershipId "3028185e-25df-4522-a380-7ab697a7241c"
```

Removes scoped membership.

## Parameters

### -ObjectId
Specifies an object ID.

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

### -ScopedRoleMembershipId
Specifies the ID of the scoped role membership to remove.

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

## Inputs

## Outputs

## Notes

## Related Links

[Add-EntraBetaScopedRoleMembership]()

[Get-EntraBetaScopedRoleMembership]()

