---
title: What is Microsoft Entra PowerShell overview (preview)?
description: "Learn about the features of Microsoft Entra PowerShell that help you derive insights and analytics, and build unique, intelligent apps in Microsoft Entra ID."
ms.topic: overview
ms.date: 09/27/2024
author: omondiatieno
manager: CelesteDG
ms.author: jomondi
ms.reviewer: stevemutungi

#customer intent: As an IT admin, I want to learn about Microsoft Entra PowerShell, so that I can get started with using the module.
---
# What is Microsoft Entra PowerShell (preview)?

> [!IMPORTANT]
> Microsoft Entra PowerShell cmdlets are currently in preview and might change. We recommend using these cmdlets for testing and development purposes only, and not in production applications at this time.

The Microsoft Entra PowerShell module is a scenario-focused command-line tool that allows administrators to manage and automate Microsoft Entra product family resources programmatically. Its key capabilities include efficiently managing users, groups, applications, service principals, policies, and more. The module builds upon and is part of the Microsoft Graph PowerShell SDK and is fully interoperable with all cmdlets in the Microsoft Graph PowerShell SDK, enabling you to perform complex operations with simple, well documented commands. The module also offers a backward compatibility option with the [deprecated Azure AD PowerShell Module][azureAdModuleDeprecationLink] to accelerate migration. We recommend using [PowerShell version 7 or higher][powershellInstallLink] with the module on all platforms, including Windows, Linux, and macOS.

## Microsoft Graph PowerShell vs. Microsoft Entra PowerShell

Microsoft Entra PowerShell is a part of our increased investment in Microsoft Graph PowerShell SDK. It brings high-quality and scenario-optimized Microsoft Entra resource management to the Microsoft Graph PowerShell SDK. Still, it keeps all the benefits of Microsoft Graph PowerShell SDK for authorization, connection management, error handling, and (low-level) API coverage. As Microsoft Entra PowerShell builds on the Microsoft Graph PowerShell SDK, it's interoperable.

Microsoft Entra PowerShell provides the following benefits:

- **Focus on usability and quality**: Microsoft Entra PowerShell offers human-readable parameters, deliberate parameter set specification, inline documentation, and core PowerShell fundamentals like pipelining.
- **Backward compatibility with Azure AD PowerShell module**: Microsoft Entra PowerShell accelerates migration from the recently [announced Azure AD PowerShell module deprecation][azureAdModuleDeprecationLink].
- **Flexible and granular authorization**: Consistent with Microsoft Graph PowerShell SDK, Microsoft Entra PowerShell enables administrative consent for the permissions you want to grant to the application. It supports specifying your own application identity for maximum granularity in app permission assignment. You can also use certificate, Service Principal, or Managed Identity authentication patterns.
- **Open source**: The Microsoft Entra PowerShell module is open source, allowing contributions from the community to create great PowerShell experiences and share them with everyone. Open source promotes collaboration and facilitates the development of innovative business solutions. You can view Microsoft's customizations and adapt them to meet your needs.

## Migrate from Azure AD PowerShell module

Microsoft Entra PowerShell is over 98% compatible with the Azure AD PowerShell module and selected MSOnline cmdlets. By using the [Enable-EntraAzureADAlias][enable-entraazureadalis] command, you only need to update one or two lines in your existing scripts, making migration to Microsoft Graph PowerShell quick and effortless. For more information on how to migrate from the legacy modules to Microsoft Entra PowerShell, see [Migration guide][migration-guide].

## Installation and get started

Microsoft Entra PowerShell module is published on the [PowerShell Gallery][powershell-gallery]. To learn how to install the module, see [Installation guide for Microsoft Entra PowerShell][installation].

To start managing Microsoft Entra resources such as creating users, groups, and other tasks, see [Get-started][get-started] guide.

## Microsoft Entra PowerShell best practices

You can apply the [best practices guide][best-practices-guide] to optimize the use of Microsoft Entra PowerShell, ensure efficient scripting, secure access, and effective resource management. This guide helps you follow recommended methods, avoiding common pitfalls and enhancing overall productivity.

## Known Issues

The following section outlines the known issues with the Microsoft Entra PowerShell module, along with recommended workarounds.

| Feature                   | Issue                                                                                                                                 | Workaround/Comments                                         |
|---------------------------|---------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
| `-All` parameter          | We don't support `-All` Boolean parameter as was the case with Azure AD PowerShell module. `-All` is supported as a switch parameter. | Replace `-All:$true` with `-All` parameter in your scripts. |
| `-SearchString` parameter | The parameter `-SearchString` might not work as expected.                                                                             |

## External learning resources

Watch John Savill's video for an in-depth [overview of how Microsoft Entra PowerShell works](https://www.youtube.com/watch?v=YOgpAkshmYI).

## Next steps

- Create a free [Microsoft Entra ID account][free-entra-id]
- Got questions? Check out our [Frequently Asked Questions][faqs]

[free-entra-id]: https://azure.microsoft.com/free/entra-id
[migration-guide]: migration-guide.md
[get-started]: quickstart-entra-powershell.md
[installation]: installation.md
[powershell-gallery]: https://aka.ms/entrapsgallery
[faqs]: entra-powershell-faqs.yml
[best-practices-guide]: entra-powershell-best-practices.md
[azureAdModuleDeprecationLink]: https://techcommunity.microsoft.com/t5/microsoft-entra-blog/important-update-deprecation-of-azure-ad-powershell-and-msonline/ba-p/4094536
[powershellInstallLink]: /powershell/scripting/install/installing-powershell
[enable-entraazureadalis]: /powershell/module/microsoft.graph.entra/enable-entraazureadalias
