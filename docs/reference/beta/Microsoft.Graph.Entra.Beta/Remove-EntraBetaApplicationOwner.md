---
title: Remove-EntraBetaApplicationOwner
description: This article provides details on the Remove-EntraBetaApplicationOwner command.

ms.service: active-directory
ms.topic: reference
ms.date: 03/05/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG

external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version:
schema: 2.0.0
---

# Remove-EntraBetaApplicationOwner

## SYNOPSIS
Removes an owner from an application.

## SYNTAX

```powershell
Remove-EntraBetaApplicationOwner 
    -OwnerId <String> 
    -ObjectId <String> 
 [<CommonParameters>]
```

## DESCRIPTION
The Remove-EntraBetaApplicationOwner cmdlet removes an owner from an application in Microsoft Entra ID.

## EXAMPLES

### Example 1: Remove an owner from an application
```powershell
PS C:\>Remove-EntraBetaApplicationOwner -ObjectId "3ddd22e7-a150-4bb3-b100-e410dea1cb84" -OwnerId "c13dd34a-492b-4561-b171-40fcce2916c5"
```

This command removes the specified owner from the specified application.

## PARAMETERS

### -ObjectId
Specifies the ID of an application in Microsoft Entra ID.

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

### -OwnerId
Specifies the ID of the owner.

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

## OUTPUTS

## NOTES

## RELATED LINKS

[Add-EntraBetaApplicationOwner](Add-EntraBetaApplicationOwner.md)

[Get-EntraBetaApplicationOwner](Get-EntraBetaApplicationOwner.md)

