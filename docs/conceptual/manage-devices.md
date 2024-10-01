---  
title: Manage devices in Microsoft Entra ID  
description: Learn how to use Microsoft Entra PowerShell to manage device identities and monitor related event information.  
ms.service: entra-id  
ms.subservice: devices  
ms.topic: how-to  
ms.date: 10/01/2024  
ms.author: jomondi  
author: omondiatieno  
manager: celested  
ms.reviewer: stevemutungi

#customer-intent: As an IT admin, I want to have a comprehensive guide on managing device identities using Microsoft Entra PowerShell, so that I can ensure security and compliance within my organization. 
---  
   
# Manage devices in Microsoft Entra ID  

Microsoft Entra PowerShell provides powerful cmdlets to manage device identities and monitor related event information. Effective device management is crucial for ensuring security, compliance, and smooth operations within an organization. With Microsoft Entra PowerShell, you can add, update, and remove devices as needed. You can also retrieve device information, view device details, and manage device settings. This article guides you through various aspects of device management using Entra PowerShell.  

## Prerequisites  

To manage devices with Microsoft Entra PowerShell, you need:  

- A Microsoft Entra user account. If you don't have one, you can [create an account for free][free-entra-id].
- One of the following roles:  
  - [Cloud Device Administrator][cloud-device-admin] (read and modify)  
  - [Intune Administrator][intune-admin] (read only)  
  - [Windows 365 Administrator][windows-365-admin] (read only)  
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Entra PowerShell module][installation] guide to install the module.  

## View and filter your devices  

Use Microsoft Entra PowerShell to filter the device list by these attributes:  

Device ID, Display Name, Enabled State, Compliant State, Join Type, Activity Timestamp, OS Type and OS Version, Device Type, MDM, Autopilot, Extension Attributes, Administrative Unit, Owner, Manufacturer, Model, Serial Number

### View all devices  

To view all devices, use the following cmdlet:  

```powershell  
Connect-Entra -Scopes 'Device.Read.All'  
Get-EntraDevice  
```  

### Get a device by ID  

To retrieve a specific device by its ID, use:  

```powershell  
Connect-Entra -Scopes 'Device.Read.All'  
Get-EntraDevice -ObjectId 'bbbbbbbb-1111-2222-3333-cccccccccccc'  
```  

### Get a device by display name  

To find devices by display name, use:  

```powershell  
Connect-Entra -Scopes 'Device.Read.All'  
Get-EntraDevice -Filter "startsWith(DisplayName,'Woodgrove')"  
```

This example demonstrates how to retrieve all devices whose display name starts with "Woodgrove."

### Get a device by Join Type

To find out all the types of devices joined to your directory using Entra PowerShell, you can use the `Get-EntraDevice` cmdlet and group the results by the `TrustType` property.

```powershell
Connect-Entra -Scopes 'Device.Read.All'  
Get-EntraDevice -All | Group-Object -Property TrustType | Select-Object Name, Count  
```

- **Get-EntraDevice -All**: Retrieves all devices in your directory.  
- **Group-Object -Property TrustType**: Groups the devices by the `TrustType` property, which indicates the type of join (e.g., Azure AD joined, Hybrid Azure AD joined, etc.).  
- **Select-Object Name, Count**: Selects the name of each group (the type of join) and the count of devices in each group.  

This will give you a list of all device types and how many devices belong to each type.

## Enable or disable a Microsoft Entra device  

To enable or disable a device, set the `-AccountEnabled` property to either `true` or `false` using the `Set-EntraDevice` cmdlet.  

> [!IMPORTANT]
>
> - You must be an Intune Administrator or Cloud Device Administrator to enable or disable a device.
> - Disabling a device prevents it from authenticating via Microsoft Entra ID, accessing resources protected by device-based Conditional Access, and using Windows Hello for Business credentials.  
> - Disabling a device revokes the Primary Refresh Token (PRT) and any refresh tokens on the device.  
> - Printers can't be enabled or disabled in Microsoft Entra ID.  

Run the following cmdlet to enable a device:

```powershell  
Connect-Entra -Scopes 'Directory.AccessAsUser.All','Device.ReadWrite.All'  
Set-EntraDevice -ObjectId 'aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb' -AccountEnabled $true  
```  

## Delete a Microsoft Entra device  

Delete devices that are no longer in use to keep your environment clean and secure. If a device is managed in another management authority, like Microsoft Intune, ensure it's wiped or retired before you delete it. See [How to manage stale devices](#manage-stale-devices) before you delete a device.  

> [!IMPORTANT]
>
> - You must be a Cloud Device Administrator, Intune Administrator, or Windows 365 Administrator to delete a device.
> - Printers can't be deleted before they are deleted from Universal Print.  
> - Windows Autopilot devices can't be deleted before they are deleted from Intune.  
> - Deleting a device:  
>   - Prevents it from accessing your Microsoft Entra resources.  
>   - Removes all details attached to the device, such as BitLocker keys for Windows devices.  
>   - Is a nonrecoverable activity. We don't recommend it unless it's required.  

```powershell  
Connect-Entra -Scopes 'Directory.AccessAsUser.All','Device.ReadWrite.All'  
$Device = Get-EntraDevice -Filter "DisplayName eq 'Woodgrove Desktop'"  
Remove-EntraDevice -ObjectId $Device.ObjectId  
```  

## Download devices  

Cloud Device Administrators and Intune Administrators can export a CSV file that lists devices. You can apply filters to determine which devices to list. If you don't apply any filters, all devices are listed. An export task might run for as long as an hour, depending on your selections. If the export task exceeds 1 hour, it fails, and no file is output.  

The exported list includes these device identity attributes:  

`displayName,accountEnabled,operatingSystem,operatingSystemVersion,joinType (trustType),registeredOwners,userNames,mdmDisplayName,isCompliant,registrationTime,approximateLastSignInDateTime,deviceId,isManaged,objectId,profileType,systemLabels,model`  

The following filters can be applied for the export task:  

- Enabled state  
- Compliant state  
- Join type  
- Activity timestamp  
- OS type  
- Device type  

### Download all devices

To get all devices and store the returned data in a CSV file, run the following cmdlet:  

```PowerShell  
Get-EntraDevice -All | select-object -Property AccountEnabled, DeviceId, OperatingSystem, OperatingSystemVersion, DisplayName, TrustType, ApproximateLastSignInDateTime | export-csv devicelist-summary.csv -NoTypeInformation  
```

### Download stale devices

To get stale devices and store the returned data in a CSV file, run the following cmdlet:  

```PowerShell  
Get-EntraDevice -All | Where-Object { $_.AccountEnabled -eq $false } | Select-Object -Property AccountEnabled, DeviceId, OperatingSystem, OperatingSystemVersion, DisplayName, TrustType, ApproximateLastSignInDateTime | Export-Csv disabled-devices.csv -NoTypeInformation   
```

## Manage stale devices  

To complete the device lifecycle, registered devices should be unregistered when they aren't needed anymore. Due to lost, stolen, broken devices, or OS reinstallations, you typically have some stale devices in your environment. As an IT admin, you probably want a method to remove stale devices, so you can focus your resources on managing devices that actually require management.  

### What is a stale device?  

A stale device is a device registered with Microsoft Entra ID that hasn't accessed any cloud apps for a specific timeframe. Stale devices impact your ability to manage and support your devices and users in the tenant because:  

- Duplicate devices can make it difficult for your helpdesk staff to identify which device is currently active.  
- An increased number of devices creates unnecessary device writebacks, increasing the time for Microsoft Entra Connect syncs.  
- As a general hygiene practice and to meet compliance, you might want to have a clean slate of devices.  

Stale devices in Microsoft Entra ID can interfere with the general lifecycle policies for devices in your organization.  

### Detect stale devices  

Detecting stale devices requires a timestamp-related property. In Microsoft Entra PowerShell, this property is called **ApproximateLastSignInDateTime** or **activity timestamp**. If the delta between now and the value of the **activity timestamp** exceeds the timeframe you've defined for active devices, a device is considered stale.  

To filter devices by the `ApproximateLastSignInDateTime`, use:  

```PowerShell  
$dt = (Get-Date).AddDays(-90)  
Get-EntraDevice -All | Where-Object {$_.ApproximateLastSignInDateTime -le $dt}  
```  

### Clean up stale devices  

A typical routine for cleaning up stale devices consists of the following steps:  

1. Connect to Microsoft Entra ID using the `Connect-Entra` cmdlet.  
2. Get the list of stale devices.  
3. Disable the device using the `Set-EntraDevice` cmdlet (disable by using the `-AccountEnabled` option).  
4. Wait for the grace period of however many days you choose before deleting the device.  
5. Remove the device using the `Remove-EntraDevice` cmdlet.  

#### Get the list of stale devices  

Use the timestamp filter to get all devices that haven't logged on in 90 days and store the returned data in a CSV file.  

```PowerShell  
$dt = (Get-Date).AddDays(-90)  
Get-EntraDevice -All | Where-Object {$_.ApproximateLastSignInDateTime -le $dt} | select-object -Property AccountEnabled, DeviceId, OperatingSystem, OperatingSystemVersion, DisplayName, TrustType, ApproximateLastSignInDateTime | export-csv devicelist-olderthan-90days-summary.csv -NoTypeInformation  
```  

> [!WARNING]  
> Some active devices may have a blank timestamp.  

#### Disable stale devices  

Using the same commands, you can pipe the output to the set command to disable the devices over a certain age.  

```powershell  
$dt = (Get-Date).AddDays(-90)  
$params = @{ accountEnabled = $false }  
$Devices = Get-EntraDevice -All | Where-Object {$_.ApproximateLastSignInDateTime -le $dt}  
foreach ($Device in $Devices) {  
    Update-EntraDevice -DeviceId $Device.Id -BodyParameter $params  
}  
```  

### Delete stale devices  

> [!CAUTION]  
> The `Remove-EntraDevice` cmdlet doesn't provide a warning. Running this command will delete devices without prompting. **There is no way to recover deleted devices**.  

Before you delete any devices, back up any BitLocker recovery keys you might need in the future. There's no way to recover BitLocker recovery keys after deleting the associated device.  

Building on the [disable devices example](#disable-stale-devices), look for disabled devices, now inactive for 120 days, and pipe the output to `Remove-EntraDevice` to delete those devices.  

```powershell  
$dt = (Get-Date).AddDays(-120)  
$Devices = Get-EntraDevice -All | Where-Object {($_.ApproximateLastSignInDateTime -le $dt) -and ($_.AccountEnabled -eq $false)}  
foreach ($Device in $Devices) {  
    Remove-EntraDevice -DeviceId $Device.Id  
}  
```  

## What you should know  

### Why is the timestamp not updated more frequently?  

The timestamp is updated to support device lifecycle scenarios. This attribute isn't an audit. Use the sign-in audit logs for more frequent updates on the device. Some active devices might have a blank timestamp.  

### Why should I worry about my BitLocker keys?  

When configured, BitLocker keys for Windows 10 or newer devices are stored on the device object in Microsoft Entra ID. If you delete a stale device, you also delete the BitLocker keys stored on the device. Confirm that your cleanup policy aligns with the actual lifecycle of your device before deleting a stale device.  

### Why should I worry about Windows Autopilot devices?  

When you delete a Microsoft Entra device associated with a Windows Autopilot object, the following scenarios can occur if the device will be repurposed in the future:  

- With Windows Autopilot user-driven deployments without using pre-provisioning, a new Microsoft Entra device is created but isn’t tagged with the ZTDID.  
- With Windows Autopilot self-deploying mode deployments, they'll fail because an associated Microsoft Entra device can’t be found. This failure is a security mechanism to ensure no "impostor" devices try to join Microsoft Entra ID with no credentials. The failure indicates a ZTDID mismatch.  
- With Windows Autopilot pre-provisioning deployments, they fail because an associated Microsoft Entra device can’t be found. Pre-provisioning deployments use the same self-deploying mode process, enforcing the same security mechanisms.  

### What happens when I disable a device?  

Any authentication where a device is used to authenticate to Microsoft Entra ID is denied. Common examples are:  

- **Microsoft Entra hybrid joined device** - Users might be able to use the device to sign in to their on-premises domain. However, they can't access Microsoft Entra resources such as Microsoft 365.  
- **Microsoft Entra joined device** - Users can't use the device to sign in.  
- **Mobile devices** - Users can't access Microsoft Entra resources such as Microsoft 365.  

Managing devices using Entra PowerShell provides a robust and efficient way to ensure your organization's devices are secure and compliant. By following the steps and best practices outlined in this article, you can effectively manage your device environment and stay ahead of potential issues.  

## Next steps  

- [Frequently asked questions][faq]

- [cloud-device-admin]:/role-based-access-control/permissions-reference.md#cloud-device-administrator  
- [intune-admin]:/role-based-access-control/permissions-reference.md#intune-administrator  
- [windows-365-admin]:/role-based-access-control/permissions-reference.md#windows-365-administrator
- [faq]:/entra/identity/devices/faq
- [installation]: installation.md
- [free-entra-id]: https://azure.microsoft.com/free/entra-id
