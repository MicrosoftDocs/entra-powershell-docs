---
title: "Microsoft Entra PowerShell authentication scenarios"
description: "Learn about Microsoft Entra PowerShell's sign-in scenarios for various use cases, ensuring secure and efficient authentication."

ms.topic: concept-article
ms.date: 06/26/2024
author: omondiatieno
manager: CelesteDG
ms.author: jomondi
ms.reviewer: stevemutungi

#customer intent: As a Microsoft Entra PowerShell user, I want to understand the different authentication options available, so that I can securely connect to Microsoft Graph and manage my Microsoft Entra ID resources.
---

# Microsoft Entra PowerShell authentication scenarios

The Microsoft Entra PowerShell module supports several authentication scenarios. This article describes the authentication scenarios for signing into Microsoft Entra ID from the module. The method you choose depends on your use case.

For example, if you're using the module for ad-hoc management of Microsoft Entra resources, you can sign in using an interactive sign-in. If you're writing a script for automation, you can sign in with a service principal. If you're running the module in an Azure resource, you can sign in with a managed identity.

## Common authentication scenarios

The two common authentication scenarios are:

- **Delegated authentication (interactive)** - In this scenario, the application acts on behalf of a signed-in user, accessing resources with the user’s permissions. It requires delegated permissions, which are granted to both the client and the user. The user’s privileges, such as those granted by Microsoft Entra role-based access control (RBAC), determine the extent of access. For more information on delegated authentication, see [Authenticate with delegated access][delegated-authentication].
- **App-only authentication (noninteractive)** - This scenario allows the application to act solely as itself without a user being signed in. It’s used for scenarios like automation or backup, involving background services or daemons. This scenario utilizes app roles or application permissions, which are granted to the client app to access data associated with the permission. For more information on app-only authentication, see [Authenticate with app-only access][apponly-authentication].

## Other authentication scenarios

The Microsoft Entra PowerShell module supports other authentication scenarios that we discuss in the rest of this article.

### Sign in to a national cloud

National clouds, also known as sovereign clouds, are physically isolated instances of Azure designed to ensure data residency, sovereignty, and compliance requirements are honored within geographical boundaries. If you have an account in a national cloud, specify the environment using the Environment parameter when you sign in. This parameter is compatible with all sign-in methods. For instance, for an account in Azure China 21Vianet, use the following command:

```powershell
Connect-Entra -Environment China
```

>[!NOTE]
>Globally registered apps don't replicate to Azure China. You need to register your own applications in Azure China and use them when connecting to Microsoft Graph.

To get a list of available environments, run this command:

```powershell
Get-EntraEnvironment
```

### Connect to Microsoft Entra ID as a different identity

To connect as a different identity other than CurrentUser, specify the `-ContextScope` parameter with the value `Process`.

```powershell
Connect-Entra -ContextScope 'Process'
```

### Set HTTP client timeout

You can set the HTTP client timeout (in seconds) by running.

```powershell
Connect-Entra -ClientTimeout 60
```

## Enhance security with the least privilege principle

To keep your Microsoft Entra resources secure, restrict permissions of the identity for the authentication method you choose to use the principle of least privilege. Limiting sign-in permissions as much as possible for your use case helps keep your Microsoft Entra resources secure. For more information, see [Enhance security with the principle of least privilege][principle-of-least-privilege].

We recommend the use of a custom application to help isolate and limit the permissions granted for Microsoft Entra PowerShell usage. To learn how to create a custom application and grant it permissions in Microsoft Entra ID, see [Create a custom application to connect with Microsoft Entra PowerShell][create-custom-app].

## See Also

- [Authenticate with delegated access][delegated-authentication]
- [Authenticate with app-only access][apponly-authentication]
- [Best practices][best-practices]

<!-- link references -->
[delegated-authentication]: delegated-access-auth.md
[apponly-authentication]: app-only-access-auth.md
[principle-of-least-privilege]: /entra/identity-platform/secure-least-privileged-access
[create-custom-app]: create-custom-application.md
[best-practices]: entra-powershell-best-practices.md
