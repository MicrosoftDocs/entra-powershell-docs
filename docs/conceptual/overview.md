---
title: What is Microsoft Entra PowerShell overview (preview)?
description: "Learn about the features of Microsoft Entra PowerShell that help you derive insights and analytics, and build unique, intelligent apps in Microsoft Entra ID."
ms.topic: overview
ms.date: 01/28/2025
author: omondiatieno
manager: CelesteDG
ms.author: jomondi
ms.reviewer: stevemutungi

#customer intent: As an IT admin, I want to learn about Microsoft Entra PowerShell, so that I can get started with using the module.
---
# What is Microsoft Entra PowerShell (preview)?

> [!IMPORTANT]
> Microsoft Entra PowerShell cmdlets are currently in preview and might change. We recommend using these cmdlets for testing and development purposes only, and not in production applications at this time.

The Microsoft Entra PowerShell module is a command-line tool that allows administrators to manage and automate Microsoft Entra resources programmatically. This includes efficiently managing users, groups, applications, service principals, policies, and more. The module builds upon and is part of the Microsoft Graph PowerShell SDK. It’s fully interoperable with all cmdlets in the Microsoft Graph PowerShell SDK, enabling you to perform complex operations with simple, well-documented commands. The module also offers a backward compatibility option to streamline migration from [the retiring AzureAD PowerShell module][azureAdModuleDeprecationLink]. Microsoft Entra PowerShell works with Windows PowerShell 5.1 and PowerShell 7+. For the best experience on Windows, Linux, and macOS, we recommend using PowerShell 7 or later.

## Benefits of Microsoft Entra PowerShell 

Microsoft Entra PowerShell provides the following benefits:

- **Focus on usability**: Microsoft Entra PowerShell offers human-readable parameters, deliberate parameter set specification, inline documentation, and core PowerShell fundamentals like pipelining.
- **Backward compatibility with Azure AD PowerShell module**: Microsoft Entra PowerShell simplifies migration from the [retiring Azure AD PowerShell module][azureAdModuleDeprecationLink].
- **Flexible and granular authorization**: Consistent with Microsoft Graph PowerShell SDK, Microsoft Entra PowerShell enables administrative consent for the permissions you want to grant to the application. It also supports running Microsoft Entra PowerShell using your own service principal or user-assigned managed identity.  
- **Open source**: Microsoft Entra PowerShell module is open source, enabling community collaboration to enhance PowerShell and share innovations. You can explore Microsoft's customizations and adapt them to your needs.

## Migrate from Azure AD PowerShell module

Microsoft Entra PowerShell is over 98% compatible with the Azure AD PowerShell module and over 80% parity with MSOnline cmdlets. By using the [Enable-EntraAzureADAlias][enable-entraazureadalis] command, you only need to update one or two lines in your existing scripts, making migration to Microsoft Entra PowerShell quick and effortless. For more information on how to migrate from the legacy modules to Microsoft Entra PowerShell, see the [Migration guide][migration-guide].

## Installation and get started

Microsoft Entra PowerShell module is published on the [PowerShell Gallery][powershell-gallery]. To learn how to install the module, see the [Installation guide for Microsoft Entra PowerShell][installation].

To start managing Microsoft Entra resources such as creating users, groups, and other tasks, see the [Navigate the module][get-started] guide.

## Microsoft Entra PowerShell best practices

You can apply the [best practices][best-practices-guide] to optimize the use of Microsoft Entra PowerShell, ensure efficient scripting, secure access, and effective resource management. This guide helps you follow recommended methods, avoiding common pitfalls and enhancing overall productivity.

## Known Issues

The following section outlines the known issues with the Microsoft Entra PowerShell module, along with recommended workarounds.

| Feature                   | Issue                                                                                                                                 | Workaround/Comments                                         |
|---------------------------|---------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------|
| `-All` parameter          | We don't support `-All` Boolean parameter as was the case with Azure AD PowerShell module. `-All` is supported as a switch parameter. | Replace `-All:$true` with `-All` parameter in your scripts. |
| `-SearchString` parameter | The parameter `-SearchString` might not work as expected.                                                                             |

## Next steps

- Create a free [Microsoft Entra ID account][free-entra-id]
- Got questions? Check out our [Frequently Asked Questions][faqs]

[free-entra-id]: https://azure.microsoft.com/free/entra-id
[migration-guide]: migration-guide.md
[get-started]: navigate-entraps.md
[installation]: installation.md
[powershell-gallery]: https://aka.ms/entra/ps/gallery
[faqs]: entra-powershell-faqs.yml
[best-practices-guide]: entra-powershell-best-practices.md
[azureAdModuleDeprecationLink]: https://techcommunity.microsoft.com/blog/identity/action-required-msonline-and-azuread-powershell-retirement---2025-info-and-resou/4364991
[powershellInstallLink]: /powershell/scripting/install/installing-powershell
[enable-entraazureadalis]: /powershell/module/microsoft.entra/enable-entraazureadalias
