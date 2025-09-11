# ------------------------------------------------------------------------------	
#  Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.	
# ------------------------------------------------------------------------------	

function Migrate-DocsToSubfolders {	
    [cmdletbinding()]	
    param(	
        [string]	
        $ModuleName = 'Entra'  # Default to "Entra" if no argument is provided	
    )	

    PROCESS {   	

        if($ModuleName -eq 'Entra'){	
            $rootModuleName = 'Microsoft.Entra'	
            $docFolderName = 'v1.0/Microsoft.Entra'	
            $mappingFile = './Entra-ModuleMapping.json'	
            $subModules = @('Authentication', 'Applications', 'DirectoryManagement', 'Governance', 'Groups', 'Users', 'Reports', 'SignIns', 'CertificateBasedAuthentication')	
        }	
        elseif($ModuleName -eq 'EntraBeta'){	
            $rootModuleName = 'Microsoft.Entra.Beta'	
            $docFolderName = 'beta/Microsoft.Entra.Beta'	
            $mappingFile = 'EntraBeta-ModuleMapping.json'	
            $subModules = @('Authentication', 'Applications', 'DirectoryManagement', 'Governance', 'Groups', 'Users', 'Reports', 'SignIns', 'NetworkAccess')	
        }	

        $moduleFolderPath = (Join-Path $PSScriptRoot "../reference/$docFolderName")	
        Write-Host "[ModuleFolderPath] $moduleFolderPath" -ForegroundColor 'Green'	
        $moduleDocs = @(Get-ChildItem -Path $moduleFolderPath -File)	
        Write-Host "[Docs Total] $($moduleDocs.Count)" -ForegroundColor 'Green'	

        # Create sub module folders if they do not exist	
        foreach($subModuleName in $subModules){	
            $subModuleFolderPath = (Join-Path $moduleFolderPath $subModuleName)	
            if(-not (Test-Path -Path $subModuleFolderPath)){	
                Write-Host "[Creating SubModule Folder] $subModuleFolderPath" -ForegroundColor 'Green'	
                New-Item -Path $subModuleFolderPath -ItemType Directory -Force | Out-Null	
            }	
        }	

        # Read mapping file	
        $mappingFilePath = (Join-Path $PSScriptRoot $mappingFile)	
        if(-not (Test-Path -Path $mappingFilePath)){ 	
            Write-Host "[Error] Mapping file not found: $mappingFilePath" -ForegroundColor 'Red'	
            return	
        }	

        $jsonContent = Get-Content -Path $mappingFilePath -Raw | ConvertFrom-Json	
        if(-not $jsonContent){	
            Write-Host "[Error] Failed to read mapping file: $mappingFilePath" -ForegroundColor 'Red'	
            return	
        }	
        foreach ($key in $jsonContent.PSObject.Properties.Name) {	
            $destinationFolderPath = (Join-Path $moduleFolderPath $jsonContent.$key)	
            $sourceFilePath = (Join-Path $moduleFolderPath "$key.md")	
            Copy-Item -Path $sourceFilePath -Destination $destinationFolderPath	
        }	
    }	
}