---
author: msewaweru
description: This article provides details on the Set-EntraBetaPartnerInformation command.
external help file: Microsoft.Entra.Beta.DirectoryManagement-Help.xml
Locale: en-US
manager: mwongerapk
Module Name: Microsoft.Entra.Beta
ms.author: eunicewaweru
ms.date: 06/26/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra.Beta/Set-EntraBetaPartnerInformation
schema: 2.0.0
title: Set-EntraBetaPartnerInformation
---

# Set-EntraBetaPartnerInformation

## SYNOPSIS

Sets company information for partners.

## SYNTAX

```powershell
Set-EntraBetaPartnerInformation
 [-CompanyType <CompanyType>]
 [-PartnerCompanyName <String>]
 [-PartnerSupportTelephones <String[]>]
 [-PartnerSupportEmails <String[]>]
 [-PartnerCommerceUrl <String>]
 [-PartnerSupportUrl <String>]
 [-PartnerHelpUrl <String>]
 [-TenantId <Guid>]
 [<CommonParameters>]
```

## DESCRIPTION

The `Set-EntraBetaPartnerInformation` cmdlet is used by partners to set partner-specific properties.

These properties can view by all tenants that the partner has access to.

## EXAMPLES

### Example 1: Update the help URL

```powershell
Connect-Entra -Scopes 'Organization.ReadWrite.All'
Set-EntraBetaPartnerInformation -PartnerHelpUrl 'http://www.help.contoso.com'
```

This example shows how to update the help URL.

### Example 2: Update the Support URL

```powershell
Connect-Entra -Scopes 'Organization.ReadWrite.All'
Set-EntraBetaPartnerInformation -PartnerSupportUrl 'http://www.test1.com'
```

This example shows how to update the support URL.

### Example 3: Update the Commerce URL

```powershell
Connect-Entra -Scopes 'Organization.ReadWrite.All'
Set-EntraBetaPartnerInformation -PartnerCommerceUrl 'http://www.test1.com'
```

This example shows how to update the commerce URL.

### Example 4: Update the SupportEmails

```powershell
Connect-Entra -Scopes 'Organization.ReadWrite.All'
Set-EntraBetaPartnerInformation -PartnerSupportEmails 'contoso@example.com'
```

This example shows how to update the support email addresses.

### Example 5: Update the SupportTelephones

```powershell
Connect-Entra -Scopes 'Organization.ReadWrite.All'
$tenantId = (Get-EntraContext).TenantId
Set-EntraBetaPartnerInformation -PartnerSupportTelephones '234234234' -TenantId $tenantId
```

This example shows how to update support telephone numbers.

## PARAMETERS

### -PartnerCommerceUrl

Specifies the URL for the partner's commerce website.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PartnerHelpUrl

Specifies the URL for the partner's Help website.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PartnerSupportEmails

Specifies the support email address for the partner.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PartnerSupportTelephones

Specifies the support telephone numbers for the partner.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PartnerSupportUrl

Specifies the URL for the partner's support website.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -TenantId

Specifies the unique ID of the tenant on which to perform the operation. This parameter provides compatibility with Azure AD and MSOnline for partner scenarios. TenantID is the signed-in user's tenant ID.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -CompanyType

Specifies the partner's company type.

```yaml
Type: CompanyType
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -PartnerCompanyName

Specifies the partner's company name.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (<https://go.microsoft.com/fwlink/?LinkID=113216>).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-EntraBetaPartnerInformation](Get-EntraBetaPartnerInformation.md)
