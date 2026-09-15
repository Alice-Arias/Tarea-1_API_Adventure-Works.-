use AdventureWorks2022;

--Insertar: Registrar un departamento nuevo
create procedure sp_InsertarDepartamento
    @Nombre nvarchar(40),@Grupo nvarchar(40)
as 
begin 

    if (@Nombre is null) or (@Grupo is null)
    begin 
        print 'Error:  El nombre y el grupo son obligatorios.'; 
    return;
    end;

    if exists (select top 1 from HumanResources.Department where Name = @Nombre)
    begin 
        print 'Error: Departamento ya existe';
        return;
    end;

    insert into  HumanResources.Department (Name,GroupName) values (  @Nombre, @Grupo);
    print 'Departamento registrado correctamente.';

end;

exec sp_InsertarDepartamento
    @Nombre = 'Tecnologia',
    @Grupo = 'Administracion';

--Actualizar:  actualiza la cantidad disponible de un producto en una ubicacion
create procedure sp_ActualizarCantidadInventarioUbicacion
    @ProductID int, @LocationID smallint, @NuevaCantidad smallint
as
begin 

    if not exists ( select 1  from Production.ProductInventory where ProductID = @ProductID and LocationID = @LocationID  )
    begin 
        print 'Error: El producto no existe en esa ubicación.';
        return;
    end;

    if @NuevaCantidad < 0 
    begin 
        print 'Error: Cantidad no puede ser negativa'
        return;
    end;

    update Production.ProductInventory
    set Quantity = @NuevaCantidad,
        ModifiedDate = GETDATE()
    where ProductID = @ProductID and  LocationID = @LocationID;

    print 'Cantidad actualizada correctamente.'

end;

exec dbo.sp_ActualizarCantidadInventario
    @ProductID = 1,
    @LocationID = 1,
    @NuevaCantidad = 100;

--DELETE: Eliminamos un departamentoque no tenga empleados solo
create procedure sp_eliminardepartamento
    @nombre nvarchar(50)
as
begin

    if not exists ( select 1 from humanresources.department where name = @nombre )
    begin
        print 'el departamento no existe.';
        return;
    end;

    if exists ( select 1
                 from humanresources.employeedepartmenthistory as edh
                inner join humanresources.department as d on edh.departmentid = d.departmentid
                where d.name = @nombre
             )
    begin
        print 'no se puede eliminar: el departamento tiene registros asociados.';
        return;
    end;


    delete from humanresources.department
    where name = @nombre;
    print 'departamento eliminado correctamente.';
end;


exec sp_eliminardepartamento
    @nombre = 'tecnologia';


-- select: consultar diferencias en work order
create procedure sp_consultarworkorder
as
begin

    select
        case
            when grouping(p.name) = 1 then 'total general'
            else p.name 
        end as producto,
        sum(w.orderqty) as cantidad_solicitada,
        sum(w.stockedqty) as cantidad_almacenada,
        sum(w.scrappedqty) as cantidad_rechazada
    from production.workorder as w
    inner join production.product as p on w.productid = p.productid
    group by rollup(p.name)
    order by grouping(p.name),sum(w.orderqty - w.stockedqty) asc;
end

exec sp_consultarworkorder;


--bUsqueda - cantidad de clientes por territorio
create procedure sp_buscarclientesporterritorio
    @territoryid int
as
begin

    select  territoryid as territorio,
          count(DISTINCT customerid) as cantidad_de_clientes
    from sales.customer
    where territoryid = @territoryid
    group by territoryid;
end;

exec sp_buscarclientesporterritorio
    @territoryid = 1;


-- busqueda con 2 join - personas por tipo
create procedure sp_buscarpersonasportipo
    @tipopersona varchar(30)
as
begin
    select  p.businessentityid as identificador,
        concat( p.firstname,  ' ', isnull(p.middlename + ' ', ''), p.lastname ) as nombre_completo,
        case
            when p.persontype = 'EM' then 'empleado'
            when p.persontype = 'SC' then 'contacto de tienda'
            when p.persontype = 'IN' then 'persona individual'
            when p.persontype = 'SP' then 'vendedor'
            when p.persontype = 'VC' then 'contacto de proveedor'
            when p.persontype = 'GC' then 'contacto general'
        end as tipo_persona, 

        e.emailaddress as correo,
        ph.phonenumber as telefono
    from person.person as p
    inner join person.emailaddress as e on p.businessentityid = e.businessentityid
    inner join person.personphone as ph on p.businessentityid = ph.businessentityid
    where
        case
            when p.persontype = 'EM' then 'empleado'
            when p.persontype = 'SC' then 'contacto de tienda'
            when p.persontype = 'IN' then 'persona individual'
            when p.persontype = 'SP' then 'vendedor'
            when p.persontype = 'VC' then 'contacto de proveedor'
            when p.persontype = 'GC' then 'contacto general'
        end = @tipopersona
    order by  p.lastname, p.firstname;

end;


exec sp_buscarpersonasportipo
    @tipopersona = 'Empleado';
