---
title: Get-EntraUserLicenseDetail.
description: This article provides details on the Get-EntraUserLicenseDetail command.

ms.service: entra
ms.topic: reference
ms.date: 03/07/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG
author: msewaweru
external help file: Microsoft.Graph.Entra-Help.xml
Module Name: Microsoft.Graph.Entra
online version:
schema: 2.0.0
---

# Get-EntraUserLicenseDetail

## SYNOPSIS

Retrieves license details for a user.

## SYNTAX

```powershell
Get-EntraUserLicenseDetail 
 -ObjectId <String> 
 [<CommonParameters>]
```

## DESCRIPTION

This cmdlet retrieves license details for a user.

## EXAMPLES

### Example 1: Retrieve user license details

```powershell
Connect-Entra -Scopes 'User.Read'
Get-EntraUserLicenseDetail -ObjectId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
```

```output
ObjectId                                    ServicePlans
--------                                    ------------
Hv-1hQIEDECePA-A1bC2dE3fH4iJ5kL6mN7oP8qR9sT0u {class ServicePlanInfo {...
Hv-1hQIEDECePA-C2dE3fH4iJ5kL6mN7oP8qR9sT0uV1w {class ServicePlanInfo {...
```

This example demonstrates how to retrieve license details for a user from Microsoft Entra ID.

## PARAMETERS

### -ObjectId

The object ID of the user for which the license details are retrieved.

```yaml
Type: System.String
Parameter Sets: (All)
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

### System.String

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
