---
title: Get-EntraUserExtension
description: This article provides details on the Get-EntraUserExtension command.


ms.topic: reference
ms.date: 06/26/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG
author: msewaweru
external help file: Microsoft.Entra.Users-Help.xml
Module Name: Microsoft.Entra
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra/Get-EntraUserExtension

schema: 2.0.0
---

# Get-EntraUserExtension

## Synopsis

Gets a user extension.

## Syntax

```powershell
Get-EntraUserExtension
 -UserId <String>
 [-Property <String[]>]
 [<CommonParameters>]
```

## Description

The Get-EntraUserExtension cmdlet gets a user extension in Microsoft Entra ID.

## Examples

### Example 1: Retrieve extension attributes for a user

```powershell
Connect-Entra -Scopes 'User.Read'
Get-EntraUserExtension -UserId 'SawyerM@contoso.com'
```

```Output
onPremisesDistinguishedName :
@odata.context              : https://graph.microsoft.com/v1.0/$metadata#users(identities,onPremisesDistinguishedName,employeeId,createdDateTime)/$entity
createdDateTime             : 18/07/2024 05:13:40
employeeId                  :
identities                  : {@{signInType=userPrincipalName; issuerAssignedId=SawyerM@contoso.com; issuer=SawyerM@contoso.com}}
userIdentities              : {@{signInType=userPrincipalName; issuerAssignedId=SawyerM@contoso.com; issuer=SawyerM@contoso.com}}
```

This example shows how to retrieve the extension attributes for a specified user.

- `-UserId` parameter specifies the user object Id.

## Parameters

### -UserId

Specifies the ID of an object.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases: ObjectId, UPN, Identity, UserPrincipalName

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Property

Specifies properties to be returned.

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases: Select

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters

This cmdlet supports the common parameters: `-Debug`, `-ErrorAction`, `-ErrorVariable`, `-InformationAction`, `-InformationVariable`, `-OutVariable`, `-OutBuffer`, `-PipelineVariable`, `-Verbose`, `-WarningAction`, and `-WarningVariable`. For more information, see [about_CommonParameters](https://go.microsoft.com/fwlink/?LinkID=113216).

## Inputs

## Outputs

## Notes

## Related Links

[Get-EntraUser](Get-EntraUser.md)

[Remove-EntraUserExtension](Remove-EntraUserExtension.md)

[Set-EntraUserExtension](Set-EntraUserExtension.md)
