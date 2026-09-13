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