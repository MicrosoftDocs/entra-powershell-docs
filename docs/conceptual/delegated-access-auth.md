---
title: "Use delegated authentication"
description: "Learn how to use the delegated access method of authentication to connect to Microsoft Entra PowerShell to manage your Microsoft Entra resources."

ms.topic: how-to
ms.date: 06/26/2024
author: omondiatieno
manager: CelesteDG
ms.author: jomondi
ms.reviewer: stevemutungi

#customer intent: As a Microsoft Entra PowerShell user, I want to understand the delegated access method of authentication, so that I can securely sign in to Microsoft Graph and manage my resources.
---

# Use delegated authentication

This article explains how to use delegated access with the Microsoft Entra PowerShell module. Delegated access allows an application to perform actions on behalf of a user who is currently signed in. This scenario is ideal for one-time management tasks and environments that require manual sign-in, like those using multifactor authentication (MFA). It also makes it easier to test scripts, learn, and manage tasks spontaneously without the need to set up service principals or other app-only authentication methods that don't involve user interaction.

While the delegated access method of authentication is the recommended sign-in method, you can also use other interactive authentication methods such as:

- Authorization code flow
- Device code flow
- Access token

In this article, you learn the various ways of signing into Microsoft Entra PowerShell to manage your Microsoft Entra resources.

## Prerequisites

To connect to Microsoft Entra PowerShell with delegated access, you need:

- A Microsoft Entra ID account. If you don't already have one, you can [Create an account for free][entra-id-account].
- One of the following roles: [Cloud Application Administrator][cloud-app-admin], or [Application Administrator][app-admin].
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Graph PowerShell module][install] guide to install the module.

## Use delegated access with a custom application (Recommended)

In this section, you learn how to use delegated access with a custom application to connect to module. You can tailor the custom application to your specific needs to isolate and limit the permissions granted for the module's usage.

Run the following command to connect to the module with delegated access using a custom application. You need to sign in with at least a [Cloud Application Administrator][cloud-app-admin] role.

```powershell
Connect-Entra -Scopes 'User.Read.All', 'Group.ReadWrite.All' -ClientId <your-custom-app-id>
```

To get the `-ClientId` value, referred to as `your-custom-app-id` in the example, follow the steps in the [Create a custom application][create-custom-app] guide.

## Other sign-in methods

In this section, you learn how to use other sign-in methods to connect to Microsoft Entra PowerShell.

### Use authorization code flow

The module's default sign-in authentication method uses a web browser and access token to sign in. To sign in interactively, use the [Connect-Entra][Connect-Entra] cmdlet, which uses an interactive browser-based sign-in prompt by default.

```powershell
Connect-Entra
```

It opens your default browser and initiates [authorization code flow][authorization-code-flow] to load Microsoft Entra sign-in page.

For example, to get a user's details, add  the `-Scopes` parameter to supply a list of required permissions.

```powershell
Connect-Entra -Scopes 'User.Read.All', 'Group.ReadWrite.All'
```

### Use device code flow authentication method

The [device code flow][device-code-flow] instructs you to open a browser page at [microsoft.com/devicelogin][ms-devicelogin] and enter the code displayed in your PowerShell session.

```powershell
Connect-Entra -Scopes 'User.Read.All', 'Group.ReadWrite.All' -UseDeviceCode
```

### Use your access token

The next example assumes you already have an access token. See [How to get access token from the token endpoint.][token-endpoint]

```powershell
$accessToken = '{my-securely-acquired-token}'
$secureString = ConvertTo-SecureString -String $accessToken -AsPlainText -Force
Connect-Entra -AccessToken $secureString
```

## Use passwordless authentication

Passwordless authentication is a method of verifying a user’s identity without the use of a password. Passwords are a primary attack vector and passwordless authentication is a strategy to mitigate attacks where bad actors use social
engineering, phishing, and spray attacks to compromise passwords.

Microsoft Entra PowerShell supports the following passwordless authentication methods:

- Windows Hello for Business
- Fast ID Online v2.0 (FIDO2)
- Microsoft Authenticator app
- Certificate-based authentication (CBA)

>[!NOTE]
> FIDO2 security keys option is only supported on PowerShell 7 and above.

For more information, see [Passwordless authentication options for Microsoft Entra ID][passwordless-auth].

## Common errors and troubleshooting tips

Common authentication errors include:

- **"Insufficient privileges to complete the operation"** - The error occurs if your credentials are incorrect or you lack the necessary permissions to access the Microsoft Entra resource.
- **"The term ‘cmdlet name’ is not recognized as the name of a cmdlet"** - The error indicates that the Microsoft Entra PowerShell module isn't installed or loaded. Ensure you install and load the correct module for the cmdlet you wish to use

For a detailed guide on troubleshooting common errors, see:
[Troubleshooting guide][troubleshooting-guide].

## Next steps

- [Manage groups][manage-groups]
- [Manage users][manage-users]
- [Manage apps][manage-apps]

<!-- link references -->
[cloud-app-admin]: /entra/identity/role-based-access-control/permissions-reference#cloud-application-administrator
[app-admin]: /entra/identity/role-based-access-control/permissions-reference#application-administrator
[entra-id-account]: https://azure.microsoft.com/free/?WT.mc_id=A261C142F
[install]: installation.md
[authorization-code-flow]: /entra/identity-platform/v2-oauth2-auth-code-flow
[device-code-flow]: /entra/identity-platform/v2-oauth2-device-code
[ms-devicelogin]: https://microsoft.com/devicelogin
[create-custom-app]: create-custom-application.md
[entra-admin-center]: https://entra.microsoft.com
[troubleshooting-guide]: troubleshooting.md#authentication-issues
[token-endpoint]: /graph/auth-v2-user#3-request-an-access-token
[passwordless-auth]: /azure/active-directory/authentication/concept-authentication-passwordless
[manage-groups]: manage-groups.md
[manage-users]: manage-user.md
[manage-apps]: manage-apps.md
[Connect-Entra]: /powershell/module/microsoft.graph.entra/connect-entra
