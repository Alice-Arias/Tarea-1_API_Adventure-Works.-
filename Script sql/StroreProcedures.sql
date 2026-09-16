USE AdventureWorks2022;


GO
-----------------------------------------------------------------------------------
-- INSERTAR: Registrar un departamento nuevo
-----------------------------------------------------------------------------------
CREATE PROCEDURE sp_InsertarDepartamento
@Nombre NVARCHAR (40), @Grupo NVARCHAR (40)
AS
BEGIN
    IF (@Nombre IS NULL)
       OR (@Grupo IS NULL)
        BEGIN
            PRINT 'Error: El nombre y el grupo son obligatorios.';
            RETURN;
        END
    IF EXISTS (SELECT 1
               FROM   HumanResources.Department
               WHERE  Name = @Nombre)
        BEGIN
            PRINT 'Error: Departamento ya existe';
            RETURN;
        END
    INSERT  INTO HumanResources.Department (
        Name,
        GroupName
    )
    VALUES                                (@Nombre, @Grupo);
    PRINT 'Departamento registrado correctamente.';
END


GO
EXECUTE sp_InsertarDepartamento @Nombre = 'Tecnologia', @Grupo = 'Administracion';


GO
-----------------------------------------------------------------------------------
-- ACTUALIZAR: actualiza la cantidad disponible de un producto en una ubicacion
-----------------------------------------------------------------------------------
CREATE PROCEDURE sp_ActualizarCantidadInventarioUbicacion
@ProductID INT, @LocationID SMALLINT, @NuevaCantidad SMALLINT
AS
BEGIN
    IF NOT EXISTS (SELECT 1
                   FROM   Production.ProductInventory
                   WHERE  ProductID = @ProductID
                          AND LocationID = @LocationID)
        BEGIN
            PRINT 'Error: El producto no existe en esa ubicación.';
            RETURN;
        END
    IF @NuevaCantidad < 0
        BEGIN
            PRINT 'Error: Cantidad no puede ser negativa';
            RETURN;
        END
    UPDATE Production.ProductInventory
    SET    Quantity     = @NuevaCantidad,
           ModifiedDate = GETDATE()
    WHERE  ProductID = @ProductID
           AND LocationID = @LocationID;
    PRINT 'Cantidad actualizada correctamente.';
END


GO
EXECUTE sp_ActualizarCantidadInventarioUbicacion @ProductID = 1, @LocationID = 1, @NuevaCantidad = 100;


GO
-----------------------------------------------------------------------------------
-- DELETE: Eliminamos un departamento que no tenga empleados asociados
-----------------------------------------------------------------------------------
CREATE PROCEDURE sp_EliminarDepartamento
@Nombre NVARCHAR (50)
AS
BEGIN
    IF NOT EXISTS (SELECT 1
                   FROM   HumanResources.Department
                   WHERE  Name = @Nombre)
        BEGIN
            PRINT 'El departamento no existe.';
            RETURN;
        END
    IF EXISTS (SELECT 1
               FROM   HumanResources.EmployeeDepartmentHistory AS EDH
                      INNER JOIN
                      HumanResources.Department AS D
                      ON EDH.DepartmentID = D.DepartmentID
               WHERE  D.Name = @Nombre)
        BEGIN
            PRINT 'No se puede eliminar: el departamento tiene registros asociados.';
            RETURN;
        END
    DELETE HumanResources.Department
    WHERE  Name = @Nombre;
    PRINT 'Departamento eliminado correctamente.';
END


GO
EXECUTE sp_EliminarDepartamento @Nombre = 'Tecnologia';


GO
-----------------------------------------------------------------------------------
-- SELECT (con JOIN): diferencias en Work Order por producto
-----------------------------------------------------------------------------------
CREATE PROCEDURE sp_ConsultarWorkOrder
AS
BEGIN
    SELECT   CASE WHEN GROUPING(P.Name) = 1 THEN 'TOTAL GENERAL' ELSE P.Name END AS Producto,
             SUM(W.OrderQty) AS Cantidad_Solicitada,
             SUM(W.StockedQty) AS Cantidad_Almacenada,
             SUM(W.ScrappedQty) AS Cantidad_Rechazada
    FROM     Production.WorkOrder AS W
             INNER JOIN
             Production.Product AS P
             ON W.ProductID = P.ProductID
    GROUP BY ROLLUP(P.Name)
    ORDER BY GROUPING(P.Name), SUM(W.OrderQty - W.StockedQty) ASC;
END


GO
EXECUTE sp_ConsultarWorkOrder ;


GO
-----------------------------------------------------------------------------------
-- SELECT (una tabla): cantidad de clientes por territorio
-----------------------------------------------------------------------------------
CREATE PROCEDURE sp_BuscarClientesPorTerritorio
@TerritoryID INT
AS
BEGIN
    SELECT   TerritoryID AS Territorio,
             COUNT(DISTINCT CustomerID) AS Cantidad_De_Clientes
    FROM     Sales.Customer
    WHERE    TerritoryID = @TerritoryID
    GROUP BY TerritoryID;
END


GO
EXECUTE sp_BuscarClientesPorTerritorio @TerritoryID = 1;


GO
USE AdventureWorks2022;


GO
-----------------------------------------------------------------------------------
-- SELECT (con 2 JOIN): personas por tipo
-----------------------------------------------------------------------------------
CREATE PROCEDURE sp_BuscarPersonasPorTipo
@TipoPersona VARCHAR (30)
AS
BEGIN
    SELECT   P.BusinessEntityID AS Identificador,
             CONCAT(P.FirstName, ' ', ISNULL(P.MiddleName + ' ', ''), P.LastName) AS Nombre_Completo,
             CASE WHEN P.PersonType = 'EM' THEN 'empleado' WHEN P.PersonType = 'SC' THEN 'contacto de tienda' WHEN P.PersonType = 'IN' THEN 'persona individual' WHEN P.PersonType = 'SP' THEN 'vendedor' WHEN P.PersonType = 'VC' THEN 'contacto de proveedor' WHEN P.PersonType = 'GC' THEN 'contacto general' END AS Tipo_Persona,
             E.EmailAddress AS Correo,
             PH.PhoneNumber AS Telefono
    FROM     Person.Person AS P
             INNER JOIN
             Person.EmailAddress AS E
             ON P.BusinessEntityID = E.BusinessEntityID
             INNER JOIN
             Person.PersonPhone AS PH
             ON P.BusinessEntityID = PH.BusinessEntityID
    WHERE    CASE WHEN P.PersonType = 'EM' THEN 'empleado' WHEN P.PersonType = 'SC' THEN 'contacto de tienda' WHEN P.PersonType = 'IN' THEN 'persona individual' WHEN P.PersonType = 'SP' THEN 'vendedor' WHEN P.PersonType = 'VC' THEN 'contacto de proveedor' WHEN P.PersonType = 'GC' THEN 'contacto general' END = @TipoPersona
    ORDER BY P.LastName, P.FirstName;
END


GO
EXECUTE sp_BuscarPersonasPorTipo @TipoPersona = 'empleado';