# Deshabilitar NTLM:
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LmCompatibilityLevel" -Value 5
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name "NTLMMinClientSec" -Value 0x20080000
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name "RestrictSendingNTLMTraffic" -Value 2

# Deshabilitar LLMNR:
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" -Name "EnableMulticast" -Value 0 -Type DWord

# Deshabilitar NetBIOS sobre TCP/IP:
Get-NetAdapter | Set-NetAdapterAdvancedProperty -RegistryKeyword "NetbiosOptions" -RegistryValue 2

# Forzar LDAP Signing:
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" -Name "LdapServerIntegrity" -Value 2

# Habilitar Channel Binding:
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\NTDS\Parameters" -Name "LdapEnforceChannelBinding" -Value 2

# Restringir Null Session:
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanManServer\Parameters" -Name "RestrictNullSessAccess" -Value 1

# Añadir usuarios y grupos privilegiados al grupo Usuarios Protegidos:
Add-ADGroupMember -Identity "Usuarios Protegidos" -Members "Administrador", "Admins. del dominio", "Administradores de empresa"
