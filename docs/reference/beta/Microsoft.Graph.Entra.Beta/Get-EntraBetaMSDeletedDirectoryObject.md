---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# Get-EntraBetaMSDeletedDirectoryObject

## SYNOPSIS
This cmdlet is used to retrieve a soft deleted directory object from the directory

## SYNTAX

```
Get-EntraBetaMSDeletedDirectoryObject -Id <String> [<CommonParameters>]
```

## DESCRIPTION
This cmdlet is used to retrieve a soft deleted directory object from the directory.
Note that soft delete for groups is currently only implemented for Unified Groups (a.k.a.
Office 365 Groups).

## EXAMPLES

### Example 1
```
Get-EntraBetaMSDeletedDirectoryObject -Id 85b5ff1e-0402-400c-9e3c-0f9e965325d1
```

This example shows how to retrieve the deleted directory object with id = 85b5ff1e-0402-400c-9e3c-0f9e965325d1 from the directory

## PARAMETERS

### -Id
The Id of the directory object to retrieve

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
