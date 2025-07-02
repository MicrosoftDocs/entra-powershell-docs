# ------------------------------------------------------------------------------
#  Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.
# ------------------------------------------------------------------------------

function Create-DocsMetadata {
    [cmdletbinding()]
    param(
        [string]
        $ModuleName = 'Entra'  # Default to "Entra" if no argument is provided
    )

    PROCESS { 

        if($ModuleName -eq 'Entra'){
            $rootModuleName = 'Microsoft.Entra'
            $docFolderName = 'v1.0/Microsoft.Entra'
        }
        elseif($ModuleName -eq 'EntraBeta'){
            $rootModuleName = 'Microsoft.Entra.Beta'
            $docFolderName = 'beta/Microsoft.Entra.Beta'
        }

        $moduleFolderPath = (Join-Path $PSScriptRoot "../reference/$docFolderName")
        Write-Host "[ModuleFolderPath] $moduleFolderPath" -ForegroundColor 'Green'
        $subModules = @(Get-ChildItem -Path $moduleFolderPath -Directory)
        Write-Host "[subModules] $($subModules.Count)" -ForegroundColor 'Green'

        foreach($subModuleName in $subModules.Name){
            $fullModuleName = $rootModuleName + '.' + $subModuleName
            $subModuleFolderPath = (Join-Path $moduleFolderPath $subModuleName)
            Write-Host "[ModuleFolderPath] $subModuleFolderPath" -ForegroundColor 'Green'
            $moduleMetadataFilePath = (Join-Path $subModuleFolderPath "$fullModuleName.md")
            New-Item -Path $moduleMetadataFilePath -ItemType File -Force

            $header = @"
---
Download Help Link: https://aka.ms/powershell51-help
Help Version: 5.2.0.0
Locale: en-US
Module Guid: e21be540-4e0b-40dc-a419-8d7912f82b2d
Module Name: $fullModuleName
ms.date: 5/29/2024
schema: 2.0.0
title: $fullModuleName
---
"@

            $metadataContent = $header + "`n"
            $metadataContent += "# $fullModuleName Module v1.1`n`n"
            $metadataContent += "## Description`n`n"
            $metadataContent += "This module contains cmdlets that designed to work with $fullModuleName.`n`n"
            $metadataContent += "## $fullModuleName Cmdlets`n`n"
            $subModulesDocs = @(Get-ChildItem -Path $subModuleFolderPath -File)

            foreach($subModuleDoc in $subModulesDocs){
                $file = $subModuleDoc.FullName
                $regex = '(?sm).*^## Synopsis\r?\n(.*?)\r?\n## Syntax.*'
                $description = (Get-Content -Raw $file) -replace $regex, '$1'

                $metadataContent += "### [$($subModuleDoc.BaseName)]($($subModuleDoc.Name))`n"
                $metadataContent += "$description`n"
            }

            $metadataContent | Out-File -FilePath $moduleMetadataFilePath -Encoding utf8
        }
    }
}