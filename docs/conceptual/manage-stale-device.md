---  
title: Manage stale devices 
description: Learn how to use Microsoft Entra PowerShell to manage stale devices and monitor related event information.  
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

# Manage stale devices  

To complete the device lifecycle, registered devices should be unregistered when they aren't needed anymore. As a result of stolen, lost, broken devices, or OS reinstallations, you typically have some stale devices in your environment. As an IT admin, you probably want a method to remove stale devices, so you can focus your resources on managing devices that actually require management.  

To manage stale devices with Microsoft Entra PowerShell, you need:  

- A Microsoft Entra user account. If you don't have one, you can [create an account for free][free-entra-id].
- A [Cloud Device Administrator][cloud-device-admin] role (read and modify).
- Microsoft Entra PowerShell module installed. Follow the [Install the Microsoft Entra PowerShell module][installation] guide to install the module.

## What is a stale device?  

A stale device is a device registered with Microsoft Entra ID that hasn't accessed any cloud apps for a specific timeframe. Stale devices impact your ability to manage and support your devices and users in the tenant because:  

- Duplicate devices can make it difficult for your helpdesk staff to identify which device is currently active.  
- An increased number of devices creates unnecessary device writebacks, increasing the time for Microsoft Entra Connect syncs.  
- As a general hygiene practice and to meet compliance, you might want to have a clean slate of devices.  

Stale devices in Microsoft Entra ID can interfere with the general lifecycle policies for devices in your organization.  

## Detect stale devices  

Detecting stale devices requires a timestamp-related property. In Microsoft Entra PowerShell, this property is called **ApproximateLastSignInDateTime** or **activity timestamp**. If the delta between now and the value of the **activity timestamp** exceeds the timeframe you set for active devices, a device is considered stale.  

To filter devices by the `ApproximateLastSignInDateTime`, use:  

```PowerShell  
$dt = (Get-Date).AddDays(-90)  
Get-EntraDevice -All | Where-Object {$_.ApproximateLastSignInDateTime -le $dt}  
```

```output


DeletedDateTime Id                                   AccountEnabled ApproximateLastSignInDateTime ComplianceExpirationDateTime DeviceCategory DeviceId                             DeviceMetadata DeviceOwnership
--------------- --                                   -------------- ----------------------------- ---------------------------- -------------- --------                             -------------- --------------
                aaaaaaaa-0000-1111-2222-bbbbbbbbbbbb True           9/30/2024 11:34:18 PM                                                     9b1b1b1b-1111-2222-3333-cccccccccccc
                bbbbbbbb-1111-2222-3333-cccccccccccc True           9/13/2024 5:46:08 PM                                                      8a2a2a2a-2222-3333-4444-dddddddddddd
                cccccccc-4444-5555-6666-dddddddddddd True           9/13/2024 3:57:52 AM                                                      7c3c3c3c-3333-4444-5555-eeeeeeeeeeee
```

## Clean up stale devices  

A typical routine for cleaning up stale devices consists of the following steps:  

1. Connect to Microsoft Entra ID using the `Connect-Entra` cmdlet.  
2. Get the list of stale devices.  
3. Disable the device using the `Set-EntraDevice` cmdlet (disable by using the `-AccountEnabled` option).  
4. Wait for the grace period of however many days you choose before deleting the device.  
5. Remove the device using the `Remove-EntraDevice` cmdlet.  
  
### Download list of stale devices

Use the timestamp filter to get all devices that don't have sign-in data in the last 90 days and store the returned data in a CSV file.  

```PowerShell
$dt = (Get-Date).AddDays(-90) # Example: devices not signed in for the last 90 days
Get-EntraDevice -All | Where-Object {$_.ApproximateLastSignInDateTime -le $dt} | Select-Object -Property AccountEnabled, DeviceId, OperatingSystem, OperatingSystemVersion, DisplayName, TrustType, ApproximateLastSignInDateTime | Export-Csv "C:\Users\YourUsername\Downloads\stale-devices.csv" -NoTypeInformation  
```

Ensure to replace YourUsername with your actual username or the desired path where you want to save the file. This example will save the CSV file directly to your Downloads folder.
> [!WARNING]  
> Some active devices may have a blank timestamp.  

### Disable stale devices  

Using the previous example for getting the list of stale devices, you can pipe the output to the set command to disable the devices over a certain age.  

```powershell  
$dt = (Get-Date).AddDays(-90)  
$Devices = Get-EntraDevice -All | Where-Object {$_.ApproximateLastSignInDateTime -le $dt}
foreach ($Device in $Devices) {Set-EntraDevice -ObjectId $Device.Id -AccountEnabled $false}
```  

### Delete stale devices  

> [!CAUTION]  
> The `Remove-EntraDevice` cmdlet doesn't provide a warning. Running this command will delete devices without prompting. **There is no way to recover deleted devices**.  

Before you delete any devices, back up any BitLocker recovery keys you might need in the future. There's no way to recover BitLocker recovery keys after deleting the associated device.  

Building on the [disable stale devices example](#disable-stale-devices), look for disabled devices, now inactive for 120 days, and pipe the output to `Remove-EntraDevice` to delete those devices.  

```powershell  
$dt = (Get-Date).AddDays(-120)  
$Devices = Get-EntraDevice -All | Where-Object {($_.ApproximateLastSignInDateTime -le $dt) -and ($_.AccountEnabled -eq $false)}  
foreach ($Device in $Devices) {Remove-EntraDevice -DeviceId $Device.Id}  
```  

## What you should know  

### Why is the timestamp not updated more frequently?  

The timestamp is updated to support device lifecycle scenarios. This attribute isn't an audit. Use the sign-in audit logs for more frequent updates on the device. Some active devices might have a blank timestamp.  

### Why should I worry about my BitLocker keys?  

When configured, BitLocker keys for Windows 10 or newer devices are stored on the device object in Microsoft Entra ID. If you delete a stale device, you also delete the BitLocker keys stored on the device. Confirm that your cleanup policy aligns with the actual lifecycle of your device before deleting a stale device.  

### Why should I worry about Windows Autopilot devices?  

When you delete a Microsoft Entra device associated with a Windows Autopilot object, the following scenarios can occur if the device will be repurposed in the future:  

- With Windows Autopilot user-driven deployments without using pre-provisioning, a new Microsoft Entra device is created but isn’t tagged with the ZTDID.  
- With Windows Autopilot self-deploying mode deployments, they fail because an associated Microsoft Entra device can’t be found. This failure is a security mechanism to ensure no "impostor" devices try to join Microsoft Entra ID with no credentials. The failure indicates a ZTDID mismatch.  
- With Windows Autopilot pre-provisioning deployments, they fail because an associated Microsoft Entra device can’t be found. Pre-provisioning deployments use the same self-deploying mode process, enforcing the same security mechanisms.  

### What happens when I disable a device?  

Any authentication where a device is used to authenticate to Microsoft Entra ID is denied. Common examples are:  

- **Microsoft Entra hybrid joined device** - Users might be able to use the device to sign in to their on-premises domain. However, they can't access Microsoft Entra resources such as Microsoft 365.  
- **Microsoft Entra joined device** - Users can't use the device to sign in.  
- **Mobile devices** - Users can't access Microsoft Entra resources such as Microsoft 365.  

Managing devices using Microsoft Entra PowerShell provides a robust and efficient way to ensure your organization's devices are secure and compliant. By following the steps and best practices outlined in this article, you can effectively manage your device environment and stay ahead of potential issues.  

## Next steps  

- [Frequently asked questions][faq]

<!-- link references -->

- [cloud-device-admin]: /entra/identity/role-based-access-control/permissions-reference#cloud-device-administrator  
- [faq]: /entra/identity/devices/faq
- [installation]: installation.md
- [free-entra-id]: https://azure.microsoft.com/free/entra-id
