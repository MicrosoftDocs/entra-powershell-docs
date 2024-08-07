---
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version: https://learn.microsoft.com/powershell/module/Microsoft.Graph.Entra.Beta/New-EntraBetaDomain

schema: 2.0.0
---

# New-EntraBetaDomain

## Synopsis
Creates a domain.

## Syntax

```
New-EntraBetaDomain [-IsDefault <Boolean>]
 [-SupportedServices <System.Collections.Generic.List`1[System.String]>] -Name <String>
 [-IsDefaultForCloudRedirections <Boolean>] [<CommonParameters>]
```

## Description
The New-EntraBetaDomain cmdlet creates a domain in Azure Active Directory (AD).

## Examples

### Example 1: Create a new Domain
```
PS C:\>New-EntraBetaDomain -Name Contoso.com 

Name        AvailabilityStatus AuthenticationType
----        ------------------ ------------------
Contoso.com                    Managed
```

This command creates a new domain.

### Example 2: Create a new Domain with a list of domain capabilities
```
PS C:\>New-EntraBetaDomain -Name Contoso.com -SupportedServices @("Email", "OfficeCommunicationsOnline")

Name        AvailabilityStatus AuthenticationType
----        ------------------ ------------------
Contoso.com                    Managed
```

This command creates a new domain with the specified services for this domain.

### Example 3: Create a new Domain as the default for cross cloud redirections
```
PS C:\>New-EntraBetaDomain -Name Contoso.com -IsDefaultForCloudRedirections

          Name        AvailabilityStatus AuthenticationType
          ----        ------------------ ------------------
          Contoso.com                    Managed
```

This command creates a new domain and marks it as the default for cross cloud redirections.

### Example 4: Create a new Domain and make if the default new user creation
```
PS C:\>New-EntraBetaDomain -Name Contoso.com -IsDefault

          Name        AvailabilityStatus AuthenticationType
          ----        ------------------ ------------------
          Contoso.com                    Managed
```

This command creates a new domain and marks it as the default to be used for new user creation.

## Parameters

### -IsDefault
Indicates whether or not this is the default domain that is used for user creation.
There is only one default domain per company.

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

### -IsDefaultForCloudRedirections
Indicates whether or not this is the default domain used for cloud redirections.

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

### -Name
The fully qualified name of the domain.

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

### -SupportedServices
The capabilities assigned to the domain.

```yaml
Type: System.Collections.Generic.List`1[System.String]
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

## Inputs

## Outputs

## Notes

## Related Links

[Confirm-EntraBetaDomain]()

[Get-EntraBetaDomain]()

[Remove-EntraBetaDomain]()

[Set-EntraBetaDomain]()

