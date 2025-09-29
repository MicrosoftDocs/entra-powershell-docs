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
            $docFolderName = 'v1.0'
        }
        elseif($ModuleName -eq 'EntraBeta'){
            $docFolderName = 'beta'
        }

        $moduleFolderPath = (Join-Path $PSScriptRoot "../reference/$docFolderName")
        Write-Host "[ModuleFolderPath] $moduleFolderPath" -ForegroundColor 'Green'
        $subModules = @(Get-ChildItem -Path $moduleFolderPath -Directory)
        Write-Host "[subModules] $($subModules.Count)" -ForegroundColor 'Green'

        foreach($subModuleName in $subModules.Name){
            $subModuleFolderPath = (Join-Path $moduleFolderPath $subModuleName)
            Write-Host "[ModuleFolderPath] $subModuleFolderPath" -ForegroundColor 'Green'
            $moduleMetadataFilePath = (Join-Path $subModuleFolderPath "$subModuleName.md")
            New-Item -Path $moduleMetadataFilePath -ItemType File -Force

            $header = @"
---
Download Help Link: https://aka.ms/powershell51-help
Help Version: 5.2.0.0
Locale: en-US
Module Guid: e21be540-4e0b-40dc-a419-8d7912f82b2d
Module Name: $subModuleName
ms.date: 5/29/2024
schema: 2.0.0
title: $subModuleName
---
"@

            $metadataContent = $header + "`n"
            $metadataContent += "# $subModuleName Module v1.1`n`n"
            $metadataContent += "## Description`n`n"
            $metadataContent += "This module contains cmdlets that designed to work with $subModuleName.`n`n"
            $metadataContent += "## $subModuleName Cmdlets`n`n"
            $subModulesDocs = @(Get-ChildItem -Path $subModuleFolderPath -File)

            foreach($subModuleDoc in $subModulesDocs){
                # This prevents adding the module metadata file itself to the list
                # E.g., if the module is "Microsoft.Entra.Users", it won't add "Microsoft.EntraUsers.md" to the list of cmdlets.
                if($subModuleDoc.BaseName -eq $subModuleName) {
                    continue
                }
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