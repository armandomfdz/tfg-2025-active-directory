# Análisis de técnicas de ataque en Active Directory e implementación de contramedidas de endurecimiento 

## Resumen
 Este trabajo de fin de grado tiene como finalidad analizar distintas técnicas de ataque en un entorno de directorio activo, típico de redes empresariales. Éste proyecto comenzará con una breve introducción donde se describirán los disintos elementos que formarán parte de la topología de la red, así como distintos servicios y protocolos (Kerberos, LDAP, DNS, entre otros) que cumplen un rol importante en éste tipo de redes.

Tras diseñar y configurar un laboratorio de pruebas con máquinas virtuales que replicará un entorno AD, se simularán y documentarán distintas técnicas de ataque como Pass-The-Hash, Kerberoasting, NTLM Relay, envenenamiento del LLMNR/MDNS, abuso de ACLs, etc. Se estudiarán técnicas de post-explotación en entornos AD asociadas a: movimiento lateral, escalado de privilegios y despliegue de persistencias.

Por último, se presentarán estrategias, scripts y configuraciones de bastionado para reducir los riesgos asociados a los ataques realizados. Estas sugerencias incluirán medidas de prevención y detección, con la finalidad de reforzar la seguridad de los entornos de Directorio Activo y reducir las superfícies de ataque.

## Objetivos

Análisis teórico y práctico de distintos vectores de ataque sobre elementos del directorio activo

Estrategias y configuraciones de endurecimiento (hardening) en el AD para reducir los riesgos asociados

## Metodología

Análisis de amenazas en Active Directory mediante el estudio de técnicas ofensivas aplicadas sobre el laboratorio AD mediante procedimientos específicos.

Metodologías Ágiles de desarrollo para el proyecto

Implementación de contramedidas de bastionado mediante scripts PowerShell y configuraciones específicas.

Validación de dichas contramedidas en un laboratorio AD.
