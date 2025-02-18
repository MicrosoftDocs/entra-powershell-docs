---  
title: Manage devices in Microsoft Entra ID  
description: Learn how to use Microsoft Entra PowerShell to manage device identities and monitor related event information.  
ms.service: entra-id  
ms.subservice: devices  
ms.topic: how-to  
ms.date: 10/30/2024  
ms.author: jomondi  
author: omondiatieno  
manager: celested  
ms.reviewer: stevemutungi

#customer intent: As an IT admin, I want to have a comprehensive guide on managing device identities using Microsoft Entra PowerShell, so that I can ensure security and compliance within my organization. 
---  
   
# Manage devices in Microsoft Entra ID  

Microsoft Entra PowerShell offers powerful cmdlets for managing device identities and monitoring related events. Effective device management is essential for maintaining security, ensuring compliance, and supporting smooth operations within an organization. With Microsoft Entra PowerShell, you can add, update, and remove devices as needed, as well as retrieve device information, view detailed device data, and manage device settings. This article provides a comprehensive guide to managing devices using Microsoft Entra PowerShell.  

## Prerequisites  

To manage devices with Microsoft Entra PowerShell, you need:  

- A Microsoft Entra user account. If you don't have one, you can [create an account for free][free-entra-id].
- One of the following roles:  
  - [Cloud Device Administrator][cloud-device-admin] (read and modify)  
  - [Intune Administrator][intune-admin] (read only)  
  - [Windows 365 Administrator][windows-365-admin] (read only)  
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Entra PowerShell module][installation] guide to install the module.

## View and filter your devices  

Use Microsoft Entra PowerShell to filter the device list by the following attributes:

Device ID, Display Name, Enabled State, Compliance State, Join Type, Activity Timestamp, OS Type, OS Version, Device Type, MDM, Autopilot, Extension Attributes, Administrative Unit, Owner, Manufacturer, Model, and Serial Number.

### View all devices  

To view all devices, use the following cmdlet:  

```powershell  
Connect-Entra -Scopes 'Device.Read.All'  
Get-EntraDevice -All | Select-Object AccountEnabled, DeviceId, OperatingSystem, ApproximateLastSignInDateTime, DisplayName | ft
```  

```Output
AccountEnabled DeviceId                             OperatingSystem ApproximateLastSignInDateTime DisplayName
-------------- --------                             --------------- ----------------------------- -----------
          True aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb Windows         10/16/2024 4:53:46 PM         devicesTest2
          True bbbbbbbb-1111-2222-3333-cccccccccccc Windows         10/15/2024 4:11:33 PM         LAPTOP-2222
          True cccccccc-4444-5555-6666-dddddddddddd Windows         9/13/2024 5:46:08 PM          AdminTest
          True dddddddd-5555-6666-7777-eeeeeeeeeeee Windows         10/15/2024 8:28:18 PM         DESKTOP-1111
```

### Get a device by ID  

To retrieve a specific device by its ID, use:  

```powershell  
Connect-Entra -Scopes 'Device.Read.All'  
Get-EntraDevice -ObjectId 'bbbbbbbb-1111-2222-3333-cccccccccccc'  
```  

```Output

DeletedDateTime Id                                   AccountEnabled ApproximateLastSignInDateTime ComplianceExpirationDateTime DeviceCategory DeviceId                             DeviceMetadata DeviceOwnership
--------------- --                                   -------------- ----------------------------- ---------------------------- -------------- --------                             -------------- --------------
                aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb False          10/2/2024 10:26:38 AM                                                     eeeeeeee-5555-6666-7777-ffffffffffff
```

### Get a device by display name  

To find devices by display name, use:  

```powershell  
Connect-Entra -Scopes 'Device.Read.All'  
Get-EntraDevice -Filter "startsWith(DisplayName,'Woodgrove')"  
```

```Output
DeletedDateTime Id                                   AccountEnabled ApproximateLastSignInDateTime ComplianceExpirationDateTime DeviceCategory DeviceId                             DeviceMetadata DeviceOwnershi
                                                                                                                                                                                                  p
--------------- --                                   -------------- ----------------------------- ---------------------------- -------------- --------                             -------------- --------------
                aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb True           10/1/2024 4:11:35 PM                                                      gggggggg-6666-7777-8888-hhhhhhhhhhhh
                bbbbbbbb-1111-2222-3333-cccccccccccc False          10/2/2024 10:26:38 AM                                                     hhhhhhhh-7777-8888-9999-iiiiiiiiiiii
```

This example demonstrates how to retrieve all devices whose display name starts with "Woodgrove".

### Get the number of devices grouped by Join Type

To find out all the types of devices joined to your directory using Microsoft Entra PowerShell, you can use the `Get-EntraDevice` cmdlet and group the results by the `TrustType` property.

```powershell
Connect-Entra -Scopes 'Device.Read.All'  
Get-EntraDevice -All | Group-Object -Property TrustType | Select-Object Name, Count  
```

- `Get-EntraDevice -All`: Retrieves all devices in your directory.  
- `Group-Object -Property TrustType`: Groups the devices by the `TrustType` property, which indicates the type of join, for example, Microsoft Entra joined and Hybrid Microsoft Entra joined.  
- `Select-Object Name, Count`: Selects the name of each group (the type of join) and the count of devices in each group.
- `Join type` refers to how a device is connected, such as Microsoft Entra joined, Hybrid Microsoft Entra joined, and other types.

This example demonstrates how to retrieve the number of devices for each device type.

```Ouput
Name      Count
----      -----
             14
EntraID      66
ServerAd     18
Workplace   393
```

### List duplicate devices

```powershell
Connect-Entra -Scopes 'Device.Read.All'  
Get-EntraDevice -All -Select DisplayName, OperatingSystem |
Group-Object DisplayName |
Where-Object { $_.Count -gt 1 } |
Select-Object Name, @{Name = "OperatingSystem"; Expression = { ($_.Group | Select-Object -First 1).OperatingSystem } }, Count | Sort-Object Count -Descending |
Format-Table Name, OperatingSystem, Count -AutoSize 
```

The output lists duplicate devices by display name, operating system, and count.

```Output
Name                       OperatingSystem Count
----                       --------------- -----
iPhone                     iOS               175
samsungSM-S928B            Android            15
woodgrove-win11-client     Windows             2
```

### Search devices

1. Retrive specific device using `DeviceId`

    ```powershell
    Connect-Entra -Scopes 'Device.Read.All'  
    Get-EntraDevice -Filter "DeviceId eq 'dddddddd-5555-6666-7777-eeeeeeeeeeee'" 
    ```

1. List non-compliant devices

    ```powershell
    Connect-Entra -Scopes 'Device.Read.All'
    Get-EntraDevice -Filter "isCompliant eq false"
    ```

1. List jail broken devices

    ```powershell
    Connect-Entra -Scopes 'Device.Read.All'
    Get-EntraDevice -All | Where-Object { $_.isRooted -eq $true }
    ```

1. List managed devices

    ```powershell
    Connect-Entra -Scopes 'Device.Read.All'
    Get-EntraDevice -Filter "isManaged eq true"
    ```

1. List enabled devices

    ```powershell
    Connect-Entra -Scopes 'Device.Read.All'
    Get-EntraDevice -Filter "accountEnabled eq true" -All
    ```

1. List devices with specific operating system and version

    ```powershell
    Connect-Entra -Scopes 'Device.Read.All'
    Get-EntraDevice -Filter "operatingSystem eq 'Windows Server' and operatingSystemVersion eq '10.0.20348.3091'"
    ```

## Enable or disable a Microsoft Entra device  

To enable or disable a device, use the `Set-EntraDevice` cmdlet and set the `-AccountEnabled` property to `true` (enable) or `false` (disable).

> [!IMPORTANT]
>
> - You must be an Intune Administrator or Cloud Device Administrator to enable or disable a device.
> - Disabling a device prevents it from authenticating via Microsoft Entra ID, accessing resources protected by device-based Conditional Access, and using Windows Hello for Business credentials.  
> - Disabling a device revokes the Primary Refresh Token (PRT) and any refresh tokens on the device.  
> - Printers can't be enabled or disabled in Microsoft Entra ID.  

To enable a device, run the following cmdlet:

```powershell  
Connect-Entra -Scopes 'Device.ReadWrite.All'  
Set-EntraDevice -ObjectId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb' -AccountEnabled $true  
```  

## Delete a Microsoft Entra device  

To maintain a clean and secure environment, delete devices that are no longer in use. If a device is managed by another system, such as Microsoft Intune, ensure you wipe or retire it before deleting. See [How to manage stale devices](manage-stale-devices.md) before you delete a device.  

> [!IMPORTANT]
>
> - You must be a Cloud Device Administrator, Intune Administrator, or Windows 365 Administrator to delete a device.
> - Printers can't be deleted before they're deleted from Universal Print.  
> - Windows Autopilot devices can't be deleted before they're deleted from Intune.  
> - Deleting a device:  
>   - Prevents it from accessing your Microsoft Entra resources.  
>   - Removes all details attached to the device, such as BitLocker keys for Windows devices.  
>   - Is a nonrecoverable activity. We don't recommend it unless it's required.  

```powershell  
Connect-Entra -Scopes 'Device.ReadWrite.All'  
$Device = Get-EntraDevice -Filter "DisplayName eq 'Woodgrove Desktop'"  
Remove-EntraDevice -ObjectId $Device.ObjectId  
```  

## Export devices  

Cloud Device Administrators and Intune Administrators can export a CSV file listing devices. You can apply filters to refine the list of devices. If no filters are applied, all devices are included. The export task might take up to an hour to complete, depending on your selections. If the export task exceeds 1 hour, it fails, and no file is output.  

The exported list includes these device identity attributes:  

`displayName,accountEnabled,operatingSystem,operatingSystemVersion,joinType (trustType),registeredOwners,userNames,mdmDisplayName,isCompliant,registrationTime,approximateLastSignInDateTime,deviceId,isManaged,objectId,profileType,systemLabels,model`  

The following filters can be applied for the export task:  

- Enabled state  
- Compliant state  
- Join type  
- Activity timestamp  
- OS type  
- Device type  

### Export all devices

To retrieve all devices and save the data to a CSV file, use the following cmdlet:

```PowerShell  
Get-EntraDevice -All `
| Select-Object -Property AccountEnabled, DeviceId, OperatingSystem, OperatingSystemVersion, DisplayName, TrustType, ApproximateLastSignInDateTime `
| Export-Csv "$env:UserProfile\Downloads\deviceList.csv" -NoTypeInformation 
```

Ensure to replace `$env:UserProfile` with the path where you want to save the file based on your environment. This example saves the CSV file directly to your Downloads folder.

## Next step

> [!div class="nextstepaction"]
> [Manage stale devices](manage-stale-devices.md)

<!-- link references -->

[cloud-device-admin]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#cloud-device-administrator  
[intune-admin]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#intune-administrator  
[windows-365-admin]: /entra/identity/role-based-access-control/permissions-reference?toc=/powershell/entra-powershell/toc.json&bc=/powershell/entra-powershell/breadcrumb/toc.json#windows-365-administrator
[installation]: installation.md
[free-entra-id]: https://azure.microsoft.com/free/entra-id
