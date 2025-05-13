New-ADOrganizationalUnit -Name "Equipos" `
	-Path "DC=madrid,DC=empresa,DC=local"
New-ADOrganizationalUnit -Name "Usuarios" `
	-Path "DC=madrid,DC=empresa,DC=local"
New-ADOrganizationalUnit -Name "Developers" `
	-Path "OU=Usuarios,DC=madrid,DC=empresa,DC=local"
New-ADOrganizationalUnit -Name "Sales" `
	-Path "OU=Usuarios,DC=madrid,DC=empresa,DC=local"

New-ADUser -Name "Lucas" `
	-SamAccountName "lucas" `
	-UserPrincipalName "lucas@madrid.empresa.local" `
	-Path "OU=Developers,OU=Usuarios,DC=madrid,DC=empresa,DC=local" `
	-AccountPassword (ConvertTo-SecureString "MachoHercules123!" -AsPlainText -Force) `
	-Enabled $true

New-ADUser -Name "sqlservice" `
	-SamAccountName "sqlservice" `
	-ServicePrincipalNames "MSSQLSvc/WS01.madrid.empresa.local" `
	-Path "OU=Usuarios,DC=madrid,DC=empresa,DC=local" `
	-AccountPassword (ConvertTo-SecureString "NotMyPassword0k?" -AsPlainText -Force) `
	-Enabled $true

Add-ADGroupMember -Identity "Operadores de copia de seguridad" `
	-Members "sqlservice" `
	-Server madrid.empresa.local

Enable-PSRemoting -Force

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name "NtlmMinServerSec" -Value 512
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0" -Name "RestrictSendingNTLMTraffic" -Value 0

Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Escritorio remoto"
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp' -Name "UserAuthentication" -Value 1
