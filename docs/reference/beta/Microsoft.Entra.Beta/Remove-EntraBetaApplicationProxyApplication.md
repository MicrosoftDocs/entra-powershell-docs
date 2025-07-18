---
author: msewaweru
description: This article provides details on the Remove-EntraBetaApplicationProxyApplication command.
external help file: Microsoft.Entra.Beta.Applications-Help.xml
Locale: en-US
manager: CelesteDG
Module Name: Microsoft.Entra.Beta
ms.author: eunicewaweru
ms.date: 07/15/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra.Beta/Remove-EntraBetaApplicationProxyApplication
schema: 2.0.0
title: Remove-EntraBetaApplicationProxyApplication
---

# Remove-EntraBetaApplicationProxyApplication

## SYNOPSIS

Deletes an Application Proxy application.

## SYNTAX

```powershell
Remove-EntraBetaApplicationProxyApplication
 -ApplicationId <String>
 [-RemoveADApplication <Boolean>]
 [<CommonParameters>]
```

## DESCRIPTION

The `Remove-EntraBetaApplicationProxyApplication` cmdlet removes Application Proxy configurations from a specific application in Microsoft Entra ID, and can delete the application completely if specified.

## EXAMPLES

### Example 1: Remove a Proxy Application

```powershell
Connect-Entra -Scopes 'Directory.ReadWrite.All'
Remove-EntraBetaApplicationProxyApplication -ApplicationId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb'
```

This example removes a Proxy Application.

- `ApplicationId` parameter specifies the application ID.

### Example 2: Remove a Proxy Application, and remove it from Microsoft Entra ID completely

```powershell
Connect-Entra -Scopes 'Directory.ReadWrite.All'
Remove-EntraBetaApplicationProxyApplication -ApplicationId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb' -RemoveADApplication $true
```

This example removes a Proxy Application, and removes it from Microsoft Entra ID completely.

- `ApplicationId` parameter specifies the application ID.  
- `RemoveADApplication` parameter specifies the user confirmation to delete application completely.

## PARAMETERS

### -ApplicationId

The unique application ID of the application.
This ApplicationId can be found using the `Get-EntraBetaApplication` command.
You can also find this ApplicationId in the Microsoft by navigating to Microsoft Entra ID > App registrations > All applications. Select your application. This will takes you to the application's overview page. Use the ObjectId on that page.

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

### -RemoveADApplication

This RemoveADApplication parameter allows you to delete application completely.
When this RemoveADApplication is false (default), Application Proxy properties are removed from the application, but the application still exists.
If this RemoveADApplication is true, the application is removed from Microsoft Entra ID.

```yaml
Type: System.Boolean
Parameter Sets: (All)
Aliases:

Required: False
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

[New-EntraBetaApplicationProxyApplication](New-EntraBetaApplicationProxyApplication.md)

[Set-EntraBetaApplicationProxyApplication](Set-EntraBetaApplicationProxyApplication.md)

[Get-EntraBetaApplicationProxyApplication](Get-EntraBetaApplicationProxyApplication.md)

[Get-EntraBetaApplication](Get-EntraBetaApplication.md)
