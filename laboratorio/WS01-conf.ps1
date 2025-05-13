New-Item -Path "C:\CarpetaCompartida" `
        -ItemType Directory `
        -Force
New-SmbShare -Name "CarpetaCompartida" `
        -Path "C:\CarpetaCompartida"
Grant-SmbShareAccess -Name "CarpetaCompartida" `
        -AccountName "madrid\lucas" `
        -AccessRight Full `
        -Force

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "DisableLoopbackCheck" -Value 1
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name "NtlmMinServerSec" -Value 512
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name "RestrictSendingNTLMTraffic" -Value 0

$password = ConvertTo-SecureString "MachoHercules123!" -AsPlainText -Force
Enable-LocalUser -Name "Administrador"
Set-LocalUser -Name "Administrador" -Password $Password
Add-LocalGroupMember -SID "S-1-5-32-580" -Member "Administrador"

Start-Service winrm
netsh advfirewall firewall add rule name="WinRM-HTTP" dir=in localport=5985 protocol=TCP action=allow

Restart-Computer -Force
