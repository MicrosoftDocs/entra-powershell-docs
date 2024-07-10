---
title: "Azure AD PowerShell to Microsoft Entra PowerShell cmdlet map"
description: "Find the equivalents of Azure AD PowerShell cmdlets in Microsoft Entra PowerShell."

ms.topic: reference
ms.date: 07/10/2024
author: msewaweru
manager: CelesteDG
ms.author: eunicewaweru
ms.reviewer: stevemutungi

#customer intent: As a Microsoft Entra PowerShell user, I want to find the equivalents of Azure AD PowerShell cmdlets in Microsoft Entra PowerShell.
---

# Azure AD PowerShell to Microsoft Entra PowerShell cmdlet map

This reference page maps Azure AD PowerShell cmdlets to their equivalent Microsoft Entra PowerShell cmdlets. Use this page to find the equivalent cmdlet in Microsoft Entra PowerShell for the cmdlet you used in Azure AD PowerShell.

|Azure AD PowerShell cmdlet|Microsoft Entra PowerShell cmdlet|
|--------------------------|---------------------------------|
|Add-AzureADMSAdministrativeUnitMember, Add-AzureADMSAdministrativeUnitMember|[Add-EntraAdministrativeUnitMember](/powershell/module/microsoft.graph.entra/Add-EntraAdministrativeUnitMember)|
|Add-AzureAdApplicationOwner, Add-AzureADMSApplicationOwner|[Add-EntraApplicationOwner](/powershell/module/microsoft.graph.entra/Add-EntraApplicationOwner)|
|Add-AzureAdDeviceRegisteredOwner|[Add-EntraDeviceRegisteredOwner](/powershell/module/microsoft.graph.entra/Add-EntraDeviceRegisteredOwner)|
|Add-AzureAdDeviceRegisteredUser|[Add-EntraDeviceRegisteredUser](/powershell/module/microsoft.graph.entra/Add-EntraDeviceRegisteredUser)|
|Add-AzureAdDirectoryRoleMember|[Add-EntraDirectoryRoleMember](/powershell/module/microsoft.graph.entra/Add-EntraDirectoryRoleMember)|
|Add-AzureADEnvironment, Add-AzureADEnvironment|[Add-EntraEnvironment](/powershell/module/microsoft.graph.entra/Add-EntraEnvironment)|
|Add-AzureAdGroupMember|[Add-EntraGroupMember](/powershell/module/microsoft.graph.entra/Add-EntraGroupMember)|
|Add-AzureAdGroupOwner|[Add-EntraGroupOwner](/powershell/module/microsoft.graph.entra/Add-EntraGroupOwner)|
|Add-AzureADMSLifecyclePolicyGroup, Add-AzureADMSLifecyclePolicyGroup|[Add-EntraLifecyclePolicyGroup](/powershell/module/microsoft.graph.entra/Add-EntraLifecyclePolicyGroup)|
|Add-AzureADMSScopedRoleMembership, Add-AzureADMSScopedRoleMembership|[Add-EntraScopedRoleMembership](/powershell/module/microsoft.graph.entra/Add-EntraScopedRoleMembership)|
|Add-AzureADMSServicePrincipalDelegatedPermissionClassification, Add-AzureADMSServicePrincipalDelegatedPermissionClassification|[Add-EntraServicePrincipalDelegatedPermissionClassification](/powershell/module/microsoft.graph.entra/Add-EntraServicePrincipalDelegatedPermissionClassification)|
|Add-AzureAdServicePrincipalOwner|[Add-EntraServicePrincipalOwner](/powershell/module/microsoft.graph.entra/Add-EntraServicePrincipalOwner)|
|Confirm-AzureAdDomain|[Confirm-EntraDomain](/powershell/module/microsoft.graph.entra/Confirm-EntraDomain)|
|Connect-AzureAd|[Connect-Entra](/powershell/module/microsoft.graph.entra/Connect-Entra)|
|Convert-MSOLFederatedUser|[Convert-EntraFederatedUser](/powershell/module/microsoft.graph.entra/Convert-EntraFederatedUser)|
|Disconnect-AzureAD|[Disconnect-Entra](/powershell/module/microsoft.graph.entra/Disconnect-Entra)|
|Enable-AzureADDirectoryRole|[Enable-EntraDirectoryRole](/powershell/module/microsoft.graph.entra/Enable-EntraDirectoryRole)|
|Find-MgGraphPermission|[Find-EntraPermissions](/powershell/module/microsoft.graph.entra/Find-EntraPermissions)|
|Get-CrossCloudVerificationCode|[Get-CrossCloudVerificationCode](/powershell/module/microsoft.graph.entra/Get-CrossCloudVerificationCode)|
|Get-MSOLAccountSku|[Get-EntraAccountSku](/powershell/module/microsoft.graph.entra/Get-EntraAccountSku)|
|Get-AzureADMSAdministrativeUnit, Get-AzureADMSAdministrativeUnit|[Get-EntraAdministrativeUnit](/powershell/module/microsoft.graph.entra/Get-EntraAdministrativeUnit)|
|Get-AzureADMSAdministrativeUnitMember, Get-AzureADMSAdministrativeUnitMember|[Get-EntraAdministrativeUnitMember](/powershell/module/microsoft.graph.entra/Get-EntraAdministrativeUnitMember)|
|Get-AzureADApplication, Get-AzureADMSApplication|[Get-EntraApplication](/powershell/module/microsoft.graph.entra/Get-EntraApplication)|
|Get-AzureADApplicationExtensionProperty, Get-AzureADMSApplicationExtensionProperty|[Get-EntraApplicationExtensionProperty](/powershell/module/microsoft.graph.entra/Get-EntraApplicationExtensionProperty)|
|Get-AzureADApplicationKeyCredential|[Get-EntraApplicationKeyCredential](/powershell/module/microsoft.graph.entra/Get-EntraApplicationKeyCredential)|
|Get-AzureADApplicationLogo|[Get-EntraApplicationLogo](/powershell/module/microsoft.graph.entra/Get-EntraApplicationLogo)|
|Get-AzureADApplicationOwner, Get-AzureADMSApplicationOwner|[Get-EntraApplicationOwner](/powershell/module/microsoft.graph.entra/Get-EntraApplicationOwner)|
|Get-AzureADApplicationPasswordCredential|[Get-EntraApplicationPasswordCredential](/powershell/module/microsoft.graph.entra/Get-EntraApplicationPasswordCredential)|
|Get-AzureADApplicationProxyApplication|[Get-EntraApplicationProxyApplication](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyApplication)|
|Get-AzureADApplicationProxyApplicationConnectorGroup|[Get-EntraApplicationProxyApplicationConnectorGroup](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyApplicationConnectorGroup)|
|Get-AzureADApplicationProxyConnector|[Get-EntraApplicationProxyConnector](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyConnector)|
|Get-AzureADApplicationProxyConnectorGroup|[Get-EntraApplicationProxyConnectorGroup](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyConnectorGroup)|
|Get-AzureADApplicationProxyConnectorGroupMember|[Get-EntraApplicationProxyConnectorGroupMember](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyConnectorGroupMember)|
|Get-AzureADApplicationProxyConnectorGroupMembers|[Get-EntraApplicationProxyConnectorGroupMembers](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyConnectorGroupMembers)|
|Get-AzureADApplicationProxyConnectorMemberOf|[Get-EntraApplicationProxyConnectorMemberOf](/powershell/module/microsoft.graph.entra/Get-EntraApplicationProxyConnectorMemberOf)|
|Get-AzureADApplicationServiceEndpoint|[Get-EntraApplicationServiceEndpoint](/powershell/module/microsoft.graph.entra/Get-EntraApplicationServiceEndpoint)|
|Get-AzureADMSAuthorizationPolicy, Get-AzureADMSAuthorizationPolicy|[Get-EntraAuthorizationPolicy](/powershell/module/microsoft.graph.entra/Get-EntraAuthorizationPolicy)|
|Get-AzureADMSConditionalAccessPolicy, Get-AzureADMSConditionalAccessPolicy|[Get-EntraConditionalAccessPolicy](/powershell/module/microsoft.graph.entra/Get-EntraConditionalAccessPolicy)|
|Get-AzureADContact|[Get-EntraContact](/powershell/module/microsoft.graph.entra/Get-EntraContact)|
|Get-AzureADContactDirectReport|[Get-EntraContactDirectReport](/powershell/module/microsoft.graph.entra/Get-EntraContactDirectReport)|
|Get-AzureADContactManager|[Get-EntraContactManager](/powershell/module/microsoft.graph.entra/Get-EntraContactManager)|
|Get-AzureADContactMembership|[Get-EntraContactMembership](/powershell/module/microsoft.graph.entra/Get-EntraContactMembership)|
|Get-AzureADContactThumbnailPhoto|[Get-EntraContactThumbnailPhoto](/powershell/module/microsoft.graph.entra/Get-EntraContactThumbnailPhoto)|
|Get-MGContext, Get-MGContext|[Get-EntraContext](/powershell/module/microsoft.graph.entra/Get-EntraContext)|
|Get-AzureADContract|[Get-EntraContract](/powershell/module/microsoft.graph.entra/Get-EntraContract)|
|Get-AzureADCurrentSessionInfo|[Get-EntraCurrentSessionInfo](/powershell/module/microsoft.graph.entra/Get-EntraCurrentSessionInfo)|
|Get-AzureADDeletedApplication|[Get-EntraDeletedApplication](/powershell/module/microsoft.graph.entra/Get-EntraDeletedApplication)|
|Get-AzureADMSDeletedDirectoryObject, Get-AzureADMSDeletedDirectoryObject|[Get-EntraDeletedDirectoryObject](/powershell/module/microsoft.graph.entra/Get-EntraDeletedDirectoryObject)|
|Get-AzureADMSDeletedGroup, Get-AzureADMSDeletedGroup|[Get-EntraDeletedGroup](/powershell/module/microsoft.graph.entra/Get-EntraDeletedGroup)|
|Get-AzureADDevice|[Get-EntraDevice](/powershell/module/microsoft.graph.entra/Get-EntraDevice)|
|Get-AzureADDeviceRegisteredOwner|[Get-EntraDeviceRegisteredOwner](/powershell/module/microsoft.graph.entra/Get-EntraDeviceRegisteredOwner)|
|Get-AzureADDeviceRegisteredUser|[Get-EntraDeviceRegisteredUser](/powershell/module/microsoft.graph.entra/Get-EntraDeviceRegisteredUser)|
|Get-MSOLDirSyncConfiguration|[Get-EntraDirSyncConfiguration](/powershell/module/microsoft.graph.entra/Get-EntraDirSyncConfiguration)|
|Get-MSOLDirSyncfeature|[Get-EntraDirSyncfeature](/powershell/module/microsoft.graph.entra/Get-EntraDirSyncfeature)|
|Get-AzureADDirectoryRole|[Get-EntraDirectoryRole](/powershell/module/microsoft.graph.entra/Get-EntraDirectoryRole)|
|Get-AzureADDirectoryRoleMember|[Get-EntraDirectoryRoleMember](/powershell/module/microsoft.graph.entra/Get-EntraDirectoryRoleMember)|
|Get-AzureADDirectoryRoleTemplate|[Get-EntraDirectoryRoleTemplate](/powershell/module/microsoft.graph.entra/Get-EntraDirectoryRoleTemplate)|
|Get-AzureADDomain|[Get-EntraDomain](/powershell/module/microsoft.graph.entra/Get-EntraDomain)|
|Get-MSOLDomainFederationSettings|[Get-EntraDomainFederationSettings](/powershell/module/microsoft.graph.entra/Get-EntraDomainFederationSettings)|
|Get-AzureADDomainNameReference|[Get-EntraDomainNameReference](/powershell/module/microsoft.graph.entra/Get-EntraDomainNameReference)|
|Get-AzureADDomainServiceConfigurationRecord|[Get-EntraDomainServiceConfigurationRecord](/powershell/module/microsoft.graph.entra/Get-EntraDomainServiceConfigurationRecord)|
|Get-AzureADDomainVerificationDnsRecord|[Get-EntraDomainVerificationDnsRecord](/powershell/module/microsoft.graph.entra/Get-EntraDomainVerificationDnsRecord)|
|Get-MgEnvironment|[Get-EntraEnvironment](/powershell/module/microsoft.graph.entra/Get-EntraEnvironment)|
|Get-AzureADExtensionProperty|[Get-EntraExtensionProperty](/powershell/module/microsoft.graph.entra/Get-EntraExtensionProperty)|
|Get-MSOLFederationProperty|[Get-EntraFederationProperty](/powershell/module/microsoft.graph.entra/Get-EntraFederationProperty)|
|Get-AzureADGroup, Get-AzureADMSGroup|[Get-EntraGroup](/powershell/module/microsoft.graph.entra/Get-EntraGroup)|
|Get-AzureADGroupAppRoleAssignment|[Get-EntraGroupAppRoleAssignment](/powershell/module/microsoft.graph.entra/Get-EntraGroupAppRoleAssignment)|
|Get-AzureADMSGroupLifecyclePolicy, Get-AzureADMSGroupLifecyclePolicy|[Get-EntraGroupLifecyclePolicy](/powershell/module/microsoft.graph.entra/Get-EntraGroupLifecyclePolicy)|
|Get-AzureADGroupMember|[Get-EntraGroupMember](/powershell/module/microsoft.graph.entra/Get-EntraGroupMember)|
|Get-AzureADGroupOwner|[Get-EntraGroupOwner](/powershell/module/microsoft.graph.entra/Get-EntraGroupOwner)|
|Get-AzureADMSGroupPermissionGrant, Get-AzureADMSGroupPermissionGrant|[Get-EntraGroupPermissionGrant](/powershell/module/microsoft.graph.entra/Get-EntraGroupPermissionGrant)|
|Get-MSOLHasObjectsWithDirSyncProvisioningError|[Get-EntraHasObjectsWithDirSyncProvisioningError](/powershell/module/microsoft.graph.entra/Get-EntraHasObjectsWithDirSyncProvisioningError)|
|Get-AzureADMSIdentityProvider, Get-AzureADMSIdentityProvider|[Get-EntraIdentityProvider](/powershell/module/microsoft.graph.entra/Get-EntraIdentityProvider)|
|Get-AzureADMSLifecyclePolicyGroup, Get-AzureADMSLifecyclePolicyGroup|[Get-EntraLifecyclePolicyGroup](/powershell/module/microsoft.graph.entra/Get-EntraLifecyclePolicyGroup)|
|Get-AzureADMSNamedLocationPolicy, Get-AzureADMSNamedLocationPolicy|[Get-EntraNamedLocationPolicy](/powershell/module/microsoft.graph.entra/Get-EntraNamedLocationPolicy)|
|Get-AzureADOAuth2PermissionGrant|[Get-EntraOAuth2PermissionGrant](/powershell/module/microsoft.graph.entra/Get-EntraOAuth2PermissionGrant)|
|Get-AzureADObjectByObjectId|[Get-EntraObjectByObjectId](/powershell/module/microsoft.graph.entra/Get-EntraObjectByObjectId)|
|Get-MSOLPartnerInformation|[Get-EntraPartnerInformation](/powershell/module/microsoft.graph.entra/Get-EntraPartnerInformation)|
|Get-MSOLPasswordPolicy|[Get-EntraPasswordPolicy](/powershell/module/microsoft.graph.entra/Get-EntraPasswordPolicy)|
|Get-AzureADMSPermissionGrantConditionSet, Get-AzureADMSPermissionGrantConditionSet|[Get-EntraPermissionGrantConditionSet](/powershell/module/microsoft.graph.entra/Get-EntraPermissionGrantConditionSet)|
|Get-AzureADMSPermissionGrantPolicy, Get-AzureADMSPermissionGrantPolicy|[Get-EntraPermissionGrantPolicy](/powershell/module/microsoft.graph.entra/Get-EntraPermissionGrantPolicy)|
|Get-AzureADMSRoleAssignment, Get-AzureADMSRoleAssignment|[Get-EntraRoleAssignment](/powershell/module/microsoft.graph.entra/Get-EntraRoleAssignment)|
|Get-AzureADMSRoleDefinition, Get-AzureADMSRoleDefinition|[Get-EntraRoleDefinition](/powershell/module/microsoft.graph.entra/Get-EntraRoleDefinition)|
|Get-AzureADMSScopedRoleMembership, Get-AzureADMSScopedRoleMembership|[Get-EntraScopedRoleMembership](/powershell/module/microsoft.graph.entra/Get-EntraScopedRoleMembership)|
|Get-AzureADServiceAppRoleAssignedTo|[Get-EntraServiceAppRoleAssignedTo](/powershell/module/microsoft.graph.entra/Get-EntraServiceAppRoleAssignedTo)|
|Get-AzureADServiceAppRoleAssignment|[Get-EntraServiceAppRoleAssignment](/powershell/module/microsoft.graph.entra/Get-EntraServiceAppRoleAssignment)|
|Get-AzureADServicePrincipal|[Get-EntraServicePrincipal](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipal)|
|Get-AzureADServicePrincipalCreatedObject|[Get-EntraServicePrincipalCreatedObject](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalCreatedObject)|
|Get-AzureADMSServicePrincipalDelegatedPermissionClassification, Get-AzureADMSServicePrincipalDelegatedPermissionClassification|[Get-EntraServicePrincipalDelegatedPermissionClassification](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalDelegatedPermissionClassification)|
|Get-AzureADServicePrincipalKeyCredential|[Get-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalKeyCredential)|
|Get-AzureADServicePrincipalMembership|[Get-EntraServicePrincipalMembership](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalMembership)|
|Get-AzureADServicePrincipalOAuth2PermissionGrant|[Get-EntraServicePrincipalOAuth2PermissionGrant](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalOAuth2PermissionGrant)|
|Get-AzureADServicePrincipalOwnedObject|[Get-EntraServicePrincipalOwnedObject](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalOwnedObject)|
|Get-AzureADServicePrincipalOwner|[Get-EntraServicePrincipalOwner](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalOwner)|
|Get-AzureADServicePrincipalPasswordCredential|[Get-EntraServicePrincipalPasswordCredential](/powershell/module/microsoft.graph.entra/Get-EntraServicePrincipalPasswordCredential)|
|Get-AzureADSubscribedSku|[Get-EntraSubscribedSku](/powershell/module/microsoft.graph.entra/Get-EntraSubscribedSku)|
|Get-AzureADTenantDetail|[Get-EntraTenantDetail](/powershell/module/microsoft.graph.entra/Get-EntraTenantDetail)|
|Get-AzureADTrustedCertificateAuthority|[Get-EntraTrustedCertificateAuthority](/powershell/module/microsoft.graph.entra/Get-EntraTrustedCertificateAuthority)|
|Get-AzureADMSUnsupportedCommand, Get-AzureADMSUnsupportedCommand|[Get-EntraUnsupportedCommand](/powershell/module/microsoft.graph.entra/Get-EntraUnsupportedCommand)|
|Get-AzureADUser|[Get-EntraUser](/powershell/module/microsoft.graph.entra/Get-EntraUser)|
|Get-AzureADUserAppRoleAssignment|[Get-EntraUserAppRoleAssignment](/powershell/module/microsoft.graph.entra/Get-EntraUserAppRoleAssignment)|
|Get-AzureADUserCreatedObject|[Get-EntraUserCreatedObject](/powershell/module/microsoft.graph.entra/Get-EntraUserCreatedObject)|
|Get-AzureADUserDirectReport|[Get-EntraUserDirectReport](/powershell/module/microsoft.graph.entra/Get-EntraUserDirectReport)|
|Get-AzureADUserExtension|[Get-EntraUserExtension](/powershell/module/microsoft.graph.entra/Get-EntraUserExtension)|
|Get-AzureADUserLicenseDetail|[Get-EntraUserLicenseDetail](/powershell/module/microsoft.graph.entra/Get-EntraUserLicenseDetail)|
|Get-AzureADUserManager|[Get-EntraUserManager](/powershell/module/microsoft.graph.entra/Get-EntraUserManager)|
|Get-AzureADUserMembership|[Get-EntraUserMembership](/powershell/module/microsoft.graph.entra/Get-EntraUserMembership)|
|Get-AzureADUserOAuth2PermissionGrant|[Get-EntraUserOAuth2PermissionGrant](/powershell/module/microsoft.graph.entra/Get-EntraUserOAuth2PermissionGrant)|
|Get-AzureADUserOwnedDevice|[Get-EntraUserOwnedDevice](/powershell/module/microsoft.graph.entra/Get-EntraUserOwnedDevice)|
|Get-AzureADUserOwnedObject|[Get-EntraUserOwnedObject](/powershell/module/microsoft.graph.entra/Get-EntraUserOwnedObject)|
|Get-AzureADUserRegisteredDevice|[Get-EntraUserRegisteredDevice](/powershell/module/microsoft.graph.entra/Get-EntraUserRegisteredDevice)|
|Get-AzureADUserThumbnailPhoto|[Get-EntraUserThumbnailPhoto](/powershell/module/microsoft.graph.entra/Get-EntraUserThumbnailPhoto)|
|New-AzureADMSAdministrativeUnit, New-AzureADMSAdministrativeUnit|[New-EntraAdministrativeUnit](/powershell/module/microsoft.graph.entra/New-EntraAdministrativeUnit)|
|New-AzureADApplication, New-AzureADMSApplication|[New-EntraApplication](/powershell/module/microsoft.graph.entra/New-EntraApplication)|
|New-AzureADApplicationExtensionProperty, New-AzureADMSApplicationExtensionProperty|[New-EntraApplicationExtensionProperty](/powershell/module/microsoft.graph.entra/New-EntraApplicationExtensionProperty)|
|New-AzureADMSApplicationKey, New-AzureADMSApplicationKey|[New-EntraApplicationKey](/powershell/module/microsoft.graph.entra/New-EntraApplicationKey)|
|New-AzureADApplicationKeyCredential|[New-EntraApplicationKeyCredential](/powershell/module/microsoft.graph.entra/New-EntraApplicationKeyCredential)|
|New-AzureADMSApplicationPassword, New-AzureADMSApplicationPassword|[New-EntraApplicationPassword](/powershell/module/microsoft.graph.entra/New-EntraApplicationPassword)|
|New-AzureADApplicationPasswordCredential|[New-EntraApplicationPasswordCredential](/powershell/module/microsoft.graph.entra/New-EntraApplicationPasswordCredential)|
|New-AzureADApplicationProxyApplication|[New-EntraApplicationProxyApplication](/powershell/module/microsoft.graph.entra/New-EntraApplicationProxyApplication)|
|New-AzureADApplicationProxyConnectorGroup|[New-EntraApplicationProxyConnectorGroup](/powershell/module/microsoft.graph.entra/New-EntraApplicationProxyConnectorGroup)|
|New-AzureADMSConditionalAccessPolicy, New-AzureADMSConditionalAccessPolicy|[New-EntraConditionalAccessPolicy](/powershell/module/microsoft.graph.entra/New-EntraConditionalAccessPolicy)|
|New-AzureADDevice|[New-EntraDevice](/powershell/module/microsoft.graph.entra/New-EntraDevice)|
|New-AzureADDomain|[New-EntraDomain](/powershell/module/microsoft.graph.entra/New-EntraDomain)|
|New-AzureADGroup, New-AzureADMSGroup|[New-EntraGroup](/powershell/module/microsoft.graph.entra/New-EntraGroup)|
|New-AzureADGroupAppRoleAssignment|[New-EntraGroupAppRoleAssignment](/powershell/module/microsoft.graph.entra/New-EntraGroupAppRoleAssignment)|
|New-AzureADMSGroupLifecyclePolicy, New-AzureADMSGroupLifecyclePolicy|[New-EntraGroupLifecyclePolicy](/powershell/module/microsoft.graph.entra/New-EntraGroupLifecyclePolicy)|
|New-AzureADMSIdentityProvider, New-AzureADMSIdentityProvider|[New-EntraIdentityProvider](/powershell/module/microsoft.graph.entra/New-EntraIdentityProvider)|
|New-AzureADMSInvitation, New-AzureADMSInvitation|[New-EntraInvitation](/powershell/module/microsoft.graph.entra/New-EntraInvitation)|
|New-AzureADMSNamedLocationPolicy, New-AzureADMSNamedLocationPolicy|[New-EntraNamedLocationPolicy](/powershell/module/microsoft.graph.entra/New-EntraNamedLocationPolicy)|
|New-AzureADMSPermissionGrantConditionSet, New-AzureADMSPermissionGrantConditionSet|[New-EntraPermissionGrantConditionSet](/powershell/module/microsoft.graph.entra/New-EntraPermissionGrantConditionSet)|
|New-AzureADMSPermissionGrantPolicy, New-AzureADMSPermissionGrantPolicy|[New-EntraPermissionGrantPolicy](/powershell/module/microsoft.graph.entra/New-EntraPermissionGrantPolicy)|
|New-AzureADMSRoleAssignment, New-AzureADMSRoleAssignment|[New-EntraRoleAssignment](/powershell/module/microsoft.graph.entra/New-EntraRoleAssignment)|
|New-AzureADMSRoleDefinition, New-AzureADMSRoleDefinition|[New-EntraRoleDefinition](/powershell/module/microsoft.graph.entra/New-EntraRoleDefinition)|
|New-AzureADServiceAppRoleAssignment|[New-EntraServiceAppRoleAssignment](/powershell/module/microsoft.graph.entra/New-EntraServiceAppRoleAssignment)|
|New-AzureADServicePrincipal|[New-EntraServicePrincipal](/powershell/module/microsoft.graph.entra/New-EntraServicePrincipal)|
|New-AzureADServicePrincipalKeyCredential|[New-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.graph.entra/New-EntraServicePrincipalKeyCredential)|
|New-AzureADServicePrincipalPasswordCredential|[New-EntraServicePrincipalPasswordCredential](/powershell/module/microsoft.graph.entra/New-EntraServicePrincipalPasswordCredential)|
|New-AzureADTrustedCertificateAuthority|[New-EntraTrustedCertificateAuthority](/powershell/module/microsoft.graph.entra/New-EntraTrustedCertificateAuthority)|
|New-AzureADUser|[New-EntraUser](/powershell/module/microsoft.graph.entra/New-EntraUser)|
|New-AzureADUserAppRoleAssignment|[New-EntraUserAppRoleAssignment](/powershell/module/microsoft.graph.entra/New-EntraUserAppRoleAssignment)|
|Remove-AzureADMSAdministrativeUnit, Remove-AzureADMSAdministrativeUnit|[Remove-EntraAdministrativeUnit](/powershell/module/microsoft.graph.entra/Remove-EntraAdministrativeUnit)|
|Remove-AzureADMSAdministrativeUnitMember, Remove-AzureADMSAdministrativeUnitMember|[Remove-EntraAdministrativeUnitMember](/powershell/module/microsoft.graph.entra/Remove-EntraAdministrativeUnitMember)|
|Remove-AzureADApplication, Remove-AzureADMSApplication|[Remove-EntraApplication](/powershell/module/microsoft.graph.entra/Remove-EntraApplication)|
|Remove-AzureADApplicationExtensionProperty, Remove-AzureADMSApplicationExtensionProperty|[Remove-EntraApplicationExtensionProperty](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationExtensionProperty)|
|Remove-AzureADMSApplicationKey, Remove-AzureADMSApplicationKey|[Remove-EntraApplicationKey](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationKey)|
|Remove-AzureADApplicationKeyCredential|[Remove-EntraApplicationKeyCredential](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationKeyCredential)|
|Remove-AzureADApplicationOwner, Remove-AzureADMSApplicationOwner|[Remove-EntraApplicationOwner](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationOwner)|
|Remove-AzureADMSApplicationPassword, Remove-AzureADMSApplicationPassword|[Remove-EntraApplicationPassword](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationPassword)|
|Remove-AzureADApplicationPasswordCredential|[Remove-EntraApplicationPasswordCredential](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationPasswordCredential)|
|Remove-AzureADApplicationProxyApplication|[Remove-EntraApplicationProxyApplication](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationProxyApplication)|
|Remove-AzureADApplicationProxyApplicationConnectorGroup|[Remove-EntraApplicationProxyApplicationConnectorGroup](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationProxyApplicationConnectorGroup)|
|Remove-AzureADApplicationProxyConnectorGroup|[Remove-EntraApplicationProxyConnectorGroup](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationProxyConnectorGroup)|
|Remove-AzureADMSApplicationVerifiedPublisher, Remove-AzureADMSApplicationVerifiedPublisher|[Remove-EntraApplicationVerifiedPublisher](/powershell/module/microsoft.graph.entra/Remove-EntraApplicationVerifiedPublisher)|
|Remove-AzureADMSConditionalAccessPolicy, Remove-AzureADMSConditionalAccessPolicy|[Remove-EntraConditionalAccessPolicy](/powershell/module/microsoft.graph.entra/Remove-EntraConditionalAccessPolicy)|
|Remove-AzureADContact|[Remove-EntraContact](/powershell/module/microsoft.graph.entra/Remove-EntraContact)|
|Remove-AzureADDeletedApplication|[Remove-EntraDeletedApplication](/powershell/module/microsoft.graph.entra/Remove-EntraDeletedApplication)|
|Remove-AzureADMSDeletedDirectoryObject, Remove-AzureADMSDeletedDirectoryObject|[Remove-EntraDeletedDirectoryObject](/powershell/module/microsoft.graph.entra/Remove-EntraDeletedDirectoryObject)|
|Remove-AzureADDevice|[Remove-EntraDevice](/powershell/module/microsoft.graph.entra/Remove-EntraDevice)|
|Remove-AzureADDeviceRegisteredOwner|[Remove-EntraDeviceRegisteredOwner](/powershell/module/microsoft.graph.entra/Remove-EntraDeviceRegisteredOwner)|
|Remove-AzureADDeviceRegisteredUser|[Remove-EntraDeviceRegisteredUser](/powershell/module/microsoft.graph.entra/Remove-EntraDeviceRegisteredUser)|
|Remove-AzureADDirectoryRoleMember|[Remove-EntraDirectoryRoleMember](/powershell/module/microsoft.graph.entra/Remove-EntraDirectoryRoleMember)|
|Remove-AzureADDomain|[Remove-EntraDomain](/powershell/module/microsoft.graph.entra/Remove-EntraDomain)|
|Remove-AzureADGroup, Remove-AzureADMSGroup|[Remove-EntraGroup](/powershell/module/microsoft.graph.entra/Remove-EntraGroup)|
|Remove-AzureADGroupAppRoleAssignment|[Remove-EntraGroupAppRoleAssignment](/powershell/module/microsoft.graph.entra/Remove-EntraGroupAppRoleAssignment)|
|Remove-AzureADMSGroupLifecyclePolicy, Remove-AzureADMSGroupLifecyclePolicy|[Remove-EntraGroupLifecyclePolicy](/powershell/module/microsoft.graph.entra/Remove-EntraGroupLifecyclePolicy)|
|Remove-AzureADGroupMember|[Remove-EntraGroupMember](/powershell/module/microsoft.graph.entra/Remove-EntraGroupMember)|
|Remove-AzureADGroupOwner|[Remove-EntraGroupOwner](/powershell/module/microsoft.graph.entra/Remove-EntraGroupOwner)|
|Remove-AzureADMSIdentityProvider, Remove-AzureADMSIdentityProvider|[Remove-EntraIdentityProvider](/powershell/module/microsoft.graph.entra/Remove-EntraIdentityProvider)|
|Remove-AzureADMSLifecyclePolicyGroup, Remove-AzureADMSLifecyclePolicyGroup|[Remove-EntraLifecyclePolicyGroup](/powershell/module/microsoft.graph.entra/Remove-EntraLifecyclePolicyGroup)|
|Remove-AzureADMSNamedLocationPolicy, Remove-AzureADMSNamedLocationPolicy|[Remove-EntraNamedLocationPolicy](/powershell/module/microsoft.graph.entra/Remove-EntraNamedLocationPolicy)|
|Remove-AzureADOAuth2PermissionGrant|[Remove-EntraOAuth2PermissionGrant](/powershell/module/microsoft.graph.entra/Remove-EntraOAuth2PermissionGrant)|
|Remove-AzureADMSPermissionGrantConditionSet, Remove-AzureADMSPermissionGrantConditionSet|[Remove-EntraPermissionGrantConditionSet](/powershell/module/microsoft.graph.entra/Remove-EntraPermissionGrantConditionSet)|
|Remove-AzureADMSPermissionGrantPolicy, Remove-AzureADMSPermissionGrantPolicy|[Remove-EntraPermissionGrantPolicy](/powershell/module/microsoft.graph.entra/Remove-EntraPermissionGrantPolicy)|
|Remove-AzureADMSRoleAssignment, Remove-AzureADMSRoleAssignment|[Remove-EntraRoleAssignment](/powershell/module/microsoft.graph.entra/Remove-EntraRoleAssignment)|
|Remove-AzureADMSRoleDefinition, Remove-AzureADMSRoleDefinition|[Remove-EntraRoleDefinition](/powershell/module/microsoft.graph.entra/Remove-EntraRoleDefinition)|
|Remove-AzureADMSScopedRoleMembership, Remove-AzureADMSScopedRoleMembership|[Remove-EntraScopedRoleMembership](/powershell/module/microsoft.graph.entra/Remove-EntraScopedRoleMembership)|
|Remove-AzureADServiceAppRoleAssignment|[Remove-EntraServiceAppRoleAssignment](/powershell/module/microsoft.graph.entra/Remove-EntraServiceAppRoleAssignment)|
|Remove-AzureADServicePrincipal|[Remove-EntraServicePrincipal](/powershell/module/microsoft.graph.entra/Remove-EntraServicePrincipal)|
|Remove-AzureADMSServicePrincipalDelegatedPermissionClassification, Remove-AzureADMSServicePrincipalDelegatedPermissionClassification|[Remove-EntraServicePrincipalDelegatedPermissionClassification](/powershell/module/microsoft.graph.entra/Remove-EntraServicePrincipalDelegatedPermissionClassification)|
|Remove-AzureADServicePrincipalKeyCredential|[Remove-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.graph.entra/Remove-EntraServicePrincipalKeyCredential)|
|Remove-AzureADServicePrincipalOwner|[Remove-EntraServicePrincipalOwner](/powershell/module/microsoft.graph.entra/Remove-EntraServicePrincipalOwner)|
|Remove-AzureADServicePrincipalPasswordCredential|[Remove-EntraServicePrincipalPasswordCredential](/powershell/module/microsoft.graph.entra/Remove-EntraServicePrincipalPasswordCredential)|
|Remove-AzureADTrustedCertificateAuthority|[Remove-EntraTrustedCertificateAuthority](/powershell/module/microsoft.graph.entra/Remove-EntraTrustedCertificateAuthority)|
|Remove-AzureADUser|[Remove-EntraUser](/powershell/module/microsoft.graph.entra/Remove-EntraUser)|
|Remove-AzureADUserAppRoleAssignment|[Remove-EntraUserAppRoleAssignment](/powershell/module/microsoft.graph.entra/Remove-EntraUserAppRoleAssignment)|
|Remove-AzureADUserExtension|[Remove-EntraUserExtension](/powershell/module/microsoft.graph.entra/Remove-EntraUserExtension)|
|Remove-AzureADUserManager|[Remove-EntraUserManager](/powershell/module/microsoft.graph.entra/Remove-EntraUserManager)|
|Reset-AzureADMSLifeCycleGroup, Reset-AzureADMSLifeCycleGroup|[Reset-EntraLifeCycleGroup](/powershell/module/microsoft.graph.entra/Reset-EntraLifeCycleGroup)|
|Restore-AzureADDeletedApplication|[Restore-EntraDeletedApplication](/powershell/module/microsoft.graph.entra/Restore-EntraDeletedApplication)|
|Restore-AzureADMSDeletedDirectoryObject, Restore-AzureADMSDeletedDirectoryObject|[Restore-EntraDeletedDirectoryObject](/powershell/module/microsoft.graph.entra/Restore-EntraDeletedDirectoryObject)|
|Revoke-AzureADSignedInUserAllRefreshToken|[Revoke-EntraSignedInUserAllRefreshToken](/powershell/module/microsoft.graph.entra/Revoke-EntraSignedInUserAllRefreshToken)|
|Revoke-AzureADUserAllRefreshToken|[Revoke-EntraUserAllRefreshToken](/powershell/module/microsoft.graph.entra/Revoke-EntraUserAllRefreshToken)|
|Select-AzureADGroupIdsContactIsMemberOf|[Select-EntraGroupIdsContactIsMemberOf](/powershell/module/microsoft.graph.entra/Select-EntraGroupIdsContactIsMemberOf)|
|Select-AzureADGroupIdsGroupIsMemberOf|[Select-EntraGroupIdsGroupIsMemberOf](/powershell/module/microsoft.graph.entra/Select-EntraGroupIdsGroupIsMemberOf)|
|Select-AzureADGroupIdsServicePrincipalIsMemberOf|[Select-EntraGroupIdsServicePrincipalIsMemberOf](/powershell/module/microsoft.graph.entra/Select-EntraGroupIdsServicePrincipalIsMemberOf)|
|Select-AzureADGroupIdsUserIsMemberOf|[Select-EntraGroupIdsUserIsMemberOf](/powershell/module/microsoft.graph.entra/Select-EntraGroupIdsUserIsMemberOf)|
|Set-AzureADMSAdministrativeUnit, Set-AzureADMSAdministrativeUnit|[Set-EntraAdministrativeUnit](/powershell/module/microsoft.graph.entra/Set-EntraAdministrativeUnit)|
|Set-AzureADApplication, Set-AzureADMSApplication|[Set-EntraApplication](/powershell/module/microsoft.graph.entra/Set-EntraApplication)|
|Set-AzureADApplicationLogo, Set-AzureADMSApplicationLogo|[Set-EntraApplicationLogo](/powershell/module/microsoft.graph.entra/Set-EntraApplicationLogo)|
|Set-AzureADApplicationProxyApplication|[Set-EntraApplicationProxyApplication](/powershell/module/microsoft.graph.entra/Set-EntraApplicationProxyApplication)|
|Set-AzureADApplicationProxyApplicationCustomDomainCertificate|[Set-EntraApplicationProxyApplicationCustomDomainCertificate](/powershell/module/microsoft.graph.entra/Set-EntraApplicationProxyApplicationCustomDomainCertificate)|
|Set-AzureADApplicationProxyApplicationSingleSignOn|[Set-EntraApplicationProxyApplicationSingleSignOn](/powershell/module/microsoft.graph.entra/Set-EntraApplicationProxyApplicationSingleSignOn)|
|Set-AzureADApplicationProxyConnector|[Set-EntraApplicationProxyConnector](/powershell/module/microsoft.graph.entra/Set-EntraApplicationProxyConnector)|
|Set-AzureADApplicationProxyConnectorGroup|[Set-EntraApplicationProxyConnectorGroup](/powershell/module/microsoft.graph.entra/Set-EntraApplicationProxyConnectorGroup)|
|Set-AzureADMSApplicationVerifiedPublisher, Set-AzureADMSApplicationVerifiedPublisher|[Set-EntraApplicationVerifiedPublisher](/powershell/module/microsoft.graph.entra/Set-EntraApplicationVerifiedPublisher)|
|Set-AzureADMSAuthorizationPolicy, Set-AzureADMSAuthorizationPolicy|[Set-EntraAuthorizationPolicy](/powershell/module/microsoft.graph.entra/Set-EntraAuthorizationPolicy)|
|Set-AzureADMSConditionalAccessPolicy, Set-AzureADMSConditionalAccessPolicy|[Set-EntraConditionalAccessPolicy](/powershell/module/microsoft.graph.entra/Set-EntraConditionalAccessPolicy)|
|Set-AzureADDevice|[Set-EntraDevice](/powershell/module/microsoft.graph.entra/Set-EntraDevice)|
|Set-MSOLDirSyncConfiguration|[Set-EntraDirSyncConfiguration](/powershell/module/microsoft.graph.entra/Set-EntraDirSyncConfiguration)|
|Set-MSOLDirSyncFeature|[Set-EntraDirSyncFeature](/powershell/module/microsoft.graph.entra/Set-EntraDirSyncFeature)|
|Set-AzureADDomain|[Set-EntraDomain](/powershell/module/microsoft.graph.entra/Set-EntraDomain)|
|Set-MSOLDomainFederationSettings|[Set-EntraDomainFederationSettings](/powershell/module/microsoft.graph.entra/Set-EntraDomainFederationSettings)|
|Set-AzureADGroup, Set-AzureADMSGroup|[Set-EntraGroup](/powershell/module/microsoft.graph.entra/Set-EntraGroup)|
|Set-AzureADMSGroupLifecyclePolicy, Set-AzureADMSGroupLifecyclePolicy|[Set-EntraGroupLifecyclePolicy](/powershell/module/microsoft.graph.entra/Set-EntraGroupLifecyclePolicy)|
|Set-AzureADMSIdentityProvider, Set-AzureADMSIdentityProvider|[Set-EntraIdentityProvider](/powershell/module/microsoft.graph.entra/Set-EntraIdentityProvider)|
|Set-AzureADMSNamedLocationPolicy, Set-AzureADMSNamedLocationPolicy|[Set-EntraNamedLocationPolicy](/powershell/module/microsoft.graph.entra/Set-EntraNamedLocationPolicy)|
|Set-MSOLPartnerInformation|[Set-EntraPartnerInformation](/powershell/module/microsoft.graph.entra/Set-EntraPartnerInformation)|
|Set-AzureADMSPermissionGrantConditionSet, Set-AzureADMSPermissionGrantConditionSet|[Set-EntraPermissionGrantConditionSet](/powershell/module/microsoft.graph.entra/Set-EntraPermissionGrantConditionSet)|
|Set-AzureADMSPermissionGrantPolicy, Set-AzureADMSPermissionGrantPolicy|[Set-EntraPermissionGrantPolicy](/powershell/module/microsoft.graph.entra/Set-EntraPermissionGrantPolicy)|
|Set-AzureADMSRoleDefinition, Set-AzureADMSRoleDefinition|[Set-EntraRoleDefinition](/powershell/module/microsoft.graph.entra/Set-EntraRoleDefinition)|
|Set-AzureAdServicePrincipal|[Set-EntraServicePrincipal](/powershell/module/microsoft.graph.entra/Set-EntraServicePrincipal)|
|Set-AzureAdTenantDetail|[Set-EntraTenantDetail](/powershell/module/microsoft.graph.entra/Set-EntraTenantDetail)|
|Set-AzureAdTrustedCertificateAuthority|[Set-EntraTrustedCertificateAuthority](/powershell/module/microsoft.graph.entra/Set-EntraTrustedCertificateAuthority)|
|Set-AzureAdUser|[Set-EntraUser](/powershell/module/microsoft.graph.entra/Set-EntraUser)|
|Set-AzureAdUserExtension|[Set-EntraUserExtension](/powershell/module/microsoft.graph.entra/Set-EntraUserExtension)|
|Set-AzureAdUserLicense|[Set-EntraUserLicense](/powershell/module/microsoft.graph.entra/Set-EntraUserLicense)|
|Set-AzureAdUserManager|[Set-EntraUserManager](/powershell/module/microsoft.graph.entra/Set-EntraUserManager)|
|Set-AzureAdUserPassword|[Set-EntraUserPassword](/powershell/module/microsoft.graph.entra/Set-EntraUserPassword)|
|Set-AzureAdUserThumbnailPhoto|[Set-EntraUserThumbnailPhoto](/powershell/module/microsoft.graph.entra/Set-EntraUserThumbnailPhoto)|
|Update-AzureAdSignedInUserPassword|[Update-EntraSignedInUserPassword](/powershell/module/microsoft.graph.entra/Update-EntraSignedInUserPassword)|


