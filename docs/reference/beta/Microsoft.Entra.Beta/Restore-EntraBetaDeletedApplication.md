---
author: msewaweru
description: This article provides details on the  Restore-EntraBetaDeletedApplication Command.
external help file: Microsoft.Entra.Beta.Applications-Help.xml
Locale: en-US
manager: CelesteDG
Module Name: Microsoft.Entra.Beta
ms.author: eunicewaweru
ms.date: 07/30/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra.Beta/Restore-EntraBetaDeletedApplication
schema: 2.0.0
title: Restore-EntraBetaDeletedApplication
---

# Restore-EntraBetaDeletedApplication

## SYNOPSIS

Restores a previously deleted application.

## SYNTAX

```powershell
Restore-EntraBetaDeletedApplication
 -ApplicationId <String>
 [-IdentifierUris <System.Collections.Generic.List`1[System.String]>]
 [<CommonParameters>]
```

## DESCRIPTION

This cmdlet restores a previously deleted application.

Restoring an application doesn't restore the associated service principal automatically. You must explicitly restore the deleted service principal.

For delegated scenarios, the calling user needs to have at least one of the following Microsoft Entra roles.

- Application Administrator
- Cloud Application Administrator
- Hybrid Identity Administrator

## EXAMPLES

### Example 1: Restores a previously deleted application

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All'
$deletedApplication = Get-EntraBetaDeletedApplication -SearchString 'My PowerShell Application'
Restore-EntraBetaDeletedApplication -ApplicationId $deletedApplication.Id
```

```Output
Id                                   DeletedDateTime
--                                   ---------------
ffffffff-5555-6666-7777-aaaaaaaaaaaa
```

This example shows how an application is deleted, then the deleted application is retrieved using the `Get-EntraBetaDeletedApplication` cmdlet, and subsequently the application is restored by specifying the application's Object ID in the `Restore-EntraBetaDeletedApplication` cmdlet.

- `-ApplicationId` parameter specifies the ObjectId of the deleted application that is to be restored.

## PARAMETERS

### -IdentifierUris

The IdentifierUris of the application that is to be restored.

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

### -ApplicationId

The object ID of the deleted application that is to be restored.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases: ObjectId

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

[Remove-EntraBetaDeletedApplication](Remove-EntraBetaDeletedApplication.md)

[Get-EntraBetaDeletedApplication](Get-EntraBetaDeletedApplication.md)
