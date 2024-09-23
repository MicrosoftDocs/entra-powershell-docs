---
title: "Azure AD PowerShell to Microsoft Entra PowerShell cmdlet map"
description: "Find the equivalents of Azure AD PowerShell cmdlets in Microsoft Entra PowerShell."

ms.topic: reference
ms.date: 07/16/2024
author: msewaweru
manager: CelesteDG
ms.author: eunicewaweru
ms.reviewer: stevemutungi
zone_pivot_groups: entra-powershell-legacy-modules
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json

#customer intent: As a Microsoft Entra PowerShell user, I want to find the equivalents of Azure AD PowerShell cmdlets in Microsoft Entra PowerShell.
---
# Find Azure AD PowerShell and MSOnline cmdlets in Microsoft Entra PowerShell

The Microsoft Entra PowerShell module is over 98% compatible with the Azure AD and Azure AD Preview PowerShell modules. Additionally, it provides parity for MSOnline cmdlets that weren't migrated to Azure AD PowerShell. Use this page to find the equivalent cmdlets in Microsoft Entra PowerShell for those you used in the Azure AD, Azure AD Preview, and MSOnline PowerShell modules.

:::zone pivot="azure-ad-powershell"

## Azure AD PowerShell to Microsoft Entra PowerShell

|Azure AD PowerShell cmdlet|Microsoft Entra PowerShell cmdlet|
|--------------------------|---------------------------------|
| Add-AzureADMSAdministrativeUnitMember | [Add-EntraAdministrativeUnitMember](/powershell/module/microsoft.graph.entra/Add-EntraAdministrativeUnitMember)|
| Add-AzureADApplicationOwner, Add-AzureADMSApplicationOwner | [Add-EntraApplicationOwner](/powershell/module/microsoft.graph.entra/Add-EntraApplicationOwner)|
| Add-AzureADDeviceRegisteredOwner | [Add-EntraDeviceRegisteredOwner](/powershell/module/microsoft.graph.entra/Add-EntraDeviceRegisteredOwner)|
| Add-AzureADDeviceRegisteredUser | [Add-EntraDeviceRegisteredUser](/powershell/module/microsoft.graph.entra/Add-EntraDeviceRegisteredUser)|
| Add-AzureADDirectoryRoleMember | [Add-EntraDirectoryRoleMember](/powershell/module/microsoft.graph.entra/Add-EntraDirectoryRoleMember)|
| Add-AzureADEnvironment | [Add-EntraEnvironment](/powershell/module/microsoft.graph.entra/Add-EntraEnvironment)|
| Add-AzureADGroupMember | [Add-EntraGroupMember](/powershell/module/microsoft.graph.entra/Add-EntraGroupMember)|
| Add-AzureADGroupOwner | [Add-EntraGroupOwner](/powershell/module/microsoft.graph.entra/Add-EntraGroupOwner)|
| Add-AzureADMSLifecyclePolicyGroup | [Add-EntraLifecyclePolicyGroup](/powershell/module/microsoft.graph.entra/Add-EntraLifecyclePolicyGroup)|
| Add-AzureADMSScopedRoleMembership | [Add-EntraScopedRoleMembership](/powershell/module/microsoft.graph.entra/Add-EntraScopedRoleMembership)|
| Add-AzureADMSServicePrincipalDelegatedPermissionClassification | [Add-EntraServicePrincipalDelegatedPermissionClassification](/powershell/module/microsoft.graph.entra/Add-EntraServicePrincipalDelegatedPermissionClassification)|
| Add-AzureADServicePrincipalOwner | [Add-EntraServicePrincipalOwner](/powershell/module/microsoft.graph.entra/Add-EntraServicePrincipalOwner)|
| Confirm-AzureADDomain | [Confirm-EntraDomain](/powershell/module/microsoft.graph.entra/Confirm-EntraDomain)|
| Connect-AzureAD | [Connect-Entra](/powershell/module/microsoft.graph.entra/Connect-Entra)|
| Disconnect-AzureAD | [Disconnect-Entra](/powershell/module/microsoft.graph.entra/Disconnect-Entra)|
| Enable-AzureADDirectoryRole | [Enable-EntraDirectoryRole](/powershell/module/microsoft.graph.entra/Enable-EntraDirectoryRole)|
| Get-CrossCloudVerificationCode | [Get-CrossCloudVerificationCode](/powershell/module/microsoft.graph.entra/Get-CrossCloudVerificationCode)|
| Get-AzureADMSAdministrativeUnit | [Get-EntraAdministrativeUnit](/powershell/module/microsoft.graph.entra/Get-EntraAdministrativeUnit)|
| Get-AzureADMSAdministrativeUnitMember | [Get-EntraAdministrativeUnitMember](/powershell/module/microsoft.graph.entra/Get-EntraAdministrativeUnitMember)|
| Get-AzureADApplication, Get-AzureADMSApplication | [Get-EntraApplication](/powershell/module/microsoft.graph.entra/Get-EntraApplication)|
| Get-AzureADApplicationExtensionProperty, Get-AzureADMSApplicationExtensionProperty | [Get-EntraApplicationExtensionProperty](/powershell/module/microsoft.graph.entra/Get-EntraApplicationExtensionProperty)|
| Get-AzureADApplicationKeyCredential | [Get-EntraApplicationKeyCredential](/powershell/module/microsoft.graph.entra/Get-EntraApplicationKeyCredential)|
| Get-AzureADApplicationLogo | [Get-EntraApplicationLogo](/powershell/module/microsoft.graph.entra/Get-EntraApplicationLogo)|
| Get-AzureADApplicationOwner, Get-AzureADMSApplicationOwner | [Get-EntraApplicationOwner](/powershell/module/microsoft.graph.entra/Get-EntraApplicationOwner)|
| Get-AzureADApplicationPasswordCredential | [Get-EntraApplicationPasswordCredential](/powershell/module/microsoft.graph.entra/Get-EntraApplicationPasswordCredential)|
| Get-AzureADApplicationProxyApplication | [Get-EntraApplicationProxyApplication](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyApplication)|
| Get-AzureADApplicationProxyApplicationConnectorGroup | [Get-EntraApplicationProxyApplicationConnectorGroup](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyApplicationConnectorGroup)|
| Get-AzureADApplicationProxyConnector | [Get-EntraApplicationProxyConnector](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyConnector)|
| Get-AzureADApplicationProxyConnectorGroup | [Get-EntraApplicationProxyConnectorGroup](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyConnectorGroup)|
| Get-AzureADApplicationProxyConnectorGroupMember | [Get-EntraApplicationProxyConnectorGroupMember](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyConnectorGroupMember)|
| Get-AzureADApplicationProxyConnectorGroupMembers | [Get-EntraApplicationProxyConnectorGroupMembers](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyConnectorGroupMembers)|
| Get-AzureADApplicationProxyConnectorMemberOf | [Get-EntraApplicationProxyConnectorMemberOf](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyConnectorMemberOf)|
| Get-AzureADApplicationServiceEndpoint | [Get-EntraApplicationServiceEndpoint](/powershell/module/microsoft.graph.entra/Get-EntraApplicationServiceEndpoint)|
| Get-AzureADMSAuthorizationPolicy | [Get-EntraAuthorizationPolicy](/powershell/module/microsoft.graph.entra/Get-EntraAuthorizationPolicy)|
| Get-AzureADMSConditionalAccessPolicy | [Get-EntraConditionalAccessPolicy](/powershell/module/microsoft.graph.entra/Get-EntraConditionalAccessPolicy)|
| Get-AzureADContact | [Get-EntraContact](/powershell/module/microsoft.graph.entra/Get-EntraContact)|
| Get-AzureADContactDirectReport | [Get-EntraContactDirectReport](/powershell/module/microsoft.graph.entra/Get-EntraContactDirectReport)|
| Get-AzureADContactManager | [Get-EntraContactManager](/powershell/module/microsoft.graph.entra/Get-EntraContactManager)|
| Get-AzureADContactMembership | [Get-EntraContactMembership](/powershell/module/microsoft.graph.entra/Get-EntraContactMembership)|
| Get-AzureADContactThumbnailPhoto | [Get-EntraContactThumbnailPhoto](/powershell/module/microsoft.graph.entra/Get-EntraContactThumbnailPhoto)|
| Get-AzureADContract | [Get-EntraContract](/powershell/module/microsoft.graph.entra/Get-EntraContract)|
| Get-AzureADCurrentSessionInfo | [Get-EntraContext](/powershell/module/microsoft.graph.entra/get-entracontext)|
| Get-AzureADDeletedApplication | [Get-EntraDeletedApplication](/powershell/module/microsoft.graph.entra/Get-EntraDeletedApplication)|
| Get-AzureADMSDeletedDirectoryObject | [Get-EntraDeletedDirectoryObject](/powershell/module/microsoft.graph.entra/Get-EntraDeletedDirectoryObject)|
| Get-AzureADMSDeletedGroup | [Get-EntraDeletedGroup](/powershell/module/microsoft.graph.entra/Get-EntraDeletedGroup)|
| Get-AzureADDevice | [Get-EntraDevice](/powershell/module/microsoft.graph.entra/Get-EntraDevice)|
| Get-AzureADDeviceRegisteredOwner | [Get-EntraDeviceRegisteredOwner](/powershell/module/microsoft.graph.entra/Get-EntraDeviceRegisteredOwner)|
| Get-AzureADDeviceRegisteredUser | [Get-EntraDeviceRegisteredUser](/powershell/module/microsoft.graph.entra/Get-EntraDeviceRegisteredUser)|
| Get-AzureADDirectoryRole | [Get-EntraDirectoryRole](/powershell/module/microsoft.graph.entra/Get-EntraDirectoryRole)|
| Get-AzureADDirectoryRoleMember | [Get-EntraDirectoryRoleMember](/powershell/module/microsoft.graph.entra/Get-EntraDirectoryRoleMember)|
| Get-AzureADDirectoryRoleTemplate | [Get-EntraDirectoryRoleTemplate](/powershell/module/microsoft.graph.entra/Get-EntraDirectoryRoleTemplate)|
| Get-AzureADDomain | [Get-EntraDomain](/powershell/module/microsoft.graph.entra/Get-EntraDomain)|
| Get-AzureADDomainNameReference | [Get-EntraDomainNameReference](/powershell/module/microsoft.graph.entra/Get-EntraDomainNameReference)|
| Get-AzureADDomainServiceConfigurationRecord | [Get-EntraDomainServiceConfigurationRecord](/powershell/module/microsoft.graph.entra/Get-EntraDomainServiceConfigurationRecord)|
| Get-AzureADDomainVerificationDnsRecord | [Get-EntraDomainVerificationDnsRecord](/powershell/module/microsoft.graph.entra/Get-EntraDomainVerificationDnsRecord)|
| Get-AzureADExtensionProperty | [Get-EntraExtensionProperty](/powershell/module/microsoft.graph.entra/Get-EntraExtensionProperty)|
| Get-AzureADGroup, Get-AzureADMSGroup | [Get-EntraGroup](/powershell/module/microsoft.graph.entra/Get-EntraGroup)|
| Get-AzureADGroupAppRoleAssignment | [Get-EntraGroupAppRoleAssignment](/powershell/module/microsoft.graph.entra/Get-EntraGroupAppRoleAssignment)|
| Get-AzureADMSGroupLifecyclePolicy | [Get-EntraGroupLifecyclePolicy](/powershell/module/microsoft.graph.entra/Get-EntraGroupLifecyclePolicy)|
| Get-AzureADGroupMember | [Get-EntraGroupMember](/powershell/module/microsoft.graph.entra/Get-EntraGroupMember)|
| Get-AzureADGroupOwner | [Get-EntraGroupOwner](/powershell/module/microsoft.graph.entra/Get-EntraGroupOwner)|
| Get-AzureADMSGroupPermissionGrant | [Get-EntraGroupPermissionGrant](/powershell/module/microsoft.graph.entra/Get-EntraGroupPermissionGrant)|
| Get-AzureADMSIdentityProvider | [Get-EntraIdentityProvider](/powershell/module/microsoft.graph.entra/Get-EntraIdentityProvider)|
| Get-AzureADMSLifecyclePolicyGroup | [Get-EntraLifecyclePolicyGroup](/powershell/module/microsoft.graph.entra/Get-EntraLifecyclePolicyGroup)|
| Get-AzureADMSNamedLocationPolicy | [Get-EntraNamedLocationPolicy](/powershell/module/microsoft.graph.entra/Get-EntraNamedLocationPolicy)|
| Get-AzureADOAuth2PermissionGrant | [Get-EntraOAuth2PermissionGrant](/powershell/module/microsoft.graph.entra/Get-EntraOAuth2PermissionGrant)|
| Get-AzureADObjectByObjectId | [Get-EntraObjectByObjectId](/powershell/module/microsoft.graph.entra/Get-EntraObjectByObjectId)|
| Get-AzureADMSPermissionGrantConditionSet | [Get-EntraPermissionGrantConditionSet](/powershell/module/microsoft.graph.entra/Get-EntraPermissionGrantConditionSet)|
| Get-AzureADMSPermissionGrantPolicy | [Get-EntraPermissionGrantPolicy](/powershell/module/microsoft.graph.entra/Get-EntraPermissionGrantPolicy)|
| Get-AzureADMSRoleAssignment | [Get-EntraDirectoryRoleAssignment](/powershell/module/microsoft.graph.entra/get-entradirectoryroleassignment)|
| Get-AzureADMSRoleDefinition | [Get-EntraDirectoryRoleDefinition](/powershell/module/microsoft.graph.entra/get-entradirectoryroledefinition)|
| Get-AzureADMSScopedRoleMembership | [Get-EntraScopedRoleMembership](/powershell/module/microsoft.graph.entra/Get-EntraScopedRoleMembership)|
| Get-AzureADServiceAppRoleAssignedTo | [Get-EntraServicePrincipalAppRoleAssignedTo](/powershell/module/microsoft.graph.entra/get-entraserviceprincipalapproleassignedto)|
| Get-AzureADServiceAppRoleAssignment | [Get-EntraServicePrincipalAppRoleAssignment](/powershell/module/microsoft.graph.entra/get-entraserviceprincipalapproleassignment)|
| Get-AzureADServicePrincipal | [Get-EntraServicePrincipal](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipal)|
| Get-AzureADServicePrincipalCreatedObject | [Get-EntraServicePrincipalCreatedObject](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalCreatedObject)|
| Get-AzureADMSServicePrincipalDelegatedPermissionClassification | [Get-EntraServicePrincipalDelegatedPermissionClassification](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalDelegatedPermissionClassification)|
| Get-AzureADServicePrincipalKeyCredential | [Get-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalKeyCredential)|
| Get-AzureADServicePrincipalMembership | [Get-EntraServicePrincipalMembership](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalMembership)|
| Get-AzureADServicePrincipalOAuth2PermissionGrant | [Get-EntraServicePrincipalOAuth2PermissionGrant](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalOAuth2PermissionGrant)|
| Get-AzureADServicePrincipalOwnedObject | [Get-EntraServicePrincipalOwnedObject](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalOwnedObject)|
| Get-AzureADServicePrincipalOwner | [Get-EntraServicePrincipalOwner](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalOwner)|
| Get-AzureADServicePrincipalPasswordCredential | [Get-EntraServicePrincipalPasswordCredential](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalPasswordCredential)|
| Get-AzureADSubscribedSku | [Get-EntraSubscribedSku](/powershell/module/microsoft.graph.entra/Get-EntraSubscribedSku)|
| Get-AzureADTenantDetail | [Get-EntraTenantDetail](/powershell/module/microsoft.graph.entra/Get-EntraTenantDetail)|
| Get-AzureADTrustedCertificateAuthority | [Get-EntraTrustedCertificateAuthority](/powershell/module/microsoft.graph.entra/Get-EntraTrustedCertificateAuthority)|
| Get-AzureADMSUnsupportedCommand | [Get-EntraUnsupportedCommand](/powershell/module/microsoft.graph.entra/Get-EntraUnsupportedCommand)|
| Get-AzureADUser | [Get-EntraUser](/powershell/module/microsoft.graph.entra/Get-EntraUser)|
| Get-AzureADUserAppRoleAssignment | [Get-EntraUserAppRoleAssignment](/powershell/module/microsoft.graph.entra/Get-EntraUserAppRoleAssignment)|
| Get-AzureADUserCreatedObject | [Get-EntraUserCreatedObject](/powershell/module/microsoft.graph.entra/Get-EntraUserCreatedObject)|
| Get-AzureADUserDirectReport | [Get-EntraUserDirectReport](/powershell/module/microsoft.graph.entra/Get-EntraUserDirectReport)|
| Get-AzureADUserExtension | [Get-EntraUserExtension](/powershell/module/microsoft.graph.entra/Get-EntraUserExtension)|
| Get-AzureADUserLicenseDetail | [Get-EntraUserLicenseDetail](/powershell/module/microsoft.graph.entra/Get-EntraUserLicenseDetail)|
| Get-AzureADUserManager | [Get-EntraUserManager](/powershell/module/microsoft.graph.entra/Get-EntraUserManager)|
| Get-AzureADUserMembership | [Get-EntraUserMembership](/powershell/module/microsoft.graph.entra/Get-EntraUserMembership)|
| Get-AzureADUserOAuth2PermissionGrant | [Get-EntraUserOAuth2PermissionGrant](/powershell/module/microsoft.graph.entra/Get-EntraUserOAuth2PermissionGrant)|
| Get-AzureADUserOwnedDevice | [Get-EntraUserOwnedDevice](/powershell/module/microsoft.graph.entra/Get-EntraUserOwnedDevice)|
| Get-AzureADUserOwnedObject | [Get-EntraUserOwnedObject](/powershell/module/microsoft.graph.entra/Get-EntraUserOwnedObject)|
| Get-AzureADUserRegisteredDevice | [Get-EntraUserRegisteredDevice](/powershell/module/microsoft.graph.entra/Get-EntraUserRegisteredDevice)|
| Get-AzureADUserThumbnailPhoto | [Get-EntraUserThumbnailPhoto](/powershell/module/microsoft.graph.entra/Get-EntraUserThumbnailPhoto)|
| New-AzureADMSAdministrativeUnit | [New-EntraAdministrativeUnit](/powershell/module/microsoft.graph.entra/New-EntraAdministrativeUnit)|
| New-AzureADApplication, New-AzureADMSApplication | [New-EntraApplication](/powershell/module/microsoft.graph.entra/New-EntraApplication)|
| New-AzureADApplicationExtensionProperty, New-AzureADMSApplicationExtensionProperty | [New-EntraApplicationExtensionProperty](/powershell/module/microsoft.graph.entra/New-EntraApplicationExtensionProperty)|
| New-AzureADMSApplicationKey | [New-EntraApplicationKey](/powershell/module/microsoft.graph.entra/New-EntraApplicationKey)|
| New-AzureADApplicationKeyCredential | [New-EntraApplicationKeyCredential](/powershell/module/microsoft.graph.entra/New-EntraApplicationKeyCredential)|
| New-AzureADMSApplicationPassword | [New-EntraApplicationPassword](/powershell/module/microsoft.graph.entra/New-EntraApplicationPassword)|
| New-AzureADApplicationPasswordCredential | [New-EntraApplicationPasswordCredential](/powershell/module/microsoft.graph.entra/New-EntraApplicationPasswordCredential)|
| New-AzureADApplicationProxyApplication | [New-EntraApplicationProxyApplication](/powershell/module/microsoft.graph.entra/New-EntraApplicationProxyApplication)|
| New-AzureADApplicationProxyConnectorGroup | [New-EntraApplicationProxyConnectorGroup](/powershell/module/microsoft.graph.entra/New-EntraApplicationProxyConnectorGroup)|
| New-AzureADMSConditionalAccessPolicy | [New-EntraConditionalAccessPolicy](/powershell/module/microsoft.graph.entra/New-EntraConditionalAccessPolicy)|
| New-AzureADDevice | [New-EntraDevice](/powershell/module/microsoft.graph.entra/New-EntraDevice)|
| New-AzureADDomain | [New-EntraDomain](/powershell/module/microsoft.graph.entra/New-EntraDomain)|
| New-AzureADGroup, New-AzureADMSGroup | [New-EntraGroup](/powershell/module/microsoft.graph.entra/New-EntraGroup)|
| New-AzureADGroupAppRoleAssignment | [New-EntraGroupAppRoleAssignment](/powershell/module/microsoft.graph.entra/New-EntraGroupAppRoleAssignment)|
| New-AzureADMSGroupLifecyclePolicy | [New-EntraGroupLifecyclePolicy](/powershell/module/microsoft.graph.entra/New-EntraGroupLifecyclePolicy)|
| New-AzureADMSIdentityProvider | [New-EntraIdentityProvider](/powershell/module/microsoft.graph.entra/New-EntraIdentityProvider)|
| New-AzureADMSInvitation | [New-EntraInvitation](/powershell/module/microsoft.graph.entra/New-EntraInvitation)|
| New-AzureADMSNamedLocationPolicy | [New-EntraNamedLocationPolicy](/powershell/module/microsoft.graph.entra/New-EntraNamedLocationPolicy)|
| New-AzureADMSPermissionGrantConditionSet | [New-EntraPermissionGrantConditionSet](/powershell/module/microsoft.graph.entra/New-EntraPermissionGrantConditionSet)|
| New-AzureADMSPermissionGrantPolicy | [New-EntraPermissionGrantPolicy](/powershell/module/microsoft.graph.entra/New-EntraPermissionGrantPolicy)|
| New-AzureADMSRoleAssignment | [New-EntraDirectoryRoleAssignment](/powershell/module/microsoft.graph.entra/new-entradirectoryroleassignment)|
| New-AzureADMSRoleDefinition | [New-EntraDirectoryRoleDefinition](/powershell/module/microsoft.graph.entra/new-entradirectoryroledefinition)|
| New-AzureADServiceAppRoleAssignment | [New-EntraServicePrincipalAppRoleAssignment](/powershell/module/microsoft.graph.entra/new-entraserviceprincipalapproleassignment)|
| New-AzureADServicePrincipal | [New-EntraServicePrincipal](/powershell/module/microsoft.graph.entra/New-EntraServicePrincipal)|
| New-AzureADServicePrincipalKeyCredential | [New-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.graph.entra/New-EntraServicePrincipalKeyCredential)|
| New-AzureADServicePrincipalPasswordCredential | [New-EntraServicePrincipalPasswordCredential](/powershell/module/microsoft.graph.entra/New-EntraServicePrincipalPasswordCredential)|
| New-AzureADTrustedCertificateAuthority | [New-EntraTrustedCertificateAuthority](/powershell/module/microsoft.graph.entra/New-EntraTrustedCertificateAuthority)|
| New-AzureADUser | [New-EntraUser](/powershell/module/microsoft.graph.entra/New-EntraUser)|
| New-AzureADUserAppRoleAssignment | [New-EntraUserAppRoleAssignment](/powershell/module/microsoft.graph.entra/New-EntraUserAppRoleAssignment)|
| Remove-AzureADMSAdministrativeUnit | [Remove-EntraAdministrativeUnit](/powershell/module/microsoft.graph.entra/Remove-EntraAdministrativeUnit)|
| Remove-AzureADMSAdministrativeUnitMember | [Remove-EntraAdministrativeUnitMember](/powershell/module/microsoft.graph.entra/Remove-EntraAdministrativeUnitMember)|
| Remove-AzureADApplication, Remove-AzureADMSApplication | [Remove-EntraApplication](/powershell/module/microsoft.graph.entra/Remove-EntraApplication)|
| Remove-AzureADApplicationExtensionProperty, Remove-AzureADMSApplicationExtensionProperty | [Remove-EntraApplicationExtensionProperty](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationExtensionProperty)|
| Remove-AzureADMSApplicationKey | [Remove-EntraApplicationKey](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationKey)|
| Remove-AzureADApplicationKeyCredential | [Remove-EntraApplicationKeyCredential](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationKeyCredential)|
| Remove-AzureADApplicationOwner, Remove-AzureADMSApplicationOwner | [Remove-EntraApplicationOwner](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationOwner)|
| Remove-AzureADMSApplicationPassword | [Remove-EntraApplicationPassword](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationPassword)|
| Remove-AzureADApplicationPasswordCredential | [Remove-EntraApplicationPasswordCredential](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationPasswordCredential)|
| Remove-AzureADApplicationProxyApplication | [Remove-EntraApplicationProxyApplication](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationProxyApplication)|
| Remove-AzureADApplicationProxyApplicationConnectorGroup | [Remove-EntraApplicationProxyApplicationConnectorGroup](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationProxyApplicationConnectorGroup)|
| Remove-AzureADApplicationProxyConnectorGroup | [Remove-EntraApplicationProxyConnectorGroup](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationProxyConnectorGroup)|
| Remove-AzureADMSApplicationVerifiedPublisher | [Remove-EntraApplicationVerifiedPublisher](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationVerifiedPublisher)|
| Remove-AzureADMSConditionalAccessPolicy | [Remove-EntraConditionalAccessPolicy](/powershell/module/microsoft.graph.entra/Remove-EntraConditionalAccessPolicy)|
| Remove-AzureADContact | [Remove-EntraContact](/powershell/module/microsoft.graph.entra/Remove-EntraContact)|
| Remove-AzureADDeletedApplication | [Remove-EntraDeletedApplication](/powershell/module/microsoft.graph.entra/Remove-EntraDeletedApplication)|
| Remove-AzureADMSDeletedDirectoryObject | [Remove-EntraDeletedDirectoryObject](/powershell/module/microsoft.graph.entra/Remove-EntraDeletedDirectoryObject)|
| Remove-AzureADDevice | [Remove-EntraDevice](/powershell/module/microsoft.graph.entra/Remove-EntraDevice)|
| Remove-AzureADDeviceRegisteredOwner | [Remove-EntraDeviceRegisteredOwner](/powershell/module/microsoft.graph.entra/Remove-EntraDeviceRegisteredOwner)|
| Remove-AzureADDeviceRegisteredUser | [Remove-EntraDeviceRegisteredUser](/powershell/module/microsoft.graph.entra/Remove-EntraDeviceRegisteredUser)|
| Remove-AzureADDirectoryRoleMember | [Remove-EntraDirectoryRoleMember](/powershell/module/microsoft.graph.entra/Remove-EntraDirectoryRoleMember)|
| Remove-AzureADDomain | [Remove-EntraDomain](/powershell/module/microsoft.graph.entra/Remove-EntraDomain)|
| Remove-AzureADGroup, Remove-AzureADMSGroup | [Remove-EntraGroup](/powershell/module/microsoft.graph.entra/Remove-EntraGroup)|
| Remove-AzureADGroupAppRoleAssignment | [Remove-EntraGroupAppRoleAssignment](/powershell/module/microsoft.graph.entra/Remove-EntraGroupAppRoleAssignment)|
| Remove-AzureADMSGroupLifecyclePolicy | [Remove-EntraGroupLifecyclePolicy](/powershell/module/microsoft.graph.entra/Remove-EntraGroupLifecyclePolicy)|
| Remove-AzureADGroupMember | [Remove-EntraGroupMember](/powershell/module/microsoft.graph.entra/Remove-EntraGroupMember)|
| Remove-AzureADGroupOwner | [Remove-EntraGroupOwner](/powershell/module/microsoft.graph.entra/Remove-EntraGroupOwner)|
| Remove-AzureADMSIdentityProvider | [Remove-EntraIdentityProvider](/powershell/module/microsoft.graph.entra/Remove-EntraIdentityProvider)|
| Remove-AzureADMSLifecyclePolicyGroup | [Remove-EntraLifecyclePolicyGroup](/powershell/module/microsoft.graph.entra/Remove-EntraLifecyclePolicyGroup)|
| Remove-AzureADMSNamedLocationPolicy | [Remove-EntraNamedLocationPolicy](/powershell/module/microsoft.graph.entra/Remove-EntraNamedLocationPolicy)|
| Remove-AzureADOAuth2PermissionGrant | [Remove-EntraOAuth2PermissionGrant](/powershell/module/microsoft.graph.entra/Remove-EntraOAuth2PermissionGrant)|
| Remove-AzureADMSPermissionGrantConditionSet | [Remove-EntraPermissionGrantConditionSet](/powershell/module/microsoft.graph.entra/Remove-EntraPermissionGrantConditionSet)|
| Remove-AzureADMSPermissionGrantPolicy | [Remove-EntraPermissionGrantPolicy](/powershell/module/microsoft.graph.entra/Remove-EntraPermissionGrantPolicy)|
| Remove-AzureADMSRoleAssignment | [Remove-EntraDirectoryRoleAssignment](/powershell/module/microsoft.graph.entra/remove-entradirectoryroleassignment)|
| Remove-AzureADMSRoleDefinition | [Remove-EntraDirectoryRoleDefinition](/powershell/module/microsoft.graph.entra/remove-entradirectoryroledefinition)|
| Remove-AzureADMSScopedRoleMembership | [Remove-EntraScopedRoleMembership](/powershell/module/microsoft.graph.entra/Remove-EntraScopedRoleMembership)|
| Remove-AzureADServiceAppRoleAssignment | [Remove-EntraServicePrincipalAppRoleAssignment](/powershell/module/microsoft.graph.entra/remove-entraserviceprincipalapproleassignment)|
| Remove-AzureADServicePrincipal | [Remove-EntraServicePrincipal](/powershell/module/microsoft.graph.entra/Remove-EntraServicePrincipal)|
| Remove-AzureADMSServicePrincipalDelegatedPermissionClassification | [Remove-EntraServicePrincipalDelegatedPermissionClassification](/powershell/module/microsoft.graph.entra/Remove-EntraServicePrincipalDelegatedPermissionClassification)|
| Remove-AzureADServicePrincipalKeyCredential | [Remove-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.graph.entra/Remove-EntraServicePrincipalKeyCredential)|
| Remove-AzureADServicePrincipalOwner | [Remove-EntraServicePrincipalOwner](/powershell/module/microsoft.graph.entra/Remove-EntraServicePrincipalOwner)|
| Remove-AzureADServicePrincipalPasswordCredential | [Remove-EntraServicePrincipalPasswordCredential](/powershell/module/microsoft.graph.entra/Remove-EntraServicePrincipalPasswordCredential)|
| Remove-AzureADTrustedCertificateAuthority | [Remove-EntraTrustedCertificateAuthority](/powershell/module/microsoft.graph.entra/Remove-EntraTrustedCertificateAuthority)|
| Remove-AzureADUser | [Remove-EntraUser](/powershell/module/microsoft.graph.entra/Remove-EntraUser)|
| Remove-AzureADUserAppRoleAssignment | [Remove-EntraUserAppRoleAssignment](/powershell/module/microsoft.graph.entra/Remove-EntraUserAppRoleAssignment)|
| Remove-AzureADUserExtension | [Remove-EntraUserExtension](/powershell/module/microsoft.graph.entra/Remove-EntraUserExtension)|
| Remove-AzureADUserManager | [Remove-EntraUserManager](/powershell/module/microsoft.graph.entra/Remove-EntraUserManager)|
| Reset-AzureADMSLifeCycleGroup | [Reset-EntraLifeCycleGroup](/powershell/module/microsoft.graph.entra/Reset-EntraLifeCycleGroup)|
| Restore-AzureADDeletedApplication | [Restore-EntraDeletedApplication](/powershell/module/microsoft.graph.entra/Restore-EntraDeletedApplication)|
| Restore-AzureADMSDeletedDirectoryObject | [Restore-EntraDeletedDirectoryObject](/powershell/module/microsoft.graph.entra/Restore-EntraDeletedDirectoryObject)|
| Revoke-AzureADSignedInUserAllRefreshToken | [Revoke-EntraSignedInUserAllRefreshToken](/powershell/module/microsoft.graph.entra/Revoke-EntraSignedInUserAllRefreshToken)|
| Revoke-AzureADUserAllRefreshToken | [Revoke-EntraUserAllRefreshToken](/powershell/module/microsoft.graph.entra/Revoke-EntraUserAllRefreshToken)|
| Select-AzureADGroupIdsContactIsMemberOf | [Select-EntraGroupIdsContactIsMemberOf](/powershell/module/microsoft.graph.entra/Select-EntraGroupIdsContactIsMemberOf)|
| Select-AzureADGroupIdsGroupIsMemberOf | [Select-EntraGroupIdsGroupIsMemberOf](/powershell/module/microsoft.graph.entra/Select-EntraGroupIdsGroupIsMemberOf)|
| Select-AzureADGroupIdsServicePrincipalIsMemberOf | [Select-EntraGroupIdsServicePrincipalIsMemberOf](/powershell/module/microsoft.graph.entra/Select-EntraGroupIdsServicePrincipalIsMemberOf)|
| Select-AzureADGroupIdsUserIsMemberOf | [Select-EntraGroupIdsUserIsMemberOf](/powershell/module/microsoft.graph.entra/Select-EntraGroupIdsUserIsMemberOf)|
| Set-AzureADMSAdministrativeUnit | [Set-EntraAdministrativeUnit](/powershell/module/microsoft.graph.entra/Set-EntraAdministrativeUnit)|
| Set-AzureADApplication, Set-AzureADMSApplication | [Set-EntraApplication](/powershell/module/microsoft.graph.entra/Set-EntraApplication)|
| Set-AzureADApplicationLogo, Set-AzureADMSApplicationLogo | [Set-EntraApplicationLogo](/powershell/module/microsoft.graph.entra/Set-EntraApplicationLogo)|
| Set-AzureADApplicationProxyApplication | [Set-EntraApplicationProxyApplication](/powershell/module/microsoft.graph.entra/Set-EntraApplicationProxyApplication)|
| Set-AzureADApplicationProxyApplicationCustomDomainCertificate | [Set-EntraApplicationProxyApplicationCustomDomainCertificate](/powershell/module/microsoft.graph.entra/Set-EntraApplicationProxyApplicationCustomDomainCertificate)|
| Set-AzureADApplicationProxyApplicationSingleSignOn | [Set-EntraApplicationProxyApplicationSingleSignOn](/powershell/module/microsoft.graph.entra/Set-EntraApplicationProxyApplicationSingleSignOn)|
| Set-AzureADApplicationProxyConnector | [Set-EntraApplicationProxyConnector](/powershell/module/microsoft.graph.entra/Set-EntraApplicationProxyConnector)|
| Set-AzureADApplicationProxyConnectorGroup | [Set-EntraApplicationProxyConnectorGroup](/powershell/module/microsoft.graph.entra/Set-EntraApplicationProxyConnectorGroup)|
| Set-AzureADMSApplicationVerifiedPublisher | [Set-EntraApplicationVerifiedPublisher](/powershell/module/microsoft.graph.entra/Set-EntraApplicationVerifiedPublisher)|
| Set-AzureADMSAuthorizationPolicy | [Set-EntraAuthorizationPolicy](/powershell/module/microsoft.graph.entra/Set-EntraAuthorizationPolicy)|
| Set-AzureADMSConditionalAccessPolicy | [Set-EntraConditionalAccessPolicy](/powershell/module/microsoft.graph.entra/Set-EntraConditionalAccessPolicy)|
| Set-AzureADDevice | [Set-EntraDevice](/powershell/module/microsoft.graph.entra/Set-EntraDevice)|
| Set-AzureADDomain | [Set-EntraDomain](/powershell/module/microsoft.graph.entra/Set-EntraDomain)|
| Set-AzureADGroup, Set-AzureADMSGroup | [Set-EntraGroup](/powershell/module/microsoft.graph.entra/Set-EntraGroup)|
| Set-AzureADMSGroupLifecyclePolicy | [Set-EntraGroupLifecyclePolicy](/powershell/module/microsoft.graph.entra/Set-EntraGroupLifecyclePolicy)|
| Set-AzureADMSIdentityProvider | [Set-EntraIdentityProvider](/powershell/module/microsoft.graph.entra/Set-EntraIdentityProvider)|
| Set-AzureADMSNamedLocationPolicy | [Set-EntraNamedLocationPolicy](/powershell/module/microsoft.graph.entra/Set-EntraNamedLocationPolicy)|
| Set-AzureADMSPermissionGrantConditionSet | [Set-EntraPermissionGrantConditionSet](/powershell/module/microsoft.graph.entra/Set-EntraPermissionGrantConditionSet)|
| Set-AzureADMSPermissionGrantPolicy | [Set-EntraPermissionGrantPolicy](/powershell/module/microsoft.graph.entra/Set-EntraPermissionGrantPolicy)|
| Set-AzureADMSRoleDefinition | [Set-EntraDirectoryRoleDefinition](/powershell/module/microsoft.graph.entra/set-entradirectoryroledefinition)|
| Set-AzureADServicePrincipal | [Set-EntraServicePrincipal](/powershell/module/microsoft.graph.entra/Set-EntraServicePrincipal)|
| Set-AzureADTenantDetail | [Set-EntraTenantDetail](/powershell/module/microsoft.graph.entra/Set-EntraTenantDetail)|
| Set-AzureADTrustedCertificateAuthority | [Set-EntraTrustedCertificateAuthority](/powershell/module/microsoft.graph.entra/Set-EntraTrustedCertificateAuthority)|
| Set-AzureADUser | [Set-EntraUser](/powershell/module/microsoft.graph.entra/Set-EntraUser)|
| Set-AzureADUserExtension | [Set-EntraUserExtension](/powershell/module/microsoft.graph.entra/Set-EntraUserExtension)|
| Set-AzureADUserLicense | [Set-EntraUserLicense](/powershell/module/microsoft.graph.entra/Set-EntraUserLicense)|
| Set-AzureADUserManager | [Set-EntraUserManager](/powershell/module/microsoft.graph.entra/Set-EntraUserManager)|
| Set-AzureADUserPassword | [Set-EntraUserPassword](/powershell/module/microsoft.graph.entra/Set-EntraUserPassword)|
| Set-AzureADUserThumbnailPhoto | [Set-EntraUserThumbnailPhoto](/powershell/module/microsoft.graph.entra/Set-EntraUserThumbnailPhoto)|
| Update-AzureADSignedInUserPassword | [Update-EntraSignedInUserPassword](/powershell/module/microsoft.graph.entra/Update-EntraSignedInUserPassword)|

:::zone-end

:::zone pivot="azure-ad-preview"

## Azure AD Preview to Microsoft Entra PowerShell

|Azure AD Preview cmdlet|Microsoft Entra PowerShell cmdlet|
|--------------------------|---------------------------------|
| Add-AzureADAdministrativeUnitMember | [Add-EntraBetaAdministrativeUnitMember](/powershell/module/microsoft.graph.entra.beta/Add-EntraBetaAdministrativeUnitMember)|
| Add-AzureADApplicationPolicy | [Add-EntraBetaApplicationPolicy](/powershell/module/microsoft.graph.entra.beta/Add-EntraBetaApplicationPolicy)|
| Add-AzureADMScustomSecurityAttributeDefinitionAllowedValues | [Add-EntraBetaCustomSecurityAttributeDefinitionAllowedValue](/powershell/module/microsoft.graph.entra.beta/Add-EntraBetaCustomSecurityAttributeDefinitionAllowedValue)|
| Add-AzureADMSFeatureRolloutPolicyDirectoryObject | [Add-EntraBetaFeatureRolloutPolicyDirectoryObject](/powershell/module/microsoft.graph.entra.beta/add-entrabetafeaturerolloutpolicydirectoryobject)|
| Add-AzureADMSPrivilegedResource | Deprecated|
| Add-AzureADScopedRoleMembership | [Add-EntraBetaScopedRoleMembership](/powershell/module/microsoft.graph.entra.beta/Add-EntraBetaScopedRoleMembership)|
| Add-AzureADServicePrincipalPolicy | [Add-EntraBetaServicePrincipalPolicy](/powershell/module/microsoft.graph.entra.beta/Add-EntraBetaServicePrincipalPolicy)|
| Close-AzureADMSPrivilegedRoleAssignmentRequest | Deprecated|
| Get-AzureADAdministrativeUnit | [Get-EntraBetaAdministrativeUnit](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaAdministrativeUnit)|
| Get-AzureADAdministrativeUnitMember | [Get-EntraBetaAdministrativeUnitMember](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaAdministrativeUnitMember)|
|Get-AzureADApplicationPasswordCredential|[Get-EntraBetaApplicationPasswordCredential](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaApplicationPasswordCredential)|
| Get-AzureADApplicationPolicy | [Get-EntraBetaApplicationPolicy](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaApplicationPolicy)|
|Get-AzureADApplicationServiceEndpoint|[Get-EntraBetaApplicationServiceEndpoint](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaApplicationServiceEndpoint)|
| Get-AzureADApplicationSignInDetailedSummary | [Get-EntraBetaApplicationSignInDetailedSummary](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaApplicationSignInDetailedSummary)|
| Get-AzureADApplicationSignInSummary | [Get-EntraBetaApplicationSignInSummary](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaApplicationSignInSummary)|
| Get-AzureADAuditDirectoryLogs | [Get-EntraBetaAuditDirectoryLog](/powershell/module/microsoft.graph.entra.beta/get-entrabetaauditdirectorylog)|
| Get-AzureADAuditSignInLogs | [Get-EntraBetaAuditSignInLog](/powershell/module/microsoft.graph.entra.beta/get-entrabetaauditsigninlog)|
| Get-AzureADDirectorySetting | [Get-EntraBetaDirectorySetting](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaDirectorySetting)|
| Get-AzureADDirectorySettingTemplate | [Get-EntraBetaDirectorySettingTemplate](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaDirectorySettingTemplate)|
| Get-AzureADExternalDomainFederation | |
| Get-AzureADMSApplicationTemplate | [Get-EntraBetaApplicationTemplate](/powershell/module/microsoft.graph.entra.beta/get-entrabetaapplicationtemplate)|
| Get-AzureADMSAttributeSet | [Get-EntraBetaAttributeSet](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaAttributeSet)|
| Get-AzureADMSCustomSecurityAttributeDefinition | [Get-EntraBetaCustomSecurityAttributeDefinition](/powershell/module/microsoft.graph.entra.beta/get-entrabetacustomsecurityattributedefinition)|
| Get-AzureADMSCustomSecurityAttributeDefinitionAllowedValue | [Get-EntraBetaCustomSecurityAttributeDefinitionAllowedValue](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaCustomSecurityAttributeDefinitionAllowedValue)|
| Get-AzureADMSFeatureRolloutPolicy | [Get-EntraBetaFeatureRolloutPolicy](/powershell/module/microsoft.graph.entra.beta/get-entrabetafeaturerolloutpolicy)|
| Get-AzureADMSGroupPermissionGrant | [Get-EntraBetaGroupPermissionGrant](/powershell/module/microsoft.graph.entra.beta/get-entrabetagrouppermissiongrant)|
| Get-AzureADMSPasswordSingleSignOnCredential | [Get-EntraBetaPasswordSingleSignOnCredential](/powershell/module/microsoft.graph.entra.beta/get-entrabetapasswordsinglesignoncredential)|
| Get-AzureADMSPrivilegedResource | [Get-EntraBetaPrivilegedResource](/powershell/module/microsoft.graph.entra.beta/get-entrabetaprivilegedresource)|
| Get-AzureADMSPrivilegedRoleAssignment |  Deprecated|
| Get-AzureADMSPrivilegedRoleAssignmentRequest | [Get-EntraBetaPrivilegedRoleAssignmentRequest](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaPrivilegedRoleAssignmentRequest)|
| Get-AzureADMSPrivilegedRoleDefinition | [Get-EntraBetaPrivilegedRoleDefinition](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaPrivilegedRoleDefinition)|
| Get-AzureADMSPrivilegedRoleSetting | [Get-EntraBetaPrivilegedRoleSetting](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaPrivilegedRoleSetting)|
| Get-AzureADMSServicePrincipal | [Get-EntraBetaServicePrincipal](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaServicePrincipal)|
| Get-AzureADMSTrustFrameworkPolicy | [Get-EntraBetaTrustFrameworkPolicy](/powershell/module/microsoft.graph.entra.beta/get-entrabetatrustframeworkpolicy)|
| Get-AzureADMSUser | [Get-EntraBetaUser](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaUser)|
| Get-AzureADObjectSetting | [Get-EntraBetaObjectSetting](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaObjectSetting)|
| Get-AzureADPolicy | [Get-EntraBetaPolicy](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaPolicy)|
| Get-AzureADPolicyAppliedObject | [Get-EntraBetaPolicyAppliedObject](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaPolicyAppliedObject)|
| Get-AzureADPrivilegedRole | [Get-EntraBetaPrivilegedRole](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaPrivilegedRole)|
| Get-AzureADPrivilegedRoleAssignment |  Deprecated|
| Get-AzureADScopedRoleMembership | [Get-EntraBetaScopedRoleMembership](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaScopedRoleMembership)|
| Get-AzureADServicePrincipalPolicy | [Get-EntraBetaServicePrincipalPolicy](/powershell/module/microsoft.graph.entra.beta/Get-EntraBetaServicePrincipalPolicy)|
| New-AzureADAdministrativeUnit | [New-EntraBetaAdministrativeUnit](/powershell/module/microsoft.graph.entra.beta/New-EntraBetaAdministrativeUnit)|
| New-AzureADDirectorySetting | [New-EntraBetaDirectorySetting](/powershell/module/microsoft.graph.entra.beta/New-EntraBetaDirectorySetting)|
| New-AzureADExternalDomainFederation | |
| New-AzureADMSAdministrativeUnitMember | [New-EntraBetaAdministrativeUnitMember](/powershell/module/microsoft.graph.entra.beta/new-entrabetaadministrativeunitmember)|
| New-AzureADMSApplicationFromApplicationTemplate | [New-EntraBetaApplicationFromApplicationTemplate](/powershell/module/microsoft.graph.entra.beta/New-EntraBetaApplicationFromApplicationTemplate)|
| New-AzureADMSAttributeSet | [New-EntraBetaAttributeSet](/powershell/module/microsoft.graph.entra.beta/new-entrabetaattributeset)|
| New-AzureADMSCustomSecurityAttributeDefinition | [New-EntraBetaCustomSecurityAttributeDefinition](/powershell/module/microsoft.graph.entra.beta/new-entrabetacustomsecurityattributedefinition)|
| New-AzureADMSFeatureRolloutPolicy | [New-EntraBetaFeatureRolloutPolicy](/powershell/module/microsoft.graph.entra.beta/New-EntraBetaFeatureRolloutPolicy)|
| New-AzureADMSPasswordSingleSignOnCredential | [New-EntraBetaPasswordSingleSignOnCredential](/powershell/module/microsoft.graph.entra.beta/new-entrabetapasswordsinglesignoncredential)|
| New-AzureADMSServicePrincipal | [New-EntraBetaServicePrincipal](/powershell/module/microsoft.graph.entra.beta/New-EntraBetaServicePrincipal)|
| New-AzureADMSTrustFrameworkPolicy | [New-EntraBetaTrustFrameworkPolicy](/powershell/module/microsoft.graph.entra.beta/new-entrabetatrustframeworkpolicy)|
| New-AzureADMSUser | [New-EntraBetaUser](/powershell/module/microsoft.graph.entra.beta/New-EntraBetaUser)|
| New-AzureADObjectSetting | [New-EntraBetaObjectSetting](/powershell/module/microsoft.graph.entra.beta/New-EntraBetaObjectSetting)|
| New-AzureADPolicy | [New-EntraBetaPolicy](/powershell/module/microsoft.graph.entra.beta/New-EntraBetaPolicy)|
| New-AzureADPrivilegedRoleAssignment | [New-EntraBetaPrivilegedRoleAssignment](/powershell/module/microsoft.graph.entra.beta/New-EntraBetaPrivilegedRoleAssignment)|
| Open-AzureADMSPrivilegedRoleAssignmentRequest |  Deprecated|
| Remove-AzureADAdministrativeUnit | [Remove-EntraBetaAdministrativeUnit](/powershell/module/microsoft.graph.entra.beta/Remove-EntraBetaAdministrativeUnit)|
| Remove-AzureADAdministrativeUnitMember | [Remove-EntraBetaAdministrativeUnitMember](/powershell/module/microsoft.graph.entra.beta/Remove-EntraBetaAdministrativeUnitMember)|
| Remove-AzureADApplicationPolicy | [Remove-EntraBetaApplicationPolicy](/powershell/module/microsoft.graph.entra.beta/Remove-EntraBetaApplicationPolicy)|
| Remove-AzureADDirectorySetting | [Remove-EntraBetaDirectorySetting](/powershell/module/microsoft.graph.entra.beta/Remove-EntraBetaDirectorySetting)|
| Remove-AzureADExternalDomainFederation | |
| Remove-AzureADMSFeatureRolloutPolicy | [Remove-EntraBetaFeatureRolloutPolicy](/powershell/module/microsoft.graph.entra.beta/remove-entrabetafeaturerolloutpolicy)|
| Remove-AzureADMSFeatureRolloutPolicyDirectoryObject | [Remove-EntraBetaFeatureRolloutPolicyDirectoryObject](/powershell/module/microsoft.graph.entra.beta/Remove-EntraBetaFeatureRolloutPolicyDirectoryObject)|
| Remove-AzureADMSPasswordSingleSignOnCredential | [Remove-EntraBetaPasswordSingleSignOnCredential](/powershell/module/microsoft.graph.entra.beta/remove-entrabetapasswordsinglesignoncredential)|
| Remove-AzureADMSTrustFrameworkPolicy | [Remove-EntraBetaTrustFrameworkPolicy](/powershell/module/microsoft.graph.entra.beta/remove-entrabetatrustframeworkpolicy)|
| Remove-AzureADObjectSetting | [Remove-EntraBetaObjectSetting](/powershell/module/microsoft.graph.entra.beta/Remove-EntraBetaObjectSetting)|
| Remove-AzureADPolicy | [Remove-EntraBetaPolicy](/powershell/module/microsoft.graph.entra.beta/Remove-EntraBetaPolicy)|
| Remove-AzureADScopedRoleMembership | [Remove-EntraBetaScopedRoleMembership](/powershell/module/microsoft.graph.entra.beta/Remove-EntraBetaScopedRoleMembership)|
| Remove-AzureADServicePrincipalPolicy | [Remove-EntraBetaServicePrincipalPolicy](/powershell/module/microsoft.graph.entra.beta/Remove-EntraBetaServicePrincipalPolicy)|
| Set-AzureADAdministrativeUnit | [Set-EntraBetaAdministrativeUnit](/powershell/module/microsoft.graph.entra.beta/Set-EntraBetaAdministrativeUnit)|
| Set-AzureADDirectorySetting | [Set-EntraBetaDirectorySetting](/powershell/module/microsoft.graph.entra.beta/Set-EntraBetaDirectorySetting)|
| Set-AzureADMSAttributeSet | [Set-EntraBetaAttributeSet](/powershell/module/microsoft.graph.entra.beta/set-entrabetaattributeset)|
| Set-AzureADMSCustomSecurityAttributeDefinition | [Set-EntraBetaCustomSecurityAttributeDefinition](/powershell/module/microsoft.graph.entra.beta/set-entrabetacustomsecurityattributedefinition)|
| Set-AzureADMSCustomSecurityAttributeDefinitionAllowedValue | [Set-EntraBetaCustomSecurityAttributeDefinitionAllowedValue](/powershell/module/microsoft.graph.entra.beta/Set-EntraBetaCustomSecurityAttributeDefinitionAllowedValue)|
| Set-AzureADMSFeatureRolloutPolicy | [Set-EntraBetaFeatureRolloutPolicy](/powershell/module/microsoft.graph.entra.beta/Set-EntraBetaFeatureRolloutPolicy)|
| Set-AzureADMSPasswordSingleSignOnCredential | [Set-EntraBetaPasswordSingleSignOnCredential](/powershell/module/microsoft.graph.entra.beta/set-entrabetapasswordsinglesignoncredential)|
| Set-AzureADMSPrivilegedRoleAssignmentRequest | [Set-EntraBetaPrivilegedRoleAssignmentRequest](/powershell/module/microsoft.graph.entra.beta/set-entrabetaprivilegedroleassignmentrequest)|
| Set-AzureADMSPrivilegedRoleSetting | [Set-EntraBetaPrivilegedRoleSetting](/powershell/module/microsoft.graph.entra.beta/set-entrabetaprivilegedrolesetting)|
| Set-AzureADMSServicePrincipal | [Set-EntraBetaServicePrincipal](/powershell/module/microsoft.graph.entra.beta/Set-EntraBetaServicePrincipal)|
| Set-AzureADMSTrustFrameworkPolicy | [Set-EntraBetaTrustFrameworkPolicy](/powershell/module/microsoft.graph.entra.beta/set-entrabetatrustframeworkpolicy)|
| Set-AzureADMSUser | [Set-EntraBetaUser](/powershell/module/microsoft.graph.entra.beta/Set-EntraBetaUser)|
| Set-AzureADObjectSetting | [Set-EntraBetaObjectSetting](/powershell/module/microsoft.graph.entra.beta/Set-EntraBetaObjectSetting)|
| Set-AzureADPolicy | [Set-EntraBetaPolicy](/powershell/module/microsoft.graph.entra.beta/Set-EntraBetaPolicy)|

:::zone-end

:::zone pivot="msonline"

## MSOnline to Microsoft Entra PowerShell

|MSOnline cmdlet|Microsoft Entra PowerShell cmdlet|
|--------------------------|---------------------------------|
| Convert-MsolFederatedUser | [Update-EntraBetaUserFromFederated](/powershell/module/microsoft.graph.entra.beta/update-entrabetauserfromfederated)|
| Get-MsolAccountSku | [Get-EntraAccountSku](/powershell/module/microsoft.graph.entra/Get-EntraAccountSku)|
| Get-MsolDirSyncConfiguration | [Get-EntraDirSyncConfiguration](/powershell/module/microsoft.graph.entra/Get-EntraDirSyncConfiguration)|
| Get-MsolDirSyncfeature | [Get-EntraDirSyncfeature](/powershell/module/microsoft.graph.entra/Get-EntraDirSyncfeature)|
| Get-MsolDomainFederationSettings | [Get-EntraDomainFederationSettings](/powershell/module/microsoft.graph.entra/Get-EntraDomainFederationSettings)|
| Get-MsolFederationProperty | [Get-EntraFederationProperty](/powershell/module/microsoft.graph.entra/Get-EntraFederationProperty)|
| Get-MsolHasObjectsWithDirSyncProvisioningError | [Get-EntraHasObjectsWithDirSyncProvisioningError](/powershell/module/microsoft.graph.entra/Get-EntraHasObjectsWithDirSyncProvisioningError)|
| Get-MsolPartnerInformation | [Get-EntraPartnerInformation](/powershell/module/microsoft.graph.entra/Get-EntraPartnerInformation)|
| Get-MsolPasswordPolicy | [Get-EntraPasswordPolicy](/powershell/module/microsoft.graph.entra/Get-EntraPasswordPolicy)|
| Set-MsolDirSyncConfiguration | [Set-EntraDirSyncConfiguration](/powershell/module/microsoft.graph.entra/Set-EntraDirSyncConfiguration)|
| Set-MsolDirSyncFeature | [Set-EntraDirSyncFeature](/powershell/module/microsoft.graph.entra/Set-EntraDirSyncFeature)|
| Set-MsolDomainFederationSettings | [Set-EntraDomainFederationSettings](/powershell/module/microsoft.graph.entra/Set-EntraDomainFederationSettings)|
| Set-MsolPartnerInformation | [Set-EntraPartnerInformation](/powershell/module/microsoft.graph.entra/Set-EntraPartnerInformation)|

:::zone-end

