
--==========	PRUEBAS DE PROCESOS Y FUNCIONES   ============
use [TiendaRopa_V2]
-- para ver si un producto esta dispoinble
		DECLARE @estadoProducto VARCHAR(20);
		SET @estadoProducto = dbo.Obtener_Estado_Producto('PRUEBAINV');--cantidad disponible cero
		SELECT @estadoProducto AS EstadoProducto;

		DECLARE @estadoProducto VARCHAR(20);
		SET @estadoProducto = dbo.Obtener_Estado_Producto('P683T425ABC');--cantidad disponible>0
		SELECT @estadoProducto AS EstadoProducto;

--prueba para obtener cantidad de compras por un cliente mediante id
		DECLARE @clienteId INT = 3; --usuario 3 a realizado 3 compras  
		SELECT *FROM dbo.obtener_compras_cliente(@clienteId);

--prueba para buscar a un empleado mediante su id y la cantidad de ventas que ha realizado 
		DECLARE @empleadoID INT = 4; --es el unico que ha hecho mas de 1 venta 
		SELECT *FROM dbo.obtener_ventas_empleado(@empleadoID);

--prueba para obtener la cantidad de ventas de un producto y el monto total vendido
		DECLARE @codigoProducto VARCHAR(50) = 'F213T425ABC'; --se busca mediante el codigo
		SELECT * FROM dbo.obtener_cantidad_ventas_producto(@codigoProducto);

--prueba funcion para obtener el precio promedio de los producto 
		SELECT dbo.CalcularPrecioPromedioProductos() Precio_Promedio_productos;

--agregar un nuevo cliente
		EXEC RegistrarNuevoCliente
			@id_lugarNacimiento = 2, -- ID de municipio de nacimiento
			@id_genero = 1, -- ID de g�nero
			@P_nombre = 'proyecto',
			@S_nombre = 'prueba1',
			@S_apellido  = 'prueba1',
			@P_apellido = 'p1',
			@correo = 'correo@eprueba.com',
			@fecha_nacimiento='2021-06-06',
			@id_profesion = 1, -- ID de profesi�n
			@Tipo_Mayoritario = 1 -- 1

--prueba buscar cliente (se puede buscar por nombre, apellido,correo,pais, genero
			exec Search_cliente 'EL SALVADOR'
			exec Search_cliente 'femenino'
			exec Search_cliente 'HONDURAS'
			exec Search_cliente 'proyecto'

	--agregar un producto con sus detalles y se almacene en inventario
		SET IDENTITY_INSERT Productos ON; --para que se pueda insertar el codigo de barras a productos
			EXEC RegistrarProducto_AgregarInventario
			@codigo_barras = '1234',
			@precio = 29.99,
			@id_talla = 1,
			@id_genero = 2,
			@id_color = 2,
			@id_tipo = 3,
			@id_marca = 3,
			@id_proveedor = 2,
			@cantidad_disponible = 100,
			@fecha_llegada = '2000-03-02', 
			@nombre_producto = 'productoProyecto',
			@id_bodega=1--inventario

			
	select * from Inventario

	--prueba buscar producto
		execute Search_pr 'nike'
		execute Search_pr 'jordan1'
		execute Search_pr 'productoProyecto'
		execute Search_pr 'verde'
		execute Search_pr 'bebe'


		SET IDENTITY_INSERT productos ON;
		execute RegistrarProducto_AgregarInventario 'PRUEBAINV',20.5,1,2,3,2,3,4,0,'2023-06-06',1,'jordan1'


--============================QUERIES=====================================
		
--informacion de los clientes
		select c.id_clientes,(p.P_nombre+' '+p.S_nombre+' '+p.P_apellido+' '+p.S_apellido)nombre_completo, 
			pr.descripcion,p.correo,p.fecha_nacimiento,g.descripcion,(mun.decripcion+', '+dep.descripcion+', '+pa.descripcion) direccion
		from Clientes c
			inner join Personas p on p.idPersona=c.id_persona
			inner join Profesiones pr on pr.idProfesion=c.id_profesion
			inner join Generos g on g.id_genero=p.id_genero
			inner join Municipios mun on mun.idMuncipio=p.id_lugarNacimiento			
			inner join Departamentos dep on dep.idDepto=mun.idMuncipio
			inner join Paises pa on pa.idPais=dep.idPais

--obtener informacion de los empleados 

		 select e.id_empleado,(p.P_nombre+' '+p.S_nombre+' '+p.P_apellido+' '+p.S_apellido)nombre_Empleado,pt.idPuesto,prof.descripcion, P.fecha_nacimiento
		 from Empleados e
			 inner join Personas p on p.idPersona=e.id_empleado
			 inner join PuestosTrabajo pt on pt.idPuesto=e.id_puesto
			 inner join Profesiones prof on prof.idProfesion=e.id_profesion
			 inner join Sucursales suc on suc.idLocal=suc.idLocal
			 inner join Municipios mun on mun.idDepto=suc.idMuncipio
		 group by
		 e.id_empleado,p.P_nombre,p.S_nombre,p.P_apellido,p.S_apellido,pt.idPuesto,prof.descripcion,P.fecha_nacimiento

-- obtener cantidad de ventas realizadas en una sucursal y el monto de esas ventas
		select count(f.id_local)ventas_Realizadas,sum(dc.cantidad*pr.precio)Monto_ventas,s.razonSocial from Factura f 
			inner join Sucursales s on s.idLocal= f.id_local
			inner join detalle_compra dc on dc.id_detalleCOmpra=f.n_Factura
			inner join Productos pr on pr.codigo_barras=dc.producto
		group by s.razonSocial
		order by ventas_Realizadas desc 

-- obtener informacion sobre las ventas
	SELECT 
	f.n_Factura,
	(p.P_nombre+' '+p.S_nombre+' '+p.P_apellido+' '+p.S_apellido) Cliente, dr.nombre_producto,ta.descripcion talla,ma.descripcion marca,gr.descripcion genero,
	suc.razonSocial Sucursal,dc.cantidad,pr.precio,dc.cantidad*pr.precio total
	FROM Factura f
	INNER JOIN detalle_compra dc on dc.id_detalleCOmpra=f.n_Factura
	INNER JOIN Productos pr on pr.detalle=dc.id_detalleCOmpra	
	INNER JOIN DetallesRopa dr on dr.id_color=pr.detalle			
	INNER JOIN Tallas ta on ta.id_talla=dr.id_talla
	INNER JOIN Tipos ti on ti.id_tipos=dr.id_tipo
	INNER JOIN Marcas ma on ma.id_marcas=dr.id_marca
	INNER JOIN GeneroRopa gr on gr.id_gen_ropa=dr.id_genero
	INNER JOIN Clientes cli on cli.id_clientes=f.id_cliente
	INNER JOIN Personas p on p.idPersona=cli.id_persona
	INNER JOIN Empleados emp on emp.id_empleado=p.idPersona
	INNER JOIN Personas p2 on p2.idPersona=emp.id_persona
	INNER JOIN Sucursales suc on suc.idLocal=f.id_local 

	--informacion sobre los productos 
	SELECT
		pr.codigo_barras,dr.nombre_producto,ta.descripcion talla,ti.descripcion tipo,
		co.descripcion color,ma.descripcion marca,gr.descripcion genero,pr.precio,
		inv.cantidad_disponible
	FROM DetallesRopa dr
		inner join  Productos pr on pr.detalle=dr.id_detalle
		inner join Tallas ta on ta.id_talla=dr.id_talla
		inner join Tipos ti on ti.id_tipos=dr.id_tipo
		inner join Colores co on co.id_colores=dr.id_color
		inner join Marcas ma on ma.id_marcas=dr.id_marca
		inner join GeneroRopa gr on gr.id_gen_ropa=dr.id_genero
		inner join Inventario inv on inv.producto=pr.codigo_barras
	group by
		pr.codigo_barras,dr.nombre_producto,ta.descripcion,ti.descripcion,
		co.descripcion,ma.descripcion,gr.descripcion,pr.precio,
		inv.cantidad_disponible

	--informacion sobre los productos y la cantidad de unidades vendidas de los productos
	SELECT
		pr.codigo_barras,dr.nombre_producto,ta.descripcion talla,ti.descripcion tipo,
		co.descripcion color,ma.descripcion marca,gr.descripcion genero,pr.precio,
		inv.cantidad_disponible,SUM(dc.cantidad)unidades_vendidas
	FROM DetallesRopa dr
		inner join  Productos pr on pr.detalle=dr.id_detalle
		inner join Tallas ta on ta.id_talla=dr.id_talla
		inner join Tipos ti on ti.id_tipos=dr.id_tipo
		inner join Colores co on co.id_colores=dr.id_color
		inner join Marcas ma on ma.id_marcas=dr.id_marca
		inner join GeneroRopa gr on gr.id_gen_ropa=dr.id_genero
		inner join Inventario inv on inv.producto=pr.codigo_barras
		inner join detalle_compra dc on dc.producto=pr.codigo_barras
	group by
		pr.codigo_barras,dr.nombre_producto,ta.descripcion,ti.descripcion,
		co.descripcion,ma.descripcion,gr.descripcion,pr.precio,
		inv.cantidad_disponible
	order by unidades_vendidas desc

	select * from Inventario
	select * from detalle_compra
	select * from Productos

	insert into detalle_compra (id_detalleCOmpra,n_factura,producto,cantidad) values (15,2,'pruebaFinal2',2)

	--INDEX
		CREATE NONCLUSTERED INDEX indexCliente ON Clientes (id_clientes asc)
		CREATE NONCLUSTERED INDEX idxEmpleado ON empleados (id_empleado)
		CREATE NONCLUSTERED INDEX idxProducto ON Productos (codigo_barras)
		CREATE NONCLUSTERED INDEX idxMunicipios ON Municipios (idMuncipio asc)

	--CHECK 
	ALTER TABLE empleados
	ADD CONSTRAINT CHK_Salario CHECK (Salario >= 0)

	ALTER TABLE Productos
	ADD CONSTRAINT CHK_Precio CHECK (Precio > 0);
	

	select * from detalle_compra