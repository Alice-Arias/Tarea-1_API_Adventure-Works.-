USE AdventureWorks2022;
GO

-----------------------------------------------------------------------------------------------
--INSERTAR: Procedimiento que permite registrar nuevos productos en la base de datos, validando que los 
--datos sean correctos, que el producto no exista y que cumpla con las reglas establecidas por la empresa.
CREATE PROCEDURE dbo.sp_InsertarProducto
    @Nombre NVARCHAR(50),
    @NumeroProducto NVARCHAR(25),
    @Color NVARCHAR(15),
    @StockSeguridad SMALLINT,
    @PuntoReorden SMALLINT,
    @CostoEstandar MONEY,
    @PrecioVenta MONEY,
    @DiasFabricacion INT,
    @FechaInicioVenta DATETIME
AS
BEGIN

    SET NOCOUNT ON;

    -- VALIDAR QUE NO EXISTAN VALORES NULL
    IF @Nombre IS NULL
       OR @NumeroProducto IS NULL
       OR @Color IS NULL
       OR @StockSeguridad IS NULL
       OR @PuntoReorden IS NULL
       OR @CostoEstandar IS NULL
       OR @PrecioVenta IS NULL
       OR @DiasFabricacion IS NULL
       OR @FechaInicioVenta IS NULL
    BEGIN
        RAISERROR('No se permite registrar un producto con valores NULL.', 16, 1);
        RETURN;
    END;

    -- VALIDAR QUE NOMBRE Y CODIGO NO ESTEN VACIOS
    IF @Nombre = '' OR @NumeroProducto = ''
    BEGIN
        RAISERROR('El nombre y el codigo del producto son obligatorios.', 16, 1);
        RETURN;
    END;

    -- VALIDAR QUE EL COLOR NO ESTE VACIO
    IF @Color = ''
    BEGIN
        RAISERROR('El color del producto es obligatorio.', 16, 1);
        RETURN;
    END;


    -- 4. VALIDAR QUE EL PRODUCTO NO EXISTA
    IF EXISTS ( SELECT 1
        FROM Production.Product
        WHERE ProductNumber = @NumeroProducto)
    BEGIN
        RAISERROR('El codigo del producto ya existe.', 16, 1);
        RETURN;
    END;

    -- 5. VALIDAR STOCK
    IF @StockSeguridad <= 0
    BEGIN
        RAISERROR('El stock de seguridad debe ser mayor que cero.', 16, 1);
        RETURN;
    END;

    -- 6. VALIDAR PUNTO DE REORDEN
    IF @PuntoReorden < 0
    BEGIN
        RAISERROR('El punto de reorden no puede ser negativo.', 16, 1);
        RETURN;
    END;

    -- 7. VALIDAR COSTO
    IF @CostoEstandar <= 0
    BEGIN
        RAISERROR('El costo estandar debe ser mayor que cero.', 16, 1);
        RETURN;
    END;

    -- 8. VALIDAR PRECIO DE VENTA
    IF @PrecioVenta <= 0
    BEGIN
        RAISERROR('El precio de venta debe ser mayor que cero.', 16, 1);
        RETURN;
    END;

    -- 9. REGLA DE NEGOCIO: EL PRECIO NO PUEDE SER MENOR AL COSTO
    IF @PrecioVenta < @CostoEstandar
    BEGIN
        RAISERROR('El precio de venta no puede ser menor que el costo estandar.', 16, 1);
        RETURN;
    END;

    -- 10. VALIDAR DIAS DE FABRICACION
    IF @DiasFabricacion < 0
    BEGIN
        RAISERROR('Los dias de fabricacion no pueden ser negativos.', 16, 1);
        RETURN;
    END;

    -- 11. INSERTAR EL PRODUCTO
    INSERT INTO Production.Product (  Name,  ProductNumber,  MakeFlag,  FinishedGoodsFlag,  Color,  SafetyStockLevel, ReorderPoint,  StandardCost, ListPrice,DaysToManufacture, SellStartDate)
    VALUES(  @Nombre,  @NumeroProducto, 1, 1,  @Color,@StockSeguridad, @PuntoReorden, @CostoEstandar, @PrecioVenta, @DiasFabricacion, @FechaInicioVenta);
    PRINT 'Producto registrado correctamente.';
END;
GO


EXEC dbo.sp_InsertarProducto
    @Nombre = 'Laptop Empresarial X1',
    @NumeroProducto = 'EMP-2026-001',
    @Color = 'Negro',
    @StockSeguridad = 20,
    @PuntoReorden = 10,
    @CostoEstandar = 500.00,
    @PrecioVenta = 750.00,
    @DiasFabricacion = 3,
    @FechaInicioVenta = GETDATE();
GO

DECLARE @Fecha DATETIME = GETDATE();

EXEC dbo.sp_InsertarProducto
    @Nombre = 'Laptop Empresarial X1',
    @NumeroProducto = 'EMP-2026-001',
    @Color = 'Negro',
    @StockSeguridad = 20,
    @PuntoReorden = 10,
    @CostoEstandar = 500.00,
    @PrecioVenta = 750.00,
    @DiasFabricacion = 3,
    @FechaInicioVenta = @Fecha;
GO

SELECT TOP 10 ProductID, Name, ProductNumber,
    Color,
    SafetyStockLevel,
    ReorderPoint,
    StandardCost,
    ListPrice,
    DaysToManufacture,
    SellStartDate
FROM Production.Product
ORDER BY ProductID DESC;
GO

-----------------------------------------------------------------------------------------------
--READ: Este procedimiento genera un reporte de empleados utilizando las tablas Person.Person y 
--HumanResources.Employee. Las relaciona mediante BusinessEntityID, muestra el nombre completo, 
--tipo de persona, puesto y estado del empleado, además de numerar y contabilizar los registros.

SELECT TOP 10 *FROM Person.Person;

SELECT TOP 10 *FROM HumanResources.Employee;

CREATE PROCEDURE dbo.sp_ReportePersonas
AS
BEGIN
    SELECT TOP 20  P.BusinessEntityID AS ID,
        CONCAT(  P.FirstName,  ' ',  ISNULL(P.MiddleName + ' ', ''),   P.LastName ) AS NombreCompleto,
        CASE P.PersonType
            WHEN 'EM' THEN 'Empleado'
            WHEN 'SC' THEN 'Contacto de tienda'
            WHEN 'IN' THEN 'Cliente individual'
            WHEN 'SP' THEN 'Vendedor'
            WHEN 'VC' THEN 'Contacto de proveedor'
            WHEN 'GC' THEN 'Contacto general'
            ELSE 'Otro'
        END AS TipoPersona,

        ISNULL(E.JobTitle, 'No aplica') AS Puesto,

        CASE
            WHEN E.BusinessEntityID IS NOT NULL THEN 'Empleado activo'
            ELSE 'No es empleado'
        END AS EstadoEmpleado,

        COUNT(*) OVER() AS TotalPersonas,

        ROW_NUMBER() OVER( ORDER BY P.LastName, P.FirstName ) AS NumeroRegistro

    FROM Person.Person AS P
    INNER JOIN HumanResources.Employee AS E ON P.BusinessEntityID = E.BusinessEntityID
    ORDER BY P.LastName, P.FirstName;
END;
GO

EXEC dbo.sp_ReportePersonas;
GO

