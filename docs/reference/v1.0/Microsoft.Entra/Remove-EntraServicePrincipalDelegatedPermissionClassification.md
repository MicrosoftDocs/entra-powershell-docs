---
author: msewaweru
description: This article provides details on the Remove-EntraServicePrincipalDelegatedPermissionClassification command.
external help file: Microsoft.Entra.Applications-Help.xml
Locale: en-US
manager: mwongerapk
Module Name: Microsoft.Entra
ms.author: eunicewaweru
ms.date: 06/26/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra/Remove-EntraServicePrincipalDelegatedPermissionClassification
schema: 2.0.0
title: Remove-EntraServicePrincipalDelegatedPermissionClassification
---

# Remove-EntraServicePrincipalDelegatedPermissionClassification

## SYNOPSIS

Remove delegated permission classification.

## SYNTAX

```powershell
Remove-EntraServicePrincipalDelegatedPermissionClassification
 -ServicePrincipalId <String>
 -Id <String>
 [<CommonParameters>]
```

## DESCRIPTION

The `Remove-EntraServicePrincipalDelegatedPermissionClassification` cmdlet deletes the given delegated permission classification by Id from service principal.

## EXAMPLES

### Example 1: Remove a delegated permission classification

```powershell
Connect-Entra -Scopes 'Policy.ReadWrite.PermissionGrant'
$servicePrincipal = Get-EntraServicePrincipal -Filter "displayName eq 'Helpdesk Application'"
$permissionClassification = Get-EntraServicePrincipalDelegatedPermissionClassification -ServicePrincipalId $servicePrincipal.Id | Where-Object {$_.PermissionName -eq 'Sites.Read.All'}
Remove-EntraServicePrincipalDelegatedPermissionClassification -ServicePrincipalId $servicePrincipal.Id -Id $permissionClassification.Id
```

This command deletes the delegated permission classification by Id from the service principal.

- `-ServicePrincipalId` parameter specifies the unique identifier of a service principal.
- `-Id` parameter specifies the unique identifier of a delegated permission classification object Id.

## PARAMETERS

### -ServicePrincipalId

The unique identifier of a service principal object in Microsoft Entra ID.

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

### -Id

The unique identifier of a delegated permission classification object Id.

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

## OUTPUTS

## NOTES

## RELATED LINKS

[Get-EntraServicePrincipalDelegatedPermissionClassification](Get-EntraServicePrincipalDelegatedPermissionClassification.md)

[Add-EntraServicePrincipalDelegatedPermissionClassification](Add-EntraServicePrincipalDelegatedPermissionClassification.md)
