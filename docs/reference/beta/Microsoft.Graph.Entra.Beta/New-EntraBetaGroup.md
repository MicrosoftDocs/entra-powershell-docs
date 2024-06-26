---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# New-EntraBetaGroup

## SYNOPSIS
Creates a group.

## SYNTAX

```
New-EntraBetaGroup [-Description <String>] -MailEnabled <Boolean> -SecurityEnabled <Boolean>
 -MailNickName <String> -DisplayName <String> [<CommonParameters>]
```

## DESCRIPTION
The New-EntraBetaGroup cmdlet creates a group in Azure Active Directory (AD).

## EXAMPLES

### Example 1: Create a group
```
PS C:\>New-EntraBetaGroup -DisplayName "My new group" -MailEnabled $false -SecurityEnabled $true -MailNickName "NotSet"

ObjectId                             DisplayName  Description
--------                             -----------  -----------
11fa5e1e-737c-40c5-835e-416ae3959606 My new group
```

## PARAMETERS

### -Description
Specifies a description of the group.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisplayName
Specifies the display name of the group.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```


### -MailEnabled
Indicates whether mail is enabled.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MailNickName
Specifies a nickname for mail.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SecurityEnabled
Indicates whether the group is security-enabled.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-EntraBetaGroup]()

[Remove-EntraBetaGroup]()

[Set-EntraBetaGroup]()

