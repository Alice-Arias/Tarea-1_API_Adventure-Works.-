<div align="center">

# Instituto Tecnológico de Costa Rica

## Escuela de Computación — Bases de Datos II

### Tarea #1 API con SQL Server

<br>

**Estudiante:** Alice Arias Salazar

**Carné:** 2023104639

**Profesor:** Cristian Paz Campos Agüero

**Grupo:** 60

**Entrega:** 18 de septiembre de 2026 · **II Semestre 2026**

<br>

---

🔗 **Repositorio:** [Tarea-1_API_Adventure-Works](https://github.com/Alice-Arias/Tarea-1_API_Adventure-Works.-.git)

</div>

---

## 📑 Índice

1. [Introducción](#introducción)
2. [Instalación y configuración de WSL y Ubuntu](#instalación-y-configuración-de-wsl-y-ubuntu)
   - [Paso 1. Abrir PowerShell como administrador](#paso-1-abrir-powershell-como-administrador)
   - [Paso 2. Instalar WSL por medio de comandos](#paso-2-instalar-wsl-por-medio-de-comandos)
   - [Paso 3. Instalar Ubuntu](#paso-3-instalar-ubuntu)
   - [Paso 4. Crear usuario y contraseña de Linux](#paso-4-crear-usuario-y-contraseña-de-linux)
   - [Paso 5. Confirmar que WSL y Ubuntu quedaron instalados](#paso-5-confirmar-que-wsl-y-ubuntu-quedaron-instalados)
   - [Paso 6. Verificar el acceso a Ubuntu](#paso-6-verificar-el-acceso-a-ubuntu)
   - [Paso 7. Actualizar Ubuntu](#paso-7-actualizar-ubuntu)
3. [Creación del contenedor con Docker](#creación-del-contenedor-con-docker)
   - [Paso 8. Instalar Docker Engine en Ubuntu](#paso-8-instalar-docker-engine-en-ubuntu)
   - [Paso 9. Dar permisos al usuario](#paso-9-dar-permisos-al-usuario)
   - [Paso 10. Verificar el grupo](#paso-10-verificar-el-grupo)
   - [Paso 11. Iniciar Docker](#paso-11-iniciar-docker)
4. [Instalación del motor de bases de datos SQL Server en Linux](#instalación-del-motor-de-bases-de-datos-sql-server-en-linux)
   - [Paso 12. Descargar la imagen de SQL Server](#paso-12-descargar-la-imagen-de-sql-server)
   - [Paso 13. Crear y ejecutar el contenedor de SQL Server](#paso-13-crear-y-ejecutar-el-contenedor-de-sql-server)
   - [Paso 14. Verificar que el contenedor esté ejecutándose](#paso-14-verificar-que-el-contenedor-esté-ejecutándose)
5. [Instalación de la base de datos AdventureWorks](#instalación-de-la-base-de-datos-adventureworks)
   - [Paso 15. Descargar el backup de AdventureWorks](#paso-15-descargar-el-backup-de-adventureworks)
   - [Paso 16. Copiar el archivo al contenedor](#paso-16-copiar-el-archivo-al-contenedor)
   - [Paso 17. Ver los nombres lógicos del backup](#paso-17-ver-los-nombres-lógicos-del-backup)
   - [Paso 18. Crear y ejecutar el archivo de restauración](#paso-18-crear-y-ejecutar-el-archivo-de-restauración)
6. [Configuración de Visual Studio Code para trabajar con Ubuntu mediante WSL](#configuración-de-visual-studio-code-para-trabajar-con-ubuntu-mediante-wsl)
   - [Paso 19. Abrir Visual Studio Code e instalar la extensión WSL](#paso-19-abrir-visual-studio-code-e-instalar-la-extensión-wsl)
7. [Configuración de SQL Server en Visual Studio Code](#configuración-de-sql-server-en-visual-studio-code)
   - [Paso 20. Instalar la extensión MSSQL](#paso-20-instalar-la-extensión-mssql)
   - [Paso 21. Solucionar el error de la extensión MSSQL](#paso-21-solucionar-el-error-de-la-extensión-mssql)
   - [Paso 22. Conectar Visual Studio Code con SQL Server](#paso-22-conectar-visual-studio-code-con-sql-server)
8. [Configuración de Git y preparación del repositorio](#configuración-de-git-y-preparación-del-repositorio)
   - [Paso 23. Verificar la instalación de Git](#paso-23-verificar-la-instalación-de-git)
   - [Paso 24. Ubicarse en la carpeta Home de Ubuntu](#paso-24-ubicarse-en-la-carpeta-home-de-ubuntu)
   - [Paso 25. Clonar el repositorio del profesor](#paso-25-clonar-el-repositorio-del-profesor)
   - [Paso 26. Entrar al proyecto y desconectarlo del repositorio original](#paso-26-entrar-al-proyecto-y-desconectarlo-del-repositorio-original)
   - [Paso 27. Crear un repositorio propio en GitHub](#paso-27-crear-un-repositorio-propio-en-github)
   - [Paso 28. Copiar la URL del repositorio propio](#paso-28-copiar-la-url-del-repositorio-propio)
9. [Creación y configuración de Stored Procedures para el CRUD](#creación-y-configuración-de-stored-procedures-para-el-crud)
   - [Paso 29. Creación de Stored Procedures para el CRUD](#paso-29-creación-de-stored-procedures-para-el-crud)
10. [Instalación y configuración de Node.js en WSL Ubuntu mediante NVM](#instalación-y-configuración-de-nodejs-en-wsl-ubuntu-mediante-nvm)
    - [Paso 30. Instalar NVM en WSL Ubuntu](#paso-30-instalar-nvm-en-wsl-ubuntu)
    - [Paso 31. Activar NVM en la terminal](#paso-31-activar-nvm-en-la-terminal)
    - [Paso 32. Instalar Node.js en su versión LTS](#paso-32-instalar-nodejs-en-su-versión-lts)
    - [Paso 33. Seleccionar la versión LTS de Node.js](#paso-33-seleccionar-la-versión-lts-de-nodejs)
    - [Paso 34. Verificar que Node.js quedó instalado](#paso-34-verificar-que-nodejs-quedó-instalado)
    - [Paso 35. Inicializar el proyecto](#paso-35-inicializar-el-proyecto)
    - [Paso 36. Instalar las librerías necesarias](#paso-36-instalar-las-librerías-necesarias)
    - [Paso 37. Instalar Nodemon](#paso-37-instalar-nodemon)
    - [Paso 38. Verificar el archivo package.json](#paso-38-verificar-el-archivo-packagejson)
    - [Paso 39. Comprobar las dependencias instaladas](#paso-39-comprobar-las-dependencias-instaladas)
    - [Paso 40. Verificar Node.js y npm](#paso-40-verificar-nodejs-y-npm)
11. [Configuración de los archivos de la API](#configuración-de-los-archivos-de-la-api)
    - [Paso 41. Crear y configurar el archivo .env](#paso-41-crear-y-configurar-el-archivo-env)
    - [Paso 42. Crear el archivo .gitignore](#paso-42-crear-el-archivo-gitignore)
12. [Configuración del servidor](#configuración-del-servidor)
    - [Paso 43. Crear el archivo server.js](#paso-43-crear-el-archivo-serverjs)
    - [Paso 44. Crear el archivo de conexión db.js](#paso-44-crear-el-archivo-de-conexión-dbjs)
13. [Creación de las rutas](#creación-de-las-rutas)
    - [Paso 45. Crear el archivo departamentos.js](#paso-45-crear-el-archivo-departamentosjs)
    - [Paso 46. Implementar la operación INSERT](#paso-46-implementar-la-operación-insert)
    - [Paso 47. Implementar la operación UPDATE](#paso-47-implementar-la-operación-update)
    - [Paso 48. Implementar la operación DELETE](#paso-48-implementar-la-operación-delete)
    - [Paso 49. Implementar la consulta de clientes por territorio](#paso-49-implementar-la-consulta-de-clientes-por-territorio)
    - [Paso 50. Implementar la consulta de personas por tipo](#paso-50-implementar-la-consulta-de-personas-por-tipo)
    - [Paso 51. Implementar el reporte de Work Order](#paso-51-implementar-el-reporte-de-work-order)
    - [Paso 52. Exportar las rutas](#paso-52-exportar-las-rutas)
14. [Configuración de los Stored Procedures (ejecución en el servidor)](#configuración-de-los-stored-procedures-ejecución-en-el-servidor)
    - [Paso 53. Verificar el archivo de Stored Procedures](#paso-53-verificar-el-archivo-de-stored-procedures)
    - [Paso 54. Ejecutar los Stored Procedures en SQL Server](#paso-54-ejecutar-los-stored-procedures-en-sql-server)
15. [Inicio y prueba de la API](#inicio-y-prueba-de-la-api)
    - [Paso 55. Iniciar el servidor](#paso-55-iniciar-el-servidor)
    - [Paso 56. Abrir una segunda terminal para realizar las pruebas](#paso-56-abrir-una-segunda-terminal-para-realizar-las-pruebas)
    - [Paso 57. Probar la ruta principal de la API](#paso-57-probar-la-ruta-principal-de-la-api)
    - [Paso 58. Probar la consulta de clientes por territorio](#paso-58-probar-la-consulta-de-clientes-por-territorio)
    - [Paso 59. Probar la actualización del inventario](#paso-59-probar-la-actualización-del-inventario)
    - [Paso 60. Probar la operación DELETE](#paso-60-probar-la-operación-delete)
    - [Paso 61. Verificación final del funcionamiento](#paso-61-verificación-final-del-funcionamiento)
    - [Paso 62. Datos de prueba para validar la API](#paso-62-datos-de-prueba-para-validar-la-api)
16. [Instalación y uso de Postman](#instalación-y-uso-de-postman)
    - [Paso 63. Descargar e instalar Postman en Windows](#paso-63-descargar-e-instalar-postman-en-windows)
    - [Paso 64. Comprender cómo se comunica Postman con la API](#paso-64-comprender-cómo-se-comunica-postman-con-la-api)
    - [Paso 65. Abrir Postman y realizar la primera prueba](#paso-65-abrir-postman-y-realizar-la-primera-prueba)
    - [Paso 66. Probar una consulta GET con Postman](#paso-66-probar-una-consulta-get-con-postman)
    - [Paso 67. Probar una solicitud POST con Postman](#paso-67-probar-una-solicitud-post-con-postman)
    - [Paso 68. Probar una solicitud PUT con Postman](#paso-68-probar-una-solicitud-put-con-postman)
    - [Paso 69. Probar una solicitud DELETE con Postman](#paso-69-probar-una-solicitud-delete-con-postman)
    - [Paso 70. Probar las demás consultas de la API](#paso-70-probar-las-demás-consultas-de-la-api)
    - [Paso 71. Organizar las pruebas en una colección de Postman](#paso-71-organizar-las-pruebas-en-una-colección-de-postman)
    - [Paso 72. Verificación final utilizando Postman](#paso-72-verificación-final-utilizando-postman)
   - [Paso 23. Verificar la instalación de Git](#paso-23-verificar-la-instalación-de-git)
   - [Paso 24. Ubicarse en la carpeta Home de Ubuntu](#paso-24-ubicarse-en-la-carpeta-home-de-ubuntu)
   - [Paso 25. Clonar el repositorio del profesor](#paso-25-clonar-el-repositorio-del-profesor)
   - [Paso 26. Entrar al proyecto y desconectarlo del repositorio original](#paso-26-entrar-al-proyecto-y-desconectarlo-del-repositorio-original)
   - [Paso 27. Crear un repositorio propio en GitHub](#paso-27-crear-un-repositorio-propio-en-github)
   - [Paso 28. Copiar la URL del repositorio propio](#paso-28-copiar-la-url-del-repositorio-propio)

> 💡 En GitHub y en la vista previa de Markdown de VS Code, cada título del índice es un enlace que salta directamente a esa sección.

---

## Introducción

Este documento describe paso a paso el proceso seguido para construir el entorno de desarrollo y la base de datos de la Tarea #1 de Bases de Datos II, cuyo objetivo es desarrollar una **API que se comunique con una base de datos en SQL Server** sobre una distribución Linux, utilizando la base de datos **AdventureWorks**.

A lo largo de esta guía se detalla cómo se:

- Instaló y configuró **WSL (Windows Subsystem for Linux)** junto con **Ubuntu**, para contar con un entorno Linux de trabajo directamente desde Windows.
- Instaló **Docker Engine** dentro de Ubuntu y se configuraron los permisos necesarios para utilizarlo sin `sudo`.
- Descargó la imagen oficial de **SQL Server 2022 para Linux** y se creó el contenedor donde se ejecuta el motor de bases de datos.
- Descargó el respaldo (`.bak`) de **AdventureWorks** y se restauró dentro del contenedor de SQL Server.
- Configuró **Visual Studio Code** para conectarse de forma remota a Ubuntu mediante WSL, y se instaló la extensión **MSSQL** para administrar la base de datos gráficamente.
- Preparó el repositorio del proyecto en **Git y GitHub**, a partir de la plantilla proporcionada por el profesor.

El propósito de esta guía es dejar un registro claro y reproducible de cada paso, de manera que el entorno completo pueda levantarse nuevamente desde cero siguiendo la misma secuencia.

---

Para la realización del proyecto se hará uso de **WSL (Windows Subsystem for Linux)**, ya que permite trabajar con un entorno Linux directamente desde Windows sin necesidad de utilizar una máquina virtual tradicional. Esto facilita el acceso a herramientas y comandos propios de Linux, manteniendo al mismo tiempo el sistema operativo Windows como entorno principal.

---

## Instalación y configuración de WSL y Ubuntu

### Paso 1. Abrir PowerShell como administrador

Primero, se debe abrir PowerShell o Terminal de Windows con **permisos de administrador**, ya que estos permisos son necesarios para realizar cambios en el sistema e instalar WSL. Para hacerlo, se debe hacer clic derecho sobre el botón Inicio de Windows y seleccionar "Terminal" o "Windows PowerShell".

En nuestro caso usaremos PowerShell.

> 📌 **Nota:** elegir esta opción entre las alternativas disponibles.

### Paso 2. Instalar WSL por medio de comandos

Una vez abierta la Terminal o PowerShell como administrador, se debe escribir el siguiente comando y presionar Enter:

```powershell
wsl --install
```

Este comando permite instalar automáticamente WSL, junto con los componentes necesarios para ejecutar Linux en Windows. Durante el proceso también se instalará Ubuntu, que será la distribución de Linux utilizada dentro de WSL. Al finalizar la instalación, puede ser necesario reiniciar el equipo para completar la configuración.

### Paso 3. Instalar Ubuntu

Después de completar la instalación inicial de WSL, se vuelve a abrir PowerShell como administrador, en caso de que la ventana anterior se haya cerrado. Luego, se ejecuta el siguiente comando y se presiona Enter:

```powershell
wsl --install -d Ubuntu
```

Después de ejecutar el comando, comenzará la descarga e instalación de Ubuntu. Durante este proceso se puede mostrar el progreso de la instalación en la terminal y el tiempo dependerá de la velocidad de la conexión a Internet y del equipo.

> ⚠️ **Importante:** no se debe cerrar la ventana mientras el proceso esté en ejecución; se debe esperar hasta que la instalación finalice y aparezca un mensaje indicando que se completó correctamente.

### Paso 4. Crear usuario y contraseña de Linux

Una vez finalizada la instalación, Ubuntu solicitará crear un usuario de Linux y una contraseña.

- El nombre de usuario debe escribirse en **minúsculas, sin espacios** y preferiblemente utilizando únicamente letras y números.
- Al escribir la contraseña, **no se mostrará ningún carácter en la pantalla**, ni siquiera asteriscos o puntos. Esto puede dar la impresión de que no se está escribiendo nada, pero sí se está registrando la contraseña.
- Después de escribirla, se presiona Enter y Ubuntu solicitará confirmarla escribiéndola nuevamente de la misma manera.

> 📌 **Nota:** estos datos son independientes de la cuenta de Windows y se utilizarán para acceder y trabajar dentro del entorno Ubuntu. Es importante recordarlos, ya que la contraseña será necesaria para ejecutar comandos que requieran permisos de administrador dentro de Linux.

### Paso 5. Confirmar que WSL y Ubuntu quedaron instalados

Para comprobar que la instalación se realizó correctamente, se abre nuevamente Terminal o PowerShell y se ejecuta:

```powershell
wsl --list --verbose
```

Este comando mostrará las distribuciones de Linux instaladas en WSL y su versión.

En la lista debería aparecer **Ubuntu** y, en la columna **VERSION**, debe indicar **2**, lo que confirma que se está utilizando **WSL 2**. En la columna **STATE** puede aparecer `Running` si Ubuntu está ejecutándose en ese momento, o `Stopped` si está instalada pero actualmente cerrada.

> 📌 **Nota:** elegí Ubuntu porque las características del equipo son suficientes para trabajar cómodamente con WSL 2 y Docker, por lo que su uso no debería representar un problema de rendimiento ni de espacio. Además, es una distribución ampliamente utilizada y cuenta con mucha documentación para trabajar con Docker y contenedores. También existen otras distribuciones como Debian (ligera y fácil de utilizar) y Alpine Linux (consume aún menos recursos, aunque requiere mayor conocimiento técnico).

### Paso 6. Verificar el acceso a Ubuntu

A partir de este momento, para ingresar nuevamente se puede abrir Terminal o PowerShell y escribir `wsl`, o simplemente buscar Ubuntu desde el menú Inicio. Al abrirlo, se accederá directamente al usuario creado anteriormente.

También es posible acceder desde Windows a los archivos de Ubuntu mediante rutas como:

```text
\\wsl$\Ubuntu\home\<usuario>
```

> 📌 **Nota:** `<usuario>` debe reemplazarse por el nombre de usuario real creado en Ubuntu.

### Paso 7. Actualizar Ubuntu

Una vez dentro de Ubuntu, se deben actualizar los paquetes del sistema:

```bash
sudo apt update && sudo apt upgrade -y
```

Este comando primero busca las actualizaciones disponibles y luego las instala automáticamente. La opción `-y` permite confirmar la instalación sin tener que responder manualmente durante el proceso.

---

## Creación del contenedor con Docker

Una vez configurado WSL y actualizado Ubuntu, se procederá a utilizar Docker para crear el contenedor donde se ejecutará la aplicación. El contenedor permitirá tener un entorno aislado con las herramientas, dependencias y configuraciones necesarias para el proyecto, sin necesidad de instalar todos estos componentes directamente en Windows.

### Paso 8. Instalar Docker Engine en Ubuntu

Para instalar Docker Engine directamente dentro del entorno de Ubuntu en WSL, se ejecuta:

```bash
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh
```

Este comando descarga y ejecuta el script oficial de instalación de Docker, permitiendo instalar Docker Engine sin necesidad de utilizar Docker Desktop en Windows.

### Paso 9. Dar permisos al usuario

Después de instalar Docker, se deben configurar los permisos para que el usuario pueda ejecutar comandos de Docker sin usar `sudo` cada vez:

```bash
sudo usermod -aG docker $USER
```

La opción `-aG` indica que se debe agregar el usuario a un grupo sin eliminarlo de los demás grupos a los que ya pertenece.

### Paso 10. Verificar el grupo

Para comprobar que el usuario pertenece correctamente al grupo docker, se ejecuta:

```bash
groups
```

En la lista debe aparecer `docker`, lo que confirma que el usuario tiene los permisos necesarios para utilizar Docker sin escribir `sudo` en cada comando.

### Paso 11. Iniciar Docker

Para iniciar el servicio de Docker dentro de Ubuntu:

```bash
sudo service docker start
```

Una vez ejecutado, se debe esperar a que el comando finalice correctamente antes de continuar con el siguiente paso.

> 📌 **Nota:** el uso de WSL y contenedores permite tener un entorno de desarrollo más práctico y controlado, separado del sistema principal, reduciendo problemas relacionados con configuraciones o dependencias.

---

## Instalación del motor de bases de datos SQL Server en Linux

### Paso 12. Descargar la imagen de SQL Server

Se utilizará una **imagen oficial de Microsoft mediante Docker**. En la terminal de Ubuntu se ejecuta:

```bash
docker pull mcr.microsoft.com/mssql/server:2022-latest
```

Este comando descarga desde el registro de contenedores de Microsoft la imagen oficial de SQL Server 2022 para Linux.

### Paso 13. Crear y ejecutar el contenedor de SQL Server

Para crear y ejecutar el contenedor donde funcionará el motor de bases de datos:

```bash
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=TuPassword123!" -p 1433:1433 --name sqlserver --hostname sqlserver -d mcr.microsoft.com/mssql/server:2022-latest
```

> 📌 **Nota:** `MSSQL_SA_PASSWORD` debe reemplazarse por la contraseña que tú desees colocar. Debe tener como mínimo 8 caracteres e incluir mayúsculas, minúsculas, números y al menos un símbolo.

| Parámetro | Función |
|---|---|
| `docker run` | Crea y ejecuta el contenedor usando la imagen descargada anteriormente. |
| `ACCEPT_EULA=Y` | Acepta los términos de licencia de Microsoft. |
| `MSSQL_SA_PASSWORD` | Establece la contraseña del usuario administrador **sa**. |
| `-p 1433:1433` | Expone el servidor SQL mediante el puerto 1433. |
| `--name sqlserver` | Asigna el nombre `sqlserver` al contenedor. |
| `--hostname sqlserver` | Establece el nombre de host del contenedor. |
| `-d` | Ejecuta el contenedor en segundo plano. |

> ⚠️ **Nota importante:** la contraseña establecida en `MSSQL_SA_PASSWORD` debe guardarse, ya que será necesaria más adelante para **conectarse desde Visual Studio Code** al motor de SQL Server que se encuentra ejecutándose dentro de Ubuntu mediante Docker.

### Paso 14. Verificar que el contenedor esté ejecutándose

```bash
docker ps
```

En la lista debe aparecer una fila correspondiente al contenedor `sqlserver` y, en la columna **STATUS**, un estado similar a `Up`.

Para verificar que el motor funciona, se ingresa al contenedor con sqlcmd y, cuando aparezca el prompt `1>`, se escribe la consulta, se presiona Enter y luego se escribe `GO` en una línea aparte:

```sql
SELECT @@VERSION;
```

```text
GO
```

Si la instalación fue correcta, se mostrará un mensaje similar a:

```text
Microsoft SQL Server 2022
(RTM-CU26-GDR) (KB5122768) - 16.0.4275.2 (X64) Aug 20 2026 00:33:45
Copyright (C) 2022 Microsoft Corporation
Developer Edition (64-bit) on Linux (Ubuntu 22.04.5 LTS) <X64>
(1 rows affected)
1>
```

Para salir del prompt de sqlcmd y regresar a la terminal de Ubuntu:

```bash
exit
```

> 📌 **Nota:** si de esta manera no se puede salir, se puede usar `Ctrl + C`.

---

## Instalación de la base de datos AdventureWorks

### Paso 15. Descargar el backup de AdventureWorks

La base de datos que se instalará es **AdventureWorks**, una base de datos de ejemplo proporcionada por Microsoft y solicitada por el profesor para este trabajo. Para descargar su archivo de respaldo `.bak` directamente en Ubuntu:

```bash
curl -L -o AdventureWorks2022.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2022.bak
```

Este comando descarga el archivo `AdventureWorks2022.bak` en el directorio actual de Ubuntu. Corresponde a la versión completa **OLTP** (Online Transaction Processing) de AdventureWorks.

### Paso 16. Copiar el archivo al contenedor

```bash
docker cp AdventureWorks2022.bak sqlserver:/var/opt/mssql/data/
```

El comando `docker cp` copia archivos entre Ubuntu y un contenedor Docker. Aquí, el archivo se copia dentro del contenedor `sqlserver`, en el directorio donde SQL Server almacena sus archivos de datos.

### Paso 17. Ver los nombres lógicos del backup

Se deben consultar los nombres lógicos de los archivos que contiene el backup, ya que serán necesarios para la restauración:

```bash
docker exec -it sqlserver /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "TuPassword123!" -C
```

> 📌 **Nota:** en `"TuPassword123!"` se debe colocar la contraseña establecida anteriormente para el usuario administrador **sa**.

Una vez dentro de sqlcmd, con el prompt `1>` visible, se ejecuta:

```sql
RESTORE FILELISTONLY FROM DISK = '/var/opt/mssql/data/AdventureWorks2022.bak'
```

```text
GO
```

> 📌 **Nota:** es importante colocar `GO` debajo de la consulta, en una línea separada. `GO` indica a sqlcmd que debe ejecutar el bloque de instrucciones introducido anteriormente.

El comando `RESTORE FILELISTONLY` permite consultar la información de los archivos contenidos en el backup sin restaurar todavía la base de datos. Entre los datos mostrados se encuentran los nombres lógicos de los archivos de datos y de registro, necesarios en el siguiente paso.

### Paso 18. Crear y ejecutar el archivo de restauración

Primero, se sale de sqlcmd y se regresa a la terminal de Ubuntu. Si es necesario, se puede volver a entrar con:

```bash
wsl -d Ubuntu
```

Se crea un archivo llamado **restore.sql** con las instrucciones necesarias para restaurar la base de datos:

```bash
cat > restore.sql << 'EOF'

RESTORE DATABASE AdventureWorks2022

FROM DISK = '/var/opt/mssql/data/AdventureWorks2022.bak'

WITH MOVE 'AdventureWorks2022'
TO '/var/opt/mssql/data/AdventureWorks2022.mdf',

MOVE 'AdventureWorks2022_log'
TO '/var/opt/mssql/data/AdventureWorks2022_log.ldf'

GO

EOF
```

> 📌 **Nota:** se debe pegar todo el bloque completo, desde `cat > restore.sql << 'EOF'` hasta `EOF`, y luego presionar Enter. `MOVE` especifica la ubicación donde SQL Server debe crear los archivos físicos `.mdf` y `.ldf` dentro del contenedor.

Una vez creado el archivo, se copia al contenedor:

```bash
docker cp restore.sql sqlserver:/var/opt/mssql/data/
```

Finalmente, se ejecuta el archivo de restauración mediante sqlcmd utilizando la opción `-i`:

```bash
docker exec -it sqlserver /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "TuPassword123!" -C -i /var/opt/mssql/data/restore.sql
```

La opción `-i` indica que sqlcmd debe utilizar un archivo como entrada. De esta manera, SQL Server ejecutará todas las instrucciones contenidas en `restore.sql` y realizará la restauración de AdventureWorks2022 dentro del contenedor.

---

## Configuración de Visual Studio Code para trabajar con Ubuntu mediante WSL

Después de instalar y restaurar la base de datos en SQL Server, se comenzará a utilizar Visual Studio Code para conectarse y trabajar con la base de datos que se encuentra ejecutándose dentro del contenedor Docker en Ubuntu. Visual Studio Code ya se encuentra instalado en Windows, por lo que no es necesario instalar una segunda versión dentro de Ubuntu; se configurará la instalación existente para trabajar directamente con el entorno Linux mediante WSL.

> 📌 **Nota:** inicialmente se había considerado utilizar Azure Data Studio para la conexión y administración de SQL Server; sin embargo, Microsoft retiró oficialmente Azure Data Studio el 28 de febrero de 2026, por lo que ya no recibe actualizaciones, correcciones de seguridad ni soporte. Microsoft recomienda utilizar Visual Studio Code junto con la extensión MSSQL como alternativa.

> 📌 **Nota:** si Visual Studio Code no estuviera instalado en el equipo, primero se debe descargar e instalar la versión oficial para Windows. No es necesario instalar la versión `.deb` de Visual Studio Code dentro de Ubuntu, ya que se utilizará la instalación de Windows conectada al entorno WSL — Microsoft recomienda precisamente este esquema.

### Paso 19. Abrir Visual Studio Code e instalar la extensión WSL

Como Visual Studio Code ya se encuentra instalado en Windows, se debe abrir normalmente desde el menú Inicio. No es necesario abrirlo desde Ubuntu.

Una vez abierto, se selecciona el icono de **Extensiones** (barra lateral izquierda, cuatro cuadrados), se busca **WSL** y se instala la extensión oficial de Microsoft.

Esta extensión permite conectar Visual Studio Code con la distribución de Ubuntu instalada mediante WSL, de forma que, aunque el programa se ejecute en Windows, pueda trabajar directamente con los archivos, comandos y herramientas del entorno Linux.

> 📌 **Nota:** si al intentar conectar se presenta algún error, se puede reintentar presionando **Ctrl + Shift + P**, escribiendo **WSL: Connect to WSL** y seleccionando esta opción nuevamente. Si el error continúa, se recomienda cerrar Visual Studio Code por completo (con la X de la ventana, no solo la pestaña) y volver a intentarlo desde el menú Inicio.

Durante la primera conexión, es posible que aparezca un mensaje indicando que se está descargando e instalando **VS Code Server** dentro de Ubuntu. Esto puede tardar algunos minutos.

> ⚠️ **Nota importante:** no se debe cerrar Visual Studio Code ni interrumpir el proceso mientras se descarga e instala VS Code Server.

Para comprobar que la conexión se realizó correctamente, se debe observar la esquina inferior izquierda de Visual Studio Code: allí aparecerá la indicación **"WSL: Ubuntu"**, lo que confirma que el programa está trabajando directamente sobre la distribución instalada mediante WSL.

---

## Configuración de SQL Server en Visual Studio Code

### Paso 20. Instalar la extensión MSSQL

Para visualizar y administrar la base de datos de forma gráfica, se instalará la extensión **MSSQL**. Dentro de la ventana de Visual Studio Code ya conectada a WSL: Ubuntu, se selecciona el icono de **Extensiones**, se busca **SQL Server (mssql)** y se instala la extensión oficial de Microsoft.

> 📌 **Nota:** es importante instalar la extensión mientras se está trabajando en la ventana conectada a WSL: Ubuntu, ya que el proyecto se ejecuta dentro de ese entorno.

### Paso 21. Solucionar el error de la extensión MSSQL

Al utilizar por primera vez la extensión MSSQL en Ubuntu mediante WSL, puede presentarse un error relacionado con una librería que necesita el servicio interno de MSSQL para funcionar correctamente en Linux — típicamente **ICU**, utilizada por .NET para funciones de internacionalización.

Para solucionarlo, en la terminal integrada de Visual Studio Code se ejecuta únicamente:

```bash
sudo apt update && sudo apt install -y libicu-dev
```

> 📌 **Nota:** Ubuntu puede solicitar la contraseña del usuario. Mientras se escribe, no aparecerán caracteres en pantalla; esto es normal.

Una vez finalizada la instalación, se debe **recargar** Visual Studio Code: se presiona **Ctrl + Shift + P**, se escribe **Reload Window** y se presiona Enter.

Después de recargar, se abre el panel de MSSQL desde el nuevo icono en la barra lateral izquierda.

### Paso 22. Conectar Visual Studio Code con SQL Server

Al crear una nueva conexión, se completa el formulario de la siguiente manera:

| Campo | Valor |
|---|---|
| Nombre del servidor | `localhost` |
| Puerto | `1433` |
| Certificado de servidor de confianza | ✅ marcar el checkbox |
| Tipo de autenticación | Inicio de sesión de SQL |
| Nombre de usuario | `sa` |
| Contraseña | la misma establecida en `MSSQL_SA_PASSWORD` al crear el contenedor |

> ⚠️ **Nota importante:** la opción **Certificado de servidor de confianza** debe quedar activada; de lo contrario, la conexión puede presentar un error relacionado con el certificado del servidor.

#### Verificar que el contenedor de SQL Server esté ejecutándose

Si la conexión no se establece, primero se comprueba que el contenedor esté activo:

```bash
docker ps
```

Si `sqlserver` no aparece, se revisan también los contenedores detenidos:

```bash
docker ps -a
```

Si aparece con un estado similar a:

```text
Exited (255)
```

no es necesario crear otro contenedor ni reinstalar SQL Server; basta con iniciarlo nuevamente:

```bash
docker start sqlserver
```

Y verificar de nuevo:

```bash
docker ps
```

> 📌 **Nota:** se recomienda esperar de 10 a 15 segundos después de iniciarlo para permitir que SQL Server termine de inicializarse antes de reintentar la conexión.

Cuando la conexión sea exitosa, en el panel de MSSQL aparecerá el servidor conectado, por ejemplo `localhost, <default> (sa)`. Para comprobar la restauración, se expande **Bases de datos → AdventureWorks2022 → Tables**, donde deben visualizarse las tablas de la base de datos.

> 📌 **Nota:** si el icono de MSSQL no aparece de inmediato tras recargar, se debe verificar que la extensión esté instalada correctamente y que la ventana continúe mostrando **WSL: Ubuntu** en la esquina inferior izquierda.

---

## Configuración de Git y preparación del repositorio

Debido a que la entrega del proyecto se realizará mediante GitHub, primero se debe verificar que Git esté instalado dentro de Ubuntu. Posteriormente, se clonará el repositorio plantilla proporcionado por el profesor, se desconectará del repositorio original y se asociará el proyecto con un repositorio propio de GitHub.

### Paso 23. Verificar la instalación de Git

En la terminal integrada de Visual Studio Code (conectada a WSL: Ubuntu):

```bash
git --version
```

> 📌 **Nota:** si aparece un mensaje indicando que git no está instalado, será necesario instalarlo antes de continuar.

### Paso 24. Ubicarse en la carpeta Home de Ubuntu

```bash
cd ~
```

Este comando regresa directamente a la carpeta Home del usuario actual de Ubuntu.

### Paso 25. Clonar el repositorio del profesor

```bash
git clone https://github.com/Bases-de-Datos-2/Proyectos.git adventureworks-api
```

`git clone` descarga una copia del repositorio desde GitHub; `adventureworks-api` indica el nombre de la carpeta donde se almacenará la copia descargada.

### Paso 26. Entrar al proyecto y desconectarlo del repositorio original

```bash
cd adventureworks-api
git remote remove origin
```

Esto es importante porque el proyecto debe quedar asociado posteriormente al repositorio propio del estudiante. Al eliminar `origin`, se evita que futuros comandos `git push` intenten enviar los cambios al repositorio original del profesor.

### Paso 27. Crear un repositorio propio en GitHub

Desde el navegador web, con la cuenta personal de GitHub:

1. Seleccionar el símbolo **+** en la esquina superior derecha.
2. Seleccionar **New repository**.
3. Escribir el nombre del repositorio, por ejemplo: `adventureworks-api`.
4. Seleccionar **Public**, si así lo requiere la entrega.
5. No seleccionar las opciones para agregar README, `.gitignore` ni License.
6. Seleccionar **Create repository**.

> 📌 **Nota:** se recomienda crear el repositorio completamente vacío, ya que el proyecto ya contiene los archivos obtenidos del repositorio plantilla.

### Paso 28. Copiar la URL del repositorio propio

Después de crear el repositorio, GitHub mostrará una dirección similar a:

```text
https://github.com/TU-USUARIO/adventureworks-api.git
```

> 📌 **Nota:** `TU-USUARIO` es solo un ejemplo; se debe usar el nombre de usuario real de la cuenta de GitHub.

De regreso en la terminal de Visual Studio Code, dentro de la carpeta `adventureworks-api`, se agrega el repositorio personal como nuevo origen:

```bash
git remote add origin https://github.com/TU-USUARIO/adventureworks-api.git
```

Por último, se prepara la rama principal y se sube el contenido:

```bash
git branch -M main
git push -u origin main
```

El primer comando establece `main` como nombre de la rama principal. El segundo envía los archivos del proyecto al repositorio personal de GitHub y establece la conexión entre la rama local y la rama remota.

Una vez finalizado el proceso, se puede ingresar al repositorio desde el navegador y comprobar que los archivos del proyecto se encuentren disponibles.

---

## Creación y configuración de Stored Procedures para el CRUD

### Paso 29. Creación de Stored Procedures para el CRUD

En este paso se crean los Stored Procedures dentro de la base de datos AdventureWorks2022. Un **Stored Procedure** es un conjunto de instrucciones SQL que se guarda directamente en SQL Server y que posteriormente puede ejecutarse mediante un nombre. En este proyecto se utilizan para realizar las operaciones del **CRUD** (insertar, consultar, actualizar y eliminar información), de manera que la API desarrollada con Node.js pueda comunicarse con SQL Server y ejecutar estos procedimientos.

Primero se utiliza `USE AdventureWorks2022;` para indicar que todos los procedimientos creados a continuación pertenecen a esta base de datos, y `GO` para separar los bloques de instrucciones que serán ejecutados por SQL Server Management Studio.

#### `sp_InsertarDepartamento` — Inserción

Recibe dos parámetros: el nombre del departamento y el grupo al que pertenece. Antes de insertar la información se realizan validaciones utilizando `IF`, `IS NULL` y `EXISTS`, para comprobar que los datos obligatorios hayan sido proporcionados y que no exista otro departamento con el mismo nombre. Si todo es correcto, se utiliza `INSERT INTO` para registrar el nuevo departamento en la tabla `HumanResources.Department`.

#### `sp_ActualizarCantidadInventarioUbicacion` — Actualización

Recibe el identificador del producto, el identificador de la ubicación y la nueva cantidad disponible. Utiliza `NOT EXISTS` para comprobar que el producto realmente exista en esa ubicación y valida que la nueva cantidad no sea negativa. Después utiliza `UPDATE` para modificar la cantidad en la tabla `Production.ProductInventory`, y `GETDATE()` para actualizar la fecha de modificación del registro.

#### `sp_EliminarDepartamento` — Eliminación

Recibe el nombre del departamento. Primero comprueba mediante `NOT EXISTS` que el departamento exista. Después utiliza un `INNER JOIN` entre `EmployeeDepartmentHistory` y `Department` para verificar si existen registros relacionados con empleados. Si el departamento tiene información asociada, la eliminación se detiene mediante `RETURN`; si no existen registros relacionados, se utiliza `DELETE`. Esta validación evita eliminar información que todavía está relacionada con otros registros.

#### `sp_ConsultarWorkOrder` — Consulta

Utiliza un `INNER JOIN` entre `Production.WorkOrder` y `Production.Product` para relacionar las órdenes de trabajo con sus productos. Se utiliza `SUM` para calcular cantidades solicitadas, almacenadas y rechazadas, `GROUP BY ROLLUP` para generar un total general, y `GROUPING` junto con `CASE` para mostrar el texto "TOTAL GENERAL" en la fila correspondiente. `ORDER BY` organiza los resultados.

#### `sp_BuscarClientesPorTerritorio` — Consulta

Recibe el identificador de un territorio y busca los clientes correspondientes en `Sales.Customer`. Utiliza `WHERE` para filtrar el territorio indicado, `COUNT(DISTINCT CustomerID)` para contar los clientes diferentes y `GROUP BY` para agrupar el resultado por territorio.

#### `sp_BuscarPersonasPorTipo` — Consulta

Utiliza dos `INNER JOIN` para relacionar `Person.Person` con `Person.EmailAddress` y `Person.PersonPhone`. Recibe como parámetro el tipo de persona a buscar y usa `CASE` para convertir los códigos almacenados (`EM`, `SC`, `SP`) en descripciones legibles ("empleado", "contacto de tienda", "vendedor"). También utiliza `CONCAT` para construir el nombre completo e `ISNULL` para controlar los casos sin segundo nombre. `WHERE` filtra según el tipo solicitado.

> 📌 **Nota:** una vez creados los procedimientos, se utiliza `EXEC` para ejecutarlos y comprobar que funcionan correctamente (por ejemplo, `EXEC sp_InsertarDepartamento`). También se puede usar `sp_helptext` para visualizar el código de un Stored Procedure, y la vista del sistema `sys.procedures` para confirmar que fueron creados correctamente.

---

## Instalación y configuración de Node.js en WSL Ubuntu mediante NVM

### Paso 30. Instalar NVM en WSL Ubuntu

Para ejecutar la API se necesita Node.js. Se utilizará **nvm** (Node Version Manager), una herramienta que permite instalar y administrar diferentes versiones de Node.js fácilmente.

Se abre la terminal de Ubuntu en WSL desde Visual Studio Code (debería mostrar una ruta similar a `/home/tu_usuario`) y se instala nvm:

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

Este comando descarga y ejecuta el instalador de nvm desde su repositorio oficial.

### Paso 31. Activar NVM en la terminal

Después de instalar nvm, es necesario recargar la configuración de la terminal para que el comando `nvm` pueda utilizarse:

```bash
source ~/.bashrc
```

El archivo `.bashrc` contiene configuraciones que se cargan al iniciar una sesión de Bash; `source` aplica esos cambios inmediatamente, sin tener que cerrar y volver a abrir la terminal.

Para comprobar que nvm está disponible:

```bash
nvm --version
```

Si la instalación fue correcta, aparecerá un número de versión (por ejemplo, `0.40.1`).

### Paso 32. Instalar Node.js en su versión LTS

Se instalará la versión **LTS** (Long Term Support), por ser una versión estable y recomendada para proyectos que necesitan confiabilidad:

```bash
nvm install --lts
```

nvm buscará automáticamente la versión LTS disponible y la instalará. No es necesario especificar ninguna versión, ya que `--lts` hace que nvm la seleccione automáticamente.

### Paso 33. Seleccionar la versión LTS de Node.js

```bash
nvm use --lts
```

Debería aparecer un mensaje parecido a `Now using node v22.x.x` (el número exacto puede variar según la versión LTS disponible). Esto indica que esa versión de Node.js quedó activa en la terminal actual.

### Paso 34. Verificar que Node.js quedó instalado

```bash
node -v
npm -v
```

El primer comando muestra la versión instalada de Node.js (por ejemplo, `v22.x.x`); el segundo muestra la versión de npm, el administrador de paquetes de Node.js (por ejemplo, `10.x.x`). Si ambos comandos muestran una versión, la instalación fue exitosa.

### Paso 35. Inicializar el proyecto

Antes de inicializar el proyecto, se verifica que la terminal se encuentre ubicada dentro de la carpeta `adventureworks-api`:

```bash
pwd
ls
```

`pwd` muestra la ruta actual (debe corresponder a algo como `/home/usuario/adventureworks-api`) y `ls` permite visualizar los archivos y carpetas existentes.

Una vez confirmada la ubicación, se inicializa el proyecto de Node.js:

```bash
npm init -y
```

Este comando crea el archivo `package.json`, donde se almacena la información del proyecto y se registran las librerías utilizadas posteriormente por la API. La opción `-y` acepta automáticamente la configuración predeterminada, sin preguntas manuales.

Al finalizar, se puede volver a usar `ls` para comprobar que se creó el archivo `package.json`.

> 📌 **Nota:** si aparece un mensaje indicando que `npm` no es reconocido, se debe comprobar que Node.js esté disponible en la terminal. Si se utilizó nvm, puede ser necesario ejecutar `nvm use --lts` antes de volver a intentarlo.

### Paso 36. Instalar las librerías necesarias

Se instalan las dependencias que permitirán construir y ejecutar la API:

```bash
npm install express mssql dotenv cors
```

| Librería | Función |
|---|---|
| `express` | Crea el servidor web de la API y define sus rutas (GET, POST, PUT, DELETE). |
| `mssql` | Establece la comunicación entre Node.js y SQL Server, y permite ejecutar los Stored Procedures. |
| `dotenv` | Administra información de configuración mediante variables de entorno (`.env`), manteniendo datos sensibles fuera del código. |
| `cors` | Controla las solicitudes realizadas desde diferentes orígenes (por ejemplo, Postman o un frontend). |

Durante la instalación, npm descarga las librerías dentro de `node_modules` y actualiza automáticamente `package.json`.

> 📌 **Nota:** el proceso puede tardar algunos minutos según la conexión a Internet. No se recomienda cerrar la terminal mientras npm está instalando.

### Paso 37. Instalar Nodemon

Se instala **Nodemon** como herramienta de desarrollo, para que el servidor se reinicie automáticamente al modificar archivos del proyecto:

```bash
npm install --save-dev nodemon
```

La opción `--save-dev` registra Nodemon como dependencia de desarrollo; aparecerá dentro de la sección `devDependencies` de `package.json`.

> 📌 **Nota:** Nodemon no es necesario para que la API funcione en sí misma, pero facilita considerablemente el desarrollo al reiniciar el servidor automáticamente.

### Paso 38. Verificar el archivo package.json

```bash
cat package.json
```

Dentro del archivo debe aparecer una sección `dependencies` con las librerías principales:

```json
"dependencies": {
  "cors": "^2.x.x",
  "dotenv": "^16.x.x",
  "express": "^4.x.x",
  "mssql": "^11.x.x"
}
```

Y una sección `devDependencies` con Nodemon:

```json
"devDependencies": {
  "nodemon": "^..."
}
```

> 📌 **Nota:** los números de versión pueden variar; lo importante es que `express`, `mssql`, `dotenv` y `cors` aparezcan en `dependencies`, y `nodemon` en `devDependencies`.

### Paso 39. Comprobar las dependencias instaladas

```bash
npm list --depth=0
```

Muestra las principales dependencias instaladas sin desglosar las dependencias internas de cada librería. El resultado debe incluir `express`, `mssql`, `dotenv`, `cors` y `nodemon`. Si alguna no aparece, se recomienda revisar nuevamente la instalación.

### Paso 40. Verificar Node.js y npm

```bash
node -v
npm -v
```

Ambos comandos deben mostrar un número de versión (por ejemplo, Node.js `v24.x.x` y npm `11.x.x`). Si ambos responden correctamente y las dependencias están instaladas, el entorno está listo para continuar con el desarrollo de la API.

> 📌 **Nota sobre errores:** los mensajes `npm WARN` son advertencias y no necesariamente indican que el proceso falló. Los mensajes `npm ERR!` sí indican un error que debe revisarse antes de continuar.

---

## Configuración de los archivos de la API

### Paso 41. Crear y configurar el archivo .env

Se crea un archivo `.env` en la carpeta principal del proyecto `adventureworks-api`, con las variables necesarias para conectarse a SQL Server:

```env
DB_USER=SA
DB_PASSWORD=TuPassword123!
DB_SERVER=localhost
DB_DATABASE=AdventureWorks2022
DB_PORT=1433
PORT=3000
```

| Variable | Descripción |
|---|---|
| `DB_USER` | Usuario utilizado para conectarse a SQL Server. |
| `DB_PASSWORD` | Contraseña real configurada para el usuario `SA`. |
| `DB_SERVER` | Servidor donde se encuentra SQL Server (`localhost` en este proyecto). |
| `DB_DATABASE` | Nombre de la base de datos (`AdventureWorks2022`). |
| `DB_PORT` | Puerto utilizado para la conexión (`1433`). |
| `PORT` | Puerto donde Express iniciará la API (`3000`). |

> ⚠️ **Nota importante:** el archivo `.env` contiene información sensible, especialmente la contraseña de la base de datos. Por esta razón, **no se debe publicar en GitHub** — se recomienda incluirlo en `.gitignore`.

### Paso 42. Crear el archivo .gitignore

Se crea un archivo `.gitignore` en la carpeta principal del proyecto:

```text
node_modules/
.env
```

`node_modules` contiene todas las librerías descargadas por npm y puede ocupar mucho espacio; no es necesario subirla porque las dependencias se pueden reinstalar desde `package.json`. `.env` debe ignorarse porque contiene contraseñas y otros datos que no deben publicarse.

> 📌 **Nota:** el archivo `package-lock.json` sí debe conservarse en el repositorio, ya que registra las versiones específicas de las dependencias instaladas.

---

## Configuración del servidor

### Paso 43. Crear el archivo server.js

Se crea el archivo principal de la aplicación dentro de la carpeta `src`, llamado `server.js`. Es el punto de entrada de la API: inicia Express, carga las variables de `.env`, habilita JSON, configura CORS y registra las rutas disponibles.

```javascript
require('dotenv').config();
const express = require('express');
const cors = require('cors');

const departamentosRoutes = require('./routes/departamentos');
const app = express();
const PORT = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());

// Todas las rutas del CRUD viven bajo /api
app.use('/api', departamentosRoutes);

// Ruta de salud, para comprobar rápido que el servidor está vivo
app.get('/', (req, res) => {
  res.json({
    mensaje: 'API AdventureWorks corriendo correctamente.'
  });
});

app.listen(PORT, () => {
  console.log(`Servidor escuchando en http://localhost:${PORT}`);
});
```

- `require('dotenv').config()` permite que la aplicación lea las variables de `.env` (por ejemplo, el puerto mediante `process.env.PORT`).
- `express.json()` permite que Express interprete los datos enviados en formato JSON, necesario para operaciones como registrar departamentos o actualizar inventario.
- `app.use('/api', departamentosRoutes)` registra las rutas bajo el prefijo `/api` (por ejemplo, `/departamentos` se vuelve `/api/departamentos`).
- La ruta `/` funciona como **ruta de salud**, para comprobar rápidamente que el servidor está activo.
- `app.listen()` inicia el servidor en el puerto configurado; al ejecutarse correctamente, la terminal mostrará `Servidor escuchando en http://localhost:3000`.

### Paso 44. Crear el archivo de conexión db.js

Se crea el archivo `db.js` dentro de `src`, responsable de establecer la conexión entre Node.js y SQL Server usando la librería `mssql` y las variables de entorno:

```javascript
require('dotenv').config();
const sql = require('mssql');

const config = {
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  server: process.env.DB_SERVER,
  database: process.env.DB_DATABASE,
  port: Number(process.env.DB_PORT) || 1433,
  options: {
    encrypt: false,
    trustServerCertificate: true,
  },
  pool: {
    max: 10,
    min: 0,
    idleTimeoutMillis: 30000,
  },
};

let poolPromise;

function getPool() {
  if (!poolPromise) {
    poolPromise = new sql.ConnectionPool(config)
      .connect()
      .then((pool) => {
        console.log('Conectado a SQL Server');
        return pool;
      })
      .catch((err) => {
        console.error('Error al conectar a SQL Server:', err.message);
        poolPromise = null;
        throw err;
      });
  }
  return poolPromise;
}

module.exports = { sql, getPool };
```

La función `getPool()` crea un grupo de conexiones mediante `sql.ConnectionPool`; cuando la conexión se establece correctamente, se muestra el mensaje `Conectado a SQL Server`. El uso de `poolPromise` permite reutilizar la conexión en lugar de crear una nueva para cada solicitud.

> 📌 **Nota:** si los datos de `.env` son incorrectos (usuario, contraseña, servidor o nombre de base de datos), la conexión fallará y se mostrará un mensaje de error en la terminal.

---

## Creación de las rutas

### Paso 45. Crear el archivo departamentos.js

Se crea la carpeta `routes` dentro de `src`, y dentro de ella el archivo `departamentos.js`, con la siguiente estructura:

```text
src/
├── server.js
├── db.js
└── routes/
    └── departamentos.js
```

El archivo comienza importando Express y las funciones necesarias para conectarse con SQL Server:

```javascript
const express = require('express');
const router = express.Router();
const { sql, getPool } = require('../db');
```

### Paso 46. Implementar la operación INSERT

**`POST /api/departamentos`** — registra un nuevo departamento.

```javascript
router.post('/departamentos', async (req, res) => {
  const { nombre, grupo } = req.body;

  if (!nombre || !grupo) {
    return res.status(400).json({
      error: 'nombre y grupo son obligatorios.'
    });
  }

  try {
    const pool = await getPool();
    const result = await pool
      .request()
      .input('Nombre', sql.NVarChar(40), nombre)
      .input('Grupo', sql.NVarChar(40), grupo)
      .execute('sp_InsertarDepartamento');

    res.status(201).json({
      mensaje: 'Departamento registrado correctamente.',
      info: result.returnValue,
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});
```

La ruta recibe `nombre` y `grupo` mediante `req.body`, valida que ambos hayan sido proporcionados, los envía a SQL Server mediante `.input()` (indicando el nombre y el tipo de dato), y finalmente ejecuta el Stored Procedure con `.execute('sp_InsertarDepartamento')`.

### Paso 47. Implementar la operación UPDATE

**`PUT /api/inventario`** — actualiza la cantidad de inventario de un producto en una ubicación.

Cuerpo esperado:

```json
{
  "productId": 1,
  "locationId": 1,
  "nuevaCantidad": 100
}
```

```javascript
router.put('/inventario', async (req, res) => {
  const { productId, locationId, nuevaCantidad } = req.body;

  if (productId == null || locationId == null || nuevaCantidad == null) {
    return res.status(400).json({
      error: 'productId, locationId y nuevaCantidad son obligatorios.'
    });
  }

  try {
    const pool = await getPool();
    await pool
      .request()
      .input('ProductID', sql.Int, productId)
      .input('LocationID', sql.SmallInt, locationId)
      .input('NuevaCantidad', sql.SmallInt, nuevaCantidad)
      .execute('sp_ActualizarCantidadInventarioUbicacion');

    res.json({ mensaje: 'Cantidad actualizada correctamente.' });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});
```

> 📌 **Nota:** durante las pruebas se presentó el error `Could not find stored procedure 'dbo.sp_ActualizarCantidadInventario'`, porque inicialmente se utilizó un nombre distinto al del procedimiento almacenado real. El nombre correcto es `sp_ActualizarCantidadInventarioUbicacion`. Los nombres utilizados en `.execute()` deben coincidir exactamente con los Stored Procedures existentes en SQL Server.

### Paso 48. Implementar la operación DELETE

**`DELETE /api/departamentos/:nombre`** — elimina un departamento.

```javascript
router.delete('/departamentos/:nombre', async (req, res) => {
  const { nombre } = req.params;

  try {
    const pool = await getPool();
    await pool
      .request()
      .input('nombre', sql.NVarChar(50), nombre)
      .execute('sp_eliminardepartamento');

    res.json({
      mensaje: 'Departamento eliminado correctamente (si existia y no tenia dependencias).'
    });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});
```

El nombre del departamento se recibe directamente desde la URL mediante `req.params` (por ejemplo, `DELETE /api/departamentos/Marketing`) y se envía al procedimiento `sp_eliminardepartamento`. La eliminación dependerá de las relaciones existentes: si hay registros que dependen del departamento, SQL Server puede impedirla.

### Paso 49. Implementar la consulta de clientes por territorio

**`GET /api/clientes/territorio/:territoryId`**

```javascript
router.get('/clientes/territorio/:territoryId', async (req, res) => {
  const { territoryId } = req.params;

  try {
    const pool = await getPool();
    const result = await pool
      .request()
      .input('territoryid', sql.Int, territoryId)
      .execute('sp_buscarclientesporterritorio');

    res.json(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});
```

El identificador del territorio se obtiene desde la URL y se envía al procedimiento `sp_buscarclientesporterritorio`. Los datos obtenidos se encuentran en `result.recordset`, que se devuelve al usuario en formato JSON. Por ejemplo, `GET /api/clientes/territorio/1` puede producir:

```json
[
  {
    "territorio": 1,
    "cantidad_de_clientes": 3520
  }
]
```

### Paso 50. Implementar la consulta de personas por tipo

**`GET /api/personas/tipo/:tipoPersona`** (por ejemplo, `GET /api/personas/tipo/empleado`)

```javascript
router.get('/personas/tipo/:tipoPersona', async (req, res) => {
  const { tipoPersona } = req.params;

  try {
    const pool = await getPool();
    const result = await pool
      .request()
      .input('tipopersona', sql.VarChar(30), tipoPersona)
      .execute('sp_buscarpersonasportipo');

    res.json(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});
```

El parámetro `tipoPersona` se obtiene de la URL y se envía al Stored Procedure `sp_buscarpersonasportipo`, demostrando cómo la API recibe parámetros desde la dirección HTTP para consultar la base de datos.

### Paso 51. Implementar el reporte de Work Order

**`GET /api/workorder/reporte`**

```javascript
router.get('/workorder/reporte', async (req, res) => {
  try {
    const pool = await getPool();
    const result = await pool.request().execute('sp_consultarworkorder');
    res.json(result.recordset);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: err.message });
  }
});
```

Esta ruta no necesita parámetros: obtiene una conexión con SQL Server, ejecuta `sp_consultarworkorder` (que utiliza `JOIN` y `ROLLUP`) y devuelve el resultado.

### Paso 52. Exportar las rutas

Al final de `departamentos.js`:

```javascript
module.exports = router;
```

Esto permite que `server.js` importe todas las rutas mediante:

```javascript
const departamentosRoutes = require('./routes/departamentos');
```

y las registre con `app.use('/api', departamentosRoutes)`. De esta manera, `server.js` se encarga de iniciar la aplicación, y `departamentos.js` administra las diferentes operaciones de la API.

---

## Configuración de los Stored Procedures (ejecución en el servidor)

### Paso 53. Verificar el archivo de Stored Procedures

Antes de ejecutar la API, se verifica que el archivo SQL con los procedimientos almacenados esté disponible dentro del proyecto:

```bash
cat "Script sql/StroreProcedures.sql"
```

> 📌 **Nota:** se debe utilizar exactamente el nombre real del archivo. Linux diferencia entre mayúsculas y minúsculas, así que el nombre debe coincidir con precisión (por ejemplo, `StroreProcedures.sql` o `StoreProcedures.sql`, según corresponda).

### Paso 54. Ejecutar los Stored Procedures en SQL Server

```bash
sqlcmd -S localhost -U SA -P 'TuPassword123!' -C -i "Script sql/StroreProcedures.sql"
```

| Opción | Función |
|---|---|
| `-S localhost` | Servidor SQL al que se desea conectar. |
| `-U SA` | Usuario de SQL Server. |
| `-P` | Contraseña correspondiente (reemplazar `TuPassword123!` por la real). |
| `-C` | Confía en el certificado del servidor. |
| `-i` | Archivo de entrada con las instrucciones SQL a ejecutar. |

Al finalizar correctamente, los Stored Procedures quedarán disponibles en la base de datos para que la API pueda ejecutarlos.

> ⚠️ **Nota de seguridad:** la contraseña utilizada en un comando de este tipo puede quedar registrada en el historial de la terminal. Para un entorno real, se recomienda utilizar mecanismos de autenticación y configuración más seguros.

---

## Inicio y prueba de la API

### Paso 55. Iniciar el servidor

Desde la carpeta principal del proyecto:

```bash
npm run dev
```

Este comando utiliza el script configurado en `package.json` para iniciar la aplicación con Nodemon. Si todo está correctamente configurado, deberían aparecer mensajes similares a:

```text
Servidor escuchando en http://localhost:3000
Conectado a SQL Server
```

Nodemon permanecerá ejecutándose, observando los archivos del proyecto para reiniciar el servidor automáticamente ante cualquier cambio.

> 📌 **Nota:** la terminal donde se ejecuta el servidor debe mantenerse abierta.

### Paso 56. Abrir una segunda terminal para realizar las pruebas

Mientras el servidor continúa funcionando en la primera terminal (`npm run dev`), se abre una segunda terminal de Ubuntu en Visual Studio Code, que se utilizará para enviar solicitudes a la API mediante `curl` sin detener el servidor.

### Paso 57. Probar la ruta principal de la API

```bash
curl http://localhost:3000/
```

Respuesta esperada:

```json
{
  "mensaje": "API AdventureWorks corriendo correctamente."
}
```

Si aparece este mensaje, el servidor está activo y puede recibir solicitudes HTTP.

### Paso 58. Probar la consulta de clientes por territorio

```bash
curl http://localhost:3000/api/clientes/territorio/1
```

Respuesta esperada (el valor puede variar según los datos existentes):

```json
[
  {
    "territorio": 1,
    "cantidad_de_clientes": 3520
  }
]
```

Esta prueba verifica Express, la conexión con SQL Server, el envío del parámetro y la ejecución del Stored Procedure.

### Paso 59. Probar la actualización del inventario

```bash
curl -X PUT http://localhost:3000/api/inventario \
  -H "Content-Type: application/json" \
  -d '{"productId":1,"locationId":1,"nuevaCantidad":100}'
```

Respuesta esperada:

```json
{
  "mensaje": "Cantidad actualizada correctamente."
}
```

Confirma que la solicitud llegó a Express, que la API se conectó con SQL Server, que el Stored Procedure fue encontrado y que la operación se ejecutó correctamente.

### Paso 60. Probar la operación DELETE

```bash
curl -X DELETE http://localhost:3000/api/departamentos/Marketing
```

Respuesta esperada:

```json
{
  "mensaje": "Departamento eliminado correctamente (si existia y no tenia dependencias)."
}
```

> 📌 **Nota:** si el departamento posee dependencias que impiden su eliminación, SQL Server puede devolver un error. Esto no significa que la API esté mal configurada, sino que la base de datos está protegiendo la integridad de sus relaciones.

### Paso 61. Verificación final del funcionamiento

Se verifica que las principales funcionalidades respondan correctamente: la ruta principal confirma que Express está activo; la consulta de clientes por territorio verifica la comunicación con SQL Server; la operación PUT comprueba la actualización del inventario; y la operación DELETE comprueba la eliminación de un departamento.

En este punto, la estructura general del proyecto debe quedar organizada así:

```text
adventureworks-api/
│
├── src/
│   ├── server.js
│   ├── db.js
│   │
│   └── routes/
│       └── departamentos.js
│
├── Script sql/
│   └── StroreProcedures.sql
│
├── node_modules/
│
├── .gitignore
├── package.json
└── package-lock.json
```

| Archivo / carpeta | Función |
|---|---|
| `server.js` | Inicia la API y registra las rutas. |
| `db.js` | Administra la conexión con SQL Server. |
| `routes/departamentos.js` | Contiene las operaciones HTTP y ejecuta los Stored Procedures. |
| `Script sql/` | Contiene los procedimientos almacenados utilizados por la aplicación. |
| `package.json` | Registra las dependencias del proyecto. |

### Paso 62. Datos de prueba para validar la API

Antes de las pruebas finales con Postman, estos son los datos utilizados para comprobar el funcionamiento de los distintos endpoints:

**Insertar un departamento**

```http
POST http://localhost:3000/api/departamentos
```

```json
{
  "nombre": "Marketing",
  "grupo": "Administracion"
}
```

**Actualizar el inventario**

```http
PUT http://localhost:3000/api/inventario
```

```json
{
  "productId": 1,
  "locationId": 1,
  "nuevaCantidad": 100
}
```

**Consultar clientes por territorio**

```http
GET http://localhost:3000/api/clientes/territorio/1
```

**Consultar personas por tipo**

```http
GET http://localhost:3000/api/personas/tipo/empleado
```

**Reporte de órdenes de trabajo** (no requiere datos en el cuerpo)

```http
GET http://localhost:3000/api/workorder/reporte
```

**Eliminar el departamento registrado**

```http
DELETE http://localhost:3000/api/departamentos/Marketing
```

> 📌 **Nota:** estos datos se utilizan tanto desde la terminal (`curl`) como desde Postman. Los resultados de las consultas pueden variar según los registros existentes en AdventureWorks2022.

---

## Instalación y uso de Postman

### Paso 63. Descargar e instalar Postman en Windows

Como último paso del proyecto se instala **Postman**, una aplicación que permite probar APIs de forma visual y organizada. Postman se instala directamente en Windows, aunque la API se ejecute dentro de WSL Ubuntu — esto no representa un problema, ya que Postman puede enviar solicitudes HTTP hacia el servidor donde está corriendo la API.

Se descarga desde el [sitio oficial de Postman](https://www.postman.com/downloads/), se ejecuta el instalador en Windows y se siguen las instrucciones en pantalla.

> 📌 **Nota:** no es necesario instalar Postman dentro de Ubuntu. Postman se utiliza en Windows, mientras Node.js, la API y el resto del proyecto continúan ejecutándose en WSL Ubuntu.

### Paso 64. Comprender cómo se comunica Postman con la API

Postman no reemplaza a Node.js, Express ni SQL Server: funciona como cliente que envía solicitudes HTTP a la API y muestra las respuestas de forma visual.

```text
                         WINDOWS
┌───────────────────────────────────────────┐
│                  POSTMAN                  │
│          GET / POST / PUT / DELETE        │
└─────────────────────┬─────────────────────┘
                      │ Solicitud HTTP
                      ▼
              http://localhost:3000
                       │
                       ▼
┌───────────────────────────────────────────┐
│                WSL UBUNTU                 │
│              Node.js + Express            │
│                     │                     │
│                     ▼                     │
│                 SQL Server                │
│                     │                     │
│                     ▼                     │
│             Stored Procedures             │
└─────────────────────┬─────────────────────┘
                      │ Respuesta JSON
                      ▼
                   POSTMAN
```

Cuando desde Postman se realiza una solicitud, esta llega al servidor Node.js en WSL; Express identifica la ruta, ejecuta el código correspondiente y, cuando es necesario, se comunica con SQL Server. La API devuelve una respuesta (normalmente JSON) y Postman la muestra en pantalla.

> ⚠️ **Nota importante:** antes de usar Postman, la API debe estar ejecutándose (`npm run dev`), mostrando `Servidor escuchando en http://localhost:3000` y `Conectado a SQL Server`.

### Paso 65. Abrir Postman y realizar la primera prueba

Se crea una nueva solicitud:

| Campo | Valor |
|---|---|
| Método | `GET` |
| URL | `http://localhost:3000/` |

Al presionar **Send**, la respuesta esperada es:

```json
{
  "mensaje": "API AdventureWorks corriendo correctamente."
}
```

Esto confirma que el servidor Node.js está activo y que Postman puede comunicarse con la API.

### Paso 66. Probar una consulta GET con Postman

| Campo | Valor |
|---|---|
| Método | `GET` |
| URL | `http://localhost:3000/api/clientes/territorio/1` |

Respuesta esperada:

```json
[
  {
    "territorio": 1,
    "cantidad_de_clientes": 3520
  }
]
```

Esta prueba comprueba el recorrido completo: Postman envía el GET, Express recibe la solicitud, obtiene el parámetro `territoryId`, Node.js se comunica con SQL Server, se ejecuta el Stored Procedure y la información regresa a Postman.

### Paso 67. Probar una solicitud POST con Postman

| Campo | Valor |
|---|---|
| Método | `POST` |
| URL | `http://localhost:3000/api/departamentos` |
| Body | `raw` → `JSON` |

Cuerpo de la solicitud:

```json
{
  "nombre": "Marketing",
  "grupo": "Administracion"
}
```

La API recibe estos datos mediante `req.body`, valida la información y ejecuta `sp_InsertarDepartamento`. Respuesta esperada:

```json
{
  "mensaje": "Departamento registrado correctamente.",
  "info": 0
}
```

> 📌 **Nota:** el valor de `info` depende del valor de retorno proporcionado por el procedimiento almacenado.

### Paso 68. Probar una solicitud PUT con Postman

| Campo | Valor |
|---|---|
| Método | `PUT` |
| URL | `http://localhost:3000/api/inventario` |
| Body | `raw` → `JSON` |

```json
{
  "productId": 1,
  "locationId": 1,
  "nuevaCantidad": 100
}
```

Respuesta esperada:

```json
{
  "mensaje": "Cantidad actualizada correctamente."
}
```

Esta prueba permite comprobar visualmente la operación UPDATE que anteriormente se realizaba mediante `curl`.

### Paso 69. Probar una solicitud DELETE con Postman

| Campo | Valor |
|---|---|
| Método | `DELETE` |
| URL | `http://localhost:3000/api/departamentos/Marketing` |

No es necesario colocar información en Body, ya que el nombre del departamento se encuentra en la URL. Express lo recibe mediante `req.params.nombre` y ejecuta `sp_eliminardepartamento`. Respuesta esperada:

```json
{
  "mensaje": "Departamento eliminado correctamente (si existia y no tenia dependencias)."
}
```

> 📌 **Nota:** si existen dependencias en la base de datos que impiden eliminar el departamento, SQL Server puede devolver un error, dependiendo de las relaciones y restricciones existentes.

### Paso 70. Probar las demás consultas de la API

| Consulta | Método | URL |
|---|---|---|
| Personas por tipo | `GET` | `http://localhost:3000/api/personas/tipo/empleado` |
| Reporte de Work Order | `GET` | `http://localhost:3000/api/workorder/reporte` |

En ambos casos se selecciona el método GET, se coloca la dirección correspondiente y se presiona Send; Postman mostrará los resultados en formato JSON.

### Paso 71. Organizar las pruebas en una colección de Postman

Las solicitudes pueden guardarse y organizarse dentro de una **Collection**, por ejemplo `AdventureWorks API`:

```text
AdventureWorks API
│
├── GET  - API funcionando
├── GET  - Clientes por territorio
├── GET  - Personas por tipo
├── GET  - Reporte Work Order
├── POST - Insertar departamento
├── PUT  - Actualizar inventario
└── DELETE - Eliminar departamento
```

De esta manera, cada operación queda almacenada y puede ejecutarse nuevamente presionando Send, sin escribir de nuevo los comandos, y Postman permite visualizar claramente el método, la dirección, los parámetros, el cuerpo JSON enviado y la respuesta generada.

### Paso 72. Verificación final utilizando Postman

Como comprobación final, se repiten desde Postman las pruebas principales mientras la API continúa ejecutándose en WSL Ubuntu:

| # | Operación | Método | URL / Body |
|---|---|---|---|
| 1 | Servidor activo | `GET` | `http://localhost:3000/` |
| 2 | Clientes por territorio | `GET` | `http://localhost:3000/api/clientes/territorio/1` |
| 3 | Insertar departamento | `POST` | `http://localhost:3000/api/departamentos` — `{"nombre":"Marketing","grupo":"Administracion"}` |
| 4 | Actualizar inventario | `PUT` | `http://localhost:3000/api/inventario` — `{"productId":1,"locationId":1,"nuevaCantidad":100}` |
| 5 | Personas por tipo | `GET` | `http://localhost:3000/api/personas/tipo/empleado` |
| 6 | Reporte Work Order | `GET` | `http://localhost:3000/api/workorder/reporte` |
| 7 | Eliminar departamento | `DELETE` | `http://localhost:3000/api/departamentos/Marketing` |

```text
POSTMAN
   │  Solicitud HTTP
   ▼
NODE.JS + EXPRESS
   │  Procesamiento de la solicitud
   ▼
SQL SERVER
   │  Stored Procedure
   ▼
BASE DE DATOS
   │  Resultado
   ▼
NODE.JS + EXPRESS
   │  Respuesta JSON
   ▼
POSTMAN
```

Con esto, Postman queda como la herramienta utilizada para probar, visualizar y organizar el funcionamiento de la API AdventureWorks. La aplicación no sustituye al servidor ni a la base de datos, sino que actúa como cliente para enviar solicitudes y comprobar las respuestas generadas.

Como resultado final, la API queda preparada para recibir solicitudes HTTP, comunicarse con SQL Server y ejecutar los procedimientos almacenados necesarios para las operaciones de inserción, actualización, eliminación y consulta.