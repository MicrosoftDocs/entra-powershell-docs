---
author: msewaweru
description: This article provides details on the Get-EntraPasswordPolicy command.
external help file: Microsoft.Entra.DirectoryManagement-Help.xml
Locale: en-US
manager: mwongerapk
Module Name: Microsoft.Entra
ms.author: eunicewaweru
ms.date: 06/26/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra/Get-EntraPasswordPolicy
schema: 2.0.0
title: Get-EntraPasswordPolicy
---

# Get-EntraPasswordPolicy

## SYNOPSIS

Retrieves the current password policy for the tenant or the specified domain.

## SYNTAX

### GetQuery (Default)

```powershell
Get-EntraPasswordPolicy
 [<CommonParameters>]
```

### GetById

```powershell
Get-EntraPasswordPolicy
 -DomainName <String>
 [<CommonParameters>]
```

## DESCRIPTION

The `Get-EntraPasswordPolicy` cmdlet can be used to retrieve the values associated with the Password Expiry
window or Password Expiry Notification window for a tenant or specified domain.

When a domain name is specified, it must be a verified domain for the company.

In delegated scenarios, the signed-in user must have either a supported Microsoft Entra role or a custom role with the necessary permissions. The minimum roles required for this operation are:

- Domain Name Administrator

## EXAMPLES

### Example 1: Get password policy for a specified domain

```powershell
Connect-Entra -Scopes 'Domain.Read.All'
Get-EntraPasswordPolicy -DomainName 'contoso.com'
```

```Output
NotificationDays ValidityPeriod
---------------- --------------
            90             180
```

Returns the password policy for the specified domain.

- `-DomainName` parameter specifies the fully qualified domain name to retrieve.

## PARAMETERS

### -DomainName

The fully qualified name of the domain to be retrieved.

```yaml
Type: System.String
Parameter Sets: GetById
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
