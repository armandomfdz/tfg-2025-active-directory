$cred = New-Object System.Management.Automation.PSCredential (
    "alicante.empresa.local\Administrador", 
    (ConvertTo-SecureString "MachoHercules123!" -AsPlainText -Force)
)

$user = Get-ADUser -Identity "Administrador" -Server "alicante.empresa.local" -Credential $cred
Add-ADGroupMember -Identity "Administradores de Empresas" -Members $user -Server "empresa.local"
