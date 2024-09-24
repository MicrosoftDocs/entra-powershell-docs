---
title: "Manage licenses with Microsoft Entra PowerShell"
description: "Learn how to manage Microsoft Entra licenses with the Microsoft Entra PowerShell."

author: msewaweru
manager: CelesteDG
ms.service: entra-powershell
ms.topic: how-to
ms.date: 09/24/2024
ms.author: eunicewaweru
ms.reviewer: stevemutungi

#customer intent: As an admin, I want to manage the assignment of Entra licenses using the Microsoft Entra PowerShell.
---

# Manage licenses with Microsoft Entra PowerShell

Most Microsoft Entra services require a license to access. Only users with active licenses can access and use the licensed Microsoft Entra services. Licenses are applied per tenant and can't be transferred to other tenants. You can use the Microsoft Entra PowerShell to manage licenses for your organization. 

In this how-to guide,  you assign and remove licenses for users and groups in your tenant.

## Prerequisites

To successfully complete this guide, make sure you have the required prerequisites:

1. Microsoft Entra PowerShell module is installed. Follow the [Install the Microsoft Entra PowerShell module](installation.md) guide to install the module.  
1. Microsoft Entra PowerShell using a License Administrator with the appropriate permissions. For this how-to guide, the `User.ReadWrite.All` delegated permission is required. To set the permissions in Microsoft Entra PowerShell, run;

    ```powershell
    Connect-Entra -Scopes User.ReadWrite.All'
    ```
    Select **Consent on behalf of your organization** before accepting in the sign-in dialog box.
1. Users to assign licenses to are created in your tenant and assigned a location.

## Review available license plans

## Assign licenses to users and groups
### Assign a license to a user
### Assign more than one license to a user
### Assign a license to a user with some disabled plans
### Assign a license to a user by copying license from another user
### Bulk assign multiple licenses for multiple users at the same time

## Remove licenses from users and groups
### Remove an assigned user's License
