# Habilitar filtrado SID
Set-ADTrust -Identity "alicante.empresa.local" -SIDFilteringQuarantined $true

# Habilitar autentación selectiva
Set-ADTrust -Identity "alicante.empresa.local" -SelectiveAuthentication $true
