w32tm /resync /rediscover
w32tm /query /status

Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

$cred = New-Object System.Management.Automation.PSCredential `
	("empresa.local\Administrador", (ConvertTo-SecureString "MachoHercules123!" -AsPlainText -Force))

Install-ADDSDomain -ParentDomainName "empresa.local" `
	-NewDomainName "alicante" `
	-InstallDNS -CreateDnsDelegation:$true `
	-DatabasePath "C:\Windows\NTDS" `
	-Credential $cred `
	-LogPath "C:\Windows\NTDS\Logs" `
	-SysvolPath "C:\Windows\SYSVOL" `
	-NoRebootOnCompletion:$false `
	-Force
