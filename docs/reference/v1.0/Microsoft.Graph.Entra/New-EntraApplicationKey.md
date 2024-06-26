---
title: New-EntraApplicationKey
description: This article provides details on the New-EntraApplicationKey command.

ms.service: entra
ms.topic: reference
ms.date: 03/21/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG
author: msewaweru

external help file: Microsoft.Graph.Entra-Help.xml
Module Name: Microsoft.Graph.Entra
online version:
schema: 2.0.0
---

# New-EntraApplicationKey

## SYNOPSIS

Adds a new key to an application.

## SYNTAX

```powershell
New-EntraApplicationKey 
 -ObjectId <String> 
 -KeyCredential <KeyCredential>  
 -PasswordCredential <PasswordCredential>] 
 -Proof <String>
 [<CommonParameters>]
```

## DESCRIPTION

Adds a new key to an application.

## EXAMPLES

### Example 1: Add a key credential to an application

```powershell
Connect-Entra -Scopes 'Application.ReadWrite.All' #Delegated Permission
Connect-Entra -Scopes 'Application.ReadWrite.OwnedBy' #Application Permission

$params = @{
    ObjectId = 'cccccccc-8888-9999-0000-dddddddddddd'
    KeyCredential = @{ key=[System.Convert]::FromBase64String("{base64cert}") }
    PasswordCredential = @{ DisplayName = 'mypassword' }
    Proof = "{token}"
}

New-EntraApplicationKey @params
```

This command adds a key credential the specified application.

## PARAMETERS

### -KeyCredential

The application key credential to add.

NOTES: keyId value should be null.

```yaml
Type: KeyCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ObjectId

The unique identifier of the object specific Microsoft Entra ID object

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

### -PasswordCredential

The application password credential to add.

NOTES: keyId value should be null.

```yaml
Type: PasswordCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Proof

A signed JWT token used as a proof of possession of the existing keys.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### String

### Microsoft.Open.MSGraph.Model.KeyCredential

### Microsoft.Open.MSGraph.Model.PasswordCredential

## OUTPUTS

### Microsoft.Open.MSGraph.Model.KeyCredential

## NOTES

## RELATED LINKS

[Remove-EntraApplicationKey](Remove-EntraApplicationKey.md)

