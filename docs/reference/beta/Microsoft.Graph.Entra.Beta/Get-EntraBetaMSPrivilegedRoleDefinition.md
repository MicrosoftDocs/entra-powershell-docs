---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# Get-EntraBetaMSPrivilegedRoleDefinition

## SYNOPSIS
Get role definitions

## SYNTAX

### GetQuery (Default)
```
Get-EntraBetaMSPrivilegedRoleDefinition -ResourceId <String> [-Filter <String>] [-Top <Int32>]
 -ProviderId <String> [<CommonParameters>]
```

### GetById
```
Get-EntraBetaMSPrivilegedRoleDefinition -ResourceId <String> -Id <String> -ProviderId <String>
 [<CommonParameters>]
```

## DESCRIPTION
Get role definitions

## EXAMPLES

### Example 1
```
PS C:\> Get-EntraBetaMSPrivilegedRoleDefinition -ProviderId AzureResources -ResourceId e5e7d29d-5465-45ac-885f-4716a5ee74b5 -Top 10
```

Get role definitions for a specific provider and resource

### Example 1
```
PS C:\> Get-EntraBetaMSPrivilegedRoleDefinition -ProviderId AzureResources -ResourceId e5e7d29d-5465-45ac-885f-4716a5ee74b5 -Id ff67e02b-d77b-4588-9f32-e02b7da6539b
```

Get a role definitions for a specific provider, resource and Id

## PARAMETERS

### -Id
The id of a role definition

```yaml
Type: String
Parameter Sets: GetById
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ProviderId
The unique identifier of the specific provider

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

### -ResourceId
The unique identifier of the specific resource

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

### -Filter
{{ Fill Filter Description }}

```yaml
Type: String
Parameter Sets: GetQuery
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Top
{{ Fill Top Description }}

```yaml
Type: Int32
Parameter Sets: GetQuery
Aliases:

Required: False
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
