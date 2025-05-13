New-ADTrust `
    -Name "madrid.empresa.local" `
    -TargetDomain "madrid.empresa.local" `
    -Direction Bidirectional `
    -TrustType "Domain" `
    -TrustTransitive $true `
    -Server dc03.empresa.local

$cred = New-Object System.Management.Automation.PSCredential (
    "madrid.empresa.local\Administrador", 
    (ConvertTo-SecureString "MachoHercules123!" -AsPlainText -Force)
)

Add-ADGroupMember -Identity "CN=Administrador,CN=Users,DC=madrid,DC=empresa,DC=local" `
	-Members "CN=Administradores de empresas,CN=Users,DC=empresa,DC=local" `
	-Server dc03.empresa.local `
	-Credential $cred

Enable-PSRemoting -Force
