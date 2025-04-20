Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

Install-ADDSForest -DomainName "empresa.local" `
	-DomainMode WinThreshold `
	-ForestMode WinThreshold `
	-InstallDNS `
	-DatabasePath "C:\Windows\NTDS" `
	-LogPath "C:\Windows\NTDS\Logs" `
	-SysvolPath "C:\Windows\SYSVOL" `
	-NoRebootOnCompletion:$false `
	-Force
