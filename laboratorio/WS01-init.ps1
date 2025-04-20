Set-DnsClientServerAddress -InterfaceAlias "Instancia de Ethernet 0" `
	-ServerAddresses "10.0.1.139"

$cred = (New-Object System.Management.Automation.PSCredential `
	("madrid.empresa.local\Administrador", `
	(ConvertTo-SecureString "MachoHercules123!" -AsPlainText -Force))) 

Add-Computer -DomainName "madrid.empresa.local" `
	-OUPath "OU=Equipos,DC=madrid,DC=empresa,DC=local" `
	-Credential $cred `
	-Restart
