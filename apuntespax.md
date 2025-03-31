# EXAMEN PAX MADE BY RICHI ;)

`Router0>` ENABLE PARA ACTIVAR ROUTER `Router0#`


# COMANDOS ÚTILES
`FIJAROS EN EL NOMBRE DEL PRINCIPIO YA QUE DEPENDIENDO EN QUE MODO ESTEMOS NO NOS FUNCIONARÁN LOS COMANDOS !!!`
- Router0# `show ip interface brief`  
**MOSTRAMOS LAS IPS CONFIGURADAS EN NUESTRO ROUTER**

- Router0# `show ip route`  
**VER LA TABLA DE SALTOS ENTRE ROUTERS O SEA LAS (TABLAS DE ENRUTAMIENTO)**

- Router0# `show running-config | section dhcp`  
**MOSTRAR DHCP CONFIGURADO EN EL ROUTER**
- routerssh#`show ip dhcp binding`  
**MOSTRAR UNA LISTA DE LAS DIRECCIONES IP ASIGNADAS POR EL SERVIDOR DHCP**

# CONF ROUTER `CLI` 'COMMAND LINE'

Router0# `config t`  >>>>  **Pasamos a modo Router0(config)#**\
Router0(config)#`interface Serial0/0/0` **Seleccionamos interfície de router que queremos configurar**

Al seleccionar interfície pasamos a **Router0(config-if) !!!** 

> Router0(config-if)#`no shutdown` **FORZAMOS ACTIVACIÓN DE LA INTERFÍCIE**

> Router0(config-if)# `ip address 172.16.1.1 255.255.255.252` **PONEMOS LA IP DE NUESTRO ROUTER JUNTO A SU MÁSCARA**

> Router0(config-if)# `exit` **SALIMOS DEL MODO EN EL QUE ESTAMOS**

> Router0(config)# `ip route 172.16.0.128 255.255.255.192 172.16.1.2` **CONFIGURAR ENTRUTAMIENTO**\
>**ip de red | su máscara | la ip de salto**

> Router(config)#`no ip route 172.16.0.128 255.255.255.192 172.16.1.2` **BORRRAMOS EL ENRUTAMIENTO CREADO POR ERROR**


# CONF SSH

> R0#conf t
> R0(config)#`hostname routerssh` **ASIGNAMOS NOMBRE AL ROUTER**

> routerssh(config)#`ip domain-name ricardossh.cat`  
**DEFINIMOS EL NOMBRE DEL DOMINIO PARA EL USO DE SSH**

> routerssh(config)#`crypto key generate rsa general-keys modulus 1024`  
**GENERAMOS LA CLAVE RSA CON UN MÓDULO DE 1024 BITS PARA LA ENCRIPTACIÓN SSH**

> routerssh(config)#`ip ssh version 2`  
**HABILITAMOS LA VERSIÓN 2 DE SSH**

> routerssh(config)#`line vty 0 15`  
**SELECCIONAMOS LAS LÍNEAS VTY ACCESO REMOTO X SSH**

> routerssh(config-line)#`transport input ssh`  
**PERMITIMOS SOLO CONEXIONES SSH EN LAS LÍNEAS VTY (BLOQUEAMOS TELNET)**

> routerssh(config-line)#`login local`  
**HABILITAMOS EL USO DE USUARIOS LOCALES PARA AUTENTICACIÓN EN SSH**

> routerssh(config-line)#`username richissh privilege 15 secret alumnatedt`  
**CREAMOS UN USUARIO LOCAL LLAMADO `richissh` CON PRIVILEGIO 15 (ADMINISTRADOR) Y UNA CONTRASEÑA ENCRIPTADA `alumnatedt`**

> routerssh(config)#`enable secret alumnatedt`  
**CONFIGURAMOS UNA CONTRASEÑA DE MODO PRIVILEGIADO ENCRIPTADA**

## Conectarse desde PC usando SSH
> C:\>`ssh -l richissh 10.0.0.1`  
**COMANDO PARA CONECTARSE AL ROUTER VIA SSH DESDE LA PC (USUARIO `richissh` Y DIRECCIÓN IP `10.0.0.1`)**

---

## Configuración DHCP en el router
> routerssh(config)#`ip dhcp excluded-address 10.0.0.1`  
**EXCLUIMOS LA DIRECCIÓN `10.0.0.1` PARA QUE NO SEA ASIGNADA POR EL SERVIDOR DHCP**

> routerssh(config)#`ip dhcp pool REDPC0`  
**CREAMOS UN NUEVO POOL DHCP LLAMADO `REDPC0`**

> routerssh(dhcp-config)#`network 10.0.0.0 255.255.255.0`  
**CONFIGURAMOS LA RED DHCP Y SU MÁSCARA (`10.0.0.0` CON `255.255.255.0`)**

> routerssh(dhcp-config)#`default-router 10.0.0.1`  
**GATEWAY QUE ASIGNARÁ : `10.0.0.1`**

---

## Moverse entre pools DHCP
> routerssh(config)#`ip dhcp pool nombre_pool`  
**ACCEDER A LA CONFIGURACIÓN DE UN POOL DHCP POR SU NOMBRE**

---

## Ver IPs asignadas actualmente por el servidor DHCP
> routerssh#`show ip dhcp binding`  
**MOSTRAR UNA LISTA DE LAS DIRECCIONES IP ASIGNADAS POR EL SERVIDOR DHCP**

# LISTA DE MASCARAS : 
| Slash | Netmask           | Wildcard Mask      |
|-------|-------------------|--------------------|
| /32   | 255.255.255.255   | 0.0.0.0           |
| /31   | 255.255.255.254   | 0.0.0.1           |
| /30   | 255.255.255.252   | 0.0.0.3           |
| /29   | 255.255.255.248   | 0.0.0.7           |
| /28   | 255.255.255.240   | 0.0.0.15          |
| /27   | 255.255.255.224   | 0.0.0.31          |
| /26   | 255.255.255.192   | 0.0.0.63          |
| /25   | 255.255.255.128   | 0.0.0.127         |
| /24   | 255.255.255.0     | 0.0.0.255         |
| /23   | 255.255.254.0     | 0.0.1.255         |
| /22   | 255.255.252.0     | 0.0.3.255         |
| /21   | 255.255.248.0     | 0.0.7.255         |
| /20   | 255.255.240.0     | 0.0.15.255        |
| /19   | 255.255.224.0     | 0.0.31.255        |
| /18   | 255.255.192.0     | 0.0.63.255        |
| /17   | 255.255.128.0     | 0.0.127.255       |
| /16   | 255.255.0.0       | 0.0.255.255       |
| /15   | 255.254.0.0       | 0.1.255.255       |
| /14   | 255.252.0.0       | 0.3.255.255       |
| /13   | 255.248.0.0       | 0.7.255.255       |
| /12   | 255.240.0.0       | 0.15.255.255      |
| /11   | 255.224.0.0       | 0.31.255.255      |
| /10   | 255.192.0.0       | 0.63.255.255      |
| /9    | 255.128.0.0       | 0.127.255.255     |
| /8    | 255.0.0.0         | 0.255.255.255     |
| /7    | 254.0.0.0         | 1.255.255.255     |
| /6    | 252.0.0.0         | 3.255.255.255     |
| /5    | 248.0.0.0         | 7.255.255.255     |
| /4    | 240.0.0.0         | 15.255.255.255    |
| /3    | 224.0.0.0         | 31.255.255.255    |
| /2    | 192.0.0.0         | 63.255.255.255    |
| /1    | 128.0.0.0         | 127.255.255.255   |
| /0    | 0.0.0.0           | 255.255.255.255   |