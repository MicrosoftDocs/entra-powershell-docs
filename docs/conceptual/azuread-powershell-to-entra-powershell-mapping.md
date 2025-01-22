---
title: "Azure AD PowerShell to Microsoft Entra PowerShell cmdlet map"
description: "Find the equivalents of Azure AD PowerShell cmdlets in Microsoft Entra PowerShell."

ms.topic: reference
ms.date: 01/13/2025
author: msewaweru
manager: CelesteDG
ms.author: eunicewaweru
ms.reviewer: stevemutungi
zone_pivot_groups: entra-powershell-legacy-modules
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json

#customer intent: As a Microsoft Entra PowerShell user, I want to find the equivalents of Azure AD PowerShell cmdlets in Microsoft Entra PowerShell.
---
# Find Azure AD PowerShell and MSOnline cmdlets in Microsoft Entra PowerShell

The Microsoft Entra PowerShell module is over 98% compatible with the Azure AD and Azure AD Preview PowerShell modules. Additionally, it provides parity for MSOnline cmdlets that weren't migrated to Azure AD PowerShell. Use this page to find the equivalent cmdlets in Microsoft Entra PowerShell for the cmdlets you used in the Azure AD, Azure AD Preview, and MSOnline PowerShell modules.

:::zone pivot="azure-ad-powershell"

## Azure AD PowerShell to Microsoft Entra PowerShell

|Azure AD PowerShell cmdlet|Microsoft Entra PowerShell cmdlet|
|--------------------------|---------------------------------|
| Add-AzureADMSAdministrativeUnitMember | [Add-EntraAdministrativeUnitMember](/powershell/module/microsoft.entra/Add-EntraAdministrativeUnitMember)|
| Add-AzureADApplicationOwner, Add-AzureADMSApplicationOwner | [Add-EntraApplicationOwner](/powershell/module/microsoft.entra/Add-EntraApplicationOwner)|
| Add-AzureADDeviceRegisteredOwner | [Add-EntraDeviceRegisteredOwner](/powershell/module/microsoft.entra/Add-EntraDeviceRegisteredOwner)|
| Add-AzureADDeviceRegisteredUser | [Add-EntraDeviceRegisteredUser](/powershell/module/microsoft.entra/Add-EntraDeviceRegisteredUser)|
| Add-AzureADDirectoryRoleMember | [Add-EntraDirectoryRoleMember](/powershell/module/microsoft.entra/Add-EntraDirectoryRoleMember)|
| Add-AzureADEnvironment | [Add-EntraEnvironment](/powershell/module/microsoft.entra/Add-EntraEnvironment)|
| Add-AzureADGroupMember | [Add-EntraGroupMember](/powershell/module/microsoft.entra/Add-EntraGroupMember)|
| Add-AzureADGroupOwner | [Add-EntraGroupOwner](/powershell/module/microsoft.entra/Add-EntraGroupOwner)|
| Add-AzureADMSLifecyclePolicyGroup | [Add-EntraLifecyclePolicyGroup](/powershell/module/microsoft.entra/Add-EntraLifecyclePolicyGroup)|
| Add-AzureADMSScopedRoleMembership | [Add-EntraScopedRoleMembership](/powershell/module/microsoft.entra/Add-EntraScopedRoleMembership)|
| Add-AzureADMSServicePrincipalDelegatedPermissionClassification | [Add-EntraServicePrincipalDelegatedPermissionClassification](/powershell/module/microsoft.entra/Add-EntraServicePrincipalDelegatedPermissionClassification)|
| Add-AzureADServicePrincipalOwner | [Add-EntraServicePrincipalOwner](/powershell/module/microsoft.entra/Add-EntraServicePrincipalOwner)|
| Confirm-AzureADDomain | [Confirm-EntraDomain](/powershell/module/microsoft.entra/Confirm-EntraDomain)|
| Connect-AzureAD | [Connect-Entra](/powershell/module/microsoft.entra/Connect-Entra)|
| Disconnect-AzureAD | [Disconnect-Entra](/powershell/module/microsoft.entra/Disconnect-Entra)|
| Enable-AzureADDirectoryRole | [Enable-EntraDirectoryRole](/powershell/module/microsoft.entra/Enable-EntraDirectoryRole)|
| Get-CrossCloudVerificationCode | [Get-CrossCloudVerificationCode](/powershell/module/microsoft.entra/Get-CrossCloudVerificationCode)|
| Get-AzureADMSAdministrativeUnit | [Get-EntraAdministrativeUnit](/powershell/module/microsoft.entra/Get-EntraAdministrativeUnit)|
| Get-AzureADMSAdministrativeUnitMember | [Get-EntraAdministrativeUnitMember](/powershell/module/microsoft.entra/Get-EntraAdministrativeUnitMember)|
| Get-AzureADApplication, Get-AzureADMSApplication | [Get-EntraApplication](/powershell/module/microsoft.entra/Get-EntraApplication)|
| Get-AzureADApplicationExtensionProperty, Get-AzureADMSApplicationExtensionProperty | [Get-EntraApplicationExtensionProperty](/powershell/module/microsoft.entra/Get-EntraApplicationExtensionProperty)|
| Get-AzureADApplicationKeyCredential | [Get-EntraApplicationKeyCredential](/powershell/module/microsoft.entra/Get-EntraApplicationKeyCredential)|
| Get-AzureADApplicationLogo | [Get-EntraApplicationLogo](/powershell/module/microsoft.entra/Get-EntraApplicationLogo)|
| Get-AzureADApplicationOwner, Get-AzureADMSApplicationOwner | [Get-EntraApplicationOwner](/powershell/module/microsoft.entra/Get-EntraApplicationOwner)|
| Get-AzureADApplicationPasswordCredential | [Get-EntraApplicationPasswordCredential](/powershell/module/microsoft.entra/Get-EntraApplicationPasswordCredential)|
| Get-AzureADApplicationProxyApplication |[Get-EntraBetaApplicationProxyApplication](/powershell/module/microsoft.entra.beta/get-entrabetaapplicationproxyapplication) |
| Get-AzureADApplicationProxyApplicationConnectorGroup |[Get-EntraBetaApplicationProxyApplicationConnectorGroup](/powershell/module/microsoft.entra.beta/get-entrabetaapplicationproxyapplicationconnectorgroup) |
| Get-AzureADApplicationProxyConnector |[Get-EntraBetaApplicationProxyConnector](/powershell/module/microsoft.entra.beta/get-entrabetaapplicationproxyconnector)|
| Get-AzureADApplicationProxyConnectorGroup |[Get-EntraBetaApplicationProxyConnectorGroup](/powershell/module/microsoft.entra.beta/get-entrabetaapplicationproxyconnectorgroup) |
| Get-AzureADApplicationProxyConnectorGroupMember | |
| Get-AzureADApplicationProxyConnectorGroupMembers |[Get-EntraBetaApplicationProxyConnectorGroupMembers](/powershell/module/microsoft.entra.beta/get-entrabetaapplicationproxyconnectorgroupmembers) |
| Get-AzureADApplicationProxyConnectorMemberOf |[Get-EntraBetaApplicationProxyConnectorMemberOf](/powershell/module/microsoft.entra.beta/get-entrabetaapplicationproxyconnectormemberof) |
| Get-AzureADApplicationServiceEndpoint | [Get-EntraApplicationServiceEndpoint](/powershell/module/microsoft.entra/Get-EntraApplicationServiceEndpoint)|
| Get-AzureADMSAuthorizationPolicy | [Get-EntraAuthorizationPolicy](/powershell/module/microsoft.entra/Get-EntraAuthorizationPolicy)|
| Get-AzureADMSConditionalAccessPolicy | [Get-EntraConditionalAccessPolicy](/powershell/module/microsoft.entra/Get-EntraConditionalAccessPolicy)|
| Get-AzureADContact | [Get-EntraContact](/powershell/module/microsoft.entra/Get-EntraContact)|
| Get-AzureADContactDirectReport | [Get-EntraContactDirectReport](/powershell/module/microsoft.entra/Get-EntraContactDirectReport)|
| Get-AzureADContactManager | [Get-EntraContactManager](/powershell/module/microsoft.entra/Get-EntraContactManager)|
| Get-AzureADContactMembership | [Get-EntraContactMembership](/powershell/module/microsoft.entra/Get-EntraContactMembership)|
| Get-AzureADContactThumbnailPhoto | [Get-EntraContactThumbnailPhoto](/powershell/module/microsoft.entra/Get-EntraContactThumbnailPhoto)|
| Get-AzureADContract | [Get-EntraContract](/powershell/module/microsoft.entra/Get-EntraContract)|
| Get-AzureADCurrentSessionInfo | [Get-EntraContext](/powershell/module/microsoft.entra/get-entracontext)|
| Get-AzureADDeletedApplication | [Get-EntraDeletedApplication](/powershell/module/microsoft.entra/Get-EntraDeletedApplication)|
| Get-AzureADMSDeletedDirectoryObject | [Get-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra/Get-EntraDeletedDirectoryObject)|
| Get-AzureADMSDeletedGroup | [Get-EntraDeletedGroup](/powershell/module/microsoft.entra/Get-EntraDeletedGroup)|
| Get-AzureADDevice | [Get-EntraDevice](/powershell/module/microsoft.entra/Get-EntraDevice)|
| Get-AzureADDeviceRegisteredOwner | [Get-EntraDeviceRegisteredOwner](/powershell/module/microsoft.entra/Get-EntraDeviceRegisteredOwner)|
| Get-AzureADDeviceRegisteredUser | [Get-EntraDeviceRegisteredUser](/powershell/module/microsoft.entra/Get-EntraDeviceRegisteredUser)|
| Get-AzureADDirectoryRole | [Get-EntraDirectoryRole](/powershell/module/microsoft.entra/Get-EntraDirectoryRole)|
| Get-AzureADDirectoryRoleMember | [Get-EntraDirectoryRoleMember](/powershell/module/microsoft.entra/Get-EntraDirectoryRoleMember)|
| Get-AzureADDirectoryRoleTemplate | [Get-EntraDirectoryRoleTemplate](/powershell/module/microsoft.entra/Get-EntraDirectoryRoleTemplate)|
| Get-AzureADDomain | [Get-EntraDomain](/powershell/module/microsoft.entra/Get-EntraDomain)|
| Get-AzureADDomainNameReference | [Get-EntraDomainNameReference](/powershell/module/microsoft.entra/Get-EntraDomainNameReference)|
| Get-AzureADDomainServiceConfigurationRecord | [Get-EntraDomainServiceConfigurationRecord](/powershell/module/microsoft.entra/Get-EntraDomainServiceConfigurationRecord)|
| Get-AzureADDomainVerificationDnsRecord | [Get-EntraDomainVerificationDnsRecord](/powershell/module/microsoft.entra/Get-EntraDomainVerificationDnsRecord)|
| Get-AzureADExtensionProperty | [Get-EntraExtensionProperty](/powershell/module/microsoft.entra/Get-EntraExtensionProperty)|
| Get-AzureADGroup, Get-AzureADMSGroup | [Get-EntraGroup](/powershell/module/microsoft.entra/Get-EntraGroup)|
| Get-AzureADGroupAppRoleAssignment | [Get-EntraGroupAppRoleAssignment](/powershell/module/microsoft.entra/Get-EntraGroupAppRoleAssignment)|
| Get-AzureADMSGroupLifecyclePolicy | [Get-EntraGroupLifecyclePolicy](/powershell/module/microsoft.entra/Get-EntraGroupLifecyclePolicy)|
| Get-AzureADGroupMember | [Get-EntraGroupMember](/powershell/module/microsoft.entra/Get-EntraGroupMember)|
| Get-AzureADGroupOwner | [Get-EntraGroupOwner](/powershell/module/microsoft.entra/Get-EntraGroupOwner)|
| Get-AzureADMSGroupPermissionGrant | [Get-EntraGroupPermissionGrant](/powershell/module/microsoft.entra/Get-EntraGroupPermissionGrant)|
| Get-AzureADMSIdentityProvider | [Get-EntraIdentityProvider](/powershell/module/microsoft.entra/Get-EntraIdentityProvider)|
| Get-AzureADMSLifecyclePolicyGroup | [Get-EntraLifecyclePolicyGroup](/powershell/module/microsoft.entra/Get-EntraLifecyclePolicyGroup)|
| Get-AzureADMSNamedLocationPolicy | [Get-EntraNamedLocationPolicy](/powershell/module/microsoft.entra/Get-EntraNamedLocationPolicy)|
| Get-AzureADOAuth2PermissionGrant | [Get-EntraOAuth2PermissionGrant](/powershell/module/microsoft.entra/Get-EntraOAuth2PermissionGrant)|
| Get-AzureADObjectByObjectId | [Get-EntraObjectByObjectId](/powershell/module/microsoft.entra/Get-EntraObjectByObjectId)|
| Get-AzureADMSPermissionGrantConditionSet | [Get-EntraPermissionGrantConditionSet](/powershell/module/microsoft.entra/Get-EntraPermissionGrantConditionSet)|
| Get-AzureADMSPermissionGrantPolicy | [Get-EntraPermissionGrantPolicy](/powershell/module/microsoft.entra/Get-EntraPermissionGrantPolicy)|
| Get-AzureADMSRoleAssignment | [Get-EntraDirectoryRoleAssignment](/powershell/module/microsoft.entra/get-entradirectoryroleassignment)|
| Get-AzureADMSRoleDefinition | [Get-EntraDirectoryRoleDefinition](/powershell/module/microsoft.entra/get-entradirectoryroledefinition)|
| Get-AzureADMSScopedRoleMembership | [Get-EntraScopedRoleMembership](/powershell/module/microsoft.entra/Get-EntraScopedRoleMembership)|
| Get-AzureADServiceAppRoleAssignedTo | [Get-EntraServicePrincipalAppRoleAssignedTo](/powershell/module/microsoft.entra/get-entraserviceprincipalapproleassignedto)|
| Get-AzureADServiceAppRoleAssignment | [Get-EntraServicePrincipalAppRoleAssignment](/powershell/module/microsoft.entra/get-entraserviceprincipalapproleassignment)|
| Get-AzureADServicePrincipal | [Get-EntraServicePrincipal](/powershell/module/microsoft.entra/Get-EntraServicePrincipal)|
| Get-AzureADServicePrincipalCreatedObject | [Get-EntraServicePrincipalCreatedObject](/powershell/module/microsoft.entra/Get-EntraServicePrincipalCreatedObject)|
| Get-AzureADMSServicePrincipalDelegatedPermissionClassification | [Get-EntraServicePrincipalDelegatedPermissionClassification](/powershell/module/microsoft.entra/Get-EntraServicePrincipalDelegatedPermissionClassification)|
| Get-AzureADServicePrincipalKeyCredential | [Get-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra/Get-EntraServicePrincipalKeyCredential)|
| Get-AzureADServicePrincipalMembership | [Get-EntraServicePrincipalMembership](/powershell/module/microsoft.entra/Get-EntraServicePrincipalMembership)|
| Get-AzureADServicePrincipalOAuth2PermissionGrant | [Get-EntraServicePrincipalOAuth2PermissionGrant](/powershell/module/microsoft.entra/Get-EntraServicePrincipalOAuth2PermissionGrant)|
| Get-AzureADServicePrincipalOwnedObject | [Get-EntraServicePrincipalOwnedObject](/powershell/module/microsoft.entra/Get-EntraServicePrincipalOwnedObject)|
| Get-AzureADServicePrincipalOwner | [Get-EntraServicePrincipalOwner](/powershell/module/microsoft.entra/Get-EntraServicePrincipalOwner)|
| Get-AzureADServicePrincipalPasswordCredential | [Get-EntraServicePrincipalPasswordCredential](/powershell/module/microsoft.entra/Get-EntraServicePrincipalPasswordCredential)|
| Get-AzureADSubscribedSku | [Get-EntraSubscribedSku](/powershell/module/microsoft.entra/Get-EntraSubscribedSku)|
| Get-AzureADTenantDetail | [Get-EntraTenantDetail](/powershell/module/microsoft.entra/Get-EntraTenantDetail)|
| Get-AzureADTrustedCertificateAuthority | [Get-EntraTrustedCertificateAuthority](/powershell/module/microsoft.entra/Get-EntraTrustedCertificateAuthority)|
| Get-AzureADMSUnsupportedCommand | [Get-EntraUnsupportedCommand](/powershell/module/microsoft.entra/Get-EntraUnsupportedCommand)|
| Get-AzureADUser | [Get-EntraUser](/powershell/module/microsoft.entra/Get-EntraUser)|
| Get-AzureADUserAppRoleAssignment | [Get-EntraUserAppRoleAssignment](/powershell/module/microsoft.entra/Get-EntraUserAppRoleAssignment)|
| Get-AzureADUserCreatedObject | [Get-EntraUserCreatedObject](/powershell/module/microsoft.entra/Get-EntraUserCreatedObject)|
| Get-AzureADUserDirectReport | [Get-EntraUserDirectReport](/powershell/module/microsoft.entra/Get-EntraUserDirectReport)|
| Get-AzureADUserExtension | [Get-EntraUserExtension](/powershell/module/microsoft.entra/Get-EntraUserExtension)|
| Get-AzureADUserLicenseDetail | [Get-EntraUserLicenseDetail](/powershell/module/microsoft.entra/Get-EntraUserLicenseDetail)|
| Get-AzureADUserManager | [Get-EntraUserManager](/powershell/module/microsoft.entra/Get-EntraUserManager)|
| Get-AzureADUserMembership | [Get-EntraUserMembership](/powershell/module/microsoft.entra/Get-EntraUserMembership)|
| Get-AzureADUserOAuth2PermissionGrant | [Get-EntraUserOAuth2PermissionGrant](/powershell/module/microsoft.entra/Get-EntraUserOAuth2PermissionGrant)|
| Get-AzureADUserOwnedDevice | [Get-EntraUserOwnedDevice](/powershell/module/microsoft.entra/Get-EntraUserOwnedDevice)|
| Get-AzureADUserOwnedObject | [Get-EntraUserOwnedObject](/powershell/module/microsoft.entra/Get-EntraUserOwnedObject)|
| Get-AzureADUserRegisteredDevice | [Get-EntraUserRegisteredDevice](/powershell/module/microsoft.entra/Get-EntraUserRegisteredDevice)|
| Get-AzureADUserThumbnailPhoto | [Get-EntraUserThumbnailPhoto](/powershell/module/microsoft.entra/Get-EntraUserThumbnailPhoto)|
| New-AzureADMSAdministrativeUnit | [New-EntraAdministrativeUnit](/powershell/module/microsoft.entra/New-EntraAdministrativeUnit)|
| New-AzureADApplication, New-AzureADMSApplication | [New-EntraApplication](/powershell/module/microsoft.entra/New-EntraApplication)|
| New-AzureADApplicationExtensionProperty, New-AzureADMSApplicationExtensionProperty | [New-EntraApplicationExtensionProperty](/powershell/module/microsoft.entra/New-EntraApplicationExtensionProperty)|
| New-AzureADMSApplicationKey | [New-EntraApplicationKey](/powershell/module/microsoft.entra/New-EntraApplicationKey)|
| New-AzureADApplicationKeyCredential | [New-EntraApplicationKeyCredential](/powershell/module/microsoft.entra/New-EntraApplicationKeyCredential)|
| New-AzureADMSApplicationPassword | [New-EntraApplicationPassword](/powershell/module/microsoft.entra/New-EntraApplicationPassword)|
| New-AzureADApplicationPasswordCredential | [New-EntraApplicationPasswordCredential](/powershell/module/microsoft.entra/New-EntraApplicationPasswordCredential)|
| New-AzureADApplicationProxyApplication |[New-EntraBetaApplicationProxyApplication](/powershell/module/microsoft.entra.beta/new-entrabetaapplicationproxyapplication) |
| New-AzureADApplicationProxyConnectorGroup |[New-EntraBetaApplicationProxyConnectorGroup](/powershell/module/microsoft.entra.beta/new-entrabetaapplicationproxyconnectorgroup) |
| New-AzureADMSConditionalAccessPolicy | [New-EntraConditionalAccessPolicy](/powershell/module/microsoft.entra/New-EntraConditionalAccessPolicy)|
| New-AzureADDevice | [New-EntraDevice](/powershell/module/microsoft.entra/New-EntraDevice)|
| New-AzureADDomain | [New-EntraDomain](/powershell/module/microsoft.entra/New-EntraDomain)|
| New-AzureADGroup, New-AzureADMSGroup | [New-EntraGroup](/powershell/module/microsoft.entra/New-EntraGroup)|
| New-AzureADGroupAppRoleAssignment | [New-EntraGroupAppRoleAssignment](/powershell/module/microsoft.entra/New-EntraGroupAppRoleAssignment)|
| New-AzureADMSGroupLifecyclePolicy | [New-EntraGroupLifecyclePolicy](/powershell/module/microsoft.entra/New-EntraGroupLifecyclePolicy)|
| New-AzureADMSIdentityProvider | [New-EntraIdentityProvider](/powershell/module/microsoft.entra/New-EntraIdentityProvider)|
| New-AzureADMSInvitation | [New-EntraInvitation](/powershell/module/microsoft.entra/New-EntraInvitation)|
| New-AzureADMSNamedLocationPolicy | [New-EntraNamedLocationPolicy](/powershell/module/microsoft.entra/New-EntraNamedLocationPolicy)|
| New-AzureADMSPermissionGrantConditionSet | [New-EntraPermissionGrantConditionSet](/powershell/module/microsoft.entra/New-EntraPermissionGrantConditionSet)|
| New-AzureADMSPermissionGrantPolicy | [New-EntraPermissionGrantPolicy](/powershell/module/microsoft.entra/New-EntraPermissionGrantPolicy)|
| New-AzureADMSRoleAssignment | [New-EntraDirectoryRoleAssignment](/powershell/module/microsoft.entra/new-entradirectoryroleassignment)|
| New-AzureADMSRoleDefinition | [New-EntraDirectoryRoleDefinition](/powershell/module/microsoft.entra/new-entradirectoryroledefinition)|
| New-AzureADServiceAppRoleAssignment | [New-EntraServicePrincipalAppRoleAssignment](/powershell/module/microsoft.entra/new-entraserviceprincipalapproleassignment)|
| New-AzureADServicePrincipal | [New-EntraServicePrincipal](/powershell/module/microsoft.entra/New-EntraServicePrincipal)|
| New-AzureADServicePrincipalKeyCredential | [New-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra/New-EntraServicePrincipalKeyCredential)|
| New-AzureADServicePrincipalPasswordCredential | [New-EntraServicePrincipalPasswordCredential](/powershell/module/microsoft.entra/New-EntraServicePrincipalPasswordCredential)|
| New-AzureADTrustedCertificateAuthority | [New-EntraTrustedCertificateAuthority](/powershell/module/microsoft.entra/New-EntraTrustedCertificateAuthority)|
| New-AzureADUser | [New-EntraUser](/powershell/module/microsoft.entra/New-EntraUser)|
| New-AzureADUserAppRoleAssignment | [New-EntraUserAppRoleAssignment](/powershell/module/microsoft.entra/New-EntraUserAppRoleAssignment)|
| Remove-AzureADMSAdministrativeUnit | [Remove-EntraAdministrativeUnit](/powershell/module/microsoft.entra/Remove-EntraAdministrativeUnit)|
| Remove-AzureADMSAdministrativeUnitMember | [Remove-EntraAdministrativeUnitMember](/powershell/module/microsoft.entra/Remove-EntraAdministrativeUnitMember)|
| Remove-AzureADApplication, Remove-AzureADMSApplication | [Remove-EntraApplication](/powershell/module/microsoft.entra/Remove-EntraApplication)|
| Remove-AzureADApplicationExtensionProperty, Remove-AzureADMSApplicationExtensionProperty | [Remove-EntraApplicationExtensionProperty](/powershell/module/microsoft.entra/Remove-EntraApplicationExtensionProperty)|
| Remove-AzureADMSApplicationKey | [Remove-EntraApplicationKey](/powershell/module/microsoft.entra/Remove-EntraApplicationKey)|
| Remove-AzureADApplicationKeyCredential | [Remove-EntraApplicationKeyCredential](/powershell/module/microsoft.entra/Remove-EntraApplicationKeyCredential)|
| Remove-AzureADApplicationOwner, Remove-AzureADMSApplicationOwner | [Remove-EntraApplicationOwner](/powershell/module/microsoft.entra/Remove-EntraApplicationOwner)|
| Remove-AzureADMSApplicationPassword | [Remove-EntraApplicationPassword](/powershell/module/microsoft.entra/Remove-EntraApplicationPassword)|
| Remove-AzureADApplicationPasswordCredential | [Remove-EntraApplicationPasswordCredential](/powershell/module/microsoft.entra/Remove-EntraApplicationPasswordCredential)|
| Remove-AzureADApplicationProxyApplication |[Remove-EntraBetaApplicationProxyApplication](/powershell/module/microsoft.entra.beta/remove-entrabetaapplicationproxyapplication)|
| Remove-AzureADApplicationProxyApplicationConnectorGroup |[Remove-EntraBetaApplicationProxyApplicationConnectorGroup](/powershell/module/microsoft.entra.beta/remove-entrabetaapplicationproxyapplicationconnectorgroup) |
| Remove-AzureADApplicationProxyConnectorGroup |[Remove-EntraBetaApplicationProxyConnectorGroup](/powershell/module/microsoft.entra.beta/remove-entrabetaapplicationproxyconnectorgroup)|
| Remove-AzureADMSApplicationVerifiedPublisher | [Remove-EntraApplicationVerifiedPublisher](/powershell/module/microsoft.entra/Remove-EntraApplicationVerifiedPublisher)|
| Remove-AzureADMSConditionalAccessPolicy | [Remove-EntraConditionalAccessPolicy](/powershell/module/microsoft.entra/Remove-EntraConditionalAccessPolicy)|
| Remove-AzureADContact | [Remove-EntraContact](/powershell/module/microsoft.entra/Remove-EntraContact)|
| Remove-AzureADDeletedApplication | [Remove-EntraDeletedApplication](/powershell/module/microsoft.entra/Remove-EntraDeletedApplication)|
| Remove-AzureADMSDeletedDirectoryObject | [Remove-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra/Remove-EntraDeletedDirectoryObject)|
| Remove-AzureADDevice | [Remove-EntraDevice](/powershell/module/microsoft.entra/Remove-EntraDevice)|
| Remove-AzureADDeviceRegisteredOwner | [Remove-EntraDeviceRegisteredOwner](/powershell/module/microsoft.entra/Remove-EntraDeviceRegisteredOwner)|
| Remove-AzureADDeviceRegisteredUser | [Remove-EntraDeviceRegisteredUser](/powershell/module/microsoft.entra/Remove-EntraDeviceRegisteredUser)|
| Remove-AzureADDirectoryRoleMember | [Remove-EntraDirectoryRoleMember](/powershell/module/microsoft.entra/Remove-EntraDirectoryRoleMember)|
| Remove-AzureADDomain | [Remove-EntraDomain](/powershell/module/microsoft.entra/Remove-EntraDomain)|
| Remove-AzureADGroup, Remove-AzureADMSGroup | [Remove-EntraGroup](/powershell/module/microsoft.entra/Remove-EntraGroup)|
| Remove-AzureADGroupAppRoleAssignment | [Remove-EntraGroupAppRoleAssignment](/powershell/module/microsoft.entra/Remove-EntraGroupAppRoleAssignment)|
| Remove-AzureADMSGroupLifecyclePolicy | [Remove-EntraGroupLifecyclePolicy](/powershell/module/microsoft.entra/Remove-EntraGroupLifecyclePolicy)|
| Remove-AzureADGroupMember | [Remove-EntraGroupMember](/powershell/module/microsoft.entra/Remove-EntraGroupMember)|
| Remove-AzureADGroupOwner | [Remove-EntraGroupOwner](/powershell/module/microsoft.entra/Remove-EntraGroupOwner)|
| Remove-AzureADMSIdentityProvider | [Remove-EntraIdentityProvider](/powershell/module/microsoft.entra/Remove-EntraIdentityProvider)|
| Remove-AzureADMSLifecyclePolicyGroup | [Remove-EntraLifecyclePolicyGroup](/powershell/module/microsoft.entra/Remove-EntraLifecyclePolicyGroup)|
| Remove-AzureADMSNamedLocationPolicy | [Remove-EntraNamedLocationPolicy](/powershell/module/microsoft.entra/Remove-EntraNamedLocationPolicy)|
| Remove-AzureADOAuth2PermissionGrant | [Remove-EntraOAuth2PermissionGrant](/powershell/module/microsoft.entra/Remove-EntraOAuth2PermissionGrant)|
| Remove-AzureADMSPermissionGrantConditionSet | [Remove-EntraPermissionGrantConditionSet](/powershell/module/microsoft.entra/Remove-EntraPermissionGrantConditionSet)|
| Remove-AzureADMSPermissionGrantPolicy | [Remove-EntraPermissionGrantPolicy](/powershell/module/microsoft.entra/Remove-EntraPermissionGrantPolicy)|
| Remove-AzureADMSRoleAssignment | [Remove-EntraDirectoryRoleAssignment](/powershell/module/microsoft.entra/remove-entradirectoryroleassignment)|
| Remove-AzureADMSRoleDefinition | [Remove-EntraDirectoryRoleDefinition](/powershell/module/microsoft.entra/remove-entradirectoryroledefinition)|
| Remove-AzureADMSScopedRoleMembership | [Remove-EntraScopedRoleMembership](/powershell/module/microsoft.entra/Remove-EntraScopedRoleMembership)|
| Remove-AzureADServiceAppRoleAssignment | [Remove-EntraServicePrincipalAppRoleAssignment](/powershell/module/microsoft.entra/remove-entraserviceprincipalapproleassignment)|
| Remove-AzureADServicePrincipal | [Remove-EntraServicePrincipal](/powershell/module/microsoft.entra/Remove-EntraServicePrincipal)|
| Remove-AzureADMSServicePrincipalDelegatedPermissionClassification | [Remove-EntraServicePrincipalDelegatedPermissionClassification](/powershell/module/microsoft.entra/Remove-EntraServicePrincipalDelegatedPermissionClassification)|
| Remove-AzureADServicePrincipalKeyCredential | [Remove-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra/Remove-EntraServicePrincipalKeyCredential)|
| Remove-AzureADServicePrincipalOwner | [Remove-EntraServicePrincipalOwner](/powershell/module/microsoft.entra/Remove-EntraServicePrincipalOwner)|
| Remove-AzureADServicePrincipalPasswordCredential | [Remove-EntraServicePrincipalPasswordCredential](/powershell/module/microsoft.entra/Remove-EntraServicePrincipalPasswordCredential)|
| Remove-AzureADTrustedCertificateAuthority | [Remove-EntraTrustedCertificateAuthority](/powershell/module/microsoft.entra/Remove-EntraTrustedCertificateAuthority)|
| Remove-AzureADUser | [Remove-EntraUser](/powershell/module/microsoft.entra/Remove-EntraUser)|
| Remove-AzureADUserAppRoleAssignment | [Remove-EntraUserAppRoleAssignment](/powershell/module/microsoft.entra/Remove-EntraUserAppRoleAssignment)|
| Remove-AzureADUserExtension | [Remove-EntraUserExtension](/powershell/module/microsoft.entra/Remove-EntraUserExtension)|
| Remove-AzureADUserManager | [Remove-EntraUserManager](/powershell/module/microsoft.entra/Remove-EntraUserManager)|
| Reset-AzureADMSLifeCycleGroup | [Reset-EntraLifeCycleGroup](/powershell/module/microsoft.entra/Reset-EntraLifeCycleGroup)|
| Restore-AzureADDeletedApplication | [Restore-EntraDeletedApplication](/powershell/module/microsoft.entra/Restore-EntraDeletedApplication)|
| Restore-AzureADMSDeletedDirectoryObject | [Restore-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra/Restore-EntraDeletedDirectoryObject)|
| Revoke-AzureADSignedInUserAllRefreshToken | [Revoke-EntraSignedInUserAllRefreshToken](/powershell/module/microsoft.entra/Revoke-EntraSignedInUserAllRefreshToken)|
| Revoke-AzureADUserAllRefreshToken | [Revoke-EntraUserAllRefreshToken](/powershell/module/microsoft.entra/Revoke-EntraUserAllRefreshToken)|
| Select-AzureADGroupIdsContactIsMemberOf | [Select-EntraGroupIdsContactIsMemberOf](/powershell/module/microsoft.entra/Select-EntraGroupIdsContactIsMemberOf)|
| Select-AzureADGroupIdsGroupIsMemberOf | [Select-EntraGroupIdsGroupIsMemberOf](/powershell/module/microsoft.entra/Select-EntraGroupIdsGroupIsMemberOf)|
| Select-AzureADGroupIdsServicePrincipalIsMemberOf | [Select-EntraGroupIdsServicePrincipalIsMemberOf](/powershell/module/microsoft.entra/Select-EntraGroupIdsServicePrincipalIsMemberOf)|
| Select-AzureADGroupIdsUserIsMemberOf | [Select-EntraGroupIdsUserIsMemberOf](/powershell/module/microsoft.entra/Select-EntraGroupIdsUserIsMemberOf)|
| Set-AzureADMSAdministrativeUnit | [Set-EntraAdministrativeUnit](/powershell/module/microsoft.entra/Set-EntraAdministrativeUnit)|
| Set-AzureADApplication, Set-AzureADMSApplication | [Set-EntraApplication](/powershell/module/microsoft.entra/Set-EntraApplication)|
| Set-AzureADApplicationLogo, Set-AzureADMSApplicationLogo | [Set-EntraApplicationLogo](/powershell/module/microsoft.entra/Set-EntraApplicationLogo)|
| Set-AzureADApplicationProxyApplication | [Set-EntraBetaApplicationProxyApplication](/powershell/module/microsoft.entra.beta/set-entrabetaapplicationproxyapplication) |
| Set-AzureADApplicationProxyApplicationCustomDomainCertificate | |
| Set-AzureADApplicationProxyApplicationSingleSignOn |[Set-EntraBetaApplicationProxyApplicationSingleSignOn](/powershell/module/microsoft.entra.beta/set-entrabetaapplicationproxyapplicationsinglesignon) |
| Set-AzureADApplicationProxyConnector |[Set-EntraBetaApplicationProxyConnector](/powershell/module/microsoft.entra.beta/set-entrabetaapplicationproxyconnector) |
| Set-AzureADApplicationProxyConnectorGroup |[Set-EntraBetaApplicationProxyApplicationConnectorGroup](/powershell/module/microsoft.entra.beta/set-entrabetaapplicationproxyapplicationconnectorgroup) |
| Set-AzureADMSApplicationVerifiedPublisher | [Set-EntraApplicationVerifiedPublisher](/powershell/module/microsoft.entra/Set-EntraApplicationVerifiedPublisher)|
| Set-AzureADMSAuthorizationPolicy | [Set-EntraAuthorizationPolicy](/powershell/module/microsoft.entra/Set-EntraAuthorizationPolicy)|
| Set-AzureADMSConditionalAccessPolicy | [Set-EntraConditionalAccessPolicy](/powershell/module/microsoft.entra/Set-EntraConditionalAccessPolicy)|
| Set-AzureADDevice | [Set-EntraDevice](/powershell/module/microsoft.entra/Set-EntraDevice)|
| Set-AzureADDomain | [Set-EntraDomain](/powershell/module/microsoft.entra/Set-EntraDomain)|
| Set-AzureADGroup, Set-AzureADMSGroup | [Set-EntraGroup](/powershell/module/microsoft.entra/Set-EntraGroup)|
| Set-AzureADMSGroupLifecyclePolicy | [Set-EntraGroupLifecyclePolicy](/powershell/module/microsoft.entra/Set-EntraGroupLifecyclePolicy)|
| Set-AzureADMSIdentityProvider | [Set-EntraIdentityProvider](/powershell/module/microsoft.entra/Set-EntraIdentityProvider)|
| Set-AzureADMSNamedLocationPolicy | [Set-EntraNamedLocationPolicy](/powershell/module/microsoft.entra/Set-EntraNamedLocationPolicy)|
| Set-AzureADMSPermissionGrantConditionSet | [Set-EntraPermissionGrantConditionSet](/powershell/module/microsoft.entra/Set-EntraPermissionGrantConditionSet)|
| Set-AzureADMSPermissionGrantPolicy | [Set-EntraPermissionGrantPolicy](/powershell/module/microsoft.entra/Set-EntraPermissionGrantPolicy)|
| Set-AzureADMSRoleDefinition | [Set-EntraDirectoryRoleDefinition](/powershell/module/microsoft.entra/set-entradirectoryroledefinition)|
| Set-AzureADServicePrincipal | [Set-EntraServicePrincipal](/powershell/module/microsoft.entra/Set-EntraServicePrincipal)|
| Set-AzureADTenantDetail | [Set-EntraTenantDetail](/powershell/module/microsoft.entra/Set-EntraTenantDetail)|
| Set-AzureADTrustedCertificateAuthority | [Set-EntraTrustedCertificateAuthority](/powershell/module/microsoft.entra/Set-EntraTrustedCertificateAuthority)|
| Set-AzureADUser | [Set-EntraUser](/powershell/module/microsoft.entra/Set-EntraUser)|
| Set-AzureADUserExtension | [Set-EntraUserExtension](/powershell/module/microsoft.entra/Set-EntraUserExtension)|
| Set-AzureADUserLicense | [Set-EntraUserLicense](/powershell/module/microsoft.entra/Set-EntraUserLicense)|
| Set-AzureADUserManager | [Set-EntraUserManager](/powershell/module/microsoft.entra/Set-EntraUserManager)|
| Set-AzureADUserPassword | [Set-EntraUserPassword](/powershell/module/microsoft.entra/Set-EntraUserPassword)|
| Set-AzureADUserThumbnailPhoto | [Set-EntraUserThumbnailPhoto](/powershell/module/microsoft.entra/Set-EntraUserThumbnailPhoto)|
| Update-AzureADSignedInUserPassword | [Update-EntraSignedInUserPassword](/powershell/module/microsoft.entra/Update-EntraSignedInUserPassword)|

:::zone-end

:::zone pivot="azure-ad-preview"

## Azure AD Preview to Microsoft Entra PowerShell

|Azure AD Preview cmdlet|Microsoft Entra PowerShell cmdlet|
|--------------------------|---------------------------------|
| Add-AzureADAdministrativeUnitMember | [Add-EntraBetaAdministrativeUnitMember](/powershell/module/microsoft.entra.beta/Add-EntraBetaAdministrativeUnitMember)|
| Add-AzureADApplicationPolicy | [Add-EntraBetaApplicationPolicy](/powershell/module/microsoft.entra.beta/Add-EntraBetaApplicationPolicy)|
| Add-AzureADMScustomSecurityAttributeDefinitionAllowedValues | [Add-EntraBetaCustomSecurityAttributeDefinitionAllowedValue](/powershell/module/microsoft.entra.beta/Add-EntraBetaCustomSecurityAttributeDefinitionAllowedValue)|
| Add-AzureADMSFeatureRolloutPolicyDirectoryObject | [Add-EntraBetaFeatureRolloutPolicyDirectoryObject](/powershell/module/microsoft.entra.beta/add-entrabetafeaturerolloutpolicydirectoryobject)|
| Add-AzureADMSPrivilegedResource | Deprecated|
| Add-AzureADScopedRoleMembership | [Add-EntraBetaScopedRoleMembership](/powershell/module/microsoft.entra.beta/Add-EntraBetaScopedRoleMembership)|
| Add-AzureADServicePrincipalPolicy | [Add-EntraBetaServicePrincipalPolicy](/powershell/module/microsoft.entra.beta/Add-EntraBetaServicePrincipalPolicy)|
| Close-AzureADMSPrivilegedRoleAssignmentRequest | Deprecated|
| Get-AzureADAdministrativeUnit | [Get-EntraBetaAdministrativeUnit](/powershell/module/microsoft.entra.beta/Get-EntraBetaAdministrativeUnit)|
| Get-AzureADAdministrativeUnitMember | [Get-EntraBetaAdministrativeUnitMember](/powershell/module/microsoft.entra.beta/Get-EntraBetaAdministrativeUnitMember)|
|Get-AzureADApplicationPasswordCredential|[Get-EntraBetaApplicationPasswordCredential](/powershell/module/microsoft.entra.beta/Get-EntraBetaApplicationPasswordCredential)|
| Get-AzureADApplicationPolicy | [Get-EntraBetaApplicationPolicy](/powershell/module/microsoft.entra.beta/Get-EntraBetaApplicationPolicy)|
|Get-AzureADApplicationServiceEndpoint|[Get-EntraBetaApplicationServiceEndpoint](/powershell/module/microsoft.entra.beta/Get-EntraBetaApplicationServiceEndpoint)|
| Get-AzureADApplicationSignInDetailedSummary | [Get-EntraBetaApplicationSignInDetailedSummary](/powershell/module/microsoft.entra.beta/Get-EntraBetaApplicationSignInDetailedSummary)|
| Get-AzureADApplicationSignInSummary | [Get-EntraBetaApplicationSignInSummary](/powershell/module/microsoft.entra.beta/Get-EntraBetaApplicationSignInSummary)|
| Get-AzureADAuditDirectoryLogs | [Get-EntraBetaAuditDirectoryLog](/powershell/module/microsoft.entra.beta/get-entrabetaauditdirectorylog)|
| Get-AzureADAuditSignInLogs | [Get-EntraBetaAuditSignInLog](/powershell/module/microsoft.entra.beta/get-entrabetaauditsigninlog)|
| Get-AzureADDirectorySetting | [Get-EntraBetaDirectorySetting](/powershell/module/microsoft.entra.beta/Get-EntraBetaDirectorySetting)|
| Get-AzureADDirectorySettingTemplate | [Get-EntraBetaDirectorySettingTemplate](/powershell/module/microsoft.entra.beta/Get-EntraBetaDirectorySettingTemplate)|
| Get-AzureADExternalDomainFederation | |
| Get-AzureADMSApplicationTemplate | [Get-EntraBetaApplicationTemplate](/powershell/module/microsoft.entra.beta/get-entrabetaapplicationtemplate)|
| Get-AzureADMSAttributeSet | [Get-EntraBetaAttributeSet](/powershell/module/microsoft.entra.beta/Get-EntraBetaAttributeSet)|
| Get-AzureADMSCustomSecurityAttributeDefinition | [Get-EntraBetaCustomSecurityAttributeDefinition](/powershell/module/microsoft.entra.beta/get-entrabetacustomsecurityattributedefinition)|
| Get-AzureADMSCustomSecurityAttributeDefinitionAllowedValue | [Get-EntraBetaCustomSecurityAttributeDefinitionAllowedValue](/powershell/module/microsoft.entra.beta/Get-EntraBetaCustomSecurityAttributeDefinitionAllowedValue)|
| Get-AzureADMSFeatureRolloutPolicy | [Get-EntraBetaFeatureRolloutPolicy](/powershell/module/microsoft.entra.beta/get-entrabetafeaturerolloutpolicy)|
| Get-AzureADMSGroupPermissionGrant | [Get-EntraBetaGroupPermissionGrant](/powershell/module/microsoft.entra.beta/get-entrabetagrouppermissiongrant)|
| Get-AzureADMSPasswordSingleSignOnCredential | [Get-EntraBetaPasswordSingleSignOnCredential](/powershell/module/microsoft.entra.beta/get-entrabetapasswordsinglesignoncredential)|
| Get-AzureADMSPrivilegedResource | [Get-EntraBetaPrivilegedResource](/powershell/module/microsoft.entra.beta/get-entrabetaprivilegedresource)|
| Get-AzureADMSPrivilegedRoleAssignment |  Deprecated|
| Get-AzureADMSPrivilegedRoleAssignmentRequest | [Get-EntraBetaPrivilegedRoleAssignmentRequest](/powershell/module/microsoft.entra.beta/Get-EntraBetaPrivilegedRoleAssignmentRequest)|
| Get-AzureADMSPrivilegedRoleDefinition | [Get-EntraBetaPrivilegedRoleDefinition](/powershell/module/microsoft.entra.beta/Get-EntraBetaPrivilegedRoleDefinition)|
| Get-AzureADMSPrivilegedRoleSetting | [Get-EntraBetaPrivilegedRoleSetting](/powershell/module/microsoft.entra.beta/Get-EntraBetaPrivilegedRoleSetting)|
| Get-AzureADMSServicePrincipal | [Get-EntraBetaServicePrincipal](/powershell/module/microsoft.entra.beta/Get-EntraBetaServicePrincipal)|
| Get-AzureADMSTrustFrameworkPolicy | [Get-EntraBetaTrustFrameworkPolicy](/powershell/module/microsoft.entra.beta/get-entrabetatrustframeworkpolicy)|
| Get-AzureADMSUser | [Get-EntraBetaUser](/powershell/module/microsoft.entra.beta/Get-EntraBetaUser)|
| Get-AzureADObjectSetting | [Get-EntraBetaObjectSetting](/powershell/module/microsoft.entra.beta/Get-EntraBetaObjectSetting)|
| Get-AzureADPolicy | [Get-EntraBetaPolicy](/powershell/module/microsoft.entra.beta/Get-EntraBetaPolicy)|
| Get-AzureADPolicyAppliedObject | [Get-EntraBetaPolicyAppliedObject](/powershell/module/microsoft.entra.beta/Get-EntraBetaPolicyAppliedObject)|
| Get-AzureADPrivilegedRole | [Get-EntraBetaPrivilegedRole](/powershell/module/microsoft.entra.beta/Get-EntraBetaPrivilegedRole)|
| Get-AzureADPrivilegedRoleAssignment |  Deprecated|
| Get-AzureADScopedRoleMembership | [Get-EntraBetaScopedRoleMembership](/powershell/module/microsoft.entra.beta/Get-EntraBetaScopedRoleMembership)|
| Get-AzureADServicePrincipalPolicy | [Get-EntraBetaServicePrincipalPolicy](/powershell/module/microsoft.entra.beta/Get-EntraBetaServicePrincipalPolicy)|
| New-AzureADAdministrativeUnit | [New-EntraBetaAdministrativeUnit](/powershell/module/microsoft.entra.beta/New-EntraBetaAdministrativeUnit)|
| New-AzureADDirectorySetting | [New-EntraBetaDirectorySetting](/powershell/module/microsoft.entra.beta/New-EntraBetaDirectorySetting)|
| New-AzureADExternalDomainFederation | |
| New-AzureADMSAdministrativeUnitMember | [New-EntraBetaAdministrativeUnitMember](/powershell/module/microsoft.entra.beta/new-entrabetaadministrativeunitmember)|
| New-AzureADMSApplicationFromApplicationTemplate | [New-EntraBetaApplicationFromApplicationTemplate](/powershell/module/microsoft.entra.beta/New-EntraBetaApplicationFromApplicationTemplate)|
| New-AzureADMSAttributeSet | [New-EntraBetaAttributeSet](/powershell/module/microsoft.entra.beta/new-entrabetaattributeset)|
| New-AzureADMSCustomSecurityAttributeDefinition | [New-EntraBetaCustomSecurityAttributeDefinition](/powershell/module/microsoft.entra.beta/new-entrabetacustomsecurityattributedefinition)|
| New-AzureADMSFeatureRolloutPolicy | [New-EntraBetaFeatureRolloutPolicy](/powershell/module/microsoft.entra.beta/New-EntraBetaFeatureRolloutPolicy)|
| New-AzureADMSPasswordSingleSignOnCredential | [New-EntraBetaPasswordSingleSignOnCredential](/powershell/module/microsoft.entra.beta/new-entrabetapasswordsinglesignoncredential)|
| New-AzureADMSServicePrincipal | [New-EntraBetaServicePrincipal](/powershell/module/microsoft.entra.beta/New-EntraBetaServicePrincipal)|
| New-AzureADMSTrustFrameworkPolicy | [New-EntraBetaTrustFrameworkPolicy](/powershell/module/microsoft.entra.beta/new-entrabetatrustframeworkpolicy)|
| New-AzureADMSUser | [New-EntraBetaUser](/powershell/module/microsoft.entra.beta/New-EntraBetaUser)|
| New-AzureADObjectSetting | [New-EntraBetaObjectSetting](/powershell/module/microsoft.entra.beta/New-EntraBetaObjectSetting)|
| New-AzureADPolicy | [New-EntraBetaPolicy](/powershell/module/microsoft.entra.beta/New-EntraBetaPolicy)|
| New-AzureADPrivilegedRoleAssignment | [New-EntraBetaPrivilegedRoleAssignment](/powershell/module/microsoft.entra.beta/New-EntraBetaPrivilegedRoleAssignment)|
| Open-AzureADMSPrivilegedRoleAssignmentRequest |  Deprecated|
| Remove-AzureADAdministrativeUnit | [Remove-EntraBetaAdministrativeUnit](/powershell/module/microsoft.entra.beta/Remove-EntraBetaAdministrativeUnit)|
| Remove-AzureADAdministrativeUnitMember | [Remove-EntraBetaAdministrativeUnitMember](/powershell/module/microsoft.entra.beta/Remove-EntraBetaAdministrativeUnitMember)|
| Remove-AzureADApplicationPolicy | [Remove-EntraBetaApplicationPolicy](/powershell/module/microsoft.entra.beta/Remove-EntraBetaApplicationPolicy)|
| Remove-AzureADDirectorySetting | [Remove-EntraBetaDirectorySetting](/powershell/module/microsoft.entra.beta/Remove-EntraBetaDirectorySetting)|
| Remove-AzureADExternalDomainFederation | |
| Remove-AzureADMSFeatureRolloutPolicy | [Remove-EntraBetaFeatureRolloutPolicy](/powershell/module/microsoft.entra.beta/remove-entrabetafeaturerolloutpolicy)|
| Remove-AzureADMSFeatureRolloutPolicyDirectoryObject | [Remove-EntraBetaFeatureRolloutPolicyDirectoryObject](/powershell/module/microsoft.entra.beta/Remove-EntraBetaFeatureRolloutPolicyDirectoryObject)|
| Remove-AzureADMSPasswordSingleSignOnCredential | [Remove-EntraBetaPasswordSingleSignOnCredential](/powershell/module/microsoft.entra.beta/remove-entrabetapasswordsinglesignoncredential)|
| Remove-AzureADMSTrustFrameworkPolicy | [Remove-EntraBetaTrustFrameworkPolicy](/powershell/module/microsoft.entra.beta/remove-entrabetatrustframeworkpolicy)|
| Remove-AzureADObjectSetting | [Remove-EntraBetaObjectSetting](/powershell/module/microsoft.entra.beta/Remove-EntraBetaObjectSetting)|
| Remove-AzureADPolicy | [Remove-EntraBetaPolicy](/powershell/module/microsoft.entra.beta/Remove-EntraBetaPolicy)|
| Remove-AzureADScopedRoleMembership | [Remove-EntraBetaScopedRoleMembership](/powershell/module/microsoft.entra.beta/Remove-EntraBetaScopedRoleMembership)|
| Remove-AzureADServicePrincipalPolicy | [Remove-EntraBetaServicePrincipalPolicy](/powershell/module/microsoft.entra.beta/Remove-EntraBetaServicePrincipalPolicy)|
| Set-AzureADAdministrativeUnit | [Set-EntraBetaAdministrativeUnit](/powershell/module/microsoft.entra.beta/Set-EntraBetaAdministrativeUnit)|
| Set-AzureADDirectorySetting | [Set-EntraBetaDirectorySetting](/powershell/module/microsoft.entra.beta/Set-EntraBetaDirectorySetting)|
| Set-AzureADMSAttributeSet | [Set-EntraBetaAttributeSet](/powershell/module/microsoft.entra.beta/set-entrabetaattributeset)|
| Set-AzureADMSCustomSecurityAttributeDefinition | [Set-EntraBetaCustomSecurityAttributeDefinition](/powershell/module/microsoft.entra.beta/set-entrabetacustomsecurityattributedefinition)|
| Set-AzureADMSCustomSecurityAttributeDefinitionAllowedValue | [Set-EntraBetaCustomSecurityAttributeDefinitionAllowedValue](/powershell/module/microsoft.entra.beta/Set-EntraBetaCustomSecurityAttributeDefinitionAllowedValue)|
| Set-AzureADMSFeatureRolloutPolicy | [Set-EntraBetaFeatureRolloutPolicy](/powershell/module/microsoft.entra.beta/Set-EntraBetaFeatureRolloutPolicy)|
| Set-AzureADMSPasswordSingleSignOnCredential | [Set-EntraBetaPasswordSingleSignOnCredential](/powershell/module/microsoft.entra.beta/set-entrabetapasswordsinglesignoncredential)|
| Set-AzureADMSPrivilegedRoleAssignmentRequest | [Set-EntraBetaPrivilegedRoleAssignmentRequest](/powershell/module/microsoft.entra.beta/set-entrabetaprivilegedroleassignmentrequest)|
| Set-AzureADMSPrivilegedRoleSetting | [Set-EntraBetaPrivilegedRoleSetting](/powershell/module/microsoft.entra.beta/set-entrabetaprivilegedrolesetting)|
| Set-AzureADMSServicePrincipal | [Set-EntraBetaServicePrincipal](/powershell/module/microsoft.entra.beta/Set-EntraBetaServicePrincipal)|
| Set-AzureADMSTrustFrameworkPolicy | [Set-EntraBetaTrustFrameworkPolicy](/powershell/module/microsoft.entra.beta/set-entrabetatrustframeworkpolicy)|
| Set-AzureADMSUser | [Set-EntraBetaUser](/powershell/module/microsoft.entra.beta/Set-EntraBetaUser)|
| Set-AzureADObjectSetting | [Set-EntraBetaObjectSetting](/powershell/module/microsoft.entra.beta/Set-EntraBetaObjectSetting)|
| Set-AzureADPolicy | [Set-EntraBetaPolicy](/powershell/module/microsoft.entra.beta/Set-EntraBetaPolicy)|

:::zone-end

:::zone pivot="msonline"

## MSOnline to Microsoft Entra PowerShell

|MSOnline cmdlet|Microsoft Entra PowerShell cmdlet|
|--------------------------|---------------------------------|
|Add-MsolAdministrativeUnitMember|[Add-EntraAdministrativeUnitMember](/powershell/module/microsoft.entra/Add-EntraAdministrativeUnitMember)
|Add-MsolGroupMember|[Add-EntraGroupMember](/powershell/module/microsoft.entra/Add-EntraGroupMember)
|Add-MsolRoleMember|[Add-EntraDirectoryRoleMember](/powershell/module/microsoft.entra/Add-EntraDirectoryRoleMember)
|Add-MsolScopedRoleMember|[Add-EntraScopedRoleMembership](/powershell/module/microsoft.entra/Add-EntraScopedRoleMembership)
|Confirm-MsolDomain|[Confirm-EntraDomain](/powershell/module/microsoft.entra/Confirm-EntraDomain)
|Connect-MsolService|[Connect-Entra](/powershell/module/microsoft.entra/Connect-Entra)
|Convert-MsolFederatedUser|[Update-EntraBetaUserFromFederated](/powershell/module/microsoft.entra.beta/Update-EntraBetaUserFromFederated)
|Disable-MsolDevice|[Set-EntraDevice](/powershell/module/microsoft.entra/Set-EntraDevice)
|Enable-MsolDevice|[Set-EntraDevice](/powershell/module/microsoft.entra/Set-EntraDevice)
|Get-MsolAccountSku|[Get-EntraAccountSku](/powershell/module/microsoft.entra/Get-EntraAccountSku)
|Get-MsolAdministrativeUnit|[Get-EntraAdministrativeUnit](/powershell/module/microsoft.entra/Get-EntraAdministrativeUnit)
|Get-MsolAdministrativeUnitMember|[Get-EntraAdministrativeUnitMember](/powershell/module/microsoft.entra/Get-EntraAdministrativeUnitMember)
|Get-MsolCompanyInformation|[Get-EntraTenantDetail](/powershell/module/microsoft.entra/Get-EntraTenantDetail)
|Get-MsolContact|[Get-EntraContact](/powershell/module/microsoft.entra/Get-EntraContact)
|Get-MsolDevice|[Get-EntraDevice](/powershell/module/microsoft.entra/Get-EntraDevice)
|Get-MsolDirSyncConfiguration|[Get-EntraDirSyncConfiguration](/powershell/module/microsoft.entra/Get-EntraDirSyncConfiguration)
|Get-MsolDirSyncFeatures|[Get-EntraDirSyncFeature](/powershell/module/microsoft.entra/Get-EntraDirSyncFeature)
|Get-MsolDirSyncProvisioningError|[Get-EntraDirectoryObjectOnPremisesProvisioningError](/powershell/module/microsoft.entra/Get-EntraDirectoryObjectOnPremisesProvisioningError)
|Get-MsolDomain|[Get-EntraDomain](/powershell/module/microsoft.entra/Get-EntraDomain)
|Get-MsolDomainFederationSettings|[Get-EntraDomainFederationSettings](/powershell/module/microsoft.entra/Get-EntraDomainFederationSettings)
|Get-MsolDomainVerificationDns|[Get-EntraDomainVerificationDnsRecord](/powershell/module/microsoft.entra/Get-EntraDomainVerificationDnsRecord)
|Get-MsolFederationProperty|[Get-EntraFederationProperty](/powershell/module/microsoft.entra/Get-EntraFederationProperty)
|Get-MsolGroup|[Get-EntraGroup](/powershell/module/microsoft.entra/Get-EntraGroup)
|Get-MsolGroupMember|[Get-EntraGroupMember](/powershell/module/microsoft.entra/Get-EntraGroupMember)
|Get-MsolHasObjectsWithDirSyncProvisioningErrors|[Get-EntraDirectoryObjectOnPremisesProvisioningError](/powershell/module/microsoft.entra/Get-EntraDirectoryObjectOnPremisesProvisioningError)
|Get-MsolPartnerInformation|[Get-EntraPartnerInformation](/powershell/module/microsoft.entra/Get-EntraPartnerInformation)
|Get-MsolPasswordPolicy|[Get-EntraPasswordPolicy](/powershell/module/microsoft.entra/Get-EntraPasswordPolicy)
|Get-MsolRole|[Get-EntraDirectoryRole](/powershell/module/microsoft.entra/Get-EntraDirectoryRole)
|Get-MsolRoleMember|[Get-EntraDirectoryRoleMember](/powershell/module/microsoft.entra/Get-EntraDirectoryRoleMember)
|Get-MsolScopedRoleMember|[Get-EntraScopedRoleMembership](/powershell/module/microsoft.entra/Get-EntraScopedRoleMembership)
|Get-MsolServicePrincipal|[Get-EntraServicePrincipal](/powershell/module/microsoft.entra/Get-EntraServicePrincipal)
|Get-MsolServicePrincipalCredential|[Get-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra/Get-EntraServicePrincipalKeyCredential)
|Get-MsolSubscription|[Get-EntraSubscribedSku](/powershell/module/microsoft.entra/Get-EntraSubscribedSku)
|Get-MsolUser|[Get-EntraUser](/powershell/module/microsoft.entra/Get-EntraUser)
|New-MsolAdministrativeUnit|[New-EntraAdministrativeUnit](/powershell/module/microsoft.entra/New-EntraAdministrativeUnit)
|New-MsolDomain|[New-EntraDomain](/powershell/module/microsoft.entra/New-EntraDomain)
|New-MsolGroup|[New-EntraGroup](/powershell/module/microsoft.entra/New-EntraGroup)
|New-MsolServicePrincipal|[New-EntraServicePrincipal](/powershell/module/microsoft.entra/New-EntraServicePrincipal)
|New-MsolServicePrincipalCredential|[New-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra/New-EntraServicePrincipalKeyCredential)
|New-MsolUser|[New-EntraUser](/powershell/module/microsoft.entra/New-EntraUser)
|Remove-MsolAdministrativeUnit|[Remove-EntraAdministrativeUnit](/powershell/module/microsoft.entra/Remove-EntraAdministrativeUnit)
|Remove-MsolAdministrativeUnitMember|[Remove-EntraAdministrativeUnitMember](/powershell/module/microsoft.entra/Remove-EntraAdministrativeUnitMember)
|Remove-MsolApplicationPassword|[Remove-EntraApplicationPassword](/powershell/module/microsoft.entra/Remove-EntraApplicationPassword)
|Remove-MsolContact|[Remove-EntraContact](/powershell/module/microsoft.entra/Remove-EntraContact)
|Remove-MsolDevice|[Remove-EntraDevice](/powershell/module/microsoft.entra/Remove-EntraDevice)
|Remove-MsolDomain|[Remove-EntraDomain](/powershell/module/microsoft.entra/Remove-EntraDomain)
|Remove-MsolGroup|[Remove-EntraGroup](/powershell/module/microsoft.entra/Remove-EntraGroup)
|Remove-MsolGroupMember|[Remove-EntraGroupMember](/powershell/module/microsoft.entra/Remove-EntraGroupMember)
|Remove-MsolRoleMember|[Remove-EntraDirectoryRoleMember](/powershell/module/microsoft.entra/Remove-EntraDirectoryRoleMember)
|Remove-MsolScopedRoleMember|[Remove-EntraScopedRoleMembership](/powershell/module/microsoft.entra/Remove-EntraScopedRoleMembership)
|Remove-MsolServicePrincipal|[Remove-EntraServicePrincipal](/powershell/module/microsoft.entra/Remove-EntraServicePrincipal)
|Remove-MsolServicePrincipalCredential|[Remove-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra/Remove-EntraServicePrincipalKeyCredential)
|Remove-MsolUser|[Remove-EntraUser](/powershell/module/microsoft.entra/Remove-EntraUser)
|Reset-MsolStrongAuthenticationMethodByUpn|[Reset-EntraStrongAuthenticationMethodByUpn](/powershell/module/microsoft.entra/Reset-EntraStrongAuthenticationMethodByUpn)
|Restore-MsolUser|[Restore-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra/Restore-EntraDeletedDirectoryObject)
|Set-MsolAdministrativeUnit|[Set-EntraAdministrativeUnit](/powershell/module/microsoft.entra/Set-EntraAdministrativeUnit)
|Set-MsolCompanyContactInformation|[Set-EntraTenantDetail](/powershell/module/microsoft.entra/Set-EntraTenantDetail)
|Set-MsolCompanySecurityComplianceContactInformation|[Set-EntraTenantDetail](/powershell/module/microsoft.entra/Set-EntraTenantDetail)
|Set-MsolDirSyncConfiguration|[Set-EntraDirSyncConfiguration](/powershell/module/microsoft.entra/Set-EntraDirSyncConfiguration)
|Set-MsolDirSyncEnabled|[Set-EntraDirSyncEnabled](/powershell/module/microsoft.entra/Set-EntraDirSyncEnabled)
|Set-MsolDirSyncFeature|[Set-EntraDirSyncFeature](/powershell/module/microsoft.entra/Set-EntraDirSyncFeature)
|Set-MsolDomain|[Set-EntraDomain](/powershell/module/microsoft.entra/Set-EntraDomain)
|Set-MsolDomainFederationSettings|[Set-EntraDomainFederationSettings](/powershell/module/microsoft.entra/Set-EntraDomainFederationSettings)
|Set-MsolGroup|[Set-EntraGroup](/powershell/module/microsoft.entra/Set-EntraGroup)
|Set-MsolPartnerInformation|[Set-EntraPartnerInformation](/powershell/module/microsoft.entra/Set-EntraPartnerInformation)
|Set-MsolServicePrincipal|[Set-EntraServicePrincipal](/powershell/module/microsoft.entra/Set-EntraServicePrincipal)
|Set-MsolUser|[Set-EntraUser](/powershell/module/microsoft.entra/Set-EntraUser)
|Set-MsolUserLicense|[Set-EntraUserLicense](/powershell/module/microsoft.entra/Set-EntraUserLicense)
|Set-MsolUserPassword|[Set-EntraUserPassword](/powershell/module/microsoft.entra/Set-EntraUserPassword)
|Set-MsolUserPrincipalName|[Set-EntraUser](/powershell/module/microsoft.entra/Set-EntraUser)


:::zone-end
