<div align="center">

# Instituto Tecnológico de Costa Rica

## Escuela de Computación

### Bases de Datos II - Tarea #1 — API con SQL Server

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

Para la realización del proyecto se hará uso de **WSL (Windows Subsystem for Linux)**, ya que permite trabajar con un entorno Linux directamente desde Windows sin necesidad de utilizar una máquina virtual tradicional. Esto facilita el acceso a herramientas y comandos propios de Linux, manteniendo al mismo tiempo el sistema operativo Windows como entorno principal.

# Instalación y configuración de WSL y Ubuntu

## Paso 1. Abrir PowerShell como administrador

Primero, se debe abrir PowerShell o Terminal de Windows con **permisos de administrador**, ya que estos permisos son necesarios para realizar cambios en el sistema e instalar WSL. Para hacerlo, se debe hacer clic derecho sobre el botón Inicio de Windows y seleccionar "Terminal" o "Windows PowerShell".

En nuestro caso usaremos PowerShell.

**Elegir 1 opción**

## Paso 2. Instalar WSL por medio de comandos

Una vez abierta la Terminal o PowerShell en nuestro caso como administrador, se debe escribir el comando `wsl --install` y presionar Enter. Este comando permite instalar automáticamente WSL, junto con los componentes necesarios para ejecutar Linux en Windows. Durante el proceso también se instalará Ubuntu, que será la distribución de Linux utilizada dentro de WSL. Al finalizar la instalación, puede ser necesario reiniciar el equipo para completar la configuración.

## Paso 3. Instalar Ubuntu

Después de completar la instalación inicial de WSL, se vuelve a abrir PowerShell como administrador, en caso de que la ventana anterior se haya cerrado. Luego, se ejecuta el comando `wsl --install -d Ubuntu` y se presiona Enter. Después de ejecutar el comando, comenzará la descarga e instalación de Ubuntu. Durante este proceso se puede mostrar el progreso de la instalación en la terminal y el tiempo dependerá de la velocidad de la conexión a Internet y del equipo. No se debe cerrar la ventana mientras el proceso esté en ejecución, sino esperar hasta que la instalación finalice y aparezca un mensaje indicando que se completó correctamente. Esto indica específicamente que se desea instalar Ubuntu como la distribución de Linux que se utilizará dentro de WSL.

## Paso 4. Crear usuario y contraseña de Linux

Una vez finalizada la instalación, Ubuntu solicitará crear un usuario de Linux y una contraseña. El nombre de usuario debe escribirse en **minúsculas, sin espacios y preferiblemente utilizando únicamente letras y números**. Posteriormente, se solicitará crear una contraseña. Al escribirla, **no se mostrará ningún carácter en la pantalla, ni siquiera asteriscos o puntos.** Esto puede dar la impresión de que no se está escribiendo nada, pero sí se está registrando la contraseña. Después de escribirla, se presiona Enter y Ubuntu solicitará confirmarla escribiéndola nuevamente de la misma manera, sin que los caracteres sean visibles. Finalmente, se presiona Enter para completar la creación del usuario.

Estos datos son independientes de la cuenta de Windows y se utilizarán para acceder y trabajar dentro del entorno Ubuntu. Es importante recordar estos datos, ya que la contraseña puede ser necesaria para ejecutar comandos que requieran permisos de administrador dentro de Linux.

## Paso 5. Confirmar que WSL y Ubuntu quedaron instalados

Para comprobar que la instalación se realizó correctamente, se debe abrir nuevamente **Terminal o PowerShell** y ejecutar el comando `wsl --list --verbose`, luego presionar **Enter**. Este comando mostrará las distribuciones de Linux instaladas en WSL y su versión.

En la lista debería aparecer **Ubuntu** y, en la columna **VERSION**, debe indicar **2**, lo que confirma que se está utilizando **WSL 2**. En la columna **STATE** puede aparecer **Running** si Ubuntu está ejecutándose en ese momento o **Stopped** si está instalada pero actualmente cerrada.

> **Nota:** elegí Ubuntu porque las características del equipo son suficientes para trabajar cómodamente con WSL 2 y Docker, por lo que el uso de Ubuntu dentro de WSL no debería representar un problema de rendimiento ni de espacio. Además, Ubuntu es una distribución ampliamente utilizada y cuenta con mucha documentación para trabajar con Docker y contenedores. También existen otras distribuciones de Linux que pueden utilizarse con WSL, como Debian y Alpine Linux. Debian es una alternativa ligera y fácil de utilizar, mientras que Alpine Linux consume todavía menos recursos, aunque requiere mayor conocimiento técnico.

## Paso 6. Verificar el acceso a Ubuntu

A partir de este momento, para ingresar nuevamente se puede abrir Terminal o PowerShell y escribir `wsl`, o simplemente buscar Ubuntu desde el menú Inicio. Al abrirlo, se accederá directamente al usuario creado anteriormente.

También es posible acceder desde Ubuntu a los archivos de Windows mediante rutas como `\\wsl$\Ubuntu\home\arias`. No se debe colocar "arias", este sería el nombre de usuario que usted creó para Ubuntu.

## Paso 7. Actualizar Ubuntu

Una vez dentro de Ubuntu, se deben actualizar los paquetes del sistema para asegurarse de que estén instalados y actualizados correctamente. Para hacerlo, se ejecuta el siguiente comando:

```bash
sudo apt update && sudo apt upgrade -y
```

Este comando primero busca las actualizaciones disponibles y luego las instala automáticamente. La opción `-y` permite confirmar la instalación sin tener que responder manualmente durante el proceso.

# Creación del contenedor con Docker

Una vez configurado WSL y actualizado Ubuntu, se procederá a utilizar Docker para crear el contenedor donde se ejecutará la aplicación. El contenedor permitirá tener un entorno aislado con las herramientas, dependencias y configuraciones necesarias para el proyecto, sin necesidad de instalar todos estos componentes directamente en Windows. De esta manera, la aplicación podrá ejecutarse en un entorno controlado y reproducible, facilitando su instalación, ejecución y despliegue.

## Paso 8. Instalar Docker Engine en Ubuntu

Una vez actualizado Ubuntu, se procederá a instalar Docker Engine directamente dentro del entorno de Ubuntu en WSL. Para realizar la instalación, se ejecuta el siguiente comando:

```bash
curl -fsSL https://get.docker.com -o get-docker.sh && sudo sh get-docker.sh
```

Este comando descarga y ejecuta el script oficial de instalación de Docker, permitiendo instalar Docker Engine directamente en Ubuntu sin necesidad de utilizar Docker Desktop en Windows.

## Paso 9. Dar permisos al usuario

Después de instalar Docker, se deben configurar los permisos para que el usuario pueda ejecutar comandos de Docker sin tener que utilizar sudo cada vez.

```bash
sudo usermod -aG docker $USER
```

Este comando agrega el usuario actual al grupo docker. La opción `-aG` indica que se debe agregar el usuario a un grupo sin eliminarlo de los demás grupos a los que ya pertenece. De esta manera, el usuario obtiene los permisos necesarios para utilizar Docker directamente.

## Paso 10. Verificar el grupo

Para comprobar que el usuario pertenece correctamente al grupo de Docker, se ejecuta el siguiente comando:

```bash
groups
```

Este comando muestra todos los grupos a los que pertenece el usuario actual. En la lista debe aparecer "docker", lo que confirma que el usuario tiene los permisos necesarios para utilizar Docker sin tener que escribir "sudo" en cada comando.

## Paso 11. Iniciar Docker

Después de completar la instalación y configuración de Docker, se debe iniciar el servicio para poder utilizar Docker dentro de Ubuntu. Para hacerlo, se ejecuta el comando:

```bash
sudo service docker start
```

y se presiona Enter.

Este comando inicia el servicio de Docker Engine dentro de Ubuntu, permitiendo que Docker quede disponible para ejecutar contenedores y demás operaciones relacionadas con el proyecto. Una vez ejecutado, se debe esperar a que el comando finalice correctamente antes de continuar con el siguiente paso.

El uso de WSL y contenedores permitirá tener un entorno de desarrollo más práctico y controlado. También permitirá mantener el entorno de trabajo separado del sistema principal, reduciendo problemas relacionados con configuraciones o dependencias.

# Instalación del motor de bases de datos SQL Server en Linux

## Paso 12. Descargar la imagen de SQL Server

Para instalar el motor de bases de datos SQL Server dentro de la distribución Linux, se utilizará una **imagen oficial de Microsoft mediante Docker**. Para descargarla, se sigue usando la terminal de Ubuntu y se ejecuta el comando:

```bash
docker pull mcr.microsoft.com/mssql/server:2022-latest
```

luego se presiona Enter.

Este comando descarga desde el registro de contenedores de Microsoft la imagen oficial de SQL Server 2022 para Linux, la cual será utilizada posteriormente para crear el contenedor donde se ejecutará el motor de bases de datos.

## Paso 13. Crear y ejecutar el contenedor de SQL Server

Una vez descargada la imagen de SQL Server, se procederá a crear y ejecutar el contenedor donde funcionará el motor de bases de datos. Para hacerlo, se ejecuta el siguiente comando completo en la terminal de Ubuntu:

```bash
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=TuPassword123!" -p 1433:1433 --name sqlserver --hostname sqlserver -d mcr.microsoft.com/mssql/server:2022-latest
```

Esa parte se cambia ya que será la contraseña que tú deseas colocar.

En este comando, `docker run` crea y ejecuta el contenedor utilizando la imagen de SQL Server **descargada anteriormente**. `ACCEPT_EULA=Y` indica que se aceptan los términos de licencia de Microsoft, mientras que `MSSQL_SA_PASSWORD` establece la contraseña del usuario **administrador sa.** La contraseña debe tener como mínimo 8 caracteres e incluir mayúsculas, minúsculas, números y al menos un símbolo.

> **Nota importante:** La contraseña establecida en `MSSQL_SA_PASSWORD` debe guardarse, ya que esta información será necesaria posteriormente para **conectarse desde Visual Studio Code al motor de SQL Server que se encuentra ejecutándose dentro de Ubuntu mediante Docker**. Este paso no se realiza hasta más adelante, pero debemos saber que la información la tenemos que guardar para próximos pasos.

La opción `-p 1433:1433` permite acceder al servidor SQL mediante el puerto 1433, `--name sqlserver` asigna el nombre sqlserver al contenedor y `--hostname sqlserver` establece su nombre de host. Finalmente, `-d` indica que el contenedor se ejecutará en segundo plano, permitiendo continuar utilizando la terminal mientras SQL Server permanece activo.

## Paso 14. Verificar que el contenedor esté ejecutándose

Después de crear el contenedor de SQL Server, se debe comprobar que este se encuentra ejecutándose correctamente. Para hacerlo, se ejecuta el siguiente comando en la terminal de Ubuntu:

```bash
docker ps
```

Este comando muestra los contenedores que se encuentran actualmente en ejecución. En la lista debe aparecer una fila correspondiente al contenedor `sqlserver` y, en la columna STATUS, debe mostrarse un estado similar a `Up`, lo que indica que el contenedor está activo y que SQL Server se encuentra ejecutándose correctamente.

Una vez confirmado que el contenedor está activo, se puede verificar que el motor de SQL Server funciona correctamente. Para ello, se ingresa al contenedor utilizando sqlcmd y, cuando aparezca el prompt `1>`, se escribe el SELECT, se presiona Enter y luego se escribe el GO en una línea aparte:

```sql
SELECT @@VERSION;
```

```text
GO
```

El comando `SELECT @@VERSION;` permite consultar la versión y la información del servidor SQL que se encuentra ejecutándose. Al ejecutar `GO`, se envía la consulta para que SQL Server la procese. Si la instalación fue correcta, se mostrará información indicando que se está utilizando Microsoft SQL Server 2022 (Developer Edition) sobre Linux (Ubuntu).

El mensaje que se mostró en este caso fue:

```text
Microsoft SQL Server 2022
(RTM-CU26-GDR) (KB5122768) - 16.0.4275.2 (X64) Aug 20 2026 00:33:45
Copyright (C) 2022 Microsoft Corporation
Developer Edition (64-bit) on Linux (Ubuntu 22.04.5 LTS) <X64>
(1 rows affected)
1>
```

En este punto se confirma que SQL Server está funcionando correctamente dentro del contenedor Docker en Ubuntu. Para salir del prompt de sqlcmd y regresar a la terminal de Ubuntu, se puede escribir:

```bash
exit
```

Si de esta manera no puedes salir, realiza `Ctrl + C`.

De esta manera, se finaliza la comprobación del funcionamiento de SQL Server y se puede continuar con el siguiente proceso.

# Instalación de la base de datos AdventureWorks

## Paso 15. Descargar el backup de AdventureWorks

La base de datos que se instalará en el **servidor SQL es AdventureWorks**, una base de datos de ejemplo proporcionada por Microsoft que fue solicitada por el profesor para la realización de este trabajo. Para descargar su archivo de respaldo **(.bak)** directamente en Ubuntu, se ejecutó el siguiente comando:

```bash
curl -L -o AdventureWorks2022.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2022.bak
```

Este comando descarga el archivo `AdventureWorks2022.bak` y lo guarda en el directorio actual de Ubuntu. El archivo corresponde a la versión completa OLTP **(Online Transaction Processing)** de AdventureWorks, que será utilizada posteriormente para restaurar **la base de datos dentro del servidor SQL que se encuentra ejecutándose en el contenedor Docker.**

## Paso 16. Copiar el archivo al contenedor

Una vez descargado el archivo **AdventureWorks2022.bak en Ubuntu**, se debe **copiar dentro del contenedor de SQL Server** para que el motor de bases de datos pueda acceder al respaldo y utilizarlo posteriormente para restaurar la base de datos. Para realizar esta acción, se ejecuta el siguiente comando:

```bash
docker cp AdventureWorks2022.bak sqlserver:/var/opt/mssql/data/
```

El comando `docker cp` permite copiar archivos entre Ubuntu y un contenedor Docker. En este caso, `AdventureWorks2022.bak` corresponde al archivo de respaldo ubicado en Ubuntu, mientras que `sqlserver:/var/opt/mssql/data/` indica que el archivo será copiado dentro del contenedor sqlserver, específicamente en el directorio donde SQL Server almacena sus archivos de datos.

Al finalizar, el archivo `.bak` estará disponible dentro del contenedor y podrá ser utilizado en el siguiente paso para restaurar la base de datos AdventureWorks en SQL Server.

## Paso 17. Ver los nombres lógicos del backup

Después de copiar el archivo de respaldo al contenedor, se deben consultar los nombres lógicos de los archivos que contiene el backup. Esta información será necesaria después para realizar correctamente la restauración de la base de datos AdventureWorks utilizando el siguiente comando:

```bash
docker exec -it sqlserver /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "TuPassword123!" -C
```

**Nota:** En la parte `"TuPassword123!"` se debe colocar la contraseña que se estableció anteriormente para el usuario administrador sa al crear el contenedor de SQL Server.

Una vez dentro de sqlcmd, aparecerá el prompt `1>`. En este punto, se ejecuta la siguiente consulta:

```sql
RESTORE FILELISTONLY FROM DISK = '/var/opt/mssql/data/AdventureWorks2022.bak'
```

```text
GO
```

**Nota:** Es importante colocar GO debajo de la consulta, en una línea separada. GO indica a sqlcmd que debe ejecutar el bloque de instrucciones introducido anteriormente.

El comando RESTORE FILELISTONLY permite consultar la información de los archivos contenidos dentro del backup sin restaurar todavía la base de datos. Entre los datos mostrados se encuentran los nombres lógicos de los archivos de datos y de registro de AdventureWorks. Estos nombres serán necesarios en el siguiente paso para indicar correctamente dónde deben ubicarse los archivos durante la restauración.

## Paso 18. Crear y ejecutar el archivo de restauración

Primero, se debe salir de sqlcmd y regresar a la terminal de Ubuntu. Si es necesario, se puede ingresar nuevamente a Ubuntu utilizando:

```bash
wsl -d Ubuntu
```

Una vez en la terminal de Ubuntu, se creará un archivo llamado **restore.sql** que contendrá las **instrucciones necesarias para restaurar la base de datos AdventureWorks2022.** Para crear el archivo, se ejecuta el siguiente bloque completo:

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

Se debe pegar todo el bloque completo, desde `cat > restore.sql << 'EOF'` hasta `EOF`, y luego presionar Enter. Este procedimiento crea el archivo restore.sql directamente desde la terminal de Ubuntu, evitando tener que escribir las instrucciones de restauración manualmente dentro de sqlcmd. Dentro del archivo se indica que se debe restaurar la base de datos AdventureWorks2022 utilizando el backup descargado anteriormente. Además, **MOVE especifica la ubicación donde SQL Server debe crear los archivos físicos .mdf y .ldf dentro del contenedor.**

Una vez creado el archivo, se copia al contenedor de SQL Server mediante:

```bash
docker cp restore.sql sqlserver:/var/opt/mssql/data/
```

Este comando copia el archivo restore.sql desde Ubuntu hacia el contenedor sqlserver, específicamente al directorio donde se encuentra el backup y donde SQL Server puede acceder a él. Finalmente, se ejecuta el archivo de restauración mediante sqlcmd utilizando la opción -i:

```bash
docker exec -it sqlserver /opt/mssql-tools18/bin/sqlcmd -S localhost -U sa -P "TuPassword123!" -C -i /var/opt/mssql/data/restore.sql
```

**Nota:** En `"TuPassword123!"` se debe colocar la contraseña que se estableció anteriormente para el usuario administrador sa.

La opción `-i` indica que sqlcmd debe utilizar un archivo como entrada. De esta manera, SQL Server ejecutará todas **las instrucciones contenidas en restore.sql y realizará la restauración de AdventureWorks2022 dentro del contenedor.**

# Configuración de Visual Studio Code para trabajar con Ubuntu mediante WSL

Después de instalar y restaurar la base de datos en SQL Server, se comenzará a utilizar Visual Studio Code para conectarse y trabajar con la base de datos que se encuentra ejecutándose dentro del contenedor Docker en Ubuntu. En este caso, Visual Studio Code ya se encuentra instalado en Windows, por lo que no es necesario instalar una segunda versión del programa dentro de Ubuntu. Se configurará la instalación existente de Windows para trabajar directamente con el entorno Linux mediante WSL.

Inicialmente se había considerado utilizar Azure Data Studio para realizar la conexión y administración de SQL Server; sin embargo, Microsoft retiró oficialmente Azure Data Studio el 28 de febrero de 2026, por lo que ya no recibe actualizaciones, correcciones de seguridad ni soporte. Microsoft recomienda utilizar Visual Studio Code junto con la extensión MSSQL como alternativa para continuar trabajando con SQL Server.

Por esta razón, se utilizará Visual Studio Code como herramienta principal. La conexión con WSL permitirá que, aunque el programa esté instalado en Windows, pueda trabajar con los archivos, herramientas y servicios que se encuentran dentro de Ubuntu. De esta manera, se podrá acceder posteriormente al SQL Server que está ejecutándose dentro del contenedor Docker y administrar la base de datos AdventureWorks2022 desde Visual Studio Code.

**Nota:** Si Visual Studio Code no estuviera instalado en el equipo, primero se debe descargar e instalar la versión oficial para Windows. En este proyecto no será necesario instalar la versión .deb de Visual Studio Code dentro de Ubuntu, ya que se utilizará la instalación de Windows conectada al entorno WSL. Microsoft recomienda precisamente este esquema para trabajar con WSL.

## Paso 19. Abrir Visual Studio Code e instalar la extensión WSL

Como Visual Studio Code ya se encuentra instalado en Windows, se debe abrir normalmente desde el menú Inicio o utilizando el acceso directo habitual. No es necesario abrirlo desde Ubuntu, ya que posteriormente se configurará para trabajar directamente con el entorno Linux mediante WSL.

Una vez abierto Visual Studio Code, se debe seleccionar el icono de Extensiones, ubicado en la barra lateral izquierda y representado por cuatro cuadrados. En el buscador de extensiones se escribe WSL y se instala la extensión oficial WSL de Microsoft, en caso de que todavía no esté instalada.

Esta extensión permite conectar Visual Studio Code con la distribución de Ubuntu instalada mediante WSL. De esta manera, aunque Visual Studio Code se esté ejecutando en Windows, podrá acceder al entorno de Ubuntu y trabajar directamente con sus archivos, comandos y herramientas.

**Nota:** Si al intentar conectar Visual Studio Code con WSL se presenta algún error, se puede intentar la conexión nuevamente. Para ello, se presiona **Ctrl + Shift + P** para abrir la paleta de comandos, se escribe **WSL: Connect to WSL** y se selecciona esta opción nuevamente.

Si el error continúa, se recomienda cerrar Visual Studio Code por completo, utilizando la X de la ventana y no solamente cerrando la pestaña. Luego, se vuelve a abrir Visual Studio Code desde el menú Inicio de Windows y se intenta nuevamente la conexión con WSL. En algunos casos, la extensión puede requerir un reinicio completo del programa durante su primera configuración.

Si todo sale bien una vez seleccionada la opción **WSL: Connect to WSL**, Visual Studio Code comenzará a establecer la conexión con Ubuntu. Durante este proceso, es posible que aparezca un mensaje indicando que se está descargando e instalando **VS Code Server** dentro de Ubuntu. Esta instalación se realiza automáticamente la primera vez que se conecta Visual Studio Code con WSL y puede tardar algunos minutos, dependiendo de la conexión a Internet y del rendimiento del equipo.

Se debe esperar a que el proceso finalice. Durante la instalación puede aparecer una barra de progreso o un mensaje relacionado con la descarga de VS Code Server. Cuando termine, el mensaje desaparecerá y Visual Studio Code quedará conectado al entorno de Ubuntu.

**Nota:** No se debe cerrar Visual Studio Code ni interrumpir el proceso mientras se descarga e instala VS Code Server. Este proceso es necesario para que Visual Studio Code pueda trabajar directamente dentro del entorno Linux de Ubuntu.

Una vez finalizada la instalación de VS Code Server, Visual Studio Code quedará conectado al entorno de Ubuntu mediante WSL. Para comprobar que la conexión se realizó correctamente, se debe observar la esquina inferior izquierda de Visual Studio Code. Allí aparecerá la indicación "WSL: Ubuntu", lo que confirma que Visual Studio Code está trabajando directamente sobre la distribución Ubuntu instalada mediante WSL. Además, puede aparecer un mensaje indicando que se encuentra conectado de forma remota. Esto significa que, aunque Visual Studio Code se está ejecutando en Windows, ahora puede acceder y trabajar directamente con los archivos, herramientas y servicios del entorno Linux.

Cuando aparezca "WSL: Ubuntu" en la esquina inferior izquierda, la conexión se considera establecida correctamente y se puede continuar con la configuración de SQL Server en Visual Studio Code.

# Configuración de SQL Server en Visual Studio Code

## Paso 20. Instalar la extensión MSSQL

Para poder visualizar y administrar la base de datos de forma gráfica desde Visual Studio Code, se utilizará la extensión MSSQL, la cual permite trabajar con SQL Server directamente desde el editor. Esta configuración se realizará dentro de la misma ventana de Visual Studio Code que ya se encuentra conectada a Ubuntu mediante WSL.

Para instalarla, se debe seleccionar el icono de Extensiones, representado por cuatro cuadrados y ubicado en la barra lateral izquierda de Visual Studio Code. En el buscador se escribe SQL Server (mssql) y se debe seleccionar la extensión oficial de Microsoft.

Una vez localizada, se presiona Instalar y se espera a que finalice el proceso. Al terminar, Visual Studio Code contará con las herramientas necesarias para establecer posteriormente la conexión con el servidor de SQL Server que se encuentra ejecutándose dentro del contenedor Docker.

**Nota:** Es importante instalar la extensión mientras se está trabajando en la ventana de Visual Studio Code conectada a WSL: Ubuntu, ya que el proyecto se está ejecutando dentro de ese entorno.

## Paso 21. Solucionar el error de la extensión MSSQL

Al instalar y **utilizar por primera vez la extensión MSSQL en Ubuntu mediante WSL**, puede presentarse un error relacionado con una librería que necesita el servicio interno de **MSSQL para funcionar correctamente en Linux**. Una de las librerías que puede requerirse es ICU, utilizada por .NET para funciones de internacionalización.

Para solucionar este problema, se debe utilizar la terminal integrada de Visual Studio Code, ubicada en la parte inferior de la ventana. En esta terminal se ejecuta únicamente el siguiente comando:

```bash
sudo apt update && sudo apt install -y libicu-dev
```

Este comando actualiza la información de los paquetes disponibles en Ubuntu y posteriormente instala la librería libicu-dev.

Al ejecutar el comando, Ubuntu puede solicitar la **contraseña del usuario**. Se debe escribir la contraseña utilizada para ingresar al usuario de Ubuntu y presionar Enter. Mientras se escribe la contraseña, no aparecerán caracteres en la pantalla; esto es normal.

Una vez finalizada la instalación correctamente, se debe **recargar** Visual Studio Code para que la extensión MSSQL vuelva a iniciar sus servicios. Para hacerlo, se presiona **Ctrl + Shift + P**, se escribe **Reload Window** y se presiona **Enter**. Visual Studio Code se recargará automáticamente.

Después de recargar la ventana, se debe abrir el panel de MSSQL seleccionando el nuevo icono relacionado con SQL Server, ubicado en la barra lateral izquierda de Visual Studio Code. Al hacer clic sobre este icono, se podrá acceder al panel desde el cual posteriormente se realizará la conexión con el servidor de SQL Server que se encuentra ejecutándose dentro del contenedor Docker.

## Paso 22. Conectar Visual Studio Code con SQL Server

Una vez solucionado el problema del servicio de MSSQL y abierto el panel de SQL Server, se debe establecer la conexión con el SQL Server que se encuentra ejecutándose dentro del contenedor Docker.

Al seleccionar la opción para crear una nueva conexión, aparecerá un formulario con los datos necesarios para conectarse al servidor. Se debe completar de la siguiente manera:

- **Nombre del servidor:** localhost
- **Puerto:** 1433
- **Certificado de servidor de confianza:** marcar el checkbox
- **Tipo de autenticación:** Inicio de sesión de SQL
- **Nombre de usuario:** sa
- **Contraseña:** utilizar la misma contraseña establecida anteriormente mediante MSSQL_SA_PASSWORD al crear el contenedor.

La opción Certificado de servidor de confianza debe quedar activada, ya que de lo contrario la conexión puede presentar un error relacionado con el certificado del servidor. Una vez completados los datos, se debe seleccionar Conectar.

### Verificar que el contenedor de SQL Server esté ejecutándose

Si la conexión no se establece, primero se debe comprobar que el contenedor de SQL Server esté activo. Para hacerlo, se debe salir de cualquier vista de registros o logs que se encuentre abierta presionando q y regresar a la terminal de Ubuntu.

Luego se ejecuta:

```bash
docker ps
```

Este comando muestra únicamente los contenedores que se encuentran actualmente en ejecución. Si aparece el contenedor sqlserver y su estado indica Up, significa que está ejecutándose correctamente.

Si sqlserver no aparece en la lista, se debe utilizar:

```bash
docker ps -a
```

A diferencia de docker ps, este comando muestra todos los contenedores, incluyendo aquellos que se encuentran detenidos. Si aparece sqlserver con un estado similar a:

```text
Exited (255)
```

significa que el contenedor existe, pero actualmente está detenido. En este caso, no es necesario crear otro **contenedor ni volver a instalar SQL Server**. Simplemente se debe iniciarlo nuevamente con:

```bash
docker start sqlserver
```

Después, se verifica nuevamente su estado:

```bash
docker ps
```

Si aparece sqlserver con un estado similar a Up, el contenedor está funcionando nuevamente.

Se recomienda esperar aproximadamente 10 a 15 segundos después de iniciarlo para permitir que SQL Server termine de inicializarse completamente. Luego se puede regresar al panel de MSSQL en Visual Studio Code e intentar nuevamente la conexión utilizando los mismos datos.

Cuando la conexión sea exitosa, en el panel de MSSQL aparecerá el servidor conectado, por ejemplo `localhost, <default> (sa)`. Debajo se mostrarán diferentes opciones, entre ellas Bases de datos, Seguridad y Objetos de servidor.

Para comprobar que la restauración de la base de datos se realizó correctamente, se debe seleccionar la flecha `>` ubicada junto a Bases de datos. Allí deberá aparecer AdventureWorks2022; se puede expandir AdventureWorks2022 y seleccionar la carpeta Tables para visualizar las tablas que contiene la base de datos.

Esto confirma que Visual Studio Code está conectado correctamente al SQL Server que se ejecuta dentro del contenedor Docker y que la base de datos AdventureWorks2022 está disponible para trabajar con ella.

**Nota:** Si el icono de MSSQL no aparece inmediatamente después de recargar Visual Studio Code, se debe verificar que la extensión SQL Server (mssql) esté instalada correctamente y que la ventana continúe mostrando WSL: Ubuntu en la esquina inferior izquierda.

Una vez instalada la extensión, Visual Studio Code estará preparado para establecer la conexión con Ubuntu y continuar con la configuración del entorno de desarrollo.

# Configuración de Git y preparación del repositorio

Debido a que la entrega del proyecto se realizará mediante GitHub, primero se debe verificar que Git esté instalado y funcionando correctamente dentro de Ubuntu. Posteriormente, se clonará el repositorio plantilla proporcionado por el profesor, se desconectará del repositorio original y se asociará el proyecto con un repositorio propio de GitHub.

## Paso 23. Verificar la instalación de Git

Antes de clonar el repositorio, se debe comprobar que Git se encuentre instalado dentro de Ubuntu. Para ello, se utiliza la terminal integrada de Visual Studio Code, que ya se encuentra conectada al entorno WSL: Ubuntu. Se ejecuta el siguiente comando:

```bash
git --version
```

Este comando muestra la versión de Git instalada en el sistema.

**Nota:** Si aparece un mensaje indicando que git no se encuentra instalado, primero será necesario instalarlo antes de continuar con el siguiente paso.

## Paso 24. Ubicarse en la carpeta Home de Ubuntu

Una vez comprobado que Git funciona correctamente, se debe regresar a la carpeta personal del usuario para realizar la clonación del repositorio. Se ejecuta:

```bash
cd ~
```

El comando `cd ~` permite regresar directamente a la carpeta Home del usuario actual de Ubuntu.

## Paso 25. Clonar el repositorio del profesor

Desde la carpeta Home se debe clonar el repositorio plantilla proporcionado para el proyecto:

```bash
git clone https://github.com/Bases-de-Datos-2/Proyectos.git adventureworks-api
```

El comando `git clone` descarga una copia del repositorio desde GitHub. En este caso, se utiliza el repositorio `https://github.com/Bases-de-Datos-2/Proyectos` y se indica `adventureworks-api` al final para que la copia descargada se almacene dentro de una carpeta con ese nombre.

Al finalizar, se tendrá una nueva carpeta llamada adventureworks-api, que contendrá el contenido del repositorio proporcionado por el profesor.

## Paso 26. Entrar al proyecto y desconectarlo del repositorio original

Se debe ingresar a la carpeta que se acaba de crear:

```bash
cd adventureworks-api
```

Una vez dentro, se elimina la conexión con el repositorio original del profesor:

```bash
git remote remove origin
```

Esto es importante porque el proyecto debe quedar asociado posteriormente al repositorio propio del estudiante. Al eliminar origin, se evita que los futuros comandos de git push intenten enviar los cambios al repositorio original del profesor.

## Paso 27. Crear un repositorio propio en GitHub

Desde el navegador web se debe ingresar a GitHub utilizando la cuenta personal.

Luego:

1. Seleccionar el símbolo **+** ubicado en la esquina superior derecha.
2. Seleccionar **New repository**.
3. Escribir el nombre del repositorio, por ejemplo: **adventureworks-api**.
4. Seleccionar **Public**, si así lo requiere la entrega.
5. No seleccionar las opciones para agregar README, `.gitignore` ni License.
6. Seleccionar **Create repository**.

Se recomienda crear el repositorio completamente vacío porque el proyecto ya contiene los archivos obtenidos del repositorio plantilla.

## Paso 28. Copiar la URL del repositorio propio

Después de crear el repositorio, GitHub mostrará la dirección del nuevo repositorio. Tendrá una estructura similar a:

```text
https://github.com/TU-USUARIO/adventureworks-api.git
```

Se debe copiar la URL correspondiente al repositorio personal.

**Nota:** TU-USUARIO es solamente un ejemplo. Se debe utilizar el nombre de usuario real de la cuenta de GitHub.

Se debe regresar a la terminal de Visual Studio Code y verificar que todavía se encuentre dentro de la carpeta adventureworks-api. Luego se agrega el repositorio personal como nuevo origen:

```bash
git remote add origin https://github.com/TU-USUARIO/adventureworks-api.git
```

Se debe reemplazar TU-USUARIO por el usuario real de GitHub y utilizar con exactitud la URL copiada anteriormente.

Por último, se prepara la rama principal y se sube el contenido al repositorio personal:

```bash
git branch -M main
```

```bash
git push -u origin main
```

El primer comando establece main como nombre de la rama principal. El segundo envía los archivos del proyecto al repositorio personal de GitHub y establece la conexión entre la rama local y la rama remota.

Una vez finalizado el proceso, se puede ingresar al repositorio desde el navegador y comprobar que los archivos del proyecto se encuentren disponibles.