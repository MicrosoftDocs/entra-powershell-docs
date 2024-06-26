---
title: Remove-EntraApplicationVerifiedPublisher.
description: This article provides details on the Remove-EntraApplicationVerifiedPublisher command.

ms.service: entra
ms.topic: reference
ms.date: 06/26/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG
author: msewaweru
external help file: Microsoft.Graph.Entra-Help.xml
Module Name: Microsoft.Graph.Entra
online version:
schema: 2.0.0
---

# Remove-EntraApplicationVerifiedPublisher

## Synopsis
Removes the verified publisher from an application.

## Syntax

```powershell
Remove-EntraApplicationVerifiedPublisher 
 -AppObjectId <String> 
 [<CommonParameters>]
```

## Description
Removes the verified publisher from an application.

## Examples

### Example 1: Remove the verified publisher from an application.
```Powershell
$appObjId = 'ad6c71a5-e48f-4320-bb59-92642a2d8d9f'
          Remove-EntraApplicationVerifiedPublisher -AppObjectId $appObjId
```
This command demonstrates how to remove the verified publisher from an application.  

## Parameters

### -AppObjectId
The unique identifier of a Microsoft Entra ID Application object.

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

### String
## Outputs

## Notes

## Related Links

[Set-EntraApplicationVerifiedPublisher](Set-EntraApplicationVerifiedPublisher.md)

