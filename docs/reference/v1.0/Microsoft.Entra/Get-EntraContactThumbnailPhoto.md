---
description: This article provides details on the Get-EntraContactThumbnailPhoto command.
external help file: Microsoft.Entra.DirectoryManagement-Help.xml
Locale: en-US
manager: mwongerapk
Module Name: Microsoft.Entra
ms.author: eunicewaweru
ms.date: 06/26/2024
ms.reviewer: stevemutungi
ms.topic: reference
online version: https://learn.microsoft.com/powershell/module/Microsoft.Entra/Get-EntraContactThumbnailPhoto
schema: 2.0.0
title: Get-EntraContactThumbnailPhoto
---

# Get-EntraContactThumbnailPhoto

## SYNOPSIS

Retrieves the thumbnail photo of a contact.

## SYNTAX

```powershell
Get-EntraContactThumbnailPhoto
 -ObjectId <String>
 [-FilePath <String>]
 [-FileName <String>]
 [-View <Boolean>]
 [<CommonParameters>]
```

## DESCRIPTION

Retrieves the thumbnail photo of a contact.

## EXAMPLES

### Example 1: Get the memberships of a contact

```powershell
Connect-Entra -Scopes 'Contacts.Read'
Get-EntraContactThumbnailPhoto -ObjectId 'bbbbbbbb-1111-2222-3333-cccccccccccc'
```

```output
Tag                  :
PhysicalDimension    : {Width=279, Height=390}
Size                 : {Width=279, Height=390}
Width                : 279
Height               : 390
HorizontalResolution : 96
VerticalResolution   : 96
Flags                : 77840
RawFormat            : [ImageFormat: aaaa0000-bb11-2222-33cc-444444dddddd]
PixelFormat          : Format24bppRgb
Palette              : System.Drawing.Imaging.ColorPalette
FrameDimensionsList  : {eeee4444-ff55-6666-77aa-888888bbbbbb}
PropertyIdList       : {274, 305, 306, 36867...}
PropertyItems        : {274, 305, 306, 36867...}
```

This example retrieves the thumbnail photo of the contact object specified with the object ID parameter.

## PARAMETERS

### -FileName

When provided, the cmdlet writes a copy of the thumbnail photo to this filename.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -FilePath

When provided, the cmdlet writes a copy of the thumbnail photo to this file path using a random filename.

```yaml
Type: System.String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -ObjectId

The object ID of the contact for which the thumbnail photo is retrieved.

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

### -View

If this parameter value is set to $True, display the retrieved thumbnail photo in a new window.

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

### System.String

System.Boolean

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS
