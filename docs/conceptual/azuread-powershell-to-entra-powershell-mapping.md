---
title: "Find Azure AD PowerShell and MSOnline cmdlet equivalents in Microsoft Entra PowerShell"
description: "Find the equivalents of Azure AD PowerShell cmdlets in Microsoft Entra PowerShell."

ms.topic: reference
ms.date: 03/20/2025
author: msewaweru
manager: mwongerapk
ms.author: eunicewaweru
ms.reviewer: stevemutungi
zone_pivot_groups: entra-powershell-legacy-modules
zone_pivot_group_filename: entra-powershell/zone-pivot-groups.json

#customer intent: As a Microsoft Entra PowerShell user, I want to find the equivalents of Azure AD PowerShell cmdlets in Microsoft Entra PowerShell.
---
# Find Azure AD PowerShell and MSOnline cmdlet equivalents in Microsoft Entra PowerShell

The Microsoft Entra PowerShell module is over 98% compatible with the Azure AD and Azure AD Preview PowerShell modules. Additionally, it provides parity for MSOnline cmdlets that weren't migrated to Azure AD PowerShell. Use this page to find the equivalent cmdlets in Microsoft Entra PowerShell for the cmdlets you used in the Azure AD, Azure AD Preview, and MSOnline PowerShell modules.

:::zone pivot="azure-ad-powershell"

## Azure AD PowerShell to Microsoft Entra PowerShell

|Azure AD PowerShell cmdlet|Microsoft Entra PowerShell cmdlet|
|--------------------------|---------------------------------|
| Add-AzureADMSAdministrativeUnitMember | [Add-EntraAdministrativeUnitMember](/powershell/module/microsoft.entra.directorymanagement/add-entraadministrativeunitmember) |
| Add-AzureADApplicationOwner, Add-AzureADMSApplicationOwner | [Add-EntraApplicationOwner](/powershell/module/microsoft.entra.applications/add-entraapplicationowner) |
| Add-AzureADDeviceRegisteredOwner | [Add-EntraDeviceRegisteredOwner](/powershell/module/microsoft.entra.directorymanagement/add-entradeviceregisteredowner) |
| Add-AzureADDeviceRegisteredUser | [Add-EntraDeviceRegisteredUser](/powershell/module/microsoft.entra.directorymanagement/add-entradeviceregistereduser) |
| Add-AzureADDirectoryRoleMember | [Add-EntraDirectoryRoleMember](/powershell/module/microsoft.entra.directorymanagement/add-entradirectoryrolemember) |
| Add-AzureADEnvironment | [Add-EntraEnvironment](/powershell/module/microsoft.entra.authentication/add-entraenvironment) |
| Add-AzureADGroupMember | [Add-EntraGroupMember](/powershell/module/microsoft.entra.groups/add-entragroupmember) |
| Add-AzureADGroupOwner | [Add-EntraGroupOwner](/powershell/module/microsoft.entra.groups/add-entragroupowner) |
| Add-AzureADMSLifecyclePolicyGroup | [Add-EntraLifecyclePolicyGroup](/powershell/module/microsoft.entra.groups/add-entralifecyclepolicygroup) |
| Add-AzureADMSScopedRoleMembership | [Add-EntraScopedRoleMembership](/powershell/module/microsoft.entra.directorymanagement/add-entrascopedrolemembership) |
| Add-AzureADMSServicePrincipalDelegatedPermissionClassification | [Add-EntraServicePrincipalDelegatedPermissionClassification](/powershell/module/microsoft.entra.applications/add-entraserviceprincipaldelegatedpermissionclassification) |
| Add-AzureADServicePrincipalOwner | [Add-EntraServicePrincipalOwner](/powershell/module/microsoft.entra.applications/add-entraserviceprincipalowner) |
| Confirm-AzureADDomain | [Confirm-EntraDomain](/powershell/module/microsoft.entra.directorymanagement/confirm-entradomain) |
| Connect-AzureAD | [Connect-Entra](/powershell/module/microsoft.entra.authentication/connect-entra) |
| Disconnect-AzureAD | [Disconnect-Entra](/powershell/module/microsoft.entra.authentication/disconnect-entra) |
| Enable-AzureADDirectoryRole | [Enable-EntraDirectoryRole](/powershell/module/microsoft.entra.directorymanagement/enable-entradirectoryrole) |
| Get-CrossCloudVerificationCode | [Get-CrossCloudVerificationCode](/powershell/module/microsoft.entra.directorymanagement/get-crosscloudverificationcode) |
| Get-AzureADMSAdministrativeUnit | [Get-EntraAdministrativeUnit](/powershell/module/microsoft.entra.directorymanagement/get-entraadministrativeunit) |
| Get-AzureADMSAdministrativeUnitMember | [Get-EntraAdministrativeUnitMember](/powershell/module/microsoft.entra.directorymanagement/get-entraadministrativeunitmember) |
| Get-AzureADApplication, Get-AzureADMSApplication | [Get-EntraApplication](/powershell/module/microsoft.entra.applications/get-entraapplication) |
| Get-AzureADApplicationExtensionProperty, Get-AzureADMSApplicationExtensionProperty | [Get-EntraApplicationExtensionProperty](/powershell/module/microsoft.entra.applications/get-entraapplicationextensionproperty) |
| Get-AzureADApplicationKeyCredential | [Get-EntraApplicationKeyCredential](/powershell/module/microsoft.entra.applications/get-entraapplicationkeycredential) |
| Get-AzureADApplicationLogo | [Get-EntraApplicationLogo](/powershell/module/microsoft.entra.applications/get-entraapplicationlogo) |
| Get-AzureADApplicationOwner, Get-AzureADMSApplicationOwner | [Get-EntraApplicationOwner](/powershell/module/microsoft.entra.applications/get-entraapplicationowner) |
| Get-AzureADApplicationPasswordCredential | [Get-EntraApplicationPasswordCredential](/powershell/module/microsoft.entra.applications/get-entraapplicationpasswordcredential) |
| Get-AzureADApplicationProxyApplication | [Get-EntraBetaApplicationProxyApplication](/powershell/module/microsoft.entra.beta.applications/get-entrabetaapplicationproxyapplication) |
| Get-AzureADApplicationProxyApplicationConnectorGroup | [Get-EntraBetaApplicationProxyApplicationConnectorGroup](/powershell/module/microsoft.entra.beta.applications/get-entrabetaapplicationproxyapplicationconnectorgroup) |
| Get-AzureADApplicationProxyConnector | [Get-EntraBetaApplicationProxyConnector](/powershell/module/microsoft.entra.beta.applications/get-entrabetaapplicationproxyconnector) |
| Get-AzureADApplicationProxyConnectorGroup | [Get-EntraBetaApplicationProxyConnectorGroup](/powershell/module/microsoft.entra.beta.applications/get-entrabetaapplicationproxyconnectorgroup) |
| Get-AzureADApplicationProxyConnectorGroupMember | |
| Get-AzureADApplicationProxyConnectorGroupMembers | [Get-EntraBetaApplicationProxyConnectorGroupMembers](/powershell/module/microsoft.entra.beta.applications/get-entrabetaapplicationproxyconnectorgroupmembers) |
| Get-AzureADApplicationProxyConnectorMemberOf | [Get-EntraBetaApplicationProxyConnectorMemberOf](/powershell/module/microsoft.entra.beta.applications/get-entrabetaapplicationproxyconnectormemberof) |
| Get-AzureADApplicationServiceEndpoint | [Get-EntraApplicationServiceEndpoint](/powershell/module/microsoft.entra.applications/get-entraapplicationserviceendpoint) |
| Get-AzureADMSAuthorizationPolicy | [Get-EntraAuthorizationPolicy](/powershell/module/microsoft.entra.signins/get-entraauthorizationpolicy) |
| Get-AzureADMSConditionalAccessPolicy | [Get-EntraConditionalAccessPolicy](/powershell/module/microsoft.entra.signins/get-entraconditionalaccesspolicy) |
| Get-AzureADContact | [Get-EntraContact](/powershell/module/microsoft.entra.directorymanagement/get-entracontact) |
| Get-AzureADContactDirectReport | [Get-EntraContactDirectReport](/powershell/module/microsoft.entra.directorymanagement/get-entracontactdirectreport) |
| Get-AzureADContactManager | [Get-EntraContactManager](/powershell/module/microsoft.entra.directorymanagement/get-entracontactmanager) |
| Get-AzureADContactMembership | [Get-EntraContactMembership](/powershell/module/microsoft.entra.directorymanagement/get-entracontactmembership) |
| Get-AzureADContactThumbnailPhoto | [Get-EntraContactThumbnailPhoto](/powershell/module/microsoft.entra.directorymanagement/get-entracontactthumbnailphoto) |
| Get-AzureADContract | [Get-EntraContract](/powershell/module/microsoft.entra.directorymanagement/get-entracontract) |
| Get-AzureADCurrentSessionInfo | [Get-EntraContext](/powershell/module/microsoft.entra.authentication/get-entracontext) |
| Get-AzureADDeletedApplication | [Get-EntraDeletedApplication](/powershell/module/microsoft.entra.applications/get-entradeletedapplication) |
| Get-AzureADMSDeletedDirectoryObject | [Get-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra.directorymanagement/get-entradeleteddirectoryobject) |
| Get-AzureADMSDeletedGroup | [Get-EntraDeletedGroup](/powershell/module/microsoft.entra.groups/get-entradeletedgroup) |
| Get-AzureADDevice | [Get-EntraDevice](/powershell/module/microsoft.entra.directorymanagement/get-entradevice) |
| Get-AzureADDeviceRegisteredOwner | [Get-EntraDeviceRegisteredOwner](/powershell/module/microsoft.entra.directorymanagement/get-entradeviceregisteredowner) |
| Get-AzureADDeviceRegisteredUser | [Get-EntraDeviceRegisteredUser](/powershell/module/microsoft.entra.directorymanagement/get-entradeviceregistereduser) |
| Get-AzureADDirectoryRole | [Get-EntraDirectoryRole](/powershell/module/microsoft.entra.directorymanagement/get-entradirectoryrole) |
| Get-AzureADDirectoryRoleMember | [Get-EntraDirectoryRoleMember](/powershell/module/microsoft.entra.directorymanagement/get-entradirectoryrolemember) |
| Get-AzureADDirectoryRoleTemplate | [Get-EntraDirectoryRoleTemplate](/powershell/module/microsoft.entra.directorymanagement/get-entradirectoryroletemplate) |
| Get-AzureADDomain | [Get-EntraDomain](/powershell/module/microsoft.entra.directorymanagement/get-entradomain) |
| Get-AzureADDomainNameReference | [Get-EntraDomainNameReference](/powershell/module/microsoft.entra.directorymanagement/get-entradomainnamereference) |
| Get-AzureADDomainServiceConfigurationRecord | [Get-EntraDomainServiceConfigurationRecord](/powershell/module/microsoft.entra.directorymanagement/get-entradomainserviceconfigurationrecord) |
| Get-AzureADDomainVerificationDnsRecord | [Get-EntraDomainVerificationDnsRecord](/powershell/module/microsoft.entra.directorymanagement/get-entradomainverificationdnsrecord) |
| Get-AzureADExtensionProperty | [Get-EntraExtensionProperty](/powershell/module/microsoft.entra.directorymanagement/get-entraextensionproperty) |
| Get-AzureADGroup, Get-AzureADMSGroup | [Get-EntraGroup](/powershell/module/microsoft.entra.groups/get-entragroup) |
| Get-AzureADGroupAppRoleAssignment | [Get-EntraGroupAppRoleAssignment](/powershell/module/microsoft.entra.groups/get-entragroupapproleassignment) |
| Get-AzureADMSGroupLifecyclePolicy | [Get-EntraGroupLifecyclePolicy](/powershell/module/microsoft.entra.groups/get-entragrouplifecyclepolicy) |
| Get-AzureADGroupMember | [Get-EntraGroupMember](/powershell/module/microsoft.entra.groups/get-entragroupmember) |
| Get-AzureADGroupOwner | [Get-EntraGroupOwner](/powershell/module/microsoft.entra.groups/get-entragroupowner) |
| Get-AzureADMSGroupPermissionGrant | [Get-EntraGroupPermissionGrant](/powershell/module/microsoft.entra.groups/get-entragrouppermissiongrant) |
| Get-AzureADMSIdentityProvider | [Get-EntraIdentityProvider](/powershell/module/microsoft.entra.signins/get-entraidentityprovider) |
| Get-AzureADMSLifecyclePolicyGroup | [Get-EntraLifecyclePolicyGroup](/powershell/module/microsoft.entra.groups/get-entralifecyclepolicygroup) |
| Get-AzureADMSNamedLocationPolicy | [Get-EntraNamedLocationPolicy](/powershell/module/microsoft.entra.signins/get-entranamedlocationpolicy) |
| Get-AzureADOAuth2PermissionGrant | [Get-EntraOAuth2PermissionGrant](/powershell/module/microsoft.entra.signins/get-entraoauth2permissiongrant) |
| Get-AzureADObjectByObjectId |[Get-EntraDirectoryObject](/powershell/module/microsoft.entra.directorymanagement/get-entradirectoryobject)|
| Get-AzureADMSPermissionGrantConditionSet | [Get-EntraPermissionGrantConditionSet](/powershell/module/microsoft.entra.signins/get-entrapermissiongrantconditionset) |
| Get-AzureADMSPermissionGrantPolicy | [Get-EntraPermissionGrantPolicy](/powershell/module/microsoft.entra.signins/get-entrapermissiongrantpolicy) |
| Get-AzureADMSRoleAssignment | [Get-EntraDirectoryRoleAssignment](/powershell/module/microsoft.entra.governance/get-entradirectoryroleassignment) |
| Get-AzureADMSRoleDefinition | [Get-EntraDirectoryRoleDefinition](/powershell/module/microsoft.entra.governance/get-entradirectoryroledefinition) |
| Get-AzureADMSScopedRoleMembership | [Get-EntraScopedRoleMembership](/powershell/module/microsoft.entra.directorymanagement/get-entrascopedrolemembership) |
| Get-AzureADServiceAppRoleAssignedTo | [Get-EntraServicePrincipalAppRoleAssignedTo](/powershell/module/microsoft.entra.applications/get-entraserviceprincipalapproleassignedto) |
| Get-AzureADServiceAppRoleAssignment | [Get-EntraServicePrincipalAppRoleAssignment](/powershell/module/microsoft.entra.applications/get-entraserviceprincipalapproleassignment) |
| Get-AzureADServicePrincipal | [Get-EntraServicePrincipal](/powershell/module/microsoft.entra.applications/get-entraserviceprincipal) |
| Get-AzureADServicePrincipalCreatedObject | [Get-EntraServicePrincipalCreatedObject](/powershell/module/microsoft.entra.applications/get-entraserviceprincipalcreatedobject) |
| Get-AzureADMSServicePrincipalDelegatedPermissionClassification | [Get-EntraServicePrincipalDelegatedPermissionClassification](/powershell/module/microsoft.entra.applications/get-entraserviceprincipaldelegatedpermissionclassification) |
| Get-AzureADServicePrincipalKeyCredential | [Get-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra.applications/get-entraserviceprincipalkeycredential) |
| Get-AzureADServicePrincipalMembership | [Get-EntraServicePrincipalMembership](/powershell/module/microsoft.entra.applications/get-entraserviceprincipalmembership) |
| Get-AzureADServicePrincipalOAuth2PermissionGrant | [Get-EntraServicePrincipalOAuth2PermissionGrant](/powershell/module/microsoft.entra.applications/get-entraserviceprincipaloauth2permissiongrant) |
| Get-AzureADServicePrincipalOwnedObject | [Get-EntraServicePrincipalOwnedObject](/powershell/module/microsoft.entra.applications/get-entraserviceprincipalownedobject) |
| Get-AzureADServicePrincipalOwner | [Get-EntraServicePrincipalOwner](/powershell/module/microsoft.entra.applications/get-entraserviceprincipalowner) |
| Get-AzureADServicePrincipalPasswordCredential | [Get-EntraServicePrincipalPasswordCredential](/powershell/module/microsoft.entra.applications/get-entraserviceprincipalpasswordcredential) |
| Get-AzureADSubscribedSku | [Get-EntraSubscribedSku](/powershell/module/microsoft.entra.directorymanagement/get-entrasubscribedsku) |
| Get-AzureADTenantDetail | [Get-EntraTenantDetail](/powershell/module/microsoft.entra.directorymanagement/get-entratenantdetail) |
| Get-AzureADTrustedCertificateAuthority | [Get-EntraTrustedCertificateAuthority](/powershell/module/microsoft.entra.signins/get-entratrustedcertificateauthority) |
| Get-AzureADMSUnsupportedCommand | |
| Get-AzureADUser | [Get-EntraUser](/powershell/module/microsoft.entra.users/get-entrauser) |
| Get-AzureADUserAppRoleAssignment | [Get-EntraUserAppRoleAssignment](/powershell/module/microsoft.entra.users/get-entrauserapproleassignment) |
| Get-AzureADUserCreatedObject | [Get-EntraUserCreatedObject](/powershell/module/microsoft.entra.users/get-entrausercreatedobject) |
| Get-AzureADUserDirectReport | [Get-EntraUserDirectReport](/powershell/module/microsoft.entra.users/get-entrauserdirectreport) |
| Get-AzureADUserExtension | [Get-EntraUserExtension](/powershell/module/microsoft.entra.users/get-entrauserextension) |
| Get-AzureADUserLicenseDetail | [Get-EntraUserLicenseDetail](/powershell/module/microsoft.entra.users/get-entrauserlicensedetail) |
| Get-AzureADUserManager | [Get-EntraUserManager](/powershell/module/microsoft.entra.users/get-entrausermanager) |
| Get-AzureADUserMembership | [Get-EntraUserMembership](/powershell/module/microsoft.entra.users/get-entrausermembership) |
| Get-AzureADUserOAuth2PermissionGrant | [Get-EntraUserOAuth2PermissionGrant](/powershell/module/microsoft.entra.users/get-entrauseroauth2permissiongrant) |
| Get-AzureADUserOwnedDevice | [Get-EntraUserOwnedDevice](/powershell/module/microsoft.entra.users/get-entrauserowneddevice) |
| Get-AzureADUserOwnedObject | [Get-EntraUserOwnedObject](/powershell/module/microsoft.entra.users/get-entrauserownedobject) |
| Get-AzureADUserRegisteredDevice | [Get-EntraUserRegisteredDevice](/powershell/module/microsoft.entra.users/get-entrauserregistereddevice) |
| Get-AzureADUserThumbnailPhoto | [Get-EntraUserThumbnailPhoto](/powershell/module/microsoft.entra.users/get-entrauserthumbnailphoto) |
| New-AzureADMSAdministrativeUnit | [New-EntraAdministrativeUnit](/powershell/module/microsoft.entra.directorymanagement/new-entraadministrativeunit) |
| New-AzureADApplication, New-AzureADMSApplication | [New-EntraApplication](/powershell/module/microsoft.entra.applications/new-entraapplication) |
| New-AzureADApplicationExtensionProperty, New-AzureADMSApplicationExtensionProperty | [New-EntraApplicationExtensionProperty](/powershell/module/microsoft.entra.applications/new-entraapplicationextensionproperty) |
| New-AzureADMSApplicationKey | [New-EntraApplicationKey](/powershell/module/microsoft.entra.applications/new-entraapplicationkey) |
| New-AzureADApplicationKeyCredential | [New-EntraApplicationKeyCredential](/powershell/module/microsoft.entra.applications/new-entraapplicationkeycredential) |
| New-AzureADMSApplicationPassword | [New-EntraApplicationPassword](/powershell/module/microsoft.entra.applications/new-entraapplicationpassword) |
| New-AzureADApplicationPasswordCredential | [New-EntraApplicationPasswordCredential](/powershell/module/microsoft.entra.applications/new-entraapplicationpasswordcredential) |
| New-AzureADApplicationProxyApplication | [New-EntraBetaApplicationProxyApplication](/powershell/module/microsoft.entra.beta.applications/new-entrabetaapplicationproxyapplication) |
| New-AzureADApplicationProxyConnectorGroup | [New-EntraBetaApplicationProxyConnectorGroup](/powershell/module/microsoft.entra.beta.applications/new-entrabetaapplicationproxyconnectorgroup) |
| New-AzureADMSConditionalAccessPolicy | [New-EntraConditionalAccessPolicy](/powershell/module/microsoft.entra.signins/new-entraconditionalaccesspolicy) |
| New-AzureADDevice | [New-EntraDevice](/powershell/module/microsoft.entra.directorymanagement/new-entradevice) |
| New-AzureADDomain | [New-EntraDomain](/powershell/module/microsoft.entra.directorymanagement/new-entradomain) |
| New-AzureADGroup, New-AzureADMSGroup | [New-EntraGroup](/powershell/module/microsoft.entra.groups/new-entragroup) |
| New-AzureADGroupAppRoleAssignment | [New-EntraGroupAppRoleAssignment](/powershell/module/microsoft.entra.groups/new-entragroupapproleassignment) |
| New-AzureADMSGroupLifecyclePolicy | [New-EntraGroupLifecyclePolicy](/powershell/module/microsoft.entra.groups/new-entragrouplifecyclepolicy) |
| New-AzureADMSIdentityProvider | [New-EntraIdentityProvider](/powershell/module/microsoft.entra.signins/new-entraidentityprovider) |
| New-AzureADMSInvitation | [New-EntraInvitation](/powershell/module/microsoft.entra.signins/new-entrainvitation) |
| New-AzureADMSNamedLocationPolicy | [New-EntraNamedLocationPolicy](/powershell/module/microsoft.entra.signins/new-entranamedlocationpolicy) |
| New-AzureADMSPermissionGrantConditionSet | [New-EntraPermissionGrantConditionSet](/powershell/module/microsoft.entra.signins/new-entrapermissiongrantconditionset) |
| New-AzureADMSPermissionGrantPolicy | [New-EntraPermissionGrantPolicy](/powershell/module/microsoft.entra.signins/new-entrapermissiongrantpolicy) |
| New-AzureADMSRoleAssignment | [New-EntraDirectoryRoleAssignment](/powershell/module/microsoft.entra.governance/new-entradirectoryroleassignment) |
| New-AzureADMSRoleDefinition | [New-EntraDirectoryRoleDefinition](/powershell/module/microsoft.entra.governance/new-entradirectoryroledefinition) |
| New-AzureADServiceAppRoleAssignment | [New-EntraServicePrincipalAppRoleAssignment](/powershell/module/microsoft.entra.applications/new-entraserviceprincipalapproleassignment) |
| New-AzureADServicePrincipal | [New-EntraServicePrincipal](/powershell/module/microsoft.entra.applications/new-entraserviceprincipal) |
| New-AzureADServicePrincipalKeyCredential | [New-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra.applications/new-entraserviceprincipalkeycredential) |
| New-AzureADServicePrincipalPasswordCredential | [New-EntraServicePrincipalPasswordCredential](/powershell/module/microsoft.entra.applications/new-entraserviceprincipalpasswordcredential) |
| New-AzureADTrustedCertificateAuthority | [New-EntraTrustedCertificateAuthority](/powershell/module/microsoft.entra.signins/new-entratrustedcertificateauthority) |
| New-AzureADUser | [New-EntraUser](/powershell/module/microsoft.entra.users/new-entrauser) |
| New-AzureADUserAppRoleAssignment | [New-EntraUserAppRoleAssignment](/powershell/module/microsoft.entra.users/new-entrauserapproleassignment) |
| Remove-AzureADMSAdministrativeUnit | [Remove-EntraAdministrativeUnit](/powershell/module/microsoft.entra.directorymanagement/remove-entraadministrativeunit) |
| Remove-AzureADMSAdministrativeUnitMember | [Remove-EntraAdministrativeUnitMember](/powershell/module/microsoft.entra.directorymanagement/remove-entraadministrativeunitmember) |
| Remove-AzureADApplication, Remove-AzureADMSApplication | [Remove-EntraApplication](/powershell/module/microsoft.entra.applications/remove-entraapplication) |
| Remove-AzureADApplicationExtensionProperty, Remove-AzureADMSApplicationExtensionProperty | [Remove-EntraApplicationExtensionProperty](/powershell/module/microsoft.entra.applications/remove-entraapplicationextensionproperty) |
| Remove-AzureADMSApplicationKey | [Remove-EntraApplicationKey](/powershell/module/microsoft.entra.applications/remove-entraapplicationkey) |
| Remove-AzureADApplicationKeyCredential | [Remove-EntraApplicationKeyCredential](/powershell/module/microsoft.entra.applications/remove-entraapplicationkeycredential) |
| Remove-AzureADApplicationOwner, Remove-AzureADMSApplicationOwner | [Remove-EntraApplicationOwner](/powershell/module/microsoft.entra.applications/remove-entraapplicationowner) |
| Remove-AzureADMSApplicationPassword | [Remove-EntraApplicationPassword](/powershell/module/microsoft.entra.applications/remove-entraapplicationpassword) |
| Remove-AzureADApplicationPasswordCredential | [Remove-EntraApplicationPasswordCredential](/powershell/module/microsoft.entra.applications/remove-entraapplicationpasswordcredential) |
| Remove-AzureADApplicationProxyApplication | [Remove-EntraBetaApplicationProxyApplication](/powershell/module/microsoft.entra.beta.applications/remove-entrabetaapplicationproxyapplication) |
| Remove-AzureADApplicationProxyApplicationConnectorGroup | [Remove-EntraBetaApplicationProxyApplicationConnectorGroup](/powershell/module/microsoft.entra.beta.applications/remove-entrabetaapplicationproxyapplicationconnectorgroup) |
| Remove-AzureADApplicationProxyConnectorGroup | [Remove-EntraBetaApplicationProxyConnectorGroup](/powershell/module/microsoft.entra.beta.applications/remove-entrabetaapplicationproxyconnectorgroup) |
| Remove-AzureADMSApplicationVerifiedPublisher | [Remove-EntraApplicationVerifiedPublisher](/powershell/module/microsoft.entra.applications/remove-entraapplicationverifiedpublisher) |
| Remove-AzureADMSConditionalAccessPolicy | [Remove-EntraConditionalAccessPolicy](/powershell/module/microsoft.entra.signins/remove-entraconditionalaccesspolicy) |
| Remove-AzureADContact | [Remove-EntraContact](/powershell/module/microsoft.entra.directorymanagement/remove-entracontact) |
| Remove-AzureADDeletedApplication | [Remove-EntraDeletedApplication](/powershell/module/microsoft.entra.applications/remove-entradeletedapplication) |
| Remove-AzureADMSDeletedDirectoryObject | [Remove-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra.directorymanagement/remove-entradeleteddirectoryobject) |
| Remove-AzureADDevice | [Remove-EntraDevice](/powershell/module/microsoft.entra.directorymanagement/remove-entradevice) |
| Remove-AzureADDeviceRegisteredOwner | [Remove-EntraDeviceRegisteredOwner](/powershell/module/microsoft.entra.directorymanagement/remove-entradeviceregisteredowner) |
| Remove-AzureADDeviceRegisteredUser | [Remove-EntraDeviceRegisteredUser](/powershell/module/microsoft.entra.directorymanagement/remove-entradeviceregistereduser) |
| Remove-AzureADDirectoryRoleMember | [Remove-EntraDirectoryRoleMember](/powershell/module/microsoft.entra.directorymanagement/remove-entradirectoryrolemember) |
| Remove-AzureADDomain | [Remove-EntraDomain](/powershell/module/microsoft.entra.directorymanagement/remove-entradomain) |
| Remove-AzureADGroup, Remove-AzureADMSGroup | [Remove-EntraGroup](/powershell/module/microsoft.entra.groups/remove-entragroup) |
| Remove-AzureADGroupAppRoleAssignment | [Remove-EntraGroupAppRoleAssignment](/powershell/module/microsoft.entra.groups/remove-entragroupapproleassignment) |
| Remove-AzureADMSGroupLifecyclePolicy | [Remove-EntraGroupLifecyclePolicy](/powershell/module/microsoft.entra.groups/remove-entragrouplifecyclepolicy) |
| Remove-AzureADGroupMember | [Remove-EntraGroupMember](/powershell/module/microsoft.entra.groups/remove-entragroupmember) |
| Remove-AzureADGroupOwner | [Remove-EntraGroupOwner](/powershell/module/microsoft.entra.groups/remove-entragroupowner) |
| Remove-AzureADMSIdentityProvider | [Remove-EntraIdentityProvider](/powershell/module/microsoft.entra.signins/remove-entraidentityprovider) |
| Remove-AzureADMSLifecyclePolicyGroup | [Remove-EntraLifecyclePolicyGroup](/powershell/module/microsoft.entra.groups/remove-entralifecyclepolicygroup) |
| Remove-AzureADMSNamedLocationPolicy | [Remove-EntraNamedLocationPolicy](/powershell/module/microsoft.entra.signins/remove-entranamedlocationpolicy) |
| Remove-AzureADOAuth2PermissionGrant | [Remove-EntraOAuth2PermissionGrant](/powershell/module/microsoft.entra.signins/remove-entraoauth2permissiongrant) |
| Remove-AzureADMSPermissionGrantConditionSet | [Remove-EntraPermissionGrantConditionSet](/powershell/module/microsoft.entra.signins/remove-entrapermissiongrantconditionset) |
| Remove-AzureADMSPermissionGrantPolicy | [Remove-EntraPermissionGrantPolicy](/powershell/module/microsoft.entra.signins/remove-entrapermissiongrantpolicy) |
| Remove-AzureADMSRoleAssignment | [Remove-EntraDirectoryRoleAssignment](/powershell/module/microsoft.entra.governance/remove-entradirectoryroleassignment) |
| Remove-AzureADMSRoleDefinition | [Remove-EntraDirectoryRoleDefinition](/powershell/module/microsoft.entra.governance/remove-entradirectoryroledefinition) |
| Remove-AzureADMSScopedRoleMembership | [Remove-EntraScopedRoleMembership](/powershell/module/microsoft.entra.directorymanagement/remove-entrascopedrolemembership) |
| Remove-AzureADServiceAppRoleAssignment | [Remove-EntraServicePrincipalAppRoleAssignment](/powershell/module/microsoft.entra.applications/remove-entraserviceprincipalapproleassignment) |
| Remove-AzureADServicePrincipal | [Remove-EntraServicePrincipal](/powershell/module/microsoft.entra.applications/remove-entraserviceprincipal) |
| Remove-AzureADMSServicePrincipalDelegatedPermissionClassification | [Remove-EntraServicePrincipalDelegatedPermissionClassification](/powershell/module/microsoft.entra.applications/remove-entraserviceprincipaldelegatedpermissionclassification) |
| Remove-AzureADServicePrincipalKeyCredential | [Remove-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra.applications/remove-entraserviceprincipalkeycredential) |
| Remove-AzureADServicePrincipalOwner | [Remove-EntraServicePrincipalOwner](/powershell/module/microsoft.entra.applications/remove-entraserviceprincipalowner) |
| Remove-AzureADServicePrincipalPasswordCredential | [Remove-EntraServicePrincipalPasswordCredential](/powershell/module/microsoft.entra.applications/remove-entraserviceprincipalpasswordcredential) |
| Remove-AzureADTrustedCertificateAuthority | [Remove-EntraTrustedCertificateAuthority](/powershell/module/microsoft.entra.signins/remove-entratrustedcertificateauthority) |
| Remove-AzureADUser | [Remove-EntraUser](/powershell/module/microsoft.entra.users/remove-entrauser) |
| Remove-AzureADUserAppRoleAssignment | [Remove-EntraUserAppRoleAssignment](/powershell/module/microsoft.entra.users/remove-entrauserapproleassignment) |
| Remove-AzureADUserExtension | [Remove-EntraUserExtension](/powershell/module/microsoft.entra.users/remove-entrauserextension) |
| Remove-AzureADUserManager | [Remove-EntraUserManager](/powershell/module/microsoft.entra.users/remove-entrausermanager) |
| Reset-AzureADMSLifeCycleGroup | [Reset-EntraLifeCycleGroup](/powershell/module/microsoft.entra.groups/reset-entralifecyclegroup) |
| Restore-AzureADDeletedApplication | [Restore-EntraDeletedApplication](/powershell/module/microsoft.entra.applications/restore-entradeletedapplication) |
| Restore-AzureADMSDeletedDirectoryObject | [Restore-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra.directorymanagement/restore-entradeleteddirectoryobject) |
| Revoke-AzureADSignedInUserAllRefreshToken | [Revoke-EntraSignedInUserAllRefreshToken](/powershell/module/microsoft.entra.authentication/revoke-entrasignedinuserallrefreshtoken) |
| Revoke-AzureADUserAllRefreshToken | [Revoke-EntraUserAllRefreshToken](/powershell/module/microsoft.entra.authentication/revoke-entrauserallrefreshtoken) |
| Select-AzureADGroupIdsContactIsMemberOf | [Select-EntraGroupIdsContactIsMemberOf](/powershell/module/microsoft.entra.groups/select-entragroupidscontactismemberof) |
| Select-AzureADGroupIdsGroupIsMemberOf | [Select-EntraGroupIdsGroupIsMemberOf](/powershell/module/microsoft.entra.groups/select-entragroupidsgroupismemberof) |
| Select-AzureADGroupIdsServicePrincipalIsMemberOf | [Select-EntraGroupIdsServicePrincipalIsMemberOf](/powershell/module/microsoft.entra.applications/select-entragroupidsserviceprincipalismemberof) |
| Select-AzureADGroupIdsUserIsMemberOf | [Select-EntraGroupIdsUserIsMemberOf](/powershell/module/microsoft.entra.groups/select-entragroupidsuserismemberof) |
| Set-AzureADMSAdministrativeUnit | [Set-EntraAdministrativeUnit](/powershell/module/microsoft.entra.directorymanagement/set-entraadministrativeunit) |
| Set-AzureADApplication, Set-AzureADMSApplication | [Set-EntraApplication](/powershell/module/microsoft.entra.applications/set-entraapplication) |
| Set-AzureADApplicationLogo, Set-AzureADMSApplicationLogo | [Set-EntraApplicationLogo](/powershell/module/microsoft.entra.applications/set-entraapplicationlogo) |
| Set-AzureADApplicationProxyApplication | [Set-EntraBetaApplicationProxyApplication](/powershell/module/microsoft.entra.beta.applications/set-entrabetaapplicationproxyapplication) |
| Set-AzureADApplicationProxyApplicationCustomDomainCertificate | |
| Set-AzureADApplicationProxyApplicationSingleSignOn | [Set-EntraBetaApplicationProxyApplicationSingleSignOn](/powershell/module/microsoft.entra.beta.applications/set-entrabetaapplicationproxyapplicationsinglesignon) |
| Set-AzureADApplicationProxyConnector | [Set-EntraBetaApplicationProxyConnector](/powershell/module/microsoft.entra.beta.applications/set-entrabetaapplicationproxyconnector) |
| Set-AzureADApplicationProxyConnectorGroup | [Set-EntraBetaApplicationProxyApplicationConnectorGroup](/powershell/module/microsoft.entra.beta.applications/set-entrabetaapplicationproxyapplicationconnectorgroup) |
| Set-AzureADMSApplicationVerifiedPublisher | [Set-EntraApplicationVerifiedPublisher](/powershell/module/microsoft.entra.applications/set-entraapplicationverifiedpublisher) |
| Set-AzureADMSAuthorizationPolicy | [Set-EntraAuthorizationPolicy](/powershell/module/microsoft.entra.signins/set-entraauthorizationpolicy) |
| Set-AzureADMSConditionalAccessPolicy | [Set-EntraConditionalAccessPolicy](/powershell/module/microsoft.entra.signins/set-entraconditionalaccesspolicy) |
| Set-AzureADDevice | [Set-EntraDevice](/powershell/module/microsoft.entra.directorymanagement/set-entradevice) |
| Set-AzureADDomain | [Set-EntraDomain](/powershell/module/microsoft.entra.directorymanagement/set-entradomain) |
| Set-AzureADGroup, Set-AzureADMSGroup | [Set-EntraGroup](/powershell/module/microsoft.entra.groups/set-entragroup) |
| Set-AzureADMSGroupLifecyclePolicy | [Set-EntraGroupLifecyclePolicy](/powershell/module/microsoft.entra.groups/set-entragrouplifecyclepolicy) |
| Set-AzureADMSIdentityProvider | [Set-EntraIdentityProvider](/powershell/module/microsoft.entra.signins/set-entraidentityprovider) |
| Set-AzureADMSNamedLocationPolicy | [Set-EntraNamedLocationPolicy](/powershell/module/microsoft.entra.signins/set-entranamedlocationpolicy) |
| Set-AzureADMSPermissionGrantConditionSet | [Set-EntraPermissionGrantConditionSet](/powershell/module/microsoft.entra.signins/set-entrapermissiongrantconditionset) |
| Set-AzureADMSPermissionGrantPolicy | [Set-EntraPermissionGrantPolicy](/powershell/module/microsoft.entra.signins/set-entrapermissiongrantpolicy) |
| Set-AzureADMSRoleDefinition | [Set-EntraDirectoryRoleDefinition](/powershell/module/microsoft.entra.governance/set-entradirectoryroledefinition) |
| Set-AzureADServicePrincipal | [Set-EntraServicePrincipal](/powershell/module/microsoft.entra.applications/set-entraserviceprincipal) |
| Set-AzureADTenantDetail | [Set-EntraTenantDetail](/powershell/module/microsoft.entra.directorymanagement/set-entratenantdetail) |
| Set-AzureADTrustedCertificateAuthority | [Set-EntraTrustedCertificateAuthority](/powershell/module/microsoft.entra.signins/set-entratrustedcertificateauthority) |
| Set-AzureADUser | [Set-EntraUser](/powershell/module/microsoft.entra.users/set-entrauser) |
| Set-AzureADUserExtension | [Set-EntraUserExtension](/powershell/module/microsoft.entra.users/set-entrauserextension) |
| Set-AzureADUserLicense | [Set-EntraUserLicense](/powershell/module/microsoft.entra.users/set-entrauserlicense) |
| Set-AzureADUserManager | [Set-EntraUserManager](/powershell/module/microsoft.entra.users/set-entrausermanager) |
| Set-AzureADUserPassword | [Set-EntraUserPasswordProfile](/powershell/module/microsoft.entra.users/set-entrauserpasswordprofile) |
| Set-AzureADUserThumbnailPhoto | [Set-EntraUserThumbnailPhoto](/powershell/module/microsoft.entra.users/set-entrauserthumbnailphoto) |
| Update-AzureADSignedInUserPassword | [Set-EntraSignedInUserPassword](/powershell/module/microsoft.entra.users/set-entrasignedinuserpassword) |

:::zone-end

:::zone pivot="azure-ad-preview"

## Azure AD Preview to Microsoft Entra PowerShell

|Azure AD Preview cmdlet|Microsoft Entra PowerShell cmdlet|
|--------------------------|---------------------------------|
| Add-AzureADAdministrativeUnitMember | [Add-EntraBetaAdministrativeUnitMember](/powershell/module/microsoft.entra.beta.directorymanagement/add-entrabetaadministrativeunitmember) |
| Add-AzureADApplicationPolicy | [Add-EntraBetaApplicationPolicy](/powershell/module/microsoft.entra.beta.applications/add-entrabetaapplicationpolicy) |
| Add-AzureADMScustomSecurityAttributeDefinitionAllowedValues | [Add-EntraBetaCustomSecurityAttributeDefinitionAllowedValue](/powershell/module/microsoft.entra.beta.directorymanagement/add-entrabetacustomsecurityattributedefinitionallowedvalue) |
| Add-AzureADMSFeatureRolloutPolicyDirectoryObject | [Add-EntraBetaFeatureRolloutPolicyDirectoryObject](/powershell/module/microsoft.entra.beta.signins/add-entrabetafeaturerolloutpolicydirectoryobject) |
| Add-AzureADMSPrivilegedResource | Deprecated|
| Add-AzureADScopedRoleMembership | [Add-EntraBetaScopedRoleMembership](/powershell/module/microsoft.entra.beta.directorymanagement/add-entrabetascopedrolemembership) |
| Add-AzureADServicePrincipalPolicy | [Add-EntraBetaServicePrincipalPolicy](/powershell/module/microsoft.entra.beta.signins/add-entrabetaserviceprincipalpolicy) |
| Close-AzureADMSPrivilegedRoleAssignmentRequest | Deprecated|
| Get-AzureADAdministrativeUnit | [Get-EntraBetaAdministrativeUnit](/powershell/module/microsoft.entra.beta.directorymanagement/get-entrabetaadministrativeunit) |
| Get-AzureADAdministrativeUnitMember | [Get-EntraBetaAdministrativeUnitMember](/powershell/module/microsoft.entra.beta.directorymanagement/get-entrabetaadministrativeunitmember) |
| Get-AzureADApplicationPasswordCredential| [Get-EntraBetaApplicationPasswordCredential](/powershell/module/microsoft.entra.beta.applications/get-entrabetaapplicationpasswordcredential) |
| Get-AzureADApplicationPolicy | [Get-EntraBetaApplicationPolicy](/powershell/module/microsoft.entra.beta.applications/get-entrabetaapplicationpolicy) |
| Get-AzureADApplicationServiceEndpoint| [Get-EntraBetaApplicationServiceEndpoint](/powershell/module/microsoft.entra.beta.applications/get-entrabetaapplicationserviceendpoint) |
| Get-AzureADApplicationSignInDetailedSummary | [Get-EntraBetaApplicationSignInDetailedSummary](/powershell/module/microsoft.entra.beta.reports/get-entrabetaapplicationsignindetailedsummary) |
| Get-AzureADApplicationSignInSummary | [Get-EntraBetaApplicationSignInSummary](/powershell/module/microsoft.entra.beta.reports/get-entrabetaapplicationsigninsummary) |
| Get-AzureADAuditDirectoryLogs | [Get-EntraBetaAuditDirectoryLog](/powershell/module/microsoft.entra.beta.reports/get-entrabetaauditdirectorylog) |
| Get-AzureADAuditSignInLogs | [Get-EntraBetaAuditSignInLog](/powershell/module/microsoft.entra.beta.reports/get-entrabetaauditsigninlog) |
| Get-AzureADDirectorySetting | [Get-EntraBetaDirectorySetting](/powershell/module/microsoft.entra.beta.directorymanagement/get-entrabetadirectorysetting) |
| Get-AzureADDirectorySettingTemplate | [Get-EntraBetaDirectorySettingTemplate](/powershell/module/microsoft.entra.beta.directorymanagement/get-entrabetadirectorysettingtemplate) |
| Get-AzureADExternalDomainFederation | |
| Get-AzureADMSApplicationTemplate | [Get-EntraBetaApplicationTemplate](/powershell/module/microsoft.entra.beta.applications/get-entrabetaapplicationtemplate) |
| Get-AzureADMSAttributeSet | [Get-EntraBetaAttributeSet](/powershell/module/microsoft.entra.beta.directorymanagement/get-entrabetaattributeset) |
| Get-AzureADMSCustomSecurityAttributeDefinition | [Get-EntraBetaCustomSecurityAttributeDefinition](/powershell/module/microsoft.entra.beta.directorymanagement/get-entrabetacustomsecurityattributedefinition) |
| Get-AzureADMSCustomSecurityAttributeDefinitionAllowedValue | [Get-EntraBetaCustomSecurityAttributeDefinitionAllowedValue](/powershell/module/microsoft.entra.beta.directorymanagement/get-entrabetacustomsecurityattributedefinitionallowedvalue) |
| Get-AzureADMSFeatureRolloutPolicy | [Get-EntraBetaFeatureRolloutPolicy](/powershell/module/microsoft.entra.beta.signins/get-entrabetafeaturerolloutpolicy) |
| Get-AzureADMSGroupPermissionGrant | [Get-EntraBetaGroupPermissionGrant](/powershell/module/microsoft.entra.beta.groups/get-entrabetagrouppermissiongrant) |
| Get-AzureADMSPasswordSingleSignOnCredential | [Get-EntraBetaPasswordSingleSignOnCredential](/powershell/module/microsoft.entra.beta.applications/get-entrabetapasswordsinglesignoncredential) |
| Get-AzureADMSPrivilegedResource | [Get-EntraBetaPrivilegedResource](/powershell/module/microsoft.entra.beta.governance/get-entrabetaprivilegedresource) |
| Get-AzureADMSPrivilegedRoleAssignment |  Deprecated|
| Get-AzureADMSPrivilegedRoleAssignmentRequest | [Get-EntraBetaPrivilegedRoleAssignmentRequest](/powershell/module/microsoft.entra.beta.governance/get-entrabetaprivilegedroleassignmentrequest) |
| Get-AzureADMSPrivilegedRoleDefinition | [Get-EntraBetaPrivilegedRoleDefinition](/powershell/module/microsoft.entra.beta.governance/get-entrabetaprivilegedroledefinition) |
| Get-AzureADMSPrivilegedRoleSetting | [Get-EntraBetaPrivilegedRoleSetting](/powershell/module/microsoft.entra.beta.governance/get-entrabetaprivilegedrolesetting) |
| Get-AzureADMSServicePrincipal | [Get-EntraBetaServicePrincipal](/powershell/module/microsoft.entra.beta.applications/get-entrabetaserviceprincipal) |
| Get-AzureADMSTrustFrameworkPolicy | [Get-EntraBetaTrustFrameworkPolicy](/powershell/module/microsoft.entra.beta.signins/get-entrabetatrustframeworkpolicy) |
| Get-AzureADMSUser | [Get-EntraBetaUser](/powershell/module/microsoft.entra.beta.users/get-entrabetauser) |
| Get-AzureADObjectSetting | [Get-EntraBetaObjectSetting](/powershell/module/microsoft.entra.beta.groups/get-entrabetaobjectsetting) |
| Get-AzureADPolicy | [Get-EntraBetaPolicy](/powershell/module/microsoft.entra.beta.signins/get-entrabetapolicy) |
| Get-AzureADPolicyAppliedObject | [Get-EntraBetaPolicyAppliedObject](/powershell/module/microsoft.entra.beta.signins/get-entrabetapolicyappliedobject) |
| Get-AzureADPrivilegedRole | [Get-EntraBetaPrivilegedRole](/powershell/module/microsoft.entra.beta.governance/get-entrabetaprivilegedrole) |
| Get-AzureADPrivilegedRoleAssignment |  Deprecated|
| Get-AzureADScopedRoleMembership | [Get-EntraBetaScopedRoleMembership](/powershell/module/microsoft.entra.beta.directorymanagement/get-entrabetascopedrolemembership) |
| Get-AzureADServicePrincipalPolicy | [Get-EntraBetaServicePrincipalPolicy](/powershell/module/microsoft.entra.beta.signins/get-entrabetaserviceprincipalpolicy) |
| New-AzureADAdministrativeUnit | [New-EntraBetaAdministrativeUnit](/powershell/module/microsoft.entra.beta.directorymanagement/new-entrabetaadministrativeunit) |
| New-AzureADDirectorySetting | [New-EntraBetaDirectorySetting](/powershell/module/microsoft.entra.beta.directorymanagement/new-entrabetadirectorysetting) |
| New-AzureADExternalDomainFederation | |
| New-AzureADMSAdministrativeUnitMember | [New-EntraBetaAdministrativeUnitMember](/powershell/module/microsoft.entra.beta.directorymanagement/new-entrabetaadministrativeunitmember) |
| New-AzureADMSApplicationFromApplicationTemplate | [New-EntraBetaApplicationFromApplicationTemplate](/powershell/module/microsoft.entra.beta.applications/new-entrabetaapplicationfromapplicationtemplate) |
| New-AzureADMSAttributeSet | [New-EntraBetaAttributeSet](/powershell/module/microsoft.entra.beta.directorymanagement/new-entrabetaattributeset) |
| New-AzureADMSCustomSecurityAttributeDefinition | [New-EntraBetaCustomSecurityAttributeDefinition](/powershell/module/microsoft.entra.beta.directorymanagement/new-entrabetacustomsecurityattributedefinition) |
| New-AzureADMSFeatureRolloutPolicy | [New-EntraBetaFeatureRolloutPolicy](/powershell/module/microsoft.entra.beta.signins/new-entrabetafeaturerolloutpolicy) |
| New-AzureADMSPasswordSingleSignOnCredential | [New-EntraBetaPasswordSingleSignOnCredential](/powershell/module/microsoft.entra.beta.applications/new-entrabetapasswordsinglesignoncredential) |
| New-AzureADMSServicePrincipal | [New-EntraBetaServicePrincipal](/powershell/module/microsoft.entra.beta.applications/new-entrabetaserviceprincipal) |
| New-AzureADMSTrustFrameworkPolicy | [New-EntraBetaTrustFrameworkPolicy](/powershell/module/microsoft.entra.beta.signins/new-entrabetatrustframeworkpolicy) |
| New-AzureADMSUser | [New-EntraBetaUser](/powershell/module/microsoft.entra.beta.users/new-entrabetauser) |
| New-AzureADObjectSetting | [New-EntraBetaObjectSetting](/powershell/module/microsoft.entra.beta.groups/new-entrabetaobjectsetting) |
| New-AzureADPolicy | [New-EntraBetaPolicy](/powershell/module/microsoft.entra.beta.signins/new-entrabetapolicy) |
| New-AzureADPrivilegedRoleAssignment | [New-EntraBetaPrivilegedRoleAssignment](/powershell/module/microsoft.entra.beta.governance/new-entrabetaprivilegedroleassignment) |
| Open-AzureADMSPrivilegedRoleAssignmentRequest |  Deprecated|
| Remove-AzureADAdministrativeUnit | [Remove-EntraBetaAdministrativeUnit](/powershell/module/microsoft.entra.beta.directorymanagement/remove-entrabetaadministrativeunit) |
| Remove-AzureADAdministrativeUnitMember | [Remove-EntraBetaAdministrativeUnitMember](/powershell/module/microsoft.entra.beta.directorymanagement/remove-entrabetaadministrativeunitmember) |
| Remove-AzureADApplicationPolicy | [Remove-EntraBetaApplicationPolicy](/powershell/module/microsoft.entra.beta.applications/remove-entrabetaapplicationpolicy) |
| Remove-AzureADDirectorySetting | [Remove-EntraBetaDirectorySetting](/powershell/module/microsoft.entra.beta.directorymanagement/remove-entrabetadirectorysetting) |
| Remove-AzureADExternalDomainFederation | |
| Remove-AzureADMSFeatureRolloutPolicy | [Remove-EntraBetaFeatureRolloutPolicy](/powershell/module/microsoft.entra.beta.signins/remove-entrabetafeaturerolloutpolicy) |
| Remove-AzureADMSFeatureRolloutPolicyDirectoryObject | [Remove-EntraBetaFeatureRolloutPolicyDirectoryObject](/powershell/module/microsoft.entra.beta.signins/remove-entrabetafeaturerolloutpolicydirectoryobject) |
| Remove-AzureADMSPasswordSingleSignOnCredential | [Remove-EntraBetaPasswordSingleSignOnCredential](/powershell/module/microsoft.entra.beta.applications/remove-entrabetapasswordsinglesignoncredential) |
| Remove-AzureADMSTrustFrameworkPolicy | [Remove-EntraBetaTrustFrameworkPolicy](/powershell/module/microsoft.entra.beta.signins/remove-entrabetatrustframeworkpolicy) |
| Remove-AzureADObjectSetting | [Remove-EntraBetaObjectSetting](/powershell/module/microsoft.entra.beta.groups/remove-entrabetaobjectsetting) |
| Remove-AzureADPolicy | [Remove-EntraBetaPolicy](/powershell/module/microsoft.entra.beta.signins/remove-entrabetapolicy) |
| Remove-AzureADScopedRoleMembership | [Remove-EntraBetaScopedRoleMembership](/powershell/module/microsoft.entra.beta.directorymanagement/remove-entrabetascopedrolemembership) |
| Remove-AzureADServicePrincipalPolicy | [Remove-EntraBetaServicePrincipalPolicy](/powershell/module/microsoft.entra.beta.signins/remove-entrabetaserviceprincipalpolicy) |
| Set-AzureADAdministrativeUnit | [Set-EntraBetaAdministrativeUnit](/powershell/module/microsoft.entra.beta.directorymanagement/set-entrabetaadministrativeunit) |
| Set-AzureADDirectorySetting | [Set-EntraBetaDirectorySetting](/powershell/module/microsoft.entra.beta.directorymanagement/set-entrabetadirectorysetting) |
| Set-AzureADMSAttributeSet | [Set-EntraBetaAttributeSet](/powershell/module/microsoft.entra.beta.directorymanagement/set-entrabetaattributeset) |
| Set-AzureADMSCustomSecurityAttributeDefinition | [Set-EntraBetaCustomSecurityAttributeDefinition](/powershell/module/microsoft.entra.beta.directorymanagement/set-entrabetacustomsecurityattributedefinition) |
| Set-AzureADMSCustomSecurityAttributeDefinitionAllowedValue | [Set-EntraBetaCustomSecurityAttributeDefinitionAllowedValue](/powershell/module/microsoft.entra.beta.directorymanagement/set-entrabetacustomsecurityattributedefinitionallowedvalue) |
| Set-AzureADMSFeatureRolloutPolicy | [Set-EntraBetaFeatureRolloutPolicy](/powershell/module/microsoft.entra.beta.signins/set-entrabetafeaturerolloutpolicy) |
| Set-AzureADMSPasswordSingleSignOnCredential | [Set-EntraBetaPasswordSingleSignOnCredential](/powershell/module/microsoft.entra.beta.applications/set-entrabetapasswordsinglesignoncredential) |
| Set-AzureADMSPrivilegedRoleAssignmentRequest | [Set-EntraBetaPrivilegedRoleAssignmentRequest](/powershell/module/microsoft.entra.beta.governance/set-entrabetaprivilegedroleassignmentrequest) |
| Set-AzureADMSPrivilegedRoleSetting | [Set-EntraBetaPrivilegedRoleSetting](/powershell/module/microsoft.entra.beta.governance/set-entrabetaprivilegedrolesetting) |
| Set-AzureADMSServicePrincipal | [Set-EntraBetaServicePrincipal](/powershell/module/microsoft.entra.beta.applications/set-entrabetaserviceprincipal) |
| Set-AzureADMSTrustFrameworkPolicy | [Set-EntraBetaTrustFrameworkPolicy](/powershell/module/microsoft.entra.beta.signins/set-entrabetatrustframeworkpolicy) |
| Set-AzureADMSUser | [Set-EntraBetaUser](/powershell/module/microsoft.entra.beta.users/set-entrabetauser) |
| Set-AzureADObjectSetting | [Set-EntraBetaObjectSetting](/powershell/module/microsoft.entra.beta.groups/set-entrabetaobjectsetting) |
| Set-AzureADPolicy | [Set-EntraBetaPolicy](/powershell/module/microsoft.entra.beta.signins/set-entrabetapolicy) |

:::zone-end

:::zone pivot="msonline"

## MSOnline to Microsoft Entra PowerShell

|MSOnline cmdlet|Microsoft Entra PowerShell cmdlet|
|--------------------------|---------------------------------|
| Add-MsolAdministrativeUnitMember| [Add-EntraAdministrativeUnitMember](/powershell/module/microsoft.entra.directorymanagement/add-entraadministrativeunitmember) |
| Add-MsolGroupMember| [Add-EntraGroupMember](/powershell/module/microsoft.entra.groups/add-entragroupmember) |
| Add-MsolRoleMember| [Add-EntraDirectoryRoleMember](/powershell/module/microsoft.entra.directorymanagement/add-entradirectoryrolemember) |
| Add-MsolScopedRoleMember| [Add-EntraScopedRoleMembership](/powershell/module/microsoft.entra.directorymanagement/add-entrascopedrolemembership) |
| Confirm-MsolDomain| [Confirm-EntraDomain](/powershell/module/microsoft.entra.directorymanagement/confirm-entradomain) |
| Connect-MsolService| [Connect-Entra](/powershell/module/microsoft.entra.authentication/connect-entra) |
| Convert-MsolFederatedUser| [Update-EntraBetaUserFromFederated](/powershell/module/microsoft.entra.beta.users/update-entrabetauserfromfederated) |
| Disable-MsolDevice| [Set-EntraDevice](/powershell/module/microsoft.entra.directorymanagement/set-entradevice) |
| Enable-MsolDevice| [Set-EntraDevice](/powershell/module/microsoft.entra.directorymanagement/set-entradevice) |
| Get-MsolAccountSku| [Get-EntraAccountSku](/powershell/module/microsoft.entra.directorymanagement/get-entraaccountsku) |
| Get-MsolAdministrativeUnit| [Get-EntraAdministrativeUnit](/powershell/module/microsoft.entra.directorymanagement/get-entraadministrativeunit) |
| Get-MsolAdministrativeUnitMember| [Get-EntraAdministrativeUnitMember](/powershell/module/microsoft.entra.directorymanagement/get-entraadministrativeunitmember) |
| Get-MsolCompanyInformation| [Get-EntraTenantDetail](/powershell/module/microsoft.entra.directorymanagement/get-entratenantdetail) |
| Get-MsolContact| [Get-EntraContact](/powershell/module/microsoft.entra.directorymanagement/get-entracontact) |
| Get-MsolDevice| [Get-EntraDevice](/powershell/module/microsoft.entra.directorymanagement/get-entradevice) |
| Get-MsolDirSyncConfiguration| [Get-EntraDirSyncConfiguration](/powershell/module/microsoft.entra.directorymanagement/get-entradirsyncconfiguration) |
| Get-MsolDirSyncFeatures| [Get-EntraDirSyncFeature](/powershell/module/microsoft.entra.directorymanagement/get-entradirsyncfeature) |
| Get-MsolDirSyncProvisioningError| [Get-EntraDirectoryObjectOnPremisesProvisioningError](/powershell/module/microsoft.entra.directorymanagement/get-entradirectoryobjectonpremisesprovisioningerror) |
| Get-MsolDomain| [Get-EntraDomain](/powershell/module/microsoft.entra.directorymanagement/get-entradomain) |
| Get-MsolDomainFederationSettings| [Get-EntraDomainFederationSettings](/powershell/module/microsoft.entra.directorymanagement/get-entradomainfederationsettings) |
| Get-MsolDomainVerificationDns| [Get-EntraDomainVerificationDnsRecord](/powershell/module/microsoft.entra.directorymanagement/get-entradomainverificationdnsrecord) |
| Get-MsolFederationProperty| [Get-EntraFederationProperty](/powershell/module/microsoft.entra.directorymanagement/get-entrafederationproperty) |
| Get-MsolGroup| [Get-EntraGroup](/powershell/module/microsoft.entra.groups/get-entragroup) |
| Get-MsolGroupMember| [Get-EntraGroupMember](/powershell/module/microsoft.entra.groups/get-entragroupmember) |
| Get-MsolHasObjectsWithDirSyncProvisioningErrors| [Get-EntraDirectoryObjectOnPremisesProvisioningError](/powershell/module/microsoft.entra.directorymanagement/get-entradirectoryobjectonpremisesprovisioningerror) |
| Get-MsolPartnerInformation| [Get-EntraPartnerInformation](/powershell/module/microsoft.entra.directorymanagement/get-entrapartnerinformation) |
| Get-MsolPasswordPolicy| [Get-EntraPasswordPolicy](/powershell/module/microsoft.entra.directorymanagement/get-entrapasswordpolicy) |
| Get-MsolRole| [Get-EntraDirectoryRole](/powershell/module/microsoft.entra.directorymanagement/get-entradirectoryrole) |
| Get-MsolRoleMember| [Get-EntraDirectoryRoleMember](/powershell/module/microsoft.entra.directorymanagement/get-entradirectoryrolemember) |
| Get-MsolScopedRoleMember| [Get-EntraScopedRoleMembership](/powershell/module/microsoft.entra.directorymanagement/get-entrascopedrolemembership) |
| Get-MsolServicePrincipal| [Get-EntraServicePrincipal](/powershell/module/microsoft.entra.applications/get-entraserviceprincipal) |
| Get-MsolServicePrincipalCredential| [Get-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra.applications/get-entraserviceprincipalkeycredential) |
| Get-MsolSubscription| [Get-EntraSubscription](/powershell/module/microsoft.entra.directorymanagement/get-entrasubscription) |
| Get-MsolUser| [Get-EntraUser](/powershell/module/microsoft.entra.users/get-entrauser) |
| Get-MsolUserRole| [Get-EntraUserRole](/powershell/module/microsoft.entra.users/get-entrauserrole) |
| New-MsolAdministrativeUnit| [New-EntraAdministrativeUnit](/powershell/module/microsoft.entra.directorymanagement/new-entraadministrativeunit) |
| New-MsolDomain| [New-EntraDomain](/powershell/module/microsoft.entra.directorymanagement/new-entradomain) |
| New-MsolGroup| [New-EntraGroup](/powershell/module/microsoft.entra.groups/new-entragroup) |
| New-MsolServicePrincipal| [New-EntraServicePrincipal](/powershell/module/microsoft.entra.applications/new-entraserviceprincipal) |
| New-MsolServicePrincipalCredential| [New-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra.applications/new-entraserviceprincipalkeycredential) |
| New-MsolUser| [New-EntraUser](/powershell/module/microsoft.entra.users/new-entrauser) |
| Remove-MsolAdministrativeUnit| [Remove-EntraAdministrativeUnit](/powershell/module/microsoft.entra.directorymanagement/remove-entraadministrativeunit) |
| Remove-MsolAdministrativeUnitMember| [Remove-EntraAdministrativeUnitMember](/powershell/module/microsoft.entra.directorymanagement/remove-entraadministrativeunitmember) |
| Remove-MsolApplicationPassword| [Remove-EntraApplicationPassword](/powershell/module/microsoft.entra.applications/remove-entraapplicationpassword) |
| Remove-MsolContact| [Remove-EntraContact](/powershell/module/microsoft.entra.directorymanagement/remove-entracontact) |
| Remove-MsolDevice| [Remove-EntraDevice](/powershell/module/microsoft.entra.directorymanagement/remove-entradevice) |
| Remove-MsolDomain| [Remove-EntraDomain](/powershell/module/microsoft.entra.directorymanagement/remove-entradomain) |
| Remove-MsolGroup| [Remove-EntraGroup](/powershell/module/microsoft.entra.groups/remove-entragroup) |
| Remove-MsolGroupMember| [Remove-EntraGroupMember](/powershell/module/microsoft.entra.groups/remove-entragroupmember) |
| Remove-MsolRoleMember| [Remove-EntraDirectoryRoleMember](/powershell/module/microsoft.entra.directorymanagement/remove-entradirectoryrolemember) |
| Remove-MsolScopedRoleMember| [Remove-EntraScopedRoleMembership](/powershell/module/microsoft.entra.directorymanagement/remove-entrascopedrolemembership) |
| Remove-MsolServicePrincipal| [Remove-EntraServicePrincipal](/powershell/module/microsoft.entra.applications/remove-entraserviceprincipal) |
| Remove-MsolServicePrincipalCredential| [Remove-EntraServicePrincipalKeyCredential](/powershell/module/microsoft.entra.applications/remove-entraserviceprincipalkeycredential) |
| Remove-MsolUser| [Remove-EntraUser](/powershell/module/microsoft.entra.users/remove-entrauser) |
| Reset-MsolStrongAuthenticationMethodByUpn| [Reset-EntraStrongAuthenticationMethodByUpn](/powershell/module/microsoft.entra.signins/reset-entrastrongauthenticationmethodbyupn) |
| Restore-MsolUser| [Restore-EntraDeletedDirectoryObject](/powershell/module/microsoft.entra.directorymanagement/restore-entradeleteddirectoryobject) |
| Set-MsolAdministrativeUnit| [Set-EntraAdministrativeUnit](/powershell/module/microsoft.entra.directorymanagement/set-entraadministrativeunit) |
| Set-MsolCompanyContactInformation| [Set-EntraTenantDetail](/powershell/module/microsoft.entra.directorymanagement/set-entratenantdetail) |
| Set-MsolCompanySecurityComplianceContactInformation| [Set-EntraTenantDetail](/powershell/module/microsoft.entra.directorymanagement/set-entratenantdetail) |
| Set-MsolDirSyncConfiguration| [Set-EntraDirSyncConfiguration](/powershell/module/microsoft.entra.directorymanagement/set-entradirsyncconfiguration) |
| Set-MsolDirSyncEnabled| [Set-EntraDirSyncEnabled](/powershell/module/microsoft.entra.directorymanagement/set-entradirsyncenabled) |
| Set-MsolDirSyncFeature| [Set-EntraDirSyncFeature](/powershell/module/microsoft.entra.directorymanagement/set-entradirsyncfeature) |
| Set-MsolDomain| [Set-EntraDomain](/powershell/module/microsoft.entra.directorymanagement/set-entradomain) |
| Set-MsolDomainFederationSettings| [Set-EntraDomainFederationSettings](/powershell/module/microsoft.entra.directorymanagement/set-entradomainfederationsettings) |
| Set-MsolGroup| [Set-EntraGroup](/powershell/module/microsoft.entra.groups/set-entragroup) |
| Set-MsolPartnerInformation| [Set-EntraPartnerInformation](/powershell/module/microsoft.entra.directorymanagement/set-entrapartnerinformation) |
| Set-MsolServicePrincipal| [Set-EntraServicePrincipal](/powershell/module/microsoft.entra.applications/set-entraserviceprincipal) |
| Set-MsolUser| [Set-EntraUser](/powershell/module/microsoft.entra.users/set-entrauser) |
| Set-MsolUserLicense| [Set-EntraUserLicense](/powershell/module/microsoft.entra.users/set-entrauserlicense) |
| Set-MsolUserPassword| [Set-EntraUserPasswordProfile](/powershell/module/microsoft.entra.users/set-entrauserpasswordprofile) |
| Set-MsolUserPrincipalName| [Set-EntraUser](/powershell/module/microsoft.entra.users/set-entrauser) |

:::zone-end
