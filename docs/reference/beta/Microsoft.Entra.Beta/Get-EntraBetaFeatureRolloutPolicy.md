---
author: msewaweru
description: This article provides details on the Get-EntraBetaFeatureRolloutPolicy command.
external help file: Microsoft.Entra.Beta.SignIns-Help.xml
Locale: en-US
manager: mwongerapk
Module Name: Microsoft.Entra.Beta
ms.author: eunicewaweru
ms.date: 07/04/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra.Beta/Get-EntraBetaFeatureRolloutPolicy
schema: 2.0.0
title: Get-EntraBetaFeatureRolloutPolicy
---

# Get-EntraBetaFeatureRolloutPolicy

## SYNOPSIS

Gets the policy for cloud authentication roll-out in Microsoft Entra ID.

## SYNTAX

### GetQuery (Default)

```powershell
Get-EntraBetaFeatureRolloutPolicy
 [-Filter <String>]
 [-Property <String[]>]
 [<CommonParameters>]
```

### GetVague

```powershell
Get-EntraBetaFeatureRolloutPolicy
 [-SearchString <String>]
 [-Property <String[]>]
 [<CommonParameters>]
```

### GetById

```powershell
Get-EntraBetaFeatureRolloutPolicy
 -Id <String>
 [-Property <String[]>]
 [<CommonParameters>]
```

## DESCRIPTION

The `Get-EntraBetaFeatureRolloutPolicy` cmdlet allows an admin to get the policy for cloud authentication rollout (users moving from federation to cloud auth) in Microsoft Entra ID.
This policy consists of one or two FeatureRolloutPolicy objects. These objects hold the groups assigned for cloud authentication (Pass-through authentication or Password Hash Sync) and groups assigned for Seamless single sign-on.

## EXAMPLES

### Example 1: Retrieves a list of all cloud authentication roll-out in Microsoft Entra ID

```powershell
Connect-Entra -Scopes 'Directory.ReadWrite.All'
Get-EntraBetaFeatureRolloutPolicy
```

```Output
Id                                   Description            DisplayName                Feature            IsAppliedToOrganization IsEnabled
--                                   -----------            -----------                -------            ----------------------- ---------
00aa00aa-bb11-cc22-dd33-44ee44ee44ee Feature-Rollout-test   Feature-Rollout-Policytest passwordHashSync   False                   True
11bb11bb-cc22-dd33-ee44-55ff55ff55ff Feature-Rollout-Policy change                     emailAsAlternateId False                   False
```

This command retrieves a list of all cloud authentication roll-out policies in Microsoft Entra ID.

### Example 2: Retrieves cloud authentication roll-out in Microsoft Entra ID with given ID

```powershell
Connect-Entra -Scopes 'Directory.ReadWrite.All'
$policy = Get-EntraBetaFeatureRolloutPolicy -Filter "DisplayName eq 'FeatureRolloutPolicy'"
Get-EntraBetaFeatureRolloutPolicy -Id $policy.Id
```

```Output
Id                                   Description          DisplayName                Feature          IsAppliedToOrganization IsEnabled
--                                   -----------          -----------                -------          ----------------------- ---------
11bb11bb-cc22-dd33-ee44-55ff55ff55ff Feature-Rollout-test Feature-Rollout-Policytest passwordHashSync False                   True
```

This example retrieves the policy for cloud authentication roll-out policy in Microsoft Entra ID.

- `-Id` - Specify The unique identifier of the cloud authentication roll-out policy in Microsoft Entra ID.

### Example 3: Retrieves cloud authentication roll-out in Microsoft Entra ID with given Search String

```powershell
Connect-Entra -Scopes 'Directory.ReadWrite.All'
Get-EntraBetaFeatureRolloutPolicy -SearchString 'Feature-Rollout-Policytest'
```

```Output
Id                                   Description          DisplayName                Feature          IsAppliedToOrganization IsEnabled
--                                   -----------          -----------                -------          ----------------------- ---------
11bb11bb-cc22-dd33-ee44-55ff55ff55ff Feature-Rollout-test Feature-Rollout-Policytest passwordHashSync False      
```

This command retrieves the policy for cloud authentication roll-out policy in Microsoft Entra ID.

### Example 4: Retrieves cloud authentication roll-out in Microsoft Entra ID with given Filter parameter

```powershell
Connect-Entra -Scopes 'Directory.ReadWrite.All'
Get-EntraBetaFeatureRolloutPolicy -Filter "DisplayName eq 'Feature-Rollout-Policytest'"
```

```Output
Id                                   Description          DisplayName                Feature          IsAppliedToOrganization IsEnabled
--                                   -----------          -----------                -------          ----------------------- ---------
11bb11bb-cc22-dd33-ee44-55ff55ff55ff Feature-Rollout-test Feature-Rollout-Policytest passwordHashSync False      
```

This command retrieves the policy for cloud authentication roll-out policy in Microsoft Entra ID.

## PARAMETERS

### -Id

The unique identifier of the cloud authentication roll-out policy in Microsoft Entra ID.

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
Parameter Sets: GetVague
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Filter

Specifies an OData v4.0 filter statement.
Controls which objects are returned.

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

## INPUTS

## OUTPUTS

### Microsoft.Online.Administration.MsFeatureRolloutPolicy

## NOTES

## RELATED LINKS

[New-EntraBetaFeatureRolloutPolicy](New-EntraBetaFeatureRolloutPolicy.md)

[Set-EntraBetaFeatureRolloutPolicy](Set-EntraBetaFeatureRolloutPolicy.md)

[Remove-EntraBetaFeatureRolloutPolicy](Remove-EntraBetaFeatureRolloutPolicy.md)
