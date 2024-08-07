---
title: Get-EntraBetaUser
description: This article provides details on the Get-EntraBetaUser command.


ms.topic: reference
ms.date: 06/21/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi
manager: CelesteDG
author: msewaweru
external help file: Microsoft.Graph.Entra.Beta-Help.xml
Module Name: Microsoft.Graph.Entra.Beta
online version: https://learn.microsoft.com/powershell/module/Microsoft.Graph.Entra.Beta/Get-EntraBetaUser

schema: 2.0.0
---

# Get-EntraBetaUser

## Synopsis

Gets a user.

## Syntax

### GetQuery (Default)

```powershell
Get-EntraBetaUser
 [-Filter <String>]
 [-All]
 [-Top <Int32>]
 [-Property <String[]>]
 [<CommonParameters>]
```

### GetByValue

```powershell
Get-EntraBetaUser
 [-SearchString <String>]
 [-All]
 [-Property <String[]>]
 [<CommonParameters>]
```

### GetById

```powershell
Get-EntraBetaUser
 -ObjectId <String>
 [-All]
 [-Property <String[]>]
 [<CommonParameters>]
```

## Description

The `Get-EntraBetaUser` cmdlet gets a user from Microsoft Entra ID. Specify the `ObjectId` parameter to get a specific user.

## Examples

### Example 1: Get two users

```powershell
Connect-Entra -Scopes 'User.Read.All','AuditLog.Read.All'
Get-EntraBetaUser -Top 2
```

```Output
DisplayName     Id                                   Mail                                 UserPrincipalName
-----------     --                                   ----                                 -----------------
Conf Room Adams aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb Adams@M365x99297270.OnMicrosoft.com  Adams@M365x99297270.OnMicrosoft.com
Adele Vance     bbbbbbbb-1111-2222-3333-cccccccccccc AdeleV@M365x99297270.OnMicrosoft.com AdeleV@M365x99297270.OnMicrosoft.com
```

This command gets two users.

### Example 2: Get a user by ID

```powershell
Connect-Entra -Scopes 'User.Read.All','AuditLog.Read.All'
Get-EntraBetaUser -ObjectId 'testUpn@tenant.com'
```

```Output
DisplayName Id                                   Mail                                 UserPrincipalName
----------- --                                   ----                                 -----------------
Adele Vance bbbbbbbb-1111-2222-3333-cccccccccccc testUpn@tenant.com testUpn@tenant.com
```

This command gets the specified user.

### Example 3: Search among retrieved users

```powershell
Connect-Entra -Scopes 'User.Read.All','AuditLog.Read.All'
Get-EntraBetaUser -SearchString 'New'
```

```Output
DisplayName        Id                                   Mail UserPrincipalName
-----------        --                                   ---- -----------------
New User88         bbbbbbbb-1111-2222-3333-cccccccccccc      demo99@tenant.com
New User           cccccccc-2222-3333-4444-dddddddddddd      NewUser@tenant.com
```

This cmdlet gets all users that match the value of SearchString against the first characters in DisplayName or UserPrincipalName.

### Example 4: Get a user by userPrincipalName

```powershell
Connect-Entra -Scopes 'User.Read.All','AuditLog.Read.All'
Get-EntraBetaUser -Filter "userPrincipalName eq 'jondoe@contoso.com'"
```

```Output
DisplayName Id                                   Mail UserPrincipalName
----------- --                                   ---- -----------------
New User    cccccccc-2222-3333-4444-dddddddddddd      jondoe@contoso.com
```

This command gets the specified user.

### Example 5: Get a user by userPrincipalName

```powershell
Connect-Entra -Scopes 'User.Read.All','AuditLog.Read.All'
Get-EntraBetaUser -Filter "startswith(DisplayName,'New')"
```

```Output
DisplayName Id                                   Mail UserPrincipalName
----------- --                                   ---- -----------------
New User    cccccccc-2222-3333-4444-dddddddddddd      NewUser@contoso.com
New User88  dddddddd-3333-4444-5555-eeeeeeeeeeee      demo99@contoso.com
```

This command gets all the users whose displayName starts with the word `New`.

## Parameters

### -All

List all pages.

```yaml
Type: System.Management.Automation.SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filter

Specifies an OData v4.0 filter statement.
This parameter controls which objects are returned.
Details on querying with oData can be found here: <https://learn.microsoft.com/graph/aad-advanced-queries?tabs=powershell>
```yaml
Type: System.String
Parameter Sets: GetQuery
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ObjectId

Specifies the ID (as a user principal name (UPN) or ObjectId) of a user in Microsoft Entra ID.

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

### -SearchString

Specifies a search string.

```yaml
Type: System.String
Parameter Sets: GetValue
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Top

Specifies the maximum number of records to return.

```yaml
Type: System.Int32
Parameter Sets: GetQuery
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Property

Specifies properties to be returned

```yaml
Type: System.String[]
Parameter Sets: (All)
Aliases:

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

[New-EntraBetaUser](New-EntraBetaUser.md)

[Remove-EntraBetaUser](Remove-EntraBetaUser.md)

[Set-EntraBetaUser](Set-EntraBetaUser.md)
