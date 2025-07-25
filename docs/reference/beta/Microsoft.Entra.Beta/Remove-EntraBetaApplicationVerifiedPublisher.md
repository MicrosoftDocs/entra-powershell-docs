---
author: msewaweru
description: This article provides details on the Remove-EntraBetaApplicationVerifiedPublisher command.
external help file: Microsoft.Entra.Beta.Applications-Help.xml
Locale: en-US
manager: mwongerapk
Module Name: Microsoft.Entra.Beta
ms.author: eunicewaweru
ms.date: 07/31/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra.Beta/Remove-EntraBetaApplicationVerifiedPublisher
schema: 2.0.0
title: Remove-EntraBetaApplicationVerifiedPublisher
---

# Remove-EntraBetaApplicationVerifiedPublisher

## SYNOPSIS

Removes the verified publisher from an application.

## SYNTAX

```powershell
Remove-EntraBetaApplicationVerifiedPublisher
 -AppObjectId <String>
 [<CommonParameters>]
```

## DESCRIPTION

Removes the verified publisher from an application.

## EXAMPLES

### Example 1: Remove the verified publisher from an application

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$application = Get-EntraBetaApplication -Filter "displayName eq 'Contoso Helpdesk Application'"
Remove-EntraBetaApplicationVerifiedPublisher -AppObjectId $application.Id
```

This command demonstrates how to remove the verified publisher from an application.  

- `-AppObjectId` parameter specifies the unique identifier of an application.

## PARAMETERS

### -AppObjectId

The unique identifier of a Microsoft Entra ID Application object.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases: ApplicationId

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### String

## OUTPUTS

## NOTES

## RELATED LINKS

[Set-EntraBetaApplicationVerifiedPublisher](Set-EntraBetaApplicationVerifiedPublisher.md)
