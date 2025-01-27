### [PowerShell 7](#tab/powershell)

- Install a supported version of
  [PowerShell version 7 or higher][install-windows]

### [Windows PowerShell](#tab/windowspowershell)

- Update to
   [Windows PowerShell 5.1][posh-5.1]
- Install [.NET Framework 4.7.2 or later](/dotnet/framework/install)
- Update PowerShellGet

   To update PowerShellGet, launch Windows PowerShell 5.1 elevated as an administrator and run the following command:

   ```powershell
   Install-Module -Name PowerShellGet -Force -AllowClobber
   ```

---

[posh-5.1]: /powershell/scripting/windows-powershell/install/installing-windows-powershell#upgrading-existing-windows-powershell
[install-windows]: /powershell/scripting/install/installing-powershell-on-windows