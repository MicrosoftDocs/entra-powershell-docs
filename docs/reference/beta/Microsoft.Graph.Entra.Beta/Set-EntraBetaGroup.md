---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# Set-EntraBetaGroup

## SYNOPSIS
Updates a specific group in Azure Active Directory

## SYNTAX

```
Set-EntraBetaGroup [-Description <String>] -ObjectId <String> [-MailEnabled <Boolean>]
 [-SecurityEnabled <Boolean>] [-MailNickName <String>] [-DisplayName <String>]
 [<CommonParameters>]
```

## DESCRIPTION
The Set-EntraBetaGroup cmdlet updates a group in Azure Active Directory (AD).

## EXAMPLES

### Example 1: Update a group
```
PS C:\>Set-EntraBetaGroup -ObjectId "11fa5e1e-737c-40c5-835e-416ae3959606" -Description "This is my new group"
```

This command updates the specfied group in Azure AD.

## PARAMETERS

### -Description
Specfies a description.

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
Specifies a display name.

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



### -MailEnabled
Indicates whether mail is enabled.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MailNickName
Specifies a nickname for the mail.

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

### -ObjectId
Specifies the object ID of a group.

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

### -SecurityEnabled
Indicates whether security is enabled.

```yaml
Type: Boolean
Parameter Sets: (All)
Aliases:

Required: False
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

[New-EntraBetaGroup]()

[Remove-EntraBetaGroup]()

